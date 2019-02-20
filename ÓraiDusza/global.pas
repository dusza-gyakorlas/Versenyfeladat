unit global;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

var t:array[1..100] of longint;
    db:shortint;
procedure kezd;

implementation

procedure kezd;
var i:shortint;
begin
  for i:=1 to 100 do t[i]:=0;
end;

end.

