with Ada.Characters.Handling; use Ada.Characters.Handling;

package body wordpkg.wordops is
	function  to_Upper(w: Word) return Word is
		w2: Word;
	begin
		w2.Letters := Ada.Characters.Handling.To_Upper(w.Letters);
		w2.Length := w.Length;
		return w2;
	end to_Upper;

	procedure to_Upper(w: in out Word) is
	begin
		w.Letters := Ada.Characters.Handling.To_Upper(w.Letters);
	end to_Upper;

	function remove_NonLetter(w: Word) return Word is
		letter_count: Natural;
		w2: Word;
	begin
		letter_count := 0;
		for i in 1..w.Length loop
			if Is_Letter(w.Letters(i)) then
				letter_count := letter_count + 1;
				w2.Letters(letter_count) := w.Letters(i);
			end if;
		end loop;
		w2.Length := letter_count;
		return w2;
	end remove_NonLetter;

	procedure remove_NonLetter(w: in out Word) is
		new_word: String(1..w.Letters'length);
		letter_count: Natural;
	begin
		letter_count := 0;
		for i in 1..w.Length loop
			if Is_Letter(w.Letters(i)) then
				letter_count := letter_count + 1;
				new_word(letter_count) := w.Letters(i);
			end if;
		end loop;
		w.Length := letter_count;
		w.Letters := new_word;
	end remove_NonLetter;
end wordpkg.wordops;