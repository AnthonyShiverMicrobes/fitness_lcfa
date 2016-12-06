function [scoremat,datametaC,datamatVC,datameta,datamatV,datamatN,datamatS,...
          datamatF,datamat,settings]...
          =scoreLCFA(cond_file,array_file,data_path,data_format,ignore,bad,plate_type,plate_index)
%[xxx]=read_in_stats('condition file','array file','data path','format','ignore','bad','type')
%--ALS 2015.
%--Save the passed files
settings.cond_file=cond_file;
settings.array_file=array_file;
settings.data_path=data_path;
settings.data_format=data_format;
settings.ignore=ignore;
settings.bad=bad;
settings.plate_type=plate_type;
settings.plate_index=plate_index;
%--HARD CODED VALUES
settings.frac=0.90; %fraction of colony sizes that can be zero before filtering colony
settings.variance_limit=1000; %limit of colony size variance before filtering S-score
settings.spatial_model_type='quartic'; %type of spatial model to use
settings.average_method='middlemean'; %how to estimate average
settings.variance_method='mad'; %how to estimate variance
settings.numDup=2; %in the end, replicates will be collapsed
settings.small_cutoff=35;
%--read data, populate datastructures
[datamat,datameta]=read_data(settings.data_path,...
                            read_array_key(settings.array_file),...
                            read_condition_key(settings.cond_file),...
                            settings.data_format);
settings.spatialmodel=generate_model(datameta.col,datameta.row,settings.spatial_model_type);
%-- filter
datamatF=filter_out_small(datamat,datameta,settings.small_cutoff);
[datamatF,datameta]=filter_data(datamatF,datameta,settings.plate_type,settings.frac);
%-- remove bad data
datamatF=remove_bad_strains(datamatF,bad);
%-- smooth data

[datamatS,datameta]=smooth_data(settings.spatialmodel,datamatF,datameta);
%-- squeeze outliers and eliminate disagreements
datamatS=squeeze_outliers_lcfa(datamatS,datameta);
datamatS=eliminate_disagreement_lcfa(datamatS,datameta,'acc');
%-- power transform data
datamatP=transform_data(datamatS,0.5);
%datamatP=datamatS;
%-- normalize size
if(strcmpi('keio6',settings.plate_type))
    [datamatN,datameta]=normalize_data_split(datamatP,datameta,settings.average_method,settings.ignore,'mut',settings.plate_index);
else
    [datamatN,datameta]=normalize_data(datamatP,datameta,settings.average_method,settings.ignore,'mut');
end
%-- scale variance of data
datamatV=RC4_scale(datamatN,datameta,settings.average_method,settings.variance_method);
%datamatV=scale_data(datamatN,'mad');
%datamatV=datamatN;
%-- collapse replicates for one score
[datamatVC,datametaC]=collapse_structure(datamatV,datameta);
[datamatFC,~]=collapse_structure(datamatF,datameta);
%-- enforce at least three measurements
%datamatVC=enforce_triplicates(datamatVC);
%datamatFC=enforce_triplicates(datamatFC);
%-- adapt for toolbox
datamatVscaled=fit_to_fivehundred(datamatVC,datametaC,settings.average_method,settings.numDup); %final data
datamatFscaled=fit_to_fivehundred(datamatFC,datametaC,settings.average_method,settings.numDup); %original data
datametaC=controlstats(datamatFscaled,datametaC,'F'); 
datametaC=controlstats(datamatVscaled,datametaC,'V');
%-- score the data
[scoremat,datametaC]=calculate_score_LCFA(datamatFscaled,datamatVscaled,datametaC,settings.variance_limit,settings.numDup);