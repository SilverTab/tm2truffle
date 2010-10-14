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
	"\\$" { emit_char('$', lemon, output); };
	"\\\\" { emit_char('\\', lemon, output); };
	"\\`" { emit_char('`', lemon, output); };

	"${" { emit(DOLLAR_CURLY, ts, te, lemon, output); };
	"$" { emit(DOLLAR, ts, te, lemon, output); };
	":" { emit(COLON, ts, te, lemon, output); };
	"}" { emit(CURLY, ts, te, lemon, output); };
	regex { emit_regex(lemon, output); };

	(alpha | '_') (alnum | '_')* { emit(IDENTIFIER, ts, te, lemon, output); };
	digit+ { emit(NUMERIC, ts, te, lemon, output); };

	"`" ([^`] | "\\`")* "`" { emit_shell(lemon, output); };
	
	any { emit_char(fc, lemon, output); };
*|;
}%%



void emit_to_lemon(T2TSnippetToken token, void* lemon, NSMutableString *output)
{
	Parse(lemon, token.type, token, output);
}

void emit_char(char c, void* lemon, NSMutableString *output)
{
	T2TSnippetToken token;
	token.type = CHAR;
	token.payloadChar = c;
	token.payloadStart = NULL;
	token.payloadEnd = NULL;
	
	printf("EMIT CHAR %c\n", c);

	emit_to_lemon(token, lemon, output);
}

void emit(int code, char* ts, char* te, void* lemon, NSMutableString *output)
{
	T2TSnippetToken token;
	token.type = code;
	token.payloadChar = '\0';
	token.payloadStart = ts;
	token.payloadEnd = te;
	
	printf("EMIT CODE %d\n", code);

	emit_to_lemon(token, lemon, output);
}

void emit_shell(void* lemon, NSMutableString *output)
{
	printf("EMIT SHELL\n");

	T2TSnippetToken token;
	token.type = SHELL;
	token.payloadChar = '\0';
	token.payloadStart = NULL;
	token.payloadEnd = NULL;
	
	emit_to_lemon(token, lemon, output);
}

void emit_regex(void* lemon, NSMutableString *output)
{
	printf("EMIT SHELL\n");
	
	T2TSnippetToken token;
	token.type = REGEX;
	token.payloadChar = '\0';
	token.payloadStart = NULL;
	token.payloadEnd = NULL;
	
	emit_to_lemon(token, lemon, output);
}



NSString *T2TConvertTextMateSnippetToChocolat(NSString *tmSnippet)
{
	//Get string data
	char* data = (char *)[tmSnippet UTF8String];
	
	//Set up lemon
	void* lemon = ParseAlloc(malloc);
	
	//Output
	NSMutableString *output = [[NSMutableString alloc] initWithCapacity:[tmSnippet length]];
	
	//Start
	char *p = data;
	
	//End
	char *pe = p + strlen(p);
	char *eof = pe;
	
	NSLog(@"p -> pe = %d -> %d = %s", p, pe, p);
	
	//State
	int cs = 0, act, have = 0, curline = 1;
	char *ts, *te = 0;
	int done = 0;
	
	//Run the machine
	%% write init;
	%% write exec;
		
	//End lemon
	T2TSnippetToken token;
	Parse(lemon, 0, token, output);
	ParseFree(lemon, free);
	
	NSLog(@"output string = %@", output);
	
	//Error state
	if (cs != 0)
		return nil;
	
	//Deal with the output
	
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