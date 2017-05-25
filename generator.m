function varargout = generator(varargin)
% GENERATOR MATLAB code for generator.fig
%      GENERATOR, by itself, creates a new GENERATOR or raises the existing
%      singleton*.
%
%      H = GENERATOR returns the handle to a new GENERATOR or the handle to
%      the existing singleton*.
%
%      GENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GENERATOR.M with the given input arguments.
%
%      GENERATOR('Property','Value',...) creates a new GENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before generator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to generator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help generator

% Last Modified by GUIDE v2.5 25-May-2017 14:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @generator_OpeningFcn, ...
                   'gui_OutputFcn',  @generator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before generator is made visible.
function generator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to generator (see VARARGIN)

% Choose default command line output for generator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes generator wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.p4,'visible','off');
set(handles.p2,'visible','off');
set(handles.p3,'visible','off');
set(handles.p1,'visible','on');
set(handles.opsize,'enable','off');
% --- Outputs from this function are returned to the command line.
function varargout = generator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
global endl
endl = sprintf('\n');

% --- Executes on button press in gen3.
function gen3_Callback(hObject, eventdata, handles)
set(handles.status,'String','Extracting Constraints');
global endl
t = get(handles.testcases,'String');
if str2double(t)<=0
        errordlg('Min no. for test cases = 1','Test Case error');
        set(handles.status,'String','Error');
        return;
end
opSize = get(handles.opsize,'Value');
ans = [];
set(handles.status,'String','Generating Random Strings');
  for i = 1:str2num(t)
    ss = get(handles.stringsize,'String');
    sym = get(handles.custom,'String');
    if isempty(sym)
        errordlg('Select Preferences','No Prefernces Selected');
        set(handles.status,'String','Error');
        return;
    end
    if opSize==1
        if i==1
            ans = {ss};
        else
            ans = char(ans);
            ans = {ans;ss};
        end
    end
    ss = str2num(ss);
    sym = char(sym);
    rng('shuffle');
    nums = randi(numel(sym),[1 ss]);
    r = sym(nums);
    set(handles.status,'String',['Writing Test Case -' ' ' num2str(i)]);
    if i==1 & opSize==0
        ans = {r};
    else
        ans = char(ans);
        ans = {ans;r};
    end 
end
set(handles.op,'String',ans);
s = get(handles.op,'String');
[m n] = size(s);
for i=1:m
    s(i)=strtrim(s(i));
end
set(handles.op,'String',s);
%coping into clipboard
str = [];
for i = 1:size(s,1); 
   row = sprintf('%s\t', s{i,:});
   row(end) = endl;
   str = [str row];
end
clipboard('copy',str);
set(handles.status,'String','Copied to Clipboard !');

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');
str = get(handles.custom,'String');
sym = 'A':'Z';
if value==1
   sym = [str sym];
else
    sym = setdiff(str,sym);
end
set(handles.custom,'String',sym);


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');
str = get(handles.custom,'String');
sym = 'a':'z';
if value==1
   sym = [str sym];
else
    sym = setdiff(str,sym);
end
set(handles.custom,'String',sym);

% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
value = get(hObject,'Value');
str = get(handles.custom,'String');
sym = '0':'9';
if value==1
   sym = [str sym];
else
    sym = setdiff(str,sym);
end
set(handles.custom,'String',sym);

% --- Executes on button press in gen1.
function gen1_Callback(hObject, eventdata, handles)
set(handles.status,'String','Extracting Constraints');
global endl
t = get(handles.testcases,'String');
if str2double(t)<=0
        errordlg('Min no. for test cases = 1','Test Case error');
        set(handles.status,'String','Error');
        return;
end
min = str2double(get(handles.min1,'String'));
max = str2double(get(handles.max1,'String'));
 if max<min
        errordlg('Max Cannot be greater than Min','Max-Min Error');
        set(handles.status,'String','Error');
        return;
 end
ans = [];
set(handles.status,'String','Generating Random Numbers');
for i = 1:str2double(t)
    rng('shuffle');
    r = randi([min max]);
    r = num2str(r);
    set(handles.status,'String',['Writing Test Case -' ' ' num2str(i)]);
    if i==1
        ans = {r};
    else
        ans = char(ans);
        ans = {ans;r};
    end 
end
set(handles.op,'String',ans);
s = get(handles.op,'String');
%coping into clipboard
str = [];
for i = 1:size(s,1); 
   row = sprintf('%s\t', s{i,:});
   row(end) = endl;
   str = [str row];
end
clipboard('copy',str);
set(handles.status,'String','Copied to Clipboard !');

% --- Executes on button press in array.
function array_Callback(hObject, eventdata, handles)
set(handles.opsize,'enable','on');
set(handles.tcs,'enable','on');
set(handles.testcases,'enable','on');
set(handles.p1,'visible','off');
set(handles.p2,'visible','on');
set(handles.p3,'visible','off');
set(handles.p4,'visible','off');

% --- Executes on button press in numbers.
function numbers_Callback(hObject, eventdata, handles)
set(handles.opsize,'enable','off');
set(handles.tcs,'enable','on');
set(handles.testcases,'enable','on');
set(handles.p1,'visible','on');
set(handles.p2,'visible','off');
set(handles.p3,'visible','off');
set(handles.p4,'visible','off');

% --- Executes on button press in Strings.
function strings_Callback(hObject, eventdata, handles)
set(handles.opsize,'enable','on');
set(handles.tcs,'enable','on');
set(handles.testcases,'enable','on');
set(handles.p1,'visible','off');
set(handles.p2,'visible','off');
set(handles.p3,'visible','on');
set(handles.p4,'visible','off');

