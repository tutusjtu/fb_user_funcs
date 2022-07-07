function fb_user_func(figureNumbers,axesNumbers,co)
% %功能: 去除图例的标题
% 只到fig层级

for i = 1:length(figureNumbers)
    figureNum = figureNumbers(i);
    figure(figureNum)
    
    legendList = findobj(figureNum,'Type','legend');
    for j = 1:length(legendList)
        legendList(j).Title.String = '';
        
    end % 对axs循环
    
end % 对figs循环
