function fb_user_func(figureNumbers,axesNumbers,co)
% %����: ����marker���ܶ�

% %ʾ��ͼ
% figure(1);clf
% x = 0:0.01:5;
% subplot(3,3,[1 2 4 5])
% plot(x,sin(x),'-*')
% subplot(3,3,9)
% plot(x,cos(x),'-*')

% %�û�����
interval = 2; % ȡ�����

for i = 1:length(figureNumbers)
    figureNum = figureNumbers(i);
    figure(figureNum)
    
    axesList = findobj(figureNum,'Type','axes');    
    
    for j = 1:length(axesList)
        axesH = axesList(j);
        lines = findobj(axesH,'Type','line');
        
        for k = 1:length(lines)
            line = lines(k);
            line.XData = line.XData(1:interval:end);
            line.YData = line.YData(1:interval:end);
        end % ��linesѭ��
        
    end % ��axsѭ��
    
end % ��figsѭ��
