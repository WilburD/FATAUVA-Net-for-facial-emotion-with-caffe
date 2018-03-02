clear;

% �ļ�·��
all = 'F:\FATAUVA-Net\prepare_data\all_data\data.txt';
train_data = 'F:\FATAUVA-Net\prepare_data\train_data.txt';
val_data = 'F:\FATAUVA-Net\prepare_data\val_data.txt';
test_data = 'F:\FATAUVA-Net\prepare_data\test_data.txt';

[filenames,classes]=textread(all,'%s %d');
num_train = length(find(classes==0));   % ѵ��������
num_val = length(find(classes==1));     % ��֤������
num_test = length(find(classes==2));    % ����������

f1=fopen(train_data,'w');
f2=fopen(val_data,'w');
f3=fopen(test_data,'w');

% д�벻ͬ�ļ�
for i=1:num_train+num_val+num_test
    if i<=10000
        fprintf(f1, '%s %d\n', filenames{i}, classes(i));
    end
    if num_train<i && i<=num_train+1000
        fprintf(f2, '%s %d\n', filenames{i}, classes(i));
    end
    if (num_train+num_val)<i && i<=(num_train+num_val+1000)
        fprintf(f3, '%s %d\n', filenames{i}, classes(i));
    end      
end

fclose(f1);
fclose(f2);
fclose(f3);
