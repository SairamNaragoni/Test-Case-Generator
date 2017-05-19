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

% Last Modified by GUIDE v2.5 18-May-2017 21:53:05

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
set(handles.opsize,'enable','off');

function stringsize_Callback(hObject, eventdata, handles)
% hObject    handle to stringsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stringsize as text
%        str2double(get(hObject,'String')) returns contents of stringsize as a double


% --- Executes during object creation, after setting all properties.
function stringsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stringsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gen3.
function gen3_Callback(hObject, eventdata, handles)
% hObject    handle to gen3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3



function custom_Callback(hObject, eventdata, handles)
% hObject    handle to custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of custom as text
%        str2double(get(hObject,'String')) returns contents of custom as a double


% --- Executes during object creation, after setting all properties.
function custom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to custom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min1_Callback(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min1 as text
%        str2double(get(hObject,'String')) returns contents of min1 as a double


% --- Executes during object creation, after setting all properties.
function min1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max1_Callback(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max1 as text
%        str2double(get(hObject,'String')) returns contents of max1 as a double


% --- Executes during object creation, after setting all properties.
function max1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gen1.
function gen1_Callback(hObject, eventdata, handles)
% hObject    handle to gen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = get(handles.testcases,'String');
for i = 1:str2num(t)
    min = str2num(get(handles.min1,'String'));
    max = str2num(get(handles.max1,'String'));
    rng('shuffle');
    r = randi([min max]);
    str = get(handles.op,'String');
    str = char(str);
    r = num2str(r);
    if i==1
        set(handles.op,'String',r);
    else
        str = {str;r};
        set(handles.op,'String',str);
    end 
end
% --- Executes on button press in array.
function array_Callback(hObject, eventdata, handles)
% hObject    handle to array (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of array
set(handles.opsize,'enable','on');

% --- Executes on button press in numbers.
function numbers_Callback(hObject, eventdata, handles)
% hObject    handle to numbers (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of numbers
set(handles.opsize,'enable','off');

function strings_Callback(hObject, eventdata, handles)
set(handles.opsize,'enable','on');

function testcases_Callback(hObject, eventdata, handles)
% hObject    handle to testcases (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of testcases as text
%        str2double(get(hObject,'String')) returns contents of testcases as a double


% --- Executes during object creation, after setting all properties.
function testcases_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testcases (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in opsize.
function opsize_Callback(hObject, eventdata, handles)
% hObject    handle to opsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of opsize
% --- Executes on button press in gen2.
function gen2_Callback(hObject, eventdata, handles)
% hObject    handle to gen2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t = get(handles.testcases,'String');
opSize = get(handles.opsize,'Value');
for i = 1:str2num(t)
    m = get(handles.m,'String');
    n = get(handles.n,'String');
    if opSize==1
        str1 = [m ' ' n];
        str = get(handles.op,'String');
        str = char(str);
        if i==1
            set(handles.op,'String',str1);
        else
            str = {str;str1};
            set(handles.op,'String',str);
        end
    end
    min = str2num(get(handles.min2,'String'));
    max = str2num(get(handles.max2,'String'));
    m = str2num(m);
    n = str2num(n);
    rng('shuffle');
    r = randi([min max],m,n);
    str = get(handles.op,'String');
    str = char(str);
    r = num2str(r);
    if i==1 & opSize==0
        set(handles.op,'String',r);
    else
        str = {str;r};
        set(handles.op,'String',str);
    end 
end
% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.op,'String',' ');
