#inclib "dev-s4"

function lessen(IniDatei as string, Sitzung as string, Schlussel as string) as string
    dim f as integer
    dim t as string
    dim hintergrund as integer
    f = freefile
    open IniDatei for input as #f
    do
        line input #f, t
        if ucase(t) = ucase("["+Sitzung+"]") then hintergrund = 1
    loop until hintergrund = 1 or eof(f)
    if hintergrund = 0 then
        close #f
        return " "
    end if
    do
        line input #1, t
        if instr(t, "=") and left(t, len(Schlussel)) = Schlussel then
            close #f
            return trim(mid(t, instr(t, "=")+1, len(t)-instr(t, "=")))
        elseif mid(t,1,1) = "[" then
            exit do
        end if
    loop until eof(f)
    close #f
    return " "
end function