function datamat = use_filter(datamat,filter)
fields=fieldnames(datamat);
for m=1:length(fields)
    if(~strcmpi('crc',fields{m}))
        s=size(filter.(fields{m}));
        for i=1:s(1)
            for j=1:s(2)
                if(filter.(fields{m})(i,j))
                    datamat.(fields{m})(i,j,:)=NaN;
                end
            end
        end
    end
end