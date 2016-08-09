function [scoreCO,metaCO] = combine_lcfasizer_batch(score,score_new,meta,meta_new)

%cnd,cnc,bch
%acc,uid,mut,mrk
if ~( isequal(meta.acc,meta_new.acc) && isequal(meta.uid,meta_new.uid)...
        && isequal(meta.mut,meta_new.mut) && isequal(meta.mrk,meta_new.mrk))
    error('Fields of meta indicate these are not batches of the same plate.');
end

metaCO.acc=meta.acc;
metaCO.uid=meta.uid;
metaCO.mut=meta.mut;
metaCO.mrk=meta.mrk;
metaCO.cnd=[meta.cnd;meta_new.cnd];
metaCO.cnc=[meta.cnc;meta_new.cnc];
metaCO.bch=[meta.bch;meta_new.bch];

scoreCO.sze=[score.sze;score_new.sze];
scoreCO.crc=[score.crc;score_new.crc];