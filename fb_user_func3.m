function fb_user_func(figureNumbers,axesNumbers,co)
% %����: ��һ��������зֱ�������Ӣ������
% ʹ�øù���ʱ�����ѡ��tex������

disp('[��ʾ]ʹ�øù�����Ҫ���л���texģʽ')

% %���������ѡ����Ӣ������
temp = uisetfont('FBӢ������(������)'); %���������
try
    fontnameEng = temp.FontName;
catch
    return
end

temp = uisetfont('FB��������(������)'); %���������
try
    fontnameChi = temp.FontName;
catch
    return
end

% %��ʼ��������
for i = 1:length(figureNumbers)
    figureNum = figureNumbers(i);
    figure(figureNum)
    
    % ����������������
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
        
    end % ��axsѭ��
    
    % ����ͼ����������
    legendList = findobj(figureNum,'Type','legend');
    for j = 1:length(legendList)
        legendH = legendList(j);
        
        for k = 1:length(legendH.String)
            legendH.String{k} = changeFontSeparated(legendH.String{k},fontnameEng,fontnameChi);
        end
        
        legendH.Title.String = changeFontSeparated(legendH.Title.String,fontnameEng,fontnameChi);
        
    end % ��legendѭ��
    
end % ��figsѭ��


function newStr = changeFontSeparated(oldStr,fontname1,fontname2)

% ƥ���������õ�������ʽ
match1 = '\\fontname{+([^\x00-\xff]|\w|\s)+}'; % ƥ����������
[startIndex,endIndex] = regexp(oldStr, match1);

% ������е�tex����
temp = [];
for i = 1:length(startIndex)-1
    temp = [temp oldStr(endIndex(i)+1:startIndex(i+1)-1)];
end

if ~isempty(temp)
    oldStr = temp;
end

% �������������µ�����
matchChinese = '[^\x00-\xff]+'; % ƥ���������Ĵ�
[startIndex,endIndex] = regexp(oldStr, matchChinese);
oldmatch = {};
for i = 1:length(startIndex)
    oldmatch = [oldmatch; oldStr(startIndex(i):endIndex(i))];
end
oldmatch = unique(oldmatch);%ɾ���ظ���

for i = 1:length(oldmatch)
    oldStr = strrep(oldStr,oldmatch{i},['\fontname{' fontname2 '}'   oldmatch{i}    '\fontname{' fontname1 '}']);
end

newStr = ['\fontname{' fontname1 '}' oldStr];

function [Chinese] = isChinese(ch)
% ����GB2312���ַ�����������ƽʱ��˵����λ����һ�����ֶ�Ӧ�������ֽڡ� ÿ���ֽڶ��Ǵ���A0��ʮ������,��160����
% ��������һ���ֽڴ���A0�����ڶ����ֽ�С��A0����ô��Ӧ�����Ǻ��֣���������GB2312)
info = unicode2native(ch,'GB2312');
bytes = size(info,2);
Chinese = 0;
if (bytes == 2)
    if(info(1)>160 & info(2)>160)
        Chinese = 1;
    end
end
