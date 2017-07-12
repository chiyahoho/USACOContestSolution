var
  n,i,j,ans,tot,k:longint;
  a:array[0..300,0..300]of longint;
  q:array[0..900,0..205]of longint;
  f:array[0..1000]of longint;

function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;

function min(a,b:longint):longint;
begin
  if a>b then exit(b) else exit(a);
end;

function ask(num:longint):longint;
var
  i,aa,tott:longint;
  flag:boolean;
begin
  aa:=-maxlongint; tott:=0;
  f[0]:=0;
  for i:=1 to n do begin
        inc(tott,q[num,i]);
        f[i]:=max(f[i-1]+q[num,i],q[num,i]);
        if f[i]>aa then aa:=f[i];
  end;
  f[0]:=0;
  flag:=true;
  for i:=1 to n do if q[num,i]>0 then flag:=false;
if flag then begin
  for i:=1 to n do if q[num,i]>aa then aa:=q[num,i];
end
else begin
  for i:=1 to n do begin
        f[i]:=min(f[i-1]+q[num,i],q[num,i]);
        if tott-f[i]>aa then aa:=tott-f[i];
  end;
end;
  exit(aa);
end;

begin
assign(input,'lepr.in'); reset(input);
assign(output,'lepr.out'); rewrite(output);
  readln(n);
  ans:=-maxlongint;
  for i:=1 to n do begin
        inc(tot);
        for j:=1 to n do begin
                read(a[i,j]);
                q[tot,j]:=a[i,j];
        end;
  end;
  for j:=1 to n do begin
        inc(tot);
        for i:=1 to n do q[tot,i]:=a[i,j];
        inc(tot);
        for i:=1 to n do q[tot,i]:=a[i,(i+j-2)mod n+1];
        inc(tot);
        for i:=1 to n do q[tot,i]:=a[i,(j-i+n)mod n+1];
  end;
  for i:=1 to tot do begin
        k:=ask(i);
        if k>ans then ans:=k;
  end;
  writeln(ans);
close(output);
end.
