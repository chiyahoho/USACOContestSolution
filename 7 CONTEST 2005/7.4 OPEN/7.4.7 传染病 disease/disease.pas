var
  ans,t,i,j,k,n,d,x:longint;
  num:array[0..10000]of longint;
  a:array[0..10000,0..20]of boolean;
  f:array[0..20]of boolean;
  flag:boolean;
procedure dfs(p:longint);
var
  tot,i,j:longint;
begin
  if t=k then begin
    tot:=0;
    for i:=1 to n do if num[i]<=t then begin
      flag:=true;
      for j:=1 to d do if a[i,j] and (not f[j]) then flag:=false;
      if flag then inc(tot);
    end;
    if tot>ans then ans:=tot;
    exit;
  end;
  if k-t>d-p+1 then exit;
  dfs(p+1);
  inc(t);
  f[p]:=true;
  dfs(p+1);
  f[p]:=false;
  dec(t);
end;

begin
assign(input,'disease.in'); reset(input);
assign(output,'disease.out'); rewrite(output);
  readln(n,d,k);
  for i:=1 to n do begin
    read(num[i]);
    for j:=1 to num[i] do begin
      read(x);
      a[i,x]:=true;
    end;
    readln;
  end;
  ans:=0;
  dfs(1);
  writeln(ans);
close(output);
end.