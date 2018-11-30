package body WordPkg.Palindromes is
    function is_Pal(w: Word) return Boolean is
    	loop_end: Natural;
    begin
    	if w.Length mod 2 = 0 then
    		loop_end := w.Length/2;
    	else
    		loop_end := (w.Length - 1)/2;
    	end if;

    	for i in 0..loop_end loop
    		if w.Letters(i + 1) /= w.Letters(w.Length - i) then
    			return false;
    		end if;
    	end loop;
    	return true;
    end is_Pal;
end WordPkg.Palindromes;