var
  dist:extended;
  a,b,aa,bb,ansa,ansb:longint;

function pan(a,b:longint):boolean;
var
  k:extended;
begin
  k:=(a/b)-(aa/bb);
  if abs(k)<dist then begin
    dist:=abs(k);
    ansa:=a; ansb:=b;
  end;
  if k=0 then begin
    writeln(a,' ',b);
    close(output);
    halt;
  end;
  if k>0 then exit(true) else exit(false);
end;

begin
assign(input,'nearfr.in'); reset(input);
assign(output,'nearfr.out'); rewrite(output);
  readln(aa,bb);
  dist:=40000;
  a:=1; b:=1;
  repeat
    if (a mod aa=0)and(b mod bb=0) then inc(a)
    else if pan(a,b) then inc(b) else inc(a);
  until (a>32767)or(b>32767);
  writeln(ansa,' ',ansb);
close(output);
end.