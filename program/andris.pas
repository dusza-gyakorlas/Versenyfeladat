unit Andris;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, StrUtils, global;

implementation

function kiindul():string;
begin
  kiindul:=adatok[1].x;
  kiindul:=kiindul+' '+floattostr(adatok[1].y);
end;

function erkezik():string;
begin
  erkezik:=(adatok[adatokhossz-1].x);
  erkezik:=erkezik+' '+floattostr(adatok[adatokhossz-1].y);
end;

function teljesut():real;
var i,j:integer;
begin
  teljesut:=0;
  for i:=3 to adatokhossz-1 do begin
    if adatok[i].allapot=0 then begin
      for j:=i-1 downto 2 do begin
        if adatok[j].allapot=0 then begin
          teljesut:=teljesut + (sqrt (sqr((adatok[i].x)-(adatok[j].x)) +
            sqr((adatok[i].y)-(adatok[j].y)) ));
        end;
      end;
    end;
  end;
end;

function atlagv():real;
var i,koordszam:integer;
begin
  koordszam:=0;
  for i:=2 to adatokhossz-1 do begin
    if adatok[i].allapot=0 then begin
      koordszam:=koordszam+1;
      atlagv:=atlagv+abs(adatok[i].v);
    end;
  end;
  atlagv:=atlagv / koordszam;
end;

function maxv():real;
var i:integer;
begin
  maxv:=-1;
  for i:=2 to adatokhossz-1 do begin
    if adatok[i].allapot=0 then begin
      if adatok[i].v>maxv then maxv:=abs(adatok[i].v);
    end;
  end;
end;

function incidensek():integer;
var i:integer;
begin
  incidensek:=0;
  //gyorshajtás
  for i:=2 to adatokhossz-1 do begin
    if adatok[i].allapot=0 then begin
      if (adatok[i].v) > (terkep[ (((adatok[i].x) div 10)+1),(((adatok[i].y) div 10)+1  ]
        then incidensek:=incidensek+1;
    end;
  end;
  //hirtelen dolgok
  for i:=2 to adatokhossz-1 do begin
    if (adatok[i].a>2,5) or (adatok[i].a<-2,5) then incidensek:=incidensek+1;
  end;
end;

end.
