var
  n,m,nn,i,j,vsx,vsy,linex,liney,ux,uy,l,r:longint;
  a:array[0..100,0..100]of longint;
  f:array[0..100,0..100]of boolean;
  q:array[0..10000]of record x,y:longint; end;
  dist:array[0..100,0..100,0..1]of longint;
  ch:char;
  flag:boolean;

procedure relax(var u,v:longint; x,y:longint);
begin
  if u+1<v then begin
    v:=u+1;
    if not f[x,y] then begin
      r:=(r mod nn)+1;
      q[r].x:=x; q[r].y:=y;
    end;
  end;
end;

procedure tget(ux,uy,vx,vy:longint);
begin
  if (vx<=0)or(vx>n)or(vy<=0)or(vy>m)or(a[vx,vy]=1) then exit;
  if (ux=linex-1)and(vx=linex)and(vy<liney) then begin
    relax(dist[ux,uy,0],dist[vx,vy,1],vx,vy);
    exit;
  end;
  if (ux=linex)and(vx=linex-1)and(uy<liney) then begin
    relax(dist[ux,uy,1],dist[vx,vy,0],vx,vy);
    exit;
  end;
  relax(dist[ux,uy,0],dist[vx,vy,0],vx,vy);
  relax(dist[ux,uy,1],dist[vx,vy,1],vx,vy);
end;

begin
assign(input,'grove.in'); reset(input);
assign(output,'grove.out'); rewrite(output);
  readln(n,m);
  flag:=false;
  for i:=1 to n do begin
    for j:=1 to m do begin
      read(ch);
      if (not flag)and(ch='X') then begin
        flag:=true;
        linex:=i; liney:=j;
      end;
      if ch='X' then a[i,j]:=1 else a[i,j]:=0;
      if ch='*' then begin
        vsx:=i; vsy:=j;
      end;
    end;
    readln;
  end;

  nn:=n*m;
  fillchar(dist,sizeof(dist),50);
  dist[vsx,vsy,0]:=0;
  l:=0; r:=1;
  q[1].x:=vsx; q[1].y:=vsy;
  while l<>r do begin
    l:=(l mod nn)+1;
    ux:=q[l].x; uy:=q[l].y;
    f[ux,uy]:=false;
    tget(ux,uy,ux+1,uy);
    tget(ux,uy,ux,uy+1);
    tget(ux,uy,ux-1,uy);
    tget(ux,uy,ux,uy-1);

    tget(ux,uy,ux-1,uy-1);
    tget(ux,uy,ux+1,uy-1);
    tget(ux,uy,ux-1,uy+1);
    tget(ux,uy,ux+1,uy+1);
  end;

  writeln(dist[vsx,vsy,1]);
close(output);
end.