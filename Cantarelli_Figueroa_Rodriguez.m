function varargout = Cantarelli_Figueroa_Rodriguez(varargin)
%CANTARELLI_FIGUEROA_RODRIGUEZ MATLAB code file for Cantarelli_Figueroa_Rodriguez.fig
%      CANTARELLI_FIGUEROA_RODRIGUEZ, by itself, creates a new CANTARELLI_FIGUEROA_RODRIGUEZ or raises the existing
%      singleton*.
%
%      H = CANTARELLI_FIGUEROA_RODRIGUEZ returns the handle to a new CANTARELLI_FIGUEROA_RODRIGUEZ or the handle to
%      the existing singleton*.
%
%      CANTARELLI_FIGUEROA_RODRIGUEZ('Property','Value',...) creates a new CANTARELLI_FIGUEROA_RODRIGUEZ using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Cantarelli_Figueroa_Rodriguez_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      CANTARELLI_FIGUEROA_RODRIGUEZ('CALLBACK') and CANTARELLI_FIGUEROA_RODRIGUEZ('CALLBACK',hObject,...) call the
%      local function named CALLBACK in CANTARELLI_FIGUEROA_RODRIGUEZ.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cantarelli_Figueroa_Rodriguez

% Last Modified by GUIDE v2.5 12-Jun-2019 01:13:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cantarelli_Figueroa_Rodriguez_OpeningFcn, ...
                   'gui_OutputFcn',  @Cantarelli_Figueroa_Rodriguez_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Cantarelli_Figueroa_Rodriguez is made visible.
function Cantarelli_Figueroa_Rodriguez_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Cantarelli_Figueroa_Rodriguez
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cantarelli_Figueroa_Rodriguez wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Cantarelli_Figueroa_Rodriguez_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Aceptar.
function Aceptar_Callback(hObject, eventdata, handles)
% hObject    handle to Aceptar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

valor_cond1=nanmean(str2double(get(handles.Condicion1, 'String')))
valor_cond2=str2double(get(handles.Condicion2, 'String'))
condicion=[valor_cond1; valor_cond2]

orden = get(handles.Orden, 'String')
orden = orden{1}
func = get(handles.Funcion, 'String')

syms y(x)
funcion = eval(strcat('diff(y,', orden,')==', func));

p_i = str2double(get(handles.PuntoInicial, 'String'))
p_f = str2double(get(handles.PuntoFinal, 'String'))
it = str2double(get(handles.Iteracion, 'String'))

[X Y] = Runge_Kutta(funcion, p_i, p_f, condicion, it);
ejeY =  Y(1,:);

axes(handles.grafica);
newplot,
plot(X,ejeY,'r.');
axis([-0.5 3 0 5]);

%utilizo esto para marcar los ejes%
axh = gca;
color = 'k';
linestyle = ':';
line(get(axh,'XLim'), [0 0], 'Color', color, 'LineStyle', linestyle);
line([0 0], get(axh,'YLim'), 'Color', color, 'LineStyle', linestyle);

xlabel('x')
ylabel('y')
title('Graficador', 'FontSize',12)


function Condicion1_Callback(hObject, eventdata, handles)
% hObject    handle to Condicion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Condicion1 as text
%        str2double(get(hObject,'String')) returns contents of Condicion1 as a double

% --- Executes during object creation, after setting all properties.
function Condicion1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Condicion1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Condicion2_Callback(hObject, eventdata, handles)
% hObject    handle to Condicion2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Condicion2 as text
%        str2double(get(hObject,'String')) returns contents of Condicion2 as a double

% --- Executes during object creation, after setting all properties.
function Condicion2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Condicion2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Aproximar.
function Aproximar_Callback(hObject, eventdata, handles)
% hObject    handle to Aproximar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valor_cond1=nanmean(str2double(get(handles.Condicion1, 'String')))
valor_cond2=str2double(get(handles.Condicion2, 'String'))
condicion=[valor_cond1; valor_cond2]


orden = get(handles.Orden, 'String')
orden = orden{1}
func = get(handles.Funcion, 'String')

syms y(x)
funcion = eval(strcat('diff(y,', orden,')==', func));

p_i = str2double(get(handles.PuntoInicial, 'String'))
p_f = str2double(get(handles.PuntoFinal, 'String'))
it = str2double(get(handles.Iteracion, 'String'))

[X Y] = Runge_Kutta(funcion, p_i, p_f, condicion, it);
ejeY =  Y(1,:);

