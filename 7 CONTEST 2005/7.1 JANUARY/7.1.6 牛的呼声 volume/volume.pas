var

begin
assign(input,'volume.in'); reset(input);
assign(output,'volume.out'); rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);

close(output);
end.