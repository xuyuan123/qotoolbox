function demowin(labelList,nameList);
% DEMOWIN draws window for qdemos

% labelList contains the descriptive names of the demos
% nameList contains the actual function names of the demos

% Now initialize the whole figure...
left = 0.1;
width = 0.8;
bottom = 0.4;
height = 0.5;
figNumber=figure( ...
    'Name','QO Toolbox demos', ...
    'IntegerHandle','off', ...
    'NumberTitle','off',...
    'Units','normalized', ...
    'Position',[left bottom width height], ...
    'Tag','demowin'...
    );
axes('Visible','off','HandleVisibility','callback')
%====================================
left=0.80;
bottom=0.03;
btnWid=0.14;
btnHt=0.10;
%====================================
% The CLOSE button
labelStr='Close';
callbackStr='close(gcbf)';
closeHndl=uicontrol( ...
    'Style','pushbutton', ...
    'Units','normalized', ...
    'Position',[left bottom btnWid btnHt], ...
    'String',labelStr, ...
    'Callback',callbackStr);
 checkNhdl = uicontrol( ...
   'BackgroundColor',get(gcf,'Color'),...
	'Units','normalized', ...
	'ListboxTop',0, ...
	'Position',[left-btnWid bottom btnWid btnHt], ...
	'String','Show script names', ...
	'Style','checkbox', ...
	'Callback','h=findobj(''Tag'',''DemoButtons'');for k=1:length(h);s=get(h(k),''Userdata'');set(h(k),''String'',s{get(gco,''Value'')+1});end'); 
%====================================
% Information for demo buttons
top=0.95;
% Spacing between the buttons
spacing=0.02;
numButtons=size(labelList,1);
ncols = 3;
nrows = fix((numButtons+ncols-1)/ncols);
btnHt = min(0.07,(1-(nrows+1)*spacing)/nrows);
btnWid = 1/(ncols+1); border = btnWid/(ncols+1);
nfull = ncols - (ncols*nrows - numButtons);
count = 1;
for k = 1:ncols
   for btnNumber = 1:nrows-(k>nfull)
      yPos=top-(btnNumber-1)*(btnHt+spacing);
      labelStr=deblank(labelList(count,:));
      cmdStr=['set(findobj(''Tag'',''demowin''),''Visible'',''off'');'...
            'clc; eval(''' nameList(count,:) ''',''return'');'... 
            'set(findobj(''Tag'',''demowin''),''Visible'',''on'');'];
      % Generic button information
      btnPos=[border+(k-1)*(btnWid+border) yPos-btnHt btnWid btnHt];
      startHndl=uicontrol( ...
         'Style','pushbutton', ...
         'Units','normalized', ...
         'Position',btnPos, ...
         'String',labelStr, ...
         'UserData',{labelStr,nameList(count,:)}, ...
         'Tag','DemoButtons',...
         'Callback',cmdStr);
      count = count + 1;
   end;
end

% 