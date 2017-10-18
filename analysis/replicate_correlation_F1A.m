function [corr]=replicate_correlation_F1A(datamat,datameta)
%----------------------------------------------------------------!
% replicate_correlation_F1A.m                                    :
% --------------------------!                                    :
% Usage: correlation=replicate_correlation_F1A(datamat,datameta) :
%                                                                :
% Expects datamatV and datameta for the normalized datasets of   :
% colony size. Filters data, extracts side-by-side replicates,   :
% outputs a scatter plot, and calculates the replicate           :
% correlation.                                                   :
%----------------------------------------------------------------!
% Anthony Shiver (2017)                                          :
%----------------------------------------------------------------!

%stitch and remove 'Empty' values
[oleatesize,meta]=automated_oleatedata_stitch(datamat,datameta);
[oleatesize,~]=kill_empty(oleatesize,meta);
%normal the colony size to the plate average
colonysize=oleatesize.sze;
S=size(colonysize);
%normalize according to plate avarage
for i=1:S(1)
    for k=1:S(3)
        plateaverage=nanmedian(colonysize(i,:,k));
        colonysize(i,:,k)=colonysize(i,:,k)./plateaverage;
    end
end
%extract replicates
%extracts the replicates at a particular position across plates
[x,y]=extracttechnicalreplicates(colonysize);

count=hist3([x,y],{0:0.01:2,0:.01:2});
densitymap=map_density(x,y,count,0:0.01:2);
densitycolor=log10(densitymap);
scatter(x,y,10,densitycolor);
axis equal;
colormap(hot);
h=colorbar;
set(h,'YLim',[0 2]);
set(h,'YTick',[0:.5:2]);
ylabel(h,'Log_1_0(Local Density)')
xlabel('Normalized Colony Size: Replicate 1');
ylabel('Normalized Colony Size: Replicate 2');
axis([0 2 0 2]);
set(gca,'XTick',[0:0.2:2]);
set(gca,'YTick',[0:0.2:2]);
corr1=corrcoef(x,y,'rows','pairwise');
corr=corr1(1,2);
end

