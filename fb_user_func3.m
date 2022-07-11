function fb_user_func(figureNumbers,axesNumbers,co)
% %功能: 在一个输入框中分别设置中英文字体
% 使用该功能时，务必选用tex解释器

disp('[提示]使用该功能需要先切换到tex模式')

% %调出字体版选择中英文字体
temp = uisetfont('FB英文字体(仅字体)'); %调出字体板
try
    fontnameEng = temp.FontName;
catch
    return
end

temp = uisetfont('FB中文字体(仅字体)'); %调出字体板
try
    fontnameChi = temp.FontName;
catch
    return
end

% %开始处理字体
for i = 1:length(figureNumbers)
    figureNum = figureNumbers(i);
    figure(figureNum)
    
    % 处理坐标区的文字
    axesList = findobj(figureNum,'Type','axes');
    
    for j = 1:length(axesList)
        axesH = axesList(j);
        
        axesH.XLabel.String =  changeFontSeparated(axesH.XLabel.String ,fontnameEng,fontnameChi);
        axesH.YLabel.String =  changeFontSeparated(axesH.YLabel.String ,fontnameEng,fontnameChi);
        axesH.ZLabel.String =  changeFontSeparated(axesH.ZLabel.String ,fontnameEng,fontnameChi);
        axesH.Title.String =  changeFontSeparated(axesH.Title.String ,fontnameEng,fontnameChi);
        
        for k = 1:length(axesH.XTickLabel)
            axesH.XTickLabel{k} = changeFontSeparated(axesH.XTickLabel{k} ,fontnameEng,fontnameChi);
        end
        for k = 1:length(axesH.YTickLabel)
            axesH.YTickLabel{k} = changeFontSeparated(axesH.YTickLabel{k} ,fontnameEng,fontnameChi);
        end
        for k = 1:length(axesH.ZTickLabel)
            axesH.ZTickLabel{k} = changeFontSeparated(axesH.ZTickLabel{k} ,fontnameEng,fontnameChi);
        end
        
    end % 对axs循环
    
    % 处理图例区的文字
    legendList = findobj(figureNum,'Type','legend');
    for j = 1:length(legendList)
        legendH = legendList(j);
        
        for k = 1:length(legendH.String)
            legendH.String{k} = changeFontSeparated(legendH.String{k},fontnameEng,fontnameChi);
        end
        
        legendH.Title.String = changeFontSeparated(legendH.Title.String,fontnameEng,fontnameChi);
        
    end % 对legend循环
    
end % 对figs循环


function newStr = changeFontSeparated(oldStr,fontname1,fontname2)

% 匹配字体设置的正则表达式
match1 = '\\fontname{+([^\x00-\xff]|\w|\s)+}'; % 匹配字体设置
[startIndex,endIndex] = regexp(oldStr, match1);

% 清除已有的tex设置
temp = [];
for i = 1:length(startIndex)-1
    temp = [temp oldStr(endIndex(i)+1:startIndex(i+1)-1)];
end

if ~isempty(temp)
    oldStr = temp;
end

% 根据字体生成新的设置
matchChinese = '[^\x00-\xff]+'; % 匹配连续中文串
[startIndex,endIndex] = regexp(oldStr, matchChinese);
oldmatch = {};
for i = 1:length(startIndex)
    oldmatch = [oldmatch; oldStr(startIndex(i):endIndex(i))];
end
oldmatch = unique(oldmatch);%删除重复的

for i = 1:length(oldmatch)
    oldStr = strrep(oldStr,oldmatch{i},['\fontname{' fontname2 '}'   oldmatch{i}    '\fontname{' fontname1 '}']);
end

newStr = ['\fontname{' fontname1 '}' oldStr];

function [Chinese] = isChinese(ch)
% 对于GB2312的字符（就是我们平时所说的区位），一个汉字对应于两个字节。 每个字节都是大于A0（十六进制,即160），
% 倘若，第一个字节大于A0，而第二个字节小于A0，那么它应当不是汉字（仅仅对于GB2312)
info = unicode2native(ch,'GB2312');
bytes = size(info,2);
Chinese = 0;
if (bytes == 2)
    if(info(1)>160 & info(2)>160)
        Chinese = 1;
    end
end
