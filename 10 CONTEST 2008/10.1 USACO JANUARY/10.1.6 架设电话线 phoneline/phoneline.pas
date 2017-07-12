var
  tot,u,v,i,l,r,n,m,k,maxl:longint;
  dist,h,q:array[0..50000]of longint;
  f:array[0..50000]of boolean;
  e:array[0..100000]of record
                         l,v,n:longint;
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

function relax(y,u,v,ll:longint):boolean;
var p:longint;
begin
  if e[y].l<=ll then p:=0 else p:=1;
  if dist[u]+p<dist[v] then begin
    dist[v]:=dist[u]+p;
    exit(true);
  end;
  exit(false);
end;

procedure spfa(ll:longint);
var
l,r,u,v,y:longint;
begin
  fillchar(dist,sizeof(dist),12);
  dist[1]:=0;
  q[1]:=1;
  l:=0; r:=1;
  while l<>r do begin
    l:=(l mod n)+1;
    u:=q[l];
    f[u]:=false;
    y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if relax(y,u,v,ll) and (not f[v]) then begin
        f[v]:=true;
        r:=(r mod n)+1;
        q[r]:=v;
      end;
      y:=e[y].n;
    end;
  end;
end;
begin
assign(input,'phoneline.in'); reset(input);
assign(output,'phoneline.out'); rewrite(output);
  readln(n,m,k);
  for i:=1 to m do begin
        readln(u,v,l);
        add(u,v,l);
        add(v,u,l);
        if l>maxl then maxl:=l;
  end;
  l:=0; r:=maxl+1;
  while l<r do begin
        m:=(l+r)>>1;
        spfa(m);
        if dist[n]<=k then flag:=true else flag:=false;
        if (l=r-1)and(not flag) then begin m:=r; break; end;
        if flag then r:=m else l:=m;
  end;
  if m=maxl+1 then writeln(-1) else writeln(m);
close(output);
end.
