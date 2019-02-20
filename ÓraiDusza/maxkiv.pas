unit maxkiv;

{$mode objfpc}{$H+}

interface


uses
  Classes, SysUtils, global;
function max:longint;
implementation
function max:longint;
var i:longint;
begin
 max:=-1;
 for i:=1 to db do begin
  if t[i]>max then max:=t[i]
 end;
end;
end.

