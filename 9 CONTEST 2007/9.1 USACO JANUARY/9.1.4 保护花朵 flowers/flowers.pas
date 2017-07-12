var
  ans,sum:int64;
  i,n:longint;
  t,d:array[0..200000]of longint;
  x:array[0..200000]of extended;

procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j:longint;
  mi,y:extended;
begin
  i:=l; j:=r;
  mi:=x[(l+r)>>1];
  repeat
    while mi-x[i]>0.00000001 do inc(i);
    while x[j]-mi>0.00000001 do dec(j);
    if not(i>j) then begin
      y:=x[i]; x[i]:=x[j]; x[j]:=y;
      swap(t[i],t[j]);
      swap(d[i],d[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'flowers.in'); reset(input);
assign(output,'flowers.out'); rewrite(output);
readln(n);
for i:=1 to n do begin
        readln(t[i],d[i]);
        t[i]:=t[i]<<1;
        x[i]:=t[i]/d[i];
        inc(sum,d[i]);
end;
sort(1,n);
for i:=1 to n do begin
        dec(sum,d[i]);
        inc(ans,sum*t[i]);
end;
writeln(ans);
close(output);
end.