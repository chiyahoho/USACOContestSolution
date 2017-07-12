var
  t,ans,i,n,c:longint;
  a,sum:array[0..100000]of longint;
procedure dfs(p:longint);
begin
  if t>c then exit;
  if p=0 then begin
    if t>ans then ans:=t;
    exit;
  end;
  if t+sum[p]<ans then exit;
  inc(t,a[p]);
  dfs(p-1);
  dec(t,a[p]);
  dfs(p-1);
end;

begin
assign(input,'scales.in'); reset(input);
assign(output,'scales.out'); rewrite(output);
  readln(n,c);
  for i:=1 to n do begin
    readln(a[i]);
    if a[i]>c then n:=i-1;
  end;
  for i:=1 to n do sum[i]:=sum[i-1]+a[i];
  ans:=-maxlongint;
  dfs(n);
  writeln(ans);
close(output);
end.
