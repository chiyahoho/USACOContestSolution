var
  i,j,u,v,l,n,m,tot,t:longint;
  x,y,fa:array[0..100000]of int64;
  e:array[0..8000000]of record u,v:longint; l:extended; end;
  ans:extended;
procedure swap(var a,b:longint);
var c:longint;
begin
  c:=a; a:=b; b:=c;
end;

procedure sort(l,r:longint);
var
  i,j:longint;
  x,k:extended;
begin
  i:=l; j:=r;
  x:=e[(l+r)>>1].l;
  repeat
    while x-e[i].l>0.000001 do inc(i);
    while e[j].l-x>0.000001 do dec(j);
    if not(i>j) then begin
      k:=e[i].l; e[i].l:=e[j].l; e[j].l:=k;
      swap(e[i].u,e[j].u);
      swap(e[i].v,e[j].v);
      inc(i); dec(j);
    end;
  until i>j;
  if l<j then sort(l,j);
  if i<r then sort(i,r);
end;

function gf(p:longint):longint;
begin
  if fa[p]=p then exit(p);
  fa[p]:=gf(fa[p]);
  exit(fa[p]);
end;

procedure union(a,b:longint);
begin
  u:=gf(a); v:=gf(b);
  if u<>v then begin
        inc(t);
        fa[u]:=v;
  end;
end;

procedure add(u,v:longint);
begin
  inc(tot);
  e[tot].u:=u;
  e[tot].v:=v;
  e[tot].l:=sqrt( sqr(x[u]-x[v])+sqr(y[u]-y[v]) );
end;
begin
assign(input,'roads.in'); reset(input);
assign(output,'roads.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do begin
        readln(x[i],y[i]);
        fa[i]:=i;
  end;
  for i:=1 to m do begin
        readln(u,v);
        if gf(u)<>gf(v) then union(u,v);
  end;
  for i:=1 to n-1 do
  for j:=i+1 to n do if gf(i)<>gf(j) then begin
        add(i,j); add(j,i);
  end;
  sort(1,tot);
  for i:=1 to tot do begin
        if t=n-1 then break;
        u:=e[i].u; v:=e[i].v;
        if gf(u)<>gf(v) then begin
                union(u,v);
                ans:=ans+e[i].l;
        end;
  end;
  writeln(ans:0:2);
close(output);
end.
