clear;
stImageFilePath  = 'E:\test1\eye36\';
stImageSavePath  = 'E:\test1\';
dirImagePathList = dir(strcat(stImageFilePath,'*.jpg'));        %��ȡ��Ŀ¼��ȫ��ͼƬ��·�����ַ�����ʽ��
iImageNum        = length(dirImagePathList);                    %��ȡͼƬ��������
%if iImageNum > 0                                                %��������ͼƬ��������ټ�y����������y
 %   for i = 1 : iImageNum
 %       iSaveNum      = int2str(i);
 %       stImagePath   = dirImagePathList(i).name;
 %       mImageCurrent = imread(strcat(stImageFilePath,stImagePath));
 %       mFaceResult   = face_segment(mImageCurrent);
 %       imwrite(mFaceResult,strcat(stImageSavePath,iSaveNum,'.jpg')); 
 %   end
%end

mImageCurrent = imread('C:\Users\iair\Desktop\8.jpg');
mFaceResult   = face_segment(mImageCurrent);
imwrite(mFaceResult,'E:\test1\8.jpg'); 