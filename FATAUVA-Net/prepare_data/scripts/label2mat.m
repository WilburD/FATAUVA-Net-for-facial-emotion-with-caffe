clear;
attrlabelpath = 'E:\CelebA\Anno\list_attr_celeba.txt';
face_attrs = {'Attractive','Male','No_Beard','Young'};
eyebrows_attrs = {'Arched_Eyebrows','Bushy_Eyebrows'};
eyes_attrs = {'Eyeglasses','Narrow_Eyes'};
mouth_attrs = {'Mouth_Slightly_Open','Smiling'};
attr_names = [face_attrs, eyebrows_attrs, eyes_attrs, mouth_attrs];

f=fopen(attrlabelpath,'r');
num = str2double(fgetl(f));     % ��ȡ��һ�У�����
attrs = regexp(fgetl(f),' ','split');       % �ڶ��У�������
[bools, indexs] = ismember(attr_names, attrs);      % �ҵ���Ҫ�������±�

i=1;
all_labels=zeros(num, 40);
% ��ȡlabelֵ
while feof(f)==0
    line=regexp(fgetl(f),' +', 'split');
    for j=2:length(line)
        all_labels(i,j-1)=str2double(line{j});
    end
    i=i+1;
end
all_labels(find(all_labels==-1))=0;
labels=all_labels(:,indexs);
save ..\labels labels