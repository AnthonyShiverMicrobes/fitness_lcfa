function [scoremat,datameta]=calculate_score_LCFA(datamatF,datamatV,datameta,variance_limit,numDup)
fields=fieldnames(datamatF); %assume V and F have same fields
[controldata,controlmeta,datamatV,datamatF,datameta]=extract_controls(datamatV,datamatF,datameta);
for m=1:length(fields)
    raw=mraw_error(datamatF,datameta,fields{m},'F',numDup);
    rawN=mraw_error(datamatV,datameta,fields{m},'V',numDup);
    rawS=mraw_score(datamatV,datameta,fields{m},'V');
    rawC=mraw_score(controldata,controlmeta,fields{m},'V');
    %score data
    err=computeErrorEstimates(raw,rawN);
    scores=computeScores_LCFA(rawS,err,rawC);
    %Remove scores resulting from unreliably noisy single measurements
    scores.data(rawS.sdsize>variance_limit)=NaN;
    scoremat.(fields{m})=scores.data;
end
end
    
function [cd,cm,datamatV,datamatF,datameta]=extract_controls(datamatV,datamatF,datameta)
control_index=strcmpi('control',datameta.cnd);
fields=fieldnames(datamatV);
for m=1:length(fields)
    cd.(fields{m})=datamatV.(fields{m})(control_index,:,:);
    datamatV.(fields{m})(control_index,:,:)=[];
    datamatF.(fields{m})(control_index,:,:)=[];
    cm.([fields{m},'_men_F'])=datameta.([fields{m},'_men_F'])(control_index,:);
    datameta.([fields{m},'_men_F'])(control_index,:)=[];
    cm.([fields{m},'_std_F'])=datameta.([fields{m},'_std_F'])(control_index,:);
    datameta.([fields{m},'_std_F'])(control_index,:)=[];;
    cm.([fields{m},'_men_V'])=datameta.([fields{m},'_men_V'])(control_index,:);
    datameta.([fields{m},'_men_V'])(control_index,:)=[];
    cm.([fields{m},'_std_V'])=datameta.([fields{m},'_std_V'])(control_index,:);
    datameta.([fields{m},'_std_V'])(control_index,:)=[];

end
cm.cnd=datameta.cnd(control_index);
cm.cnc=datameta.cnc(control_index);
cm.bch=datameta.bch(control_index);

cm.acc=datameta.acc;
cm.uid=datameta.uid;
cm.mut=datameta.mut;
cm.mrk=datameta.mrk;

datameta.cnd(control_index)=[];
datameta.cnc(control_index)=[];
datameta.bch(control_index)=[];

end


        