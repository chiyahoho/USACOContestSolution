var
  n,m,i,j:longint;
  v,f:array[0..10000]of int64;
begin
assign(input,'river.in'); reset(input);
assign(output,'river.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do begin
        readln(v[i]);
        inc(v[i],v[i-1]);
  end;
  for i:=1 to n do inc(v[i],2*m);
  fillchar(f,sizeof(f),100);
  f[0]:=0;
  for i:=1 to n do
  for j:=0 to i-1 do if f[j]+v[i-j]<f[i] then f[i]:=f[j]+v[i-j];
  writeln(f[n]-m);
close(output);
end.
