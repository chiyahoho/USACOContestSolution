var
  ans,k,i,n,sum:longint;
  a,w,s:array[0..1000000]of longint;
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
      swap(w[i],w[j]);
      swap(s[i],s[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'acrobat.in'); reset(input);
assign(output,'acrobat.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
    readln(w[i],s[i]);
    a[i]:=w[i]+s[i];
  end;
  sort(1,n);
  ans:=-maxlongint;
  for i:=1 to n do begin
    k:=sum-s[i];
    if k>ans then ans:=k;
    inc(sum,w[i]);
  end;
  writeln(ans);
close(output);
end.
