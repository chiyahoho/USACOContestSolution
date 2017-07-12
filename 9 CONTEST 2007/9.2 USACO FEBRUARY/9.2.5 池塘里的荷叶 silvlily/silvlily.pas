var
  ve,vs,i,j,n,m,tot:longint;
  oo:int64;
  t,bu,fang,q,h,tu:array[0..10000]of int64;
  a:array[0..50,0..50]of longint;
  f:array[0..10000]of boolean;
  e:array[0..100000]of record v,n:longint; end;
function get(i,j:longint):longint;
begin
exit((i-1)*m+j);
end;

procedure add(ui,uj,vi,vj:longint);
var u,v:longint;
begin
if (vi<=0)or(vi>n)or(vj<=0)or(vj>m)or(a[vi,vj]=2) then exit;
u:=get(ui,uj);
v:=get(vi,vj);

inc(tot);
e[tot].v:=v;
e[tot].n:=h[u];
h[u]:=tot;

inc(tot);
e[tot].v:=u;
e[tot].n:=h[v];
h[v]:=tot;
end;

function relax(u,v,y:longint):boolean;
var l:longint;
begin
  if tu[v]=0 then l:=1 else l:=0;
  if fang[u]+l<fang[v] then begin
        fang[v]:=fang[u]+l;
        bu[v]:=bu[u]+1;
        t[v]:=t[u];
        exit(true);
  end;
  if fang[u]+l=fang[v] then begin
         if bu[u]+1<bu[v] then begin
                bu[v]:=bu[u]+1;
                t[v]:=t[u];
                exit(true);
         end;
         if bu[u]+1=bu[v] then begin
                inc(t[v],t[u]);
                exit(true);
         end;
  end;
  exit(false);
end;

procedure spfa(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(fang,sizeof(fang),100);
  oo:=fang[1];
  fillchar(bu,sizeof(bu),100);
  fillchar(t,sizeof(t),0);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; fang[uu]:=0; bu[uu]:=0; t[uu]:=1;
  while l<>r do begin
    l:=(l mod (n*m))+1;
    u:=q[l]; f[u]:=false; y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if relax(u,v,y) and not f[v] then begin
        r:=(r mod (n*m))+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;
begin
assign(input,'silvlily.in'); reset(input);
assign(output,'silvlily.out'); rewrite(output);
readln(n,m);
for i:=1 to n do begin
        for j:=1 to m do begin
                read(a[i,j]);
                if a[i,j]=3 then begin vs:=get(i,j); a[i,j]:=1; end;
                if a[i,j]=4 then begin ve:=get(i,j); a[i,j]:=1; end;
                tu[get(i,j)]:=a[i,j];
        end;
        readln;
end;
for i:=1 to n do
for j:=1 to m do
if a[i,j]<>2 then begin
        add(i,j,i+1,j+2);
        add(i,j,i+2,j+1);
        add(i,j,i+1,j-2);
        add(i,j,i+2,j-1);
end;
spfa(vs);
if fang[ve]<>oo then begin
        writeln(fang[ve]);
        writeln(bu[ve]);
        writeln(t[ve]);
end
else writeln(-1);

close(output);
end.

