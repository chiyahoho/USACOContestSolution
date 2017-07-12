var

begin
assign(input,'flow.in'); reset(input);
assign(output,'flow.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin
        read(a); read(b); read(b);
        readln(l);
        add(g(a),g(b),l);
  end;

close(output);
end.