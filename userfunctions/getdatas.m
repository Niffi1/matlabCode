function getdatas(textfilename,postfix,skipheaders,num_cols)
% GETDATA - grabs data from a text file outputted from a C++ program. 
% Format: getdatas(Eclipse project name,Postfix,Skip Headers, # Cols)
cols = '%f ';
if num_cols > 1
    for ii = 2:num_cols
        cols = [cols , '%f '];
    end
end

copyfile(sprintf('/home/ben/workspace/programming/%s/%s%s%s',textfilename,textfilename,postfix,'data.txt'),sprintf('%s%s%s',textfilename,postfix,'data.txt'))
fid = fopen(sprintf('%s%s%s',textfilename,postfix,'data.txt'));
C = textscan(fid,sprintf('%s',cols),'HeaderLines',skipheaders);
fclose(fid);
M = cell2mat(C);
%M=C;
eval([sprintf('%s',postfix),'=M;']);
if exist(sprintf('%s%s',textfilename,'.mat'),'file')
    save(sprintf('%s',textfilename),'-append',sprintf('%s',postfix));
else
save(sprintf('%s',textfilename),sprintf('%s',postfix));
end

end

% [A,delimiter, nheaderlines] = importdata(sprintf('%s%s%s',textfilename,postfix,'data.txt'));
% B = importdata(sprintf('%s%s%s',textfilename,postfix,'data.txt'),delimiter,nheaderlines);
% realcol=find(isnan(B.data(1,:))==0);
% for ii=1:length(realcol)
% C(:,ii)= B.data(:,realcol(ii));
% end