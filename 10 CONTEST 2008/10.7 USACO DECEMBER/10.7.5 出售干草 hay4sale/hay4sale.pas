var
  n,m,top,top1,i,g,v:longint;
  q:array[0..50001]of longint;
  f:array[0..50001]of boolean;
begin
assign(input,'hay4sale.in'); reset(input);
assign(output,'hay4sale.out'); rewrite(output);
  readln(m,n);
  top:=1; q[1]:=0;
  f[0]:=true;
  for g:=1 to n do begin
        readln(v);
        top1:=top;
        for i:=1 to top do if (q[i]+v<=m) and not f[q[i]+v] then begin
                inc(top1);
                q[top1]:=q[i]+v;
                f[q[i]+v]:=true;
        end;
        top:=top1;
  end;
  while not f[m] do dec(m);
  writeln(m);
close(output);
end.