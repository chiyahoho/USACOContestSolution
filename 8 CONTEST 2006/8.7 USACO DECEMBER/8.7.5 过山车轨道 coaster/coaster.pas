var
  l,n,b,i,p,j,ans:longint;
  x,w,fun,c:array[0..100000]of longint;
  f:array[0..2000,0..2000]of longint;

procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j,mi:longint;
begin
  i:=l; j:=r;
  mi:=w[(l+r)>>1];
  repeat
    while w[i]<mi do inc(i);
    while mi<w[j] do dec(j);
    if not(i>j) then begin
      swap(x[i],x[j]);
      swap(w[i],w[j]);
      swap(c[i],c[j]);
      swap(fun[i],fun[j]);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

procedure tget(a:longint; var b:longint);
begin
        if a>b then b:=a;
end;

begin
assign(input,'coaster.in'); reset(input);
assign(output,'coaster.out'); rewrite(output);
readln(l,n,b);
  for i:=1 to n do begin
        readln(x[i],w[i],fun[i],c[i]);
        inc(w[i],x[i]);
  end;
  sort(1,n);
  fillchar(f,sizeof(f),200);
  f[0,0]:=0;
  p:=1;
  for i:=1 to l do begin
        while w[p]=i do begin
                for j:=1 to b do if j>=c[p] then
                  tget(f[x[p],j-c[p]]+fun[p],f[i,j]);
                inc(p);
        end;
  end;
  ans:=f[l+1,b+2];
  for j:=1 to b do if f[l,j]>ans then ans:=f[l,j];
  if ans<0 then ans:=-1;
  writeln(ans);
close(output);
end.
