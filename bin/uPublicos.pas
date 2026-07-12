unit uPublicos;

interface

uses
  Forms, IniFiles, SysUtils, Dialogs, Windows, StdCtrls, Controls, DateUtils;

type
  TVectorHoras = array [0..23] of integer;


  function LeerIni(Archivo, Seccion, Clave, Default: String): String;
  function calcularEdad(elNatalicio:string):integer;
  function validarFechas(desde, hasta : TDate):boolean;
  function fechaComoPeriodo(laFecha: Tdate) :Tdate;
  function diaDelMes(laFecha :TDate; elDia :integer) :TDate;
  function fechayyyymmdd(laFecha :TDate) :string;
  procedure GrabarIni(Archivo, Seccion, Clave, Valor: String);

implementation

function LeerIni(Archivo, Seccion, Clave, Default: String): String;
var
  IFile: TIniFile;
begin
  IFile:= TIniFile.Create(Archivo);
  try
    if IFile.ValueExists(Seccion, Clave) then
      Result:= IFile.ReadString(Seccion, Clave, Default)
    else
    begin
      IFile.WriteString(Seccion, Clave, Default);
      Result:= Default;
    end;
  finally
    IFile.Free;
  end;
end;

function calcularEdad(elNatalicio:string):integer;
var
  iTemp,iTemp2,Nada:word;
  Fecha:TDate;
begin
  // fuente http://www.clubdelphi.com/foros/showthread.php?t=27658&highlight=edad
  Fecha:=StrToDate(elNatalicio);
  DecodeDate(Date,itemp,Nada,Nada);
  DecodeDate(Fecha,itemp2,Nada,Nada);
  if FormatDateTime('mmdd',Date) < FormatDateTime('mmdd',Fecha) then
    Result:=iTemp-iTemp2-1
  else
    Result:=iTemp-iTemp2;
end;


procedure GrabarIni(Archivo, Seccion, Clave, Valor: String);
var
  IFile: TIniFile;
begin
  IFile:= TIniFile.Create(Archivo);
  try
      IFile.WriteString(Seccion, Clave, Valor);
  finally
    IFile.Free;
  end;
end;

function validarFechas(desde, hasta : TDate):boolean;
begin
  if desde > hasta then
    begin
    application.MessageBox(#13+'Fecha desde no puede ser mayor a fecha hasta',
      'Atención',MB_OK + MB_ICONINFORMATION);
    result:=false;
    end
  else
    result:=true;
end;

function fechaComoPeriodo(laFecha: Tdate) :Tdate;
var
  anio, mes, dia :word;
  periodo :Tdate;
begin
  // función que recibe una fecha cualquiera, 13/09/2016, y la devuelve como
  // 01/09/2016 para que sea usada como periodo por el sistema de alquileres
  //periodo:=date;
  DecodeDate(laFecha, anio, mes, dia);
  dia:=1;
  periodo:=EncodeDate(anio, mes, 1);
  result:=periodo;
end;

function diaDelMes(laFecha :TDate; elDia :integer) :TDate;
var
  anio, mes, dia :word;
  periodo :Tdate;
begin
  // función que arma una fecha a partir de la fecha parámetro y el día indicado
  // para que sea utilizada por el sistema alquileres y formar los tres
  // vencimientos 10 - 20 - 30 días
  // hay que tener cuidado con que la fecha a 30 días no supere la candidad de
  // días del mes
  DecodeDate(laFecha, anio, mes, dia);
  if elDia < 21 then
    begin
    // cuando se pide un día mayor a 21, devuelvo el último día del mes
    dia:=elDia;
    periodo:=EncodeDate(anio, mes, dia);
    end
  else
    begin
    periodo:=EndOfAMonth(anio, mes);
    end;
  result:=periodo;
end;

function fechayyyymmdd(laFecha :TDate) :string;
var
  anio, mes, dia :word;
begin
  // procedimiento para armar la fecha de la factura electrónica
  DecodeDate(laFecha, anio, mes, dia);
  result:=IntToStr(anio)+IntToStr(mes)+IntToStr(dia);
end;

end.
