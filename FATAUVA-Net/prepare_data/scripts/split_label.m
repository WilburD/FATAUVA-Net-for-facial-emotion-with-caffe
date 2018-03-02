clear;

% �ļ�·��
all = 'F:\FATAUVA-Net\prepare_data\all_data\data.txt';
labels_file = 'F:\FATAUVA-Net\prepare_data\all_data\labels.mat';

[filenames,classes] = textread(all,'%s %d');
num_train = length(find(classes==0));   % ѵ��������
num_val = length(find(classes==1));     % ��֤������
num_test = length(find(classes==2));    % ����������

% д�벻ͬmat
labels = cell2mat(struct2cell(load(labels_file)));
train_labels = labels(1:10000,:);
val_labels = labels(num_train+1:num_train+1000,:);
test_labels = labels(num_train+num_val+1:num_train+num_val+1000,:);

save ..\train_labels train_labels
save ..\val_labels val_labels
save ..\test_labels test_labels

