# fitness_lcfa
scripts and raw data for analysis of long chain fatty acid fitness scores, relative to a glucose control.
Functions from the sister repository fitness_score/ are a prerequisite for these scripts.

Dependencies

-----------!

MATLAB 2014a or later recommended

Requires the MATLAB scripts from fitness_score/ (https://github.com/AnthonyShiverMicrobes/fitness_score)

Running the code
---------------!

First, load the keio6index. This index specifies how to approach the keio6 plate for normalization. The keio6index is found within <b><i>pathtorepository</i>/metadata/keio6index.mat</b>

Second, open up the script automated_oleate_sizer.m and enter the full path to the data directory in this repository on your local clone. This will look something like <i>parent='/Users/brucewayne/Documents/MATLAB/fitness_lcfa/data/'</i>.

Third, make sure that both repositories <b>fitness_lcfa/</b> and <b>fitness_score/</b>, as well as all subfolders, have been added to the MATLAB path.

Finally, run the script automated_lcfa_assembly.m

Looking at the raw data
----------------------!

Colony sizes and metadata that were used for analysis are stored in <b>data/</b> and <b>metadata/</b> respectively.


--Folders--

batchanalysis/

-------------!

automated_lcfa_assembly.m calls the scoring, stitching, and filtering/normalization steps to generate a final dataset as published.

It outputs oleateS and oleateM for the scores and metadata of the screen, respectively.


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

