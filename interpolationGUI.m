function varargout = interpolationGUI(varargin)
% INTERPOLATIONGUI MATLAB code for interpolationGUI.fig
%      INTERPOLATIONGUI, by itself, creates a new INTERPOLATIONGUI or raises the existing
%      singleton*.
%
%      H = INTERPOLATIONGUI returns the handle to a new INTERPOLATIONGUI or the handle to
%      the existing singleton*.
%
%      INTERPOLATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERPOLATIONGUI.M with the given input arguments.
%
%      INTERPOLATIONGUI('Property','Value',...) creates a new INTERPOLATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interpolationGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interpolationGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interpolationGUI

% Last Modified by GUIDE v2.5 22-Oct-2016 13:12:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interpolationGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @interpolationGUI_OutputFcn, ...
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


% --- Executes just before interpolationGUI is made visible.
function interpolationGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interpolationGUI (see VARARGIN)

% Choose default command line output for interpolationGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interpolationGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interpolationGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in interpolatedFunctionSelect.
function interpolatedFunctionSelect_Callback(hObject, eventdata, handles)
% hObject    handle to interpolatedFunctionSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns interpolatedFunctionSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from interpolatedFunctionSelect


% --- Executes during object creation, after setting all properties.
function interpolatedFunctionSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interpolatedFunctionSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0Edit_Callback(hObject, eventdata, handles)
% hObject    handle to x0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0Edit as text
%        str2double(get(hObject,'String')) returns contents of x0Edit as a double


% --- Executes during object creation, after setting all properties.
function x0Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0Edit_Callback(hObject, eventdata, handles)
% hObject    handle to y0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0Edit as text
%        str2double(get(hObject,'String')) returns contents of y0Edit as a double


% --- Executes during object creation, after setting all properties.
function y0Edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0Edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function squareSideLengthEdit_Callback(hObject, eventdata, handles)
% hObject    handle to squareSideLengthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of squareSideLengthEdit as text
%        str2double(get(hObject,'String')) returns contents of squareSideLengthEdit as a double


% --- Executes during object creation, after setting all properties.
function squareSideLengthEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to squareSideLengthEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in logDebugInfoCheckbox.
function logDebugInfoCheckbox_Callback(hObject, eventdata, handles)
% hObject    handle to logDebugInfoCheckbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logDebugInfoCheckbox


% --- Executes on selection change in displayTypeSelect.
function displayTypeSelect_Callback(hObject, eventdata, handles)
% hObject    handle to displayTypeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns displayTypeSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from displayTypeSelect


% --- Executes during object creation, after setting all properties.
function displayTypeSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displayTypeSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
x0 = str2double(get(handles.x0Edit, 'String'));
y0 = str2double(get(handles.y0Edit, 'String'));
H = str2double(get(handles.squareSideLengthEdit, 'String'));
epsilon = str2double(get(handles.epsilonEdit, 'String'));
logDebugInfo = get(handles.logDebugInfoCheckbox, 'Value');
interpolatedFunctionIndex = get(handles.interpolatedFunctionSelect, 'Value');
displayType = get(handles.displayTypeSelect, 'Value');

availableFunctions = {
    @(x, y)(x^2 + y^2)
    @(x, y)(x + y)
    @(x, y)(x^3 + y^3)
    @(x, y)(sin(x) + cos(y))
    };

interpolateSquare(availableFunctions{interpolatedFunctionIndex}, x0, y0, H, 1, epsilon, logDebugInfo, displayType);



function epsilonEdit_Callback(hObject, eventdata, handles)
% hObject    handle to epsilonEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilonEdit as text
%        str2double(get(hObject,'String')) returns contents of epsilonEdit as a double


% --- Executes during object creation, after setting all properties.
function epsilonEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilonEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
