clear;

% �ļ�·��
labels_file = 'F:\FATAUVA-Net\prepare_data\AFEW-VA\crop\labels.mat';

num_train = 17650;
num_test = 3468;

% д�벻ͬmat
labels = cell2mat(struct2cell(load(labels_file)));
train_labels = labels(1:17650,:);
test_labels = labels(17650+1:21118,:);

save ..\AFEW-VA\crop\train_labels train_labels
save ..\AFEW-VA\crop\test_labels test_labels

