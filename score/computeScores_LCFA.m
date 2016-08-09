function scoremat = computeScores_LCFA(raw,err,rawC)
%this function converts the raw colony size data into unaveraged S scores.
%It can use one of two methods for computing the expected colony size.
%
%written by Sean Collins (2006) as part of the EMAP toolbox

[r c n] = size(raw.size);
scoremat.rowlabels = raw.rowlabels;
scoremat.collabels = raw.collabels;
scoremat.rep_num = raw.rep_num ;
fn=fieldnames(raw);
if ismember('row_mut',fn)
    scoremat.row_mut = raw.row_mut ;
end
if ismember('col_mut',fn)
    scoremat.col_mut = raw.col_mut ;
end

SD=rawC.sdsize;
m=nanmedian(rawC.size,3);

% Compute the epistasis scores
for i=1:r
    for j=1:c
        if ~strcmp(scoremat.collabels(j),'N/A')
            scoremat.data(i,j)=scoreS(raw,i,j,err,m(j),SD(j));
        else
            scoremat.data(i,j)=NaN;
        end
    end
end

