function [keioS,keioM]=automated_oleatedata_stitch(score,meta)
%stolen directly from keio_stitch, for use with datamats

[keioS,keioM]=combine_size_plate(score.a1,meta.a2,score.a2,meta.a2);
[keioS,keioM]=combine_size_plate(keioS,keioM,score.a3,meta.a3);
[keioS,keioM]=combine_size_plate(keioS,keioM,score.a4,meta.a4);
[keioS,keioM]=combine_size_plate(keioS,keioM,score.a5,meta.a5);
[keioS,keioM]=combine_size_plate(keioS,keioM,score.a6,meta.a6);