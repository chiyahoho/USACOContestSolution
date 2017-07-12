var
  l,r,ju,n,m,mi,t,p,i:longint;
  d:array[0..100000]of longint;
  f:array[0..100000]of boolean;

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
  x:=d[(l+r)>>1];
  repeat
    while d[i]<x do inc(i);
    while x<d[j] do dec(j);
    if not(i>j) then begin
      swap(d[i],d[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

begin
assign(input,'jump.in'); reset(input);
assign(output,'jump.out'); rewrite(output);
readln(ju,n,m);
for i:=1 to n do readln(d[i]);
sort(1,n);
l:=1; r:=ju;
mi:=(l+r)>>1;
while l<r do begin
        t:=m; p:=0;
        for i:=0 to n do f[i]:=true;
        for i:=1 to n do begin
                if d[i]-d[p]>=mi then p:=i
                else begin
                        f[i]:=false;
                        dec(t);
                end;
        end;
        while ju-d[p]<mi do begin
                if f[p] then dec(t);
                dec(p);
        end;
    //    if (l=r-1) then inc(l)
    //    else
        if (t>=0)and(l=r-1)and(mi=l) then inc(mi)
        else if (t<0)and(l=r-1)and(mi=r) then begin dec(r); dec(mi); end
        else if t>=0 then begin l:=mi;mi:=(l+r)>>1; end
        else begin r:=mi; mi:=(l+r)>>1; end;
end;
writeln(mi);
close(output);
end.
