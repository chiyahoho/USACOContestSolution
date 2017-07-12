var
  c,f1,f2,d,a,b,i,j,sum:longint;
  num:array[0..10000]of longint;
begin
assign(input,'fcount.in'); reset(input);
assign(output,'fcount.out'); rewrite(output);
  readln(c,f1,f2,d);
  dec(f1,f2);
  for i:=1 to c do begin
    readln(a,b);
    if a<0 then a:=0; if b>d then b:=d;
    for j:=a to b do inc(num[j]);
  end;
  for i:=d downto 0 do begin
    inc(sum,num[i]);
    if sum>=f1 then break;
  end;
  writeln(i);
close(output);
end.