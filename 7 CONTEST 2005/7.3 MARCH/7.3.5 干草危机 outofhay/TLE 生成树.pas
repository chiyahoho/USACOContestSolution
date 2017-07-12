var
  l,r,mi,maxl,mind,p,i,j,tot,n,m,u,v:longint;
  dist,h:array[0..3000]of longint;
  e:array[0..20000]of record
                        l,n,v:longint;
                      end;
  flag:boolean;
procedure add(u,v,l:longint);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  h[u]:=tot;
end;
procedure tget(u:longint);
var
  v,y:longint;
begin
  y:=h[u];
  while y>0 do begin
    v:=e[y].v;
    if dist[v]>e[y].l then dist[v]:=e[y].l;
    y:=e[y].n;
  end;
end;

begin
assign(input,'outofhay.in'); reset(input);
assign(output,'outofhay.out');rewrite(output);
  readln(n,m);
  maxl:=0;
  for i:=1 to m do begin
    readln(u,v,l);
    add(u,v,l);
    add(v,u,l);
    if l>maxl then maxl:=l;
  end;

  l:=1; r:=maxl;
  while r>l do begin
    mi:=(l+r)>>1;
    fillchar(dist,sizeof(dist),127);
    dist[1]:=0;
    tget(1);
    for i:=n-1 downto 1 do begin
      mind:=maxlongint;
      for j:=2 to n do if (dist[j]<mind)and(dist[j]<>0) then begin
        mind:=dist[j];
        p:=j;
      end;
      if mind<=mi then begin
        dist[p]:=0;
        tget(p);
      end;
    end;
    flag:=true;
    for i:=1 to n do if flag and (dist[i]<>0) then flag:=false;
    if flag then begin
      if r=mi then dec(r) else r:=mi;
    end
    else begin
      if l=mi then inc(l) else l:=mi;
    end;
    mi:=(l+r)>>1;
  end;
  writeln(mi);
close(output);
end.