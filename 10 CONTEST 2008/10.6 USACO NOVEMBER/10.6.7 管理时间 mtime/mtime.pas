var
  i,n,ans:longint;
  a,t:array[0..100000]of longint;
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
      swap(t[i],t[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'mtime.in'); reset(input);
assign(output,'mtime.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
    readln(t[i],a[i]);
  end;
  sort(1,n);
  for i:=n downto 2 do if a[i]-t[i]<a[i-1] then a[i-1]:=a[i]-t[i];
  ans:=a[1]-t[1];
  if ans<0 then ans:=-1;
  writeln(ans);
close(output);
end.