function exportGSEAset(mat,meta,folder,field)
mat_size=size(mat.(field));
%print gene names
for i=1:mat_size(1)
    cond_name=meta.cnd{i};
    filename=[folder,cond_name,'_gsea.rnk'];
    fid=fopen(filename,'w');
    COND = sprintf('\t%s',meta.cnd{i});
 
    LINE=[ 'Condition' COND ];
    fprintf(fid,'%s\n',LINE);
    %print row label then data
    [~,sort_index]=sort(mat.(field)(i,:));
    for j = 1 : mat_size(2)
    VALUE=regexprep(mat2str(mat.(field)(i,sort_index(j))),{'\s+','[',']'},{'\t','',''});
    GENE = meta.acc{sort_index(j)};
    LINE=[ GENE sprintf('\t%s',VALUE) ];
    fprintf(fid,'%s\n',LINE);
    end
    fclose(fid);
end

end

    