--purpose: converts text edit file to FCP batch lists, by converting linefeed characters to return characters

--Version 1.0 created 07/04/09, Surreal Road Ltd. sales@surrealroad.com
--Based on specification at http://www.surrealroad.com/research/archives/2008/final-cut-pro-batch-list-specification
--tested on Mac OS 10.5 with FCP 6.0.5

set theFile to (choose file with prompt "Original file:" without invisibles)
set theText to read theFile as string
if theText contains (ASCII character 10) then
	set delim to AppleScript's text item delimiters
	set text item delimiters to ASCII character 10
	set theList to every text item of theText
	set text item delimiters to ASCII character 13
	set theNewText to theList as text
	set text item delimiters to delim
	set theNewFile to (choose file name with prompt "Converted file:" default name "Batch List.txt")
	write_to_text_file(theNewFile, theNewText)
end if


--save as text
on write_to_text_file(the_file, the_text)
	set file_ref to open for access the_file with write permission
	set eof file_ref to 0
	write the_text to file_ref as string
	close access file_ref
end write_to_text_file
