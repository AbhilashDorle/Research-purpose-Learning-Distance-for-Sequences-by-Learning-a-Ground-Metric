function [sequence,trainingsetdata,trainingsetdatalabel,trainingsetdatanum,trainingsetnum]=train
data=csvread("D:\Dr. Sheng Li\Datasets\UCRArchive_2018\GunPoint\sample.csv");
traininglabel=data(:,1);
trainingsett=data(:,2:end);
temp_sequence={};
labels=[];
counter=0;
count=0;
seqcount=1;
trainingsetdatanum=size(data,1);
for i = 1:length(unique(traininglabel))
    for j = 1:length(traininglabel)
        vectors=[];
        if traininglabel(j) == i
            vectors=trainingsett(j,:);
            counter=counter+1;
            count=count+1;
            temp_sequence{counter}=vectors;
        end
        labels(i)=i;
%         if count == 5;
%             sequence{seqcount}=temp_sequence;
%             seqcount=seqcount+1;
%             temp_sequence={};
%             count=0;
%             counter=0;
%         end
    end
    sequence{seqcount}=temp_sequence;
    seqcount=seqcount+1;
end
trainingsetnum=[];
for i = 1:size(sequence,2)
    trainingsetnum(i)=size(sequence{i},2);
end

trainingsetdata=cell([size(data,1),size(data,1)]);
for i = 1:size(trainingsetdata,1)
    trainingsetdata{i}=trainingsett(i,:);
end
trainingsetdatalabel=[];
for i = 1:size(traininglabel,1)
    trainingsetdatalabel(i)=traininglabel(i);
end
end

