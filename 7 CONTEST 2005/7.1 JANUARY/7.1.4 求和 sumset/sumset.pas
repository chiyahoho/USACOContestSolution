  var
 i,j,n,k:longint;
 f:array[0..1000000] of longint;
 a:array[0..19]of longint=(1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384,32768,65536,131072,262144,524288);
begin
assign(input,'sumset.in'); reset(input);
assign(output,'sumset.out'); rewrite(output);
 readln(n);
 for i:=19 downto 0 do
 if a[i]<n then
 begin
  k:=i;
  break;
 end;
 
 f[0]:=1;
 for i:=0 to k do
  for j:=a[i] to n do
  f[j]:=(f[j]+f[j-a[i]]) mod 1000000000;
 writeln(f[n]);
 close(output);
end.