%load keio6ind first
automated_oleate_sizer
[oleateS,oleateM]=automated_lcfascoresizer_stitch(score,meta);
[oleateS,oleateM]=kill_empty_lcfa(oleateS,oleateM);
oleateS=normalizeIQR(oleateS);