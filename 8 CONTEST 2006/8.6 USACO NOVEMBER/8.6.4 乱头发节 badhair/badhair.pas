var
  ans:int64;
  i,n:longint;
  ne,h:array[0..100000]of longint;
begin
assign(input,'badhair.in'); reset(input);
assign(output,'badhair.out'); rewrite(output);
  readln(n);
  for i:=n downto 1 do begin
    readln(h[i]);
    ne[i]:=i-1;
  end;
  h[0]:=maxlongint;
  for i:=2 to n do while h[ne[i]]<h[i] do ne[i]:=ne[ne[i]];
  for i:=1 to n do inc(ans,i-ne[i]-1);
  writeln(ans);
close(output);
end.
