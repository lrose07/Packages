with wordpkg.wordops;
with wordpkg.palindromes;
with wordpkg;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Pals is
	package my_word_package is new wordpkg(50);
	package my_word_ops is new my_word_package.wordops;
	package my_word_pals is new my_word_package.palindromes;

	use my_word_package;
	use my_word_ops;
	use my_word_pals;

	current_word: Word;
	to_upper_word: Word;
	remove_non_letter_word: Word;
	to_upper_and_remove_non_letter_word: Word;
begin -- Pals
	while not end_of_file loop
		get(current_word);

		to_upper_word := to_Upper(current_word);
		remove_non_letter_word := remove_NonLetter(current_word);
		to_upper_and_remove_non_letter_word := remove_NonLetter(to_upper_word);

		put("String: ");
		put(current_word);
		new_line;
		put("Status: ");

		if is_Pal(current_word) then
			put("Palindrome as is");
		elsif is_Pal(to_upper_word) then
			put("Palindrome when converted to upper case");
			new_line;
			put("PalStr: ");
			put(to_upper_word);
		elsif is_Pal(remove_non_letter_word) then
			put("Palindrome when non-letters are removed");
			new_line;
			put("PalStr: ");
			put(remove_non_letter_word);
		elsif is_Pal(to_upper_and_remove_non_letter_word) then
			put("Palindrome when converted to upper case and non-letters are removed");
			new_line;
			put("PalStr: ");
			put(to_upper_and_remove_non_letter_word);
		else
			put("Never a palindrome");
			new_line;
		end if;

		new_line(2);

	end loop;
end Pals;