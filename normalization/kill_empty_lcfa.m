function [datamat,datameta]=kill_empty(datamat,datameta)
index=strcmpi('empty',datameta.mut);
datameta.mut(index)=[];datameta.acc(index)=[];datameta.mrk(index)=[];datameta.uid(index)=[];
datamat.sze(:,index,:)=[];datamat.crc(:,index,:)=[];