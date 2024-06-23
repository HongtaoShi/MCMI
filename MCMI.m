clear ;
load newEXL
newEx(find(isnan(newEx)==1)) = 0;
tic 
Y=Label;
X=newEx;
%% 特征离散化
X(find(isnan(X)==1))=0;
nF = size(X,2);
if ~isinteger(X)
    t = weka.filters.supervised.attribute.Discretize();
    t.setOptions(wekaArgumentString({'-R','first-last'}));
    B = SY2MY(Y);
    t.setInputFormat(wekaCategoricalData(X, B));
    dat = weka.filters.Filter.useFilter(wekaCategoricalData(X, B),t);
    for i = 0:nF-1
        X(:,i+1) = dat.attributeToDoubleArray(i);
    end
end

newx=X;
y=Y;
EnY=Entropy(y);
[m,n]=size(newx);
%%%%%%%%%%%
len=n;
for i=1:len

    MI(1,i)=MutualInformation(newx(:,i),y);

end
%%%%%%%%从大到小排序
[SMI,ind]=sort(MI,'descend');
%%%%%%%%剩余特征
% for i=1:len
%     REM(i)=i;
% end
%
REM=ind(1:1000);
% index=find(SMI==0);
% REM(index)=[];
OPT(1)=REM(1);
REM(1)=[];
conF(:,1)=newx(:,OPT(1));
MIAll=MutualInformation(newx,y);

for i=2:len
    [mo,no]=size(OPT);
    [mr,nr]=size(REM);
    MICon=MutualInformation(conF,y);
    clear conMI;
    for j= 1:nr
        clear newF;
        newF=[conF,newx(:,REM(j))];
        MINew=MutualInformation(newF,y);
        conMI(j)=MINew-MICon;
       
        
    end
    [SMI,ind]=sort(conMI,'descend');
    if SMI(1)>0
        OPT(no+1)=REM(ind(1));
        conF(:,no+1)=newx(:,REM(ind(1)));
        conMI(find(REM==ind(1)))=[];
        REM(find(REM==ind(1)))=[];
        
        Rnum=find(conMI==0);
        [nrn,mrn]=size(Rnum);
        for k=mrn:-1:1
             REM(Rnum(k))=[]; 
        end
       

        if SMI(1)+MICon>=MIAll
            break
        end
        if length(REM)==0
            break
        end 
    else
        break
    end
    
end

for k=no:-1:1
    conNewF=conF;
    conNewF(:,k)=[];
    MIConNew=MutualInformation(conNewF,y);
    if MIConNew==MINew
        OPT(k)=[];
        conF=conNewF;
    end
end
time=toc;