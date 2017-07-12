var
  f,sum:array[0..200000]of longint;
  a:array[0..10000]of longint;
  i,j,n,nn,m1,m2,x,ans:longint;
function max(a,b:longint):longint;
begin
  if a>b then exit(a) else exit(b);
end;

procedure pan(var x:longint);
begin
  if x<0 then inc(x,1000000);
  if x>1000000 then x:=x mod 1000000;
end;

begin
assign(input,'ants.in'); reset(input);
assign(output,'ants.out'); rewrite(output);
  readln(n,nn,m1,m2);
  for i:=1 to nn do begin
    readln(x);
    inc(a[x]);
  end;
  for j:=1 to a[1] do begin
    f[j]:=1; sum[j]:=j; end;
  for i:=j+1 to m2 do sum[i]:=sum[j];

  for i:=2 to n do begin
    for j:=1 to m2 do begin
      if a[i]>=j then f[j]:=sum[j]+1
      else f[j]:=sum[j]-sum[j-a[i]-1];
      pan(f[j]);
    end;
    for j:=1 to m2 do begin
      sum[j]:=sum[j-1]+f[j]; pan(sum[j]); end;
  end;
  ans:=sum[m2]-sum[m1-1];
  pan(ans);
  writeln(ans);
close(output);
end.