
program udtParameters;

type
    A = array[0..9] of integer;
    
    S = set of 1..10;
    
    R = record
        a, b : integer;
        c, d : real;
    end;
    
var
    vA : A;
    VS : S;
    vR : R;
    i : integer;

procedure printA(arg : A);
var i : integer;
begin
    for i := 0 to 9 do
        writeln('a[', i, '] = ', arg[i]);
    writeln;
end;

procedure printS(arg : S);
var i : integer;
begin
    write('s = [ ');
    for i := 1 to 10 do
        if i in arg then
            write(i, ' ');
    writeln(']');
    writeln;
end;

procedure printR(arg : R);
begin
    writeln('r.a = ', arg.a);
    writeln('r.b = ', arg.b);
    writeln('r.c = ', arg.c);
    writeln('r.d = ', arg.d);
    writeln;
end;
    
procedure testA(arg : A);
begin
    printA(arg);
    arg[0] := 123;
    arg[9] := 321;
end;

procedure testS(arg : S);
begin
    printS(arg);
    arg := [];
end;

procedure testR(arg : R);
begin
    printR(arg);
    arg.a := 0;
    arg.b := -1;
    arg.c := 0;
    arg.d := -3.14;
end;

begin
    for i := 0 to 9 do vA[i] := i;
    testA(vA);
    printA(vA);
    
    writeln('------------------------------');
    
    vS := [1, 2, 3, 5, 7];
    testS(vS);
    printS(vS);

    writeln('------------------------------');
    
    testS([5, 4, 9]);

    writeln('------------------------------');

    vR.a := 11;
    vR.b := 22;
    vR.c := 1.1;
    vR.d := 2.2;
    testR(vR);
    printR(vR);
end.