syms x
fam = [1 x x^2];
res(x)=Aproximacion_Discreta(fam, X, ejeY)

axes(handles.grafica);
hold on
%no especifico color para que use varios%
plot(X,res(X),'m');
axis([-0.1 2.3 -0.1 5]);


function PuntoInicial_Callback(hObject, eventdata, handles)
% hObject    handle to PuntoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PuntoInicial as text
%        str2double(get(hObject,'String')) returns contents of PuntoInicial as a double

% --- Executes during object creation, after setting all properties.
function PuntoInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PuntoInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PuntoFinal_Callback(hObject, eventdata, handles)
% hObject    handle to PuntoFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PuntoFinal as text
%        str2double(get(hObject,'String')) returns contents of PuntoFinal as a double

% --- Executes during object creation, after setting all properties.
function PuntoFinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PuntoFinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Iteracion_Callback(hObject, eventdata, handles)
% hObject    handle to Iteracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Iteracion as text
%        str2double(get(hObject,'String')) returns contents of Iteracion as a double

% --- Executes during object creation, after setting all properties.
function Iteracion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Iteracion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Orden_Callback(hObject, eventdata, handles)
% hObject    handle to Orden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Orden as text
%        str2double(get(hObject,'String')) returns contents of Orden as a double


% --- Executes during object creation, after setting all properties.
function Orden_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Orden (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Aproximar2.
function Aproximar2_Callback(hObject, eventdata, handles)
% hObject    handle to Aproximar2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valor_cond1=nanmean(str2double(get(handles.Condicion1, 'String')))
valor_cond2=str2double(get(handles.Condicion2, 'String'))
condicion=[valor_cond1; valor_cond2]


orden = get(handles.Orden, 'String')
orden = orden{1}
func = get(handles.Funcion, 'String')

syms y(x)
funcion = eval(strcat('diff(y,', orden,')==', func));

p_i = str2double(get(handles.PuntoInicial, 'String'))
p_f = str2double(get(handles.PuntoFinal, 'String'))
it = str2double(get(handles.Iteracion, 'String'))

[X Y] = Runge_Kutta(funcion, p_i, p_f, condicion, it);
ejeY =  Y(1,:);

syms x
fam = [0.2*exp(1)    0.5*exp(x)    -0.2*exp(x^2)];
res(x)=Aproximacion_Discreta(fam, X, ejeY)

axes(handles.grafica);
hold on
%no especifico color para que use varios%
plot(X,res(X),'g');
axis([-0.1 2.3 -0.1 5]);

% --- Executes on button press in Limpiar.
function Limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to Limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.grafica);
title('Graficador', 'FontSize',12);


function Funcion_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Funcion as text
%        str2double(get(hObject,'String')) returns contents of Funcion as a double

% --- Executes during object creation, after setting all properties.
function Funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Familias_Callback(hObject, eventdata, handles)
% hObject    handle to Familias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Familias as text
%        str2double(get(hObject,'String')) returns contents of Familias as a double


% --- Executes during object creation, after setting all properties.
function Familias_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Familias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AproximarFlia.
function AproximarFlia_Callback(hObject, eventdata, handles)
% hObject    handle to AproximarFlia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valor_cond1=nanmean(str2double(get(handles.Condicion1, 'String')))
valor_cond2=str2double(get(handles.Condicion2, 'String'))
condicion=[valor_cond1; valor_cond2]

orden = get(handles.Orden, 'String')
orden = orden{1}
func = get(handles.Funcion, 'String')

syms y(x)
funcion = eval(strcat('diff(y,', orden,')==', func));

p_i = str2double(get(handles.PuntoInicial, 'String'))
p_f = str2double(get(handles.PuntoFinal, 'String'))
it = str2double(get(handles.Iteracion, 'String'))

[X Y] = Runge_Kutta(funcion, p_i, p_f, condicion, it);
ejeY =  Y(1,:);

syms x
fam = get(handles.Familias, 'String');
fam = regexp(fam, ' ', 'split');
fam = str2sym(fam);
res(x)=Aproximacion_Discreta(fam, X, ejeY)

axes(handles.grafica);
hold on
plot(X,res(X),'b');
axis([-0.1 2.3 -0.1 5]);


% --- Executes on button press in Ayudabttn.
function Ayudabttn_Callback(hObject, eventdata, handles)
% hObject    handle to Ayudabttn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Llama a la otra GUI
help;
