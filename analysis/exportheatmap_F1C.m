%-------------------------------------------------------------------------!
% Script: exportheatmap_F1C.m                                             :
%---------------------------!                                             :
% Takes the final score from automated_lcfa_assembly.m and the index of   :
% genes of interest in the metadata folder, and exports a subset of the   :
% fitness scores for display in F1C.                                      :
%-------------------------------------------------------------------------!
% Anthony Shiver (2017)                                                   :
%-------------------------------------------------------------------------!

%hard coded values
exportpath=''; %change the filepath to adapt to local system

index=generate_comparison_index(F1C_eck_values,oleateM.acc);

exportUBERindex(oleateS,oleateM,exportpath,'sze',index);

