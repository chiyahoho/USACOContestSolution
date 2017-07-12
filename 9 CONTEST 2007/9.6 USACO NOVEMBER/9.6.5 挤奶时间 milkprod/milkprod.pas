var
  i,n,m,rest,j,max:longint;
  a,b,c,f:array[0..2000]of longint;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j,x:longint;
begin
  i:=l; j:=r;
  x:=a[(l+r)>>1];
  repeat
    while a[i]<x do inc(i);
    while x<a[j] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      swap(b[i],b[j]);
      swap(c[i],c[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'milkprod.in'); reset(input);
assign(output,'milkprod.out'); rewrite(output);
  readln(n,m,rest);
  dec(rest);
  for i:=1 to m do readln(a[i],b[i],c[i]);
  sort(1,m);
  f[1]:=c[1];
  for i:=2 to m do begin
        if c[i]>f[i] then f[i]:=c[i];
        for j:=1 to i-1 do if (b[j]+rest<a[i]) and (f[j]+c[i]>f[i]) then f[i]:=f[j]+c[i];
  end;
  for i:=1 to m do if f[i]>max then max:=f[i];
  writeln(max);
close(output);
end.