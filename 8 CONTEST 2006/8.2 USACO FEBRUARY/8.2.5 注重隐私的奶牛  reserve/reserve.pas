var
  top,pp,l,r,mi,n,m,i,k,ne,ans:longint;
  a,b,p,next,qu,f,eq:array[0..100200] of longint;
  flag:boolean;

function get(i:longint):boolean;
begin
  pp:=p[i];
  if a[i]=b[pp*2-1] then exit(true) else exit(false);
end;

    procedure sort(l,r: longint);
      var
         i,j,x,y,mid: longint;
         ff:boolean;
      begin
         i:=l;
         j:=r;
         mid:=(l+r)>>1;
         x:=a[mid];
         ff:=get(mid);
         repeat

           while (a[i]<x)or((a[i]=x)and(not get(i))and(ff)) do
            inc(i);
           while (x<a[j])or((a[j]=x)and get(j) and(not ff)) do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=p[i];
                p[i]:=p[j];
                p[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;

begin
assign(input,'reserve.in'); reset(input);
assign(output,'reserve.out'); rewrite(output);
  readln(m);
  ans:=maxlongint;
  for i:=1 to m do begin
        k:=i*2;
        readln(a[k-1],a[k]);
        inc(a[k]);
        p[k-1]:=i; p[k]:=i;
  end;
  b:=a;
  sort(1,m*2);
  n:=a[m*2];
  l:=1; r:=m;
  while l<r do begin
        mi:=(l+r)>>1;
        fillchar(f,sizeof(f),0);
        fillchar(qu,sizeof(qu),0);
        flag:=true;
        for i:=1 to mi do next[i]:=i;
        top:=mi;
        for i:=1 to m*2 do if flag then begin
              pp:=p[i];
              if a[i]=b[pp*2-1] then begin
                    if top=0 then flag:=false;

                    if flag then begin
                          ne:=next[top];
                          f[ne]:=pp;
                          qu[pp]:=ne;
                          dec(top);
                    end;
              end
              else begin
                    inc(top);
                    next[top]:=qu[pp];
              end;
        end;
        if flag and (mi<ans) then begin
          ans:=mi;
          eq:=qu;
        end;
        if (not flag)and(r-l=1) then l:=r
        else if flag then r:=mi else l:=mi;
  end;
  writeln(ans);
  for i:=1 to m do writeln(eq[i]);
close(output);
end.