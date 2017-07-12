var
  ans,k,c,l,n,m,p,i:longint;
  s,e:array[0..20000]of longint;
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
  x:=s[(l+r)>>1];
  repeat
    while s[i]<x do inc(i);
    while x<s[j] do dec(j);
    if not(i>j) then begin
      swap(s[i],s[j]);
      swap(e[i],e[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'mud.in'); reset(input);
assign(output,'mud.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do readln(s[i],e[i]);
  sort(1,n);
  p:=0;
  while p<n do begin
    inc(p);
    l:=e[p]-s[p];
    k:=l div m;
    if l mod m<>0 then begin
      inc(k);
      c:=k*m+s[p];
      while (e[p+1]<=c)and(p<n) do inc(p);
      if (p<n)and(s[p+1]<c) then s[p+1]:=c;
    end;
    inc(ans,k);
  end;
  writeln(ans);
close(output);
end.