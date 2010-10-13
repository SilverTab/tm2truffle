#import "T2TSnippetConverterLexer.h"
#import "T2TSnippetConverterParser.h"
#import "T2TSnippetConverterShared.h"

%%{
	machine TMSnippetToChocolatSnippet;
	write data;
}%%

%%{
regex_string = ([^/\\] | "\\\\" | "\\/" | "\\" [^/\\])+;
regex = "/" regex_string "/" regex_string ("/" alnum*)?;

main := |*
	"\\$" { emit_char('$'); };
	"\\\\" { emit_char('\\'); };
	"\\`" { emit_char('`'); };

	"${" { emit(DOLLAR_CURLY); };
	"$" { emit(DOLLAR); };
	":" { emit(COLON); };
	"}" { emit(CURLY); };
	regex { emit(REGEX); };

	(alpha | '_') (alnum | '_')+ { emit(IDENTIFIER); };
	digit+ { emit(NUMERIC); };

	"`" ([^`] | "\\`")* "`" { emit_shell(); };
*|;
}%%


void emit_char(char c)
{
	printf("EMIT CHAR %c", c);
}

void emit(int code)
{
	printf("EMIT CODE %d", code);
}

void emit_shell()
{
	printf("EMIT SHELL");
}


NSString *T2TConvertTextMateSnippetToChocolat(NSString *tmSnippet)
{
	//Get string data
	char* data = (char *)[tmSnippet UTF8String];
	
	//Start
	char *p = data;
	
	//End
	char *pe = p + strlen(p);
	char *eof = pe;
	
	//State
	//static char buf[BUFSIZE];
	int cs = 0, act, have = 0, curline = 1;
	char *ts, *te = 0;
	int done = 0;
	
	//Run the machine
	%% write init;
	%% write exec;
	
	//Deal with the output
	
	//Error state
	if (cs == 0)
		return nil;
	
	//Worked
	
	
	return nil;
}


 /*

 # <description>
 ## <textmate-syntax> -> <chocolat-syntax>

 # An escape sequence
 escape_sequence = backslash_escape | dollar_escape | backtick_escape;
 backslash_escape = "\\\\" @{ output("\\"); };
 dollar_escape = "\\$" @{ output("$"); };
 backtick_escape = "\\`" @{ output("%"); };



 # An identifier for a variable
 ## TM_SELECTED_TEXT -> TM_SELECTED_TEXT
 variable_identifier = (alpha | '_') (alnum | '_') +;


 # A tabstop is a dollar sign followed by a digit
 any_tabstop = inline_tabstop | block_tabstop;

 ## $42 -> {42}
 inline_tabstop = "$" digit+;

 ## ${42} -> {42}
 block_tabstop = "${" digit+ misc_stuff"}";



 any_variable = inline_Variable | block_variable;

 ## $TM_SELECTED_TEXT -> {TM_SELECTED_TEXT}
 inline_variable = "$" variable_identifier;

 ## ${TM_SELECTED_TEXT} -> {TM_SELECTED_TEXT}
 block_variable = "${" variable_identifier misc_stuff "}";

 misc_stuff = filter | default_condition;
 filter = "/" regex "/" regex_replacement ("/" regex_options)?;

 default_condition = ":" (tabstop | variable | escape_sequence | other);

 other := any @{ output_char(fc) };

 main := |*

	 any_tabstop => { };
	 any_variable => { };

 tabstop | variable | escape_sequence | other;
 *|;

 */