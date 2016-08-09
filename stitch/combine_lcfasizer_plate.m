function [score,meta] = combine_lcfasizer_plate(score1,meta1,score2,meta2)
fields=fieldnames(score1);
%create unique tags that combine batch and condition
K1tag=strcat(meta1.bch,meta1.cnd,meta1.cnc);
K2tag=strcat(meta2.bch,meta2.cnd,meta2.cnc);
[cndav,cnd1,cnd2]=intersect(K1tag,K2tag);
%create the common conditions
for a = 1 : length(cndav)
    meta.cnd(a,1)=meta1.cnd(cnd1(a));
    meta.cnc(a,1)=meta1.cnc(cnd1(a));
    meta.bch(a,1)=meta1.bch(cnd1(a));
end
%stitch plates for common conditions
for m=1:length(fields)
    score.(fields{m})=[score1.(fields{m})(cnd1,:),score2.(fields{m})(cnd2,:)];
end
    meta.mut =[ meta1.mut; meta2.mut ];
    meta.acc =[ meta1.acc; meta2.acc ];
    meta.uid =[ meta1.uid; meta2.uid ];
    meta.mrk =[ meta1.mrk; meta2.mrk ];
%add the conditions specific to either K1 or K2
[cnd1_uniq,cndi]=setdiff(K1tag,K2tag);
addition=length(meta.cnd);
for l=1:length(cnd1_uniq)
    meta.cnd(addition+l)=meta1.cnd(cndi(l));
    meta.cnc(addition+l)=meta1.cnc(cndi(l));
    meta.bch(addition+l)=meta1.bch(cndi(l));
    for m=1:length(fields)
        score.(fields{m})(addition+l,:)=[score1.(fields{m})(cndi(l),:),ones(1,length(meta2.mut))*NaN];
    end
end
[cnd2_uniq,cndi]=setdiff(K2tag,K1tag);
addition=length(meta.cnd);
for l=1:length(cnd2_uniq)
    meta.cnd(addition+l)=meta2.cnd(cndi(l));
    meta.cnc(addition+l)=meta2.cnc(cndi(l));
    meta.bch(addition+l)=meta2.bch(cndi(l));
    for m=1:length(fields)
        score.(fields{m})(addition+l,:)=[ones(1,length(meta1.mut))*NaN,score2.(fields{m})(cndi(l),:)];
    end
end
