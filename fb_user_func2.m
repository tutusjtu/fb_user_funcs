function fb_user_func(figureNumbers,axesNumbers,co)
% %����: ȥ��ͼ���ı���
% ֻ��fig�㼶

for i = 1:length(figureNumbers)
    figureNum = figureNumbers(i);
    figure(figureNum)
    
    legendList = findobj(figureNum,'Type','legend');
    for j = 1:length(legendList)
        legendList(j).Title.String = '';
        
    end % ��axsѭ��
    
end % ��figsѭ��
