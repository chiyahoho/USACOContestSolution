var
  l,r,mi,maxl,mind,p,i,j,tot,n,m,u,v,ll,rr,y:longint;
  dist,h,q:array[0..3000]of longint;
  f:array[0..3000]of boolean;
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
    fillchar(f,sizeof(f),0);
    ll:=0; rr:=1;
    q[1]:=1; f[1]:=true;
    while ll<rr do begin
      inc(ll);
      u:=q[ll];
      y:=h[u];
      while y>0 do begin
        v:=e[y].v;
        if (not f[v])and(e[y].l<=mi) then begin
          inc(rr);
          q[rr]:=v;
          f[v]:=true;
        end;
        y:=e[y].n;
      end;
    end;
    if rr=n then flag:=true else flag:=false;

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
