var
  u,v,n,m,i,j,top,tot,p,uu,ee,nn:longint;
  dist,h,pre,q,ans2:array[0..3000]of longint;
  ans1,lu:array[0..3000]of char;
  ch1,ch2:char;
  f:array[0..3000]of boolean;
  e:array[0..10000]of record
                        n,v:longint;
                        l:char;
                      end;
procedure add(u,v:longint; l:char);
begin
  inc(tot);
  e[tot].v:=v;
  e[tot].l:=l;
  e[tot].n:=h[u];
  h[u]:=tot;
end;

function relax(u,v,y:longint):boolean;
begin
  if dist[v]>dist[u]+1 then begin
    dist[v]:=dist[u]+1;
    pre[v]:=u;
    lu[v]:=e[y].l;
    exit(true);
  end;
  exit(false);
end;

procedure spfa(uu:longint);
var l,r,u,v,y:longint;
begin
  fillchar(dist,sizeof(dist),100);
  fillchar(f,sizeof(f),0);
  l:=0; r:=1;
  q[1]:=uu; dist[uu]:=0;
  while l<>r do begin
    l:=(l mod nn)+1;
    u:=q[l]; f[u]:=false; y:=h[u];
    while y>0 do begin
      v:=e[y].v;
      if relax(u,v,y) and not f[v] then begin
        r:=(r mod nn)+1; q[r]:=v; f[v]:=true; end;
      y:=e[y].n;
    end;
  end;
end;

function get(x,y:longint):longint;
begin
  exit((x-1)*m+y);
end;

procedure pan(ch:char; x,y:longint);
begin
  if ch='S' then uu:=get(x,y);
  if ch='E' then ee:=get(x,y);
end;

begin
assign(input,'navcit.in'); reset(input);
assign(output,'navcit.out'); rewrite(output);
  readln(n,m);
  nn:=get(n,m);
  for i:=1 to n do begin
    for j:=1 to m-1 do begin
      read(ch1); read(ch2);
      pan(ch1,i,j);
      if ch2='-' then begin
        u:=get(i,j); v:=u+1;
        add(u,v,'E'); add(v,u,'W');
      end;
    end;
    readln(ch1);
    pan(ch1,i,m);

    if i<>n then begin
      for j:=1 to m do begin
        read(ch2);
        if ch2='|' then begin
          u:=get(i,j); v:=get(i+1,j);
          add(u,v,'S'); add(v,u,'N');
        end;
        if j=m then readln else read(ch2);
      end;
    end;
  end;

  spfa(uu);
  p:=pre[ee];
  top:=1;
  ans1[1]:=lu[ee];
  ans2[1]:=1;
  while p<>uu do begin
    if lu[p]=ans1[top] then inc(ans2[top])
    else begin
      inc(top);
      ans1[top]:=lu[p];
      ans2[top]:=1;
    end;
    p:=pre[p];
  end;

  for i:=top downto 1 do writeln(ans1[i],' ',ans2[i]);
close(output);
end.
