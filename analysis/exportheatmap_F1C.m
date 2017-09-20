%-------------------------------------------------------------------------!
% Script: exportheatmap_F1C.m                                             :
%---------------------------!
% Takes the final score from automated_lcfa_assembly.m and the index of   :
% genes of interest in the metadata folder, and exports a subset of the   :
% fitness scores for display in F1C.                                      :
%-------------------------------------------------------------------------!
index=generate_comparison_index(F1C_eck_values,oleateM.acc);
%change the filepath to adapt to local system
exportUBERindex(oleateS,oleateM,'/Users/ashiver/Desktop/F1Cheatmap.txt','sze',index);

