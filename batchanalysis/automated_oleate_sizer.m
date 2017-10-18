%-------------------------------------------------------------------------!
% Script: automated_oleate_sizer.m                                        :
% -------------------------------!                                        :
% This script will repeatedly call the scoreLCFA.m driver on individual   :
% plates and batches, storing the results as fields in individual         :
% structures.                                                             :
% load keio6index.mat before running.                                     :
%-------------------------------------------------------------------------!

%hard-coded values 
parent=''; %path to the data folder in the code repository

%don't change these
dataset={'RC-oleate-sizer/','RC-oleate-sizer/','RC-oleate-sizer/','RC-oleate-sizer/','RC-oleate-sizer/','RC-phen-sizer/','RC-phen-sizer/','RC-phen-sizer/','RC-phen-sizer/','RC-phen-sizer/','RC-oleate-sizer/','RC-phen-sizer/'};
data={'size/','size/','size/','size/','size/','size/','size/','size/','size/','size/','size/','size/'};
condition={'k1-oleate-sizer.txt','k2-oleate-sizer.txt','k3-oleate-sizer.txt','k4-oleate-sizer.txt','k5-oleate-sizer.txt','k1-rc-phen-sizer.txt','k2-rc-phen-sizer.txt','k3-rc-phen-sizer.txt','k4-rc-phen-sizer.txt','k5-rc-phen-sizer.txt','k6-oleate-sizer.txt','k6-rc-phen-sizer.txt'};
array={'KEIO1_KEY.csv','KEIO2_KEY.csv','KEIO3_key.csv','KEIO4_key.csv','KEIO5_KEY.csv','KEIO1_KEY.csv','KEIO2_KEY.csv','KEIO3_key.csv','KEIO4_key.csv','KEIO5_KEY.csv','KEIO6_KEY.csv','KEIO6_KEY.csv'};
structurekey={'a1','a2','a3','a4','a5','b1','b2','b3','b4','b5','a6','b6'};    

for keio = 1 : 10
    key=structurekey{keio};
[score.(key),meta.(key),datamatVC.(key),datameta.(key),datamatV.(key),...
        datamatN.(key),datamatS.(key),datamatF.(key),datamat.(key),...
        settings.(key)]=scoreLCFA([parent,dataset{keio},condition{keio}],...
                                [parent,array{keio}],...
                                [parent,dataset{keio},data{keio}],...
                                'collins_v1',{},[],'keio',[]);
end
for keio = 11 : 12
    key=structurekey{keio};
[score.(key),meta.(key),datamatVC.(key),datameta.(key),datamatV.(key),...
        datamatN.(key),datamatS.(key),datamatF.(key),datamat.(key),...
        settings.(key)]=scoreLCFA([parent,dataset{keio},condition{keio}],...
                                [parent,array{keio}],...
                                [parent,dataset{keio},data{keio}],...
                                'collins_v1',{},[],'keio6',keio6ind);
end
