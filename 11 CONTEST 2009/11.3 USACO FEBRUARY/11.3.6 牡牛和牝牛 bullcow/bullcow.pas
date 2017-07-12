var
  n,k,i:longint;
  f:array[-100010..120000]of longint;
begin
assign(input,'bullcow.in'); reset(input);
assign(output,'bullcow.out'); rewrite(output);
  readln(n,k);
  for i:=-k to 0 do f[i]:=1;
  for i:=1 to n do f[i]:=(f[i-1]+f[i-k-1])mod 5000011;
  writeln(f[n]);
close(output);
end.