unit beolvas;

{$mode objfpc}{$H+}

interface

uses
  global, Classes, SysUtils;

procedure beolv;

implementation

procedure beolv;
var i:int32;
begin
  writeln('Hany szam van?');
  readln(db);
  writeln('Ird be a szamokat');
  for i:=1 to db do readln(t[i]);
end;

end.

