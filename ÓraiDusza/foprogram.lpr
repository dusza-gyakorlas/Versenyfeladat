program foprogram;

uses global,beolvas,maxkiv;
var i,darab:shortint;
    m:longint;
begin
  kezd;
  beolv;
  m:=max;
  darab:=0;
  for i:=1 to db do begin
    if t[i]=m then darab:=darab+1;
  end;
  writeln(darab);
  readln;
end.

