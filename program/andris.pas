unit Andris;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

implementation

function kiindul():string;
begin
  kiindul:=adatok[1].x;
  kiindul:=kiindul+' '+adatok[1].y;
end;

function erkezik():string;
begin
  erkezik:=(adatok[adatokhossz].x);
  erkezik:=erkezik+' '+adatok[adatokhossz].y;
end;

end.
