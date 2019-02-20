unit Dani;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Global;

implementation
procedure meghataroz;
var s,t,v:real;
     i:int32.
begin
  for i:=1 to adatokhossz do begin
    if adatok[i].allapot=0 then begin
     if adatok[i-1].allapot=0 then begin
      t:=adatok[i].t-adatok[i-1].t;
      s:=sqrt(sqr(adatok[i].x-adatok[i-1].x)+sqr(adatok[i].y-adatok[i-1].y));
      adatok[i].v:=s/t;
      adatok[i].a:=adatok[i].v-adatok[i-1].v;
     end else begin
      adatok[i].v:=0;
      adatok[i].a:=0;
     end;
   end;
  end;
end;

procedure lekerdezes(t:real);
var x0,x1,y0,y1,v,v0,v1,t,t0,t1,a,s:real;
  i,j:int32;

begin

  i:=1;
  while (adatok[i].allapot<>0) or (adatok[i].t<t) do i:=i+1; //kiszámolja h melyik két mintavételi pont között van

  j:=1;
  while adatok[i-j].allapot=0 do j:=j+1;                  //motor állapota
  if adatok[i-j].allapot=1 then writeln('Beindítva')
  else begin
   writeln('Leállítva');
   end;


   adatok[i-1].t=t then a:=adatok[i-1].a         //kiszámolja a gyorsulását
   else a:=(adatok[i-1].a+adatok[i].a)/2;

   x0:=adatok[i-1].x;                        //v0..megadja
   x1:=adatok[i].x;
   y0:=adatok[i-1].y;
   y1:=adatok[i].y;
   v0:=adatok[i-1].v;
   v1:=adatok[i].v;
   t0:=adatok[i-1].t;
   t1:=adatok[i].t;
    s:=v0*(t-t0)+(a/2)*sqr(t-t0);            //mekkora utat tett meg az autó a legutóbbi mintavétel óta

    if x0<>x1 then begin
      if x1>x0 then writeln(x0+s)
      else writeln(x0-s);
    end;                                    //autó pozícióját kiírja

    if y0<>y1 then begin
      if y1>y0 then writeln(y0+s)
      else writeln(y0-s);
    end;

   v:=v0+a*(t-t0);                          //aktuális sebesség kiírása

   writeln(a);                             //aktuális gyorsulás kiírása

   if v*3,6>terkep[x,y] then writeln('Az autó túl gyorsan megy');

   if a>2,5 then writeln('AZ autó hirtelen gyorsul');
   if a<-2,5 then writeln('Az autó hirtelen lassul');
end.

