var
  u,v,k,ans,t,i,j,num:longint;
  x:char;
  f:array[0..30,0..30]of boolean;
  a,q,qq:array[0..100]of longint;
  ff:array[1..7]of boolean;
function get(x,y:longint):longint;
begin
  exit((x-1)*5+y);
end;

function check:boolean;
var
  h,i,j,g,l,r:longint;
  flag:boolean;
begin
  fillchar(ff,sizeof(ff),0);
  ff[1]:=true;
  qq[1]:=q[1];
  l:=0; r:=1;
  while l<>r do begin
    inc(l);
    u:=qq[l];
    for i:=2 to 7 do if (not ff[i])and(f[u,q[i]]) then begin
      inc(r);
      qq[r]:=q[i];
      ff[i]:=true;
    end;
  end;
  flag:=true;
  for i:=1 to 7 do flag:=flag and ff[i];
  exit(flag);
end;

procedure dfs(p:longint);
var
  i:longint;
begin
  if num>3 then exit;
  if t=7 then begin
    if check then begin
      k:=0;
      for i:=1 to t do inc(k,a[q[i]]);
      if k>0 then
      inc(ans);
    end;
    exit;
  end;
  if p=26 then exit;
  if 7-t>26-p then exit;
    inc(t);
    q[t]:=p;
    if a[p]=-1 then inc(num);
    dfs(p+1);
    dec(t);
    if a[p]=-1 then dec(num);
dfs(p+1);
end;

begin
assign(input,'cowrig.in'); reset(input);
assign(output,'cowrig.out'); rewrite(output);
  for i:=1 to 5 do begin
    for j:=1 to 5 do begin
      read(x);
      u:=get(i,j);
      if x='J' then a[u]:=1 else a[u]:=-1;
      if i<5 then begin
        v:=get(i+1,j);
        f[u,v]:=true;
        f[v,u]:=true;
      end;
      if j<5 then begin
        v:=get(i,j+1);
        f[u,v]:=true;
        f[v,u]:=true;
      end;
    end;
    readln;
  end;
  ans:=0;
  dfs(1);
  writeln(ans);
close(output);
end.
