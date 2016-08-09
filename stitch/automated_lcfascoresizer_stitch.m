function [keioS,keioM]=automated_lcfascoresizer_stitch(score,meta)

[k1s,k1m]=combine_lcfasizer_batch(score.a1,score.b1,meta.a1,meta.b1);
[k2s,k2m]=combine_lcfasizer_batch(score.a2,score.b2,meta.a2,meta.b2);
[k3s,k3m]=combine_lcfasizer_batch(score.a3,score.b3,meta.a3,meta.b3);
[k4s,k4m]=combine_lcfasizer_batch(score.a4,score.b4,meta.a4,meta.b4);
[k5s,k5m]=combine_lcfasizer_batch(score.a5,score.b5,meta.a5,meta.b5);
[k6s,k6m]=combine_lcfasizer_batch(score.a6,score.b6,meta.a6,meta.b6);

[keioS,keioM]=combine_lcfasizer_plate(k1s,k1m,k2s,k2m);
[keioS,keioM]=combine_lcfasizer_plate(keioS,keioM,k3s,k3m);
[keioS,keioM]=combine_lcfasizer_plate(keioS,keioM,k4s,k4m);
[keioS,keioM]=combine_lcfasizer_plate(keioS,keioM,k5s,k5m);
[keioS,keioM]=combine_lcfasizer_plate(keioS,keioM,k6s,k6m);
