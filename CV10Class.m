function [ res ] = CV10Class( NEXL,indices,param )
[M,N]=size(NEXL);%���ݼ�Ϊһ��M*N�ľ�������ÿһ�д���һ������
% indices=crossvalind('Kfold',NEXL(1:M,N),10);%��������ְ�
result=zeros(1,10);
for i=1:10%������֤k=10��10����������Ϊ���Լ�
    test = (indices == i); %���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
    train = ~test;%train��Ԫ�صı��Ϊ��testԪ�صı��
    train_data=NEXL(train,1:N-1);%�����ݼ��л��ֳ�train����������\
    train_target=NEXL(train,N);%����������Ĳ���Ŀ�꣬�ڱ�������ʵ�ʷ������
    test_data=NEXL(test,1:N-1);%test������
    test_target=NEXL(test,N);
   if param.type==1
    %%navi bayes model
    model = NaiveBayes.fit(train_data, train_target);
    %%classifiation
    predict_label = predict(model, test_data);
    predict_label(find(isnan(predict_label)==1)) = 1;
    result(i)=sum(predict_label==test_target)/size(predict_label,1);
elseif param.type==2
    %%libsvm model
    addpath('libsvm');
    model = svmtrain( train_target,train_data, '-t 2 -c 1 -g 0.15');
    %%classifiation
    [predict_label, accuracy, dec_values] =  svmpredict(test_target, test_data, model);
    result(i)=sum(predict_label==test_target)/size(predict_label,1);
elseif param.type==3
    %model
    model = ClassificationKNN.fit(train_data,train_target,'NumNeighbors',50);
    %%classification
    predict_label = predict(model, test_data);
    result(i)=sum(predict_label==test_target)/size(predict_label,1);

    
elseif param.type==4
    model =fitctree(train_data, train_target);
    predict_label = predict(model, test_data);
    %%classification
    result(i)=sum(predict_label==test_target)/size(predict_label,1);
elseif param.type==5
    nTrees = 100;
    model = TreeBagger(nTrees,train_data,train_target,'Method', 'classification');
    %%classification
    predict_label_Str = predict(model, test_data);
    predict_label=str2num(char(predict_label_Str));
    result(i)=sum(predict_label==test_target)/size(predict_label,1);
   end
    
    %     result(i)=Bayes_CV_estimate(train_data,train_target,test_data,test_target);
end
res=mean(result) ;
end

