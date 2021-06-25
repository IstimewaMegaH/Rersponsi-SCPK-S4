function varargout = ResponsiWP1(varargin)
% RESPONSIWP1 MATLAB code for ResponsiWP1.fig
%      RESPONSIWP1, by itself, creates a new RESPONSIWP1 or raises the existing
%      singleton*.
%
%      H = RESPONSIWP1 returns the handle to a new RESPONSIWP1 or the handle to
%      the existing singleton*.
%
%      RESPONSIWP1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESPONSIWP1.M with the given input arguments.
%
%      RESPONSIWP1('Property','Value',...) creates a new RESPONSIWP1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ResponsiWP1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ResponsiWP1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ResponsiWP1

% Last Modified by GUIDE v2.5 26-Jun-2021 03:17:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ResponsiWP1_OpeningFcn, ...
                   'gui_OutputFcn',  @ResponsiWP1_OutputFcn, ...
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


% --- Executes just before ResponsiWP1 is made visible.
function ResponsiWP1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ResponsiWP1 (see VARARGIN)

% Choose default command line output for ResponsiWP1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ResponsiWP1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ResponsiWP1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('fileexcelWP.xlsx','C2:F51'); %membaca file yang terdapat pada Real.xlsx pada kolom C2 sampai F51
set(handles.tabel,'data',data); % menampilkan pada tabel dengan tag data


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = xlsread('fileexcelWP.xlsx','C2:F51'); %membaca file 
x = [data];
k = [1,0,1,0];%menentukan cost atau benefit
w = [3,5,4,1];%bobot yang telah di tentukan

[m,n]=size (x);
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan dimana melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
if k(j)==0, w(j)=-1*w(j);
end
end
for i=1:m
    S(i)=prod(x(i,:).^w);
end

V= S/sum(S);
Skor_Max = max(V) %melakukan perhitungan nilai maksimal
set(handles.hasil,'String',Skor_Max); %menampilkan data yang sudah di hitung ke tabel dengan tag hasil

function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hasil as text
%        str2double(get(hObject,'String')) returns contents of hasil as a double


% --- Executes during object creation, after setting all properties.
function hasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
