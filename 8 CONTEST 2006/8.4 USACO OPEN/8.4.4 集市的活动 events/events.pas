var
  i,n,p,time:longint;
  a,b:array[0..10010]of longint;
  f:array[0..200100]of longint;
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
  x:=b[(l+r)>>1];
  repeat
    while b[i]<x do inc(i);
    while x<b[j] do dec(j);
    if not(i>j) then begin
      swap(a[i],a[j]);
      swap(b[i],b[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure tget(var a,b:longint);
begin
  if a>b then b:=a;
end;

begin
assign(input,'events.in'); reset(input);
assign(output,'events.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
    readln(a[i],b[i]);
    inc(b[i],a[i]);
    if b[i]>time then time:=b[i];
  end;
  sort(1,n);
  p:=1;
  for i:=1 to time do begin
    f[i]:=f[i-1];
    while b[p]=i do begin
      if f[a[p]]+1>f[i] then f[i]:=f[a[p]]+1;
      inc(p);
    end;
  end;
  writeln(f[time]);
close(output);
end.