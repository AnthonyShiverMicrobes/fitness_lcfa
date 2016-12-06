function d = filter_out_small(d,m,cutoff)
control_index=find(strcmpi('control',m.cnd));
fields=fieldnames(d);
for n=1:length(fields)
    if ~strcmpi('crc',fields{n})
    meanfield=nanmean(d.(fields{n}),3);
    for i=1:length(m.cnd)
        if i~=control_index;
            for j=1:length(m.mut)
                if( meanfield(i,j) < cutoff && meanfield(control_index,j) < cutoff)
                    d.(fields{n})(i,j,:)=NaN;
                end
            end
        end
    end
    end
end
                    