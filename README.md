# fitness_lcfa
scripts and raw data for analysis of long chain fatty acid fitness scores, relative to a glucose control.
Functions from the sister repository fitness_score/ are a prerequisite for these scripts.

Organization

-----------!

batchanalysis/

-------------!

The top level scripts for generating normalized scores can be found in batchanalysis/ 

automated_lcfa_assembly.m calls the scoring, stitching, and filtering/normalization steps to generate a final dataset as published.
It outputs oleateS and oleateM for the scores and metadata of the screen, respectively.

automated_oleate_sizer.m generates a structure with normalized s-scores for each keio plate by iteratively calling the fitness score driver.

driver_scripts/

--------------!

scoreLCFA.m generates normalized scores for a single plate, using the functions generated specifically for the analysis of growth on
carbon sources relative to a glucose control.

data/

----!

The raw data used in analysis can be found in data/

KEIO-key plates are recreated from Shiver et al. 2016. The plate data from RC-phen-sizer are taken from the raw data of Nichols et al. 2010.

normalization/ score/ and stitch/

--------------------------------!

These folders contain the functions written to specifically analyze the growth on carbon sources relative to a glucose control. Functions are organized among folders according to general purpose.

