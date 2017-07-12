var
  n,i,k,max:longint;
  a,b:array[0..100000]of longint;
  num:array[0..100000,0..1]of longint;
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
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'balance.in'); reset(input);
assign(output,'balance.out'); rewrite(output);
readln(n);
for i:=1 to n do begin
        readln(b[i],a[i]);
        if b[i]=0 then b[i]:=-1;
end;
sort(1,n);
for i:=1 to n do begin
        inc(k,b[i]);
        if num[k,0]=0 then num[k,0]:=i;
        num[k,1]:=i;
end;
for i:=-n to n do if (num[i,0]<>0)and(num[i,1]<>num[i,0])and(a[num[i,1]]-a[num[i,0]+1]>max) then max:=a[num[i,1]]-a[num[i,0]+1];
writeln(max);
close(output);
end.