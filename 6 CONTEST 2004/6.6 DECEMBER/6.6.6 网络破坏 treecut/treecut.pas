var
  u,v,n,m,y,tot,i:longint;
  flag:boolean;
  bo,ff:array[0..100010]of boolean;
  h,d:array[0..100010]of longint;
  e:array[0..100010]of record
                        v,n:longint;
                      end;
procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].n:=h[u];
  h[u]:=tot;
  bo[tot]:=true;
end;

function build(u:longint):longint;
var
  num,y,v:longint;
begin
  num:=0;
  ff[u]:=true;
  y:=h[u];
  while y>0 do begin
    v:=e[y].v;
    if not ff[v] then inc(num,build(v))
    else bo[y]:=false;
    y:=e[y].n;
  end;
  d[u]:=num+1;
  exit(num+1);
end;

begin
assign(input,'treecut.in'); reset(input);
assign(output,'treecut.out'); rewrite(output);
  readln(n);
  for i:=1 to n-1 do begin
    readln(u,v);
    add(u,v);
    add(v,u);
  end;
  build(1);
  m:=d[1]>>1;
  for i:=1 to n do if d[1]-d[i]<=m then begin
    flag:=true;
    y:=h[i];
    while y>0 do begin
      if bo[y] and (d[e[y].v]>m) then flag:=false;
      y:=e[y].n;
    end;
    if flag then writeln(i);
  end;
close(output);
end.