% --- Executes on button press in gen2.
function gen2_Callback(hObject, eventdata, handles)
% hObject    handle to gen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status,'String','Extracting Constraints');
global endl;
t = get(handles.testcases,'String');
if str2double(t)<=0
        errordlg('Min no. of test cases = 1','Test Case error');
        set(handles.status,'String','Error');
        return;
end
opSize = get(handles.opsize,'Value');
m = get(handles.m,'String');
n = get(handles.n,'String');
mnum = str2double(m);
nnum = str2double(n);
min = str2double(get(handles.min2,'String'));
max = str2double(get(handles.max2,'String'));
 if max<min
        errordlg('Max Cannot be greater than Min','Max-Min Error');
        set(handles.status,'String','Error');
        return;
 end
ans = zeros(mnum,nnum);
set(handles.status,'String','Generating Random Arrays');
for i = 1:str2double(t)
    if opSize==1
        ss = [m ' ' n];
        if i==1
            ans = {ss};
        else
            ans = char(ans);
            ans = {ans;ss};
        end
    end
    rng('shuffle');
    r = randi([min max],mnum,nnum);
    set(handles.status,'String',['Writing Test Case -' ' ' num2str(i)]);
    if i == str2double(t)-1
       set(handles.status,'String','Be patient,Writing the last test case...'); 
    end
    r = num2str(r);
    if i==1 & opSize==0
        ans = {r};
    else
        ans = char(ans);
        ans = {ans;r};
    end
end
set(handles.op,'String',ans);
s = get(handles.op,'String');
[m n] = size(s);
for i=1:m
    s(i)=strtrim(s(i));
end
set(handles.op,'String',s);
%coping into clipboard
str = [];
for i = 1:size(s,1); 
   row = sprintf('%s\t', s{i,:});
   row(end) = endl;
   str = [str row];
end
clipboard('copy',str);
set(handles.status,'String','Copied to Clipboard !');

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
set(handles.op,'String',' ');
set(handles.status,'String','Status');

% --- Executes on button press in gen4.
function gen4_Callback(hObject, eventdata, handles)
set(handles.status,'String','Extracting Constraints');
global endl
xlr = get(handles.xlr,'Value');
m = str2double(get(handles.srow,'String'));
if xlr==1
    xmin = str2double(get(handles.xmin,'String'));
    xmax = str2double(get(handles.xmax,'String'));
     if xmax<xmin
        errordlg('Max Cannot be greater than Min','Max-Min Error');
        set(handles.status,'String','Error');
        return;
 end
    rng('shuffle');
    x = randi([xmin xmax],m,1);
end
lmin = str2double(get(handles.lmin,'String'));
lmax = str2double(get(handles.lmax,'String'));
rmin = str2double(get(handles.rmin,'String'));
rmax = str2double(get(handles.rmax,'String'));
 if (lmax<lmin) || (rmax<rmin)
        errordlg('Max Cannot be greater than Min','Max-Min Error');
        set(handles.status,'String','Error');
        return;
 end
a = zeros(m,2);
count = 0;
v = get(handles.uibuttongroup3,'SelectedObject');
e = get(handles.e,'Value');
set(handles.status,'String','Generating Random Numbers');
while count~=m
    rng('shuffle');
    l = randi([lmin lmax],1,1);
    rng('shuffle');
    r = randi([rmin rmax],1,1);
    switch v.String
        case 'L<R'
            if e==1
                if l<=r
                    count=count+1;
                    a(count,1) = l;
                    a(count,2) = r;
                end
            else
                if l<r
                    count=count+1;
                    a(count,1) = l;
                    a(count,2) = r;
                end
            end
        case 'L=R'
            if l==r
                count=count+1;
                a(count,1) = l;
                a(count,2) = r;
            end
        case 'L>R'
            if e==1
                if l>=r
                    count=count+1;
                    a(count,1) = l;
                    a(count,2) = r;
                end
            else
                if l>r
                    count=count+1;
                    a(count,1) = l;
                    a(count,2) = r;
                end
            end
        otherwise
            count=count+1;
            a(count,1) = l;
            a(count,2) = r;
    end
    set(handles.status,'String',['Generating row -' ' ' num2str(count)]);
end
if xlr==1
    a = [x a];
end
set(handles.op,'String',num2str(a));
s = get(handles.op,'String');
%coping into clipboard
str = [];
for i = 1:size(s,1); 
   row = sprintf('%s\t', s(i,:));
   row(end) = endl;
   str = [str row];
end
clipboard('copy',str);
set(handles.status,'String','Copied to Clipboard !');


% --- Executes on button press in llr.
function llr_Callback(hObject, eventdata, handles)
set(handles.e,'enable','on');

% --- Executes on button press in ler.
function ler_Callback(hObject, eventdata, handles)
set(handles.e,'enable','off');

% --- Executes on button press in lgr.
function lgr_Callback(hObject, eventdata, handles)
set(handles.e,'enable','on');

% --- Executes on button press in xlr.
function xlr_Callback(hObject, eventdata, handles)
set(handles.uibuttongroup4,'visible','on');


% --- Executes on button press in lr.
function lr_Callback(hObject, eventdata, handles)
set(handles.uibuttongroup4,'visible','off');

% --- Executes on button press in random.
function random_Callback(hObject, eventdata, handles)
set(handles.e,'enable','off');

% --- Executes on button press in xlr2.
function xlr2_Callback(hObject, eventdata, handles)
set(handles.opsize,'enable','off');
set(handles.tcs,'enable','off');
set(handles.testcases,'enable','off');
set(handles.p1,'visible','off');
set(handles.p2,'visible','off');
set(handles.p3,'visible','off');
set(handles.p4,'visible','on');
