const o=0.0000001;

var
  n,i,j,top,ans:longint;
  x,y:array[0..1000]of longint;
  q:array[0..40100]of extended;

function com(x,y:extended):boolean;
begin
  if (x-y<o)and(x-y>-o) then exit(true) else exit(false);
end;

    procedure sort(l,r: longint);
      var
         i,j:longint;
         x,y:extended;
      begin
         i:=l;
         j:=r;
         x:=q[(l+r) div 2];
         repeat
           while x-q[i]>o do
            inc(i);
           while q[j]-x>o do
            dec(j);
           if not(i>j) then
             begin
                y:=q[i];
                q[i]:=q[j];
                q[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;


procedure it(x:extended);
begin
        inc(top);
        q[top]:=x;
end;

procedure add(x,y,xx,yy:longint);
var jj:longint;
begin
  if x-xx>o then begin
        jj:=x; x:=xx; xx:=jj;
        jj:=y; y:=yy; yy:=jj;
  end;
  if com(x,xx) then begin it(maxlongint); exit; end;
  it((yy-y)/(xx-x));
end;

begin
assign(input,'lines.in'); reset(input);
assign(output,'lines.out'); rewrite(output);
 readln(n);
 for i:=1 to n do readln(x[i],y[i]);
 for i:=1 to n-1 do
 for j:=i+1 to n do add(x[i],y[i],x[j],y[j]);
 sort(1,top); ans:=1;
 for i:=2 to top do if not com(q[i],q[i-1]) then inc(ans);
 writeln(ans);
close(output);
end.
