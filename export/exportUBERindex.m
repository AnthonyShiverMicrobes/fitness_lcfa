function exportUBERindex(mat,meta,filename,field,index)
mat_size=size(mat.(field));
fid=fopen(filename,'w');
%print gene names
GENE=sprintf('\t%s', meta.mut{index});
LINE=[ 'Condition' GENE ];
fprintf(fid,'%s\n',LINE);
%print row label then data
for i = 1 : mat_size(1)
    VECTOR=regexprep(mat2str(mat.(field)(i,index)),{'\s+','NaN','[',']'},{'\t','','',''});
    COND=[ char(meta.cnd(i)) ' [' char(meta.cnc(i)) '] {' char(meta.bch(i)) '}' ];
    LINE=[ COND sprintf('\t%s',VECTOR) ];
    fprintf(fid,'%s\n',LINE);
end
fclose(fid);
end