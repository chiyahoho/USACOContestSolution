var

begin
assign(input,'obstacle.in'); reset(input);
assign(output,'obstacle.out'); rewrite(output);
  readln(n);
  fillchar(dist,sizeof(dist),100);
  for i:=1 to n do begin
          for j:=1 to n do begin
                read(ch);
                if ch<>'x' then f[]
          end;
          readln;
  end;
close(output);
end.