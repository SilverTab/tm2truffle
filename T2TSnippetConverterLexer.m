
#line 1 "T2TSnippetConverterLexer.rl"
#import "T2TSnippetConverterLexer.h"
#import "T2TSnippetConverterParser.h"
#import "T2TSnippetConverterShared.h"


#line 9 "T2TSnippetConverterLexer.c"
static const char _TMSnippetToChocolatSnippet_actions[] = {
	0, 1, 0, 1, 1, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 1, 13, 1, 14, 1, 
	15, 1, 16, 1, 17, 1, 18, 1, 
	19, 1, 20, 2, 2, 3, 2, 2, 
	4, 2, 2, 5
};

static const char _TMSnippetToChocolatSnippet_key_offsets[] = {
	0, 2, 4, 4, 4, 6, 8, 20, 
	21, 23, 25, 31, 33, 40, 43
};

static const char _TMSnippetToChocolatSnippet_trans_keys[] = {
	47, 92, 47, 92, 92, 96, 92, 96, 
	36, 47, 58, 92, 96, 125, 48, 57, 
	65, 90, 95, 122, 123, 47, 92, 47, 
	92, 48, 57, 65, 90, 97, 122, 48, 
	57, 95, 48, 57, 65, 90, 97, 122, 
	36, 92, 96, 92, 96, 0
};

static const char _TMSnippetToChocolatSnippet_single_lengths[] = {
	2, 2, 0, 0, 2, 2, 6, 1, 
	2, 2, 0, 0, 1, 3, 2
};

static const char _TMSnippetToChocolatSnippet_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 3, 0, 
	0, 0, 3, 1, 3, 0, 0
};

static const char _TMSnippetToChocolatSnippet_index_offsets[] = {
	0, 3, 6, 7, 8, 11, 14, 24, 
	26, 29, 32, 36, 38, 43, 47
};

static const char _TMSnippetToChocolatSnippet_trans_targs[] = {
	1, 3, 0, 6, 2, 9, 9, 0, 
	5, 6, 4, 5, 14, 4, 7, 8, 
	6, 13, 14, 6, 11, 12, 12, 6, 
	6, 6, 6, 3, 0, 10, 2, 9, 
	10, 10, 10, 6, 11, 6, 12, 12, 
	12, 12, 6, 6, 6, 6, 6, 5, 
	6, 4, 6, 6, 6, 6, 6, 6, 
	6, 6, 6, 6, 6, 6, 6, 6, 
	0
};

static const char _TMSnippetToChocolatSnippet_trans_actions[] = {
	0, 0, 0, 31, 0, 35, 35, 0, 
	0, 17, 0, 0, 38, 0, 0, 41, 
	13, 0, 41, 15, 0, 0, 0, 19, 
	11, 21, 29, 0, 0, 0, 0, 35, 
	0, 0, 0, 23, 0, 27, 0, 0, 
	0, 0, 25, 5, 7, 9, 29, 0, 
	17, 0, 31, 31, 33, 31, 33, 33, 
	21, 29, 23, 23, 27, 25, 29, 33, 
	0
};

static const char _TMSnippetToChocolatSnippet_to_state_actions[] = {
	0, 0, 0, 0, 0, 0, 1, 0, 
	0, 0, 0, 0, 0, 0, 0
};

static const char _TMSnippetToChocolatSnippet_from_state_actions[] = {
	0, 0, 0, 0, 0, 0, 3, 0, 
	0, 0, 0, 0, 0, 0, 0
};

static const char _TMSnippetToChocolatSnippet_eof_trans[] = {
	54, 54, 64, 54, 64, 64, 0, 57, 
	63, 60, 60, 61, 62, 63, 64
};

static const int TMSnippetToChocolatSnippet_start = 6;
static const int TMSnippetToChocolatSnippet_first_final = 6;
static const int TMSnippetToChocolatSnippet_error = -1;

static const int TMSnippetToChocolatSnippet_en_main = 6;


#line 8 "T2TSnippetConverterLexer.rl"



#line 32 "T2TSnippetConverterLexer.rl"




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
	
#line 189 "T2TSnippetConverterLexer.c"
	{
	cs = TMSnippetToChocolatSnippet_start;
	ts = 0;
	te = 0;
	act = 0;
	}

#line 122 "T2TSnippetConverterLexer.rl"
	
#line 199 "T2TSnippetConverterLexer.c"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
_resume:
	_acts = _TMSnippetToChocolatSnippet_actions + _TMSnippetToChocolatSnippet_from_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 1:
#line 1 "NONE"
	{ts = p;}
	break;
#line 218 "T2TSnippetConverterLexer.c"
		}
	}

	_keys = _TMSnippetToChocolatSnippet_trans_keys + _TMSnippetToChocolatSnippet_key_offsets[cs];
	_trans = _TMSnippetToChocolatSnippet_index_offsets[cs];

	_klen = _TMSnippetToChocolatSnippet_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _TMSnippetToChocolatSnippet_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += ((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
_eof_trans:
	cs = _TMSnippetToChocolatSnippet_trans_targs[_trans];

	if ( _TMSnippetToChocolatSnippet_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _TMSnippetToChocolatSnippet_actions + _TMSnippetToChocolatSnippet_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 2:
#line 1 "NONE"
	{te = p+1;}
	break;
	case 3:
#line 23 "T2TSnippetConverterLexer.rl"
	{act = 8;}
	break;
	case 4:
#line 28 "T2TSnippetConverterLexer.rl"
	{act = 11;}
	break;
	case 5:
#line 30 "T2TSnippetConverterLexer.rl"
	{act = 12;}
	break;
	case 6:
#line 15 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('$', lemon, output); }}
	break;
	case 7:
#line 16 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('\\', lemon, output); }}
	break;
	case 8:
#line 17 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('`', lemon, output); }}
	break;
	case 9:
#line 19 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(DOLLAR_CURLY, ts, te, lemon, output); }}
	break;
	case 10:
#line 21 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(COLON, ts, te, lemon, output); }}
	break;
	case 11:
#line 22 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(CURLY, ts, te, lemon, output); }}
	break;
	case 12:
#line 28 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_shell(lemon, output); }}
	break;
	case 13:
#line 30 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char((*p), lemon, output); }}
	break;
	case 14:
#line 20 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(DOLLAR, ts, te, lemon, output); }}
	break;
	case 15:
#line 23 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit_regex(lemon, output); }}
	break;
	case 16:
#line 25 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(IDENTIFIER, ts, te, lemon, output); }}
	break;
	case 17:
#line 26 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(NUMERIC, ts, te, lemon, output); }}
	break;
	case 18:
#line 30 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit_char((*p), lemon, output); }}
	break;
	case 19:
#line 30 "T2TSnippetConverterLexer.rl"
	{{p = ((te))-1;}{ emit_char((*p), lemon, output); }}
	break;
	case 20:
#line 1 "NONE"
	{	switch( act ) {
	case 8:
	{{p = ((te))-1;} emit_regex(lemon, output); }
	break;
	case 11:
	{{p = ((te))-1;} emit_shell(lemon, output); }
	break;
	case 12:
	{{p = ((te))-1;} emit_char((*p), lemon, output); }
	break;
	}
	}
	break;
#line 370 "T2TSnippetConverterLexer.c"
		}
	}

_again:
	_acts = _TMSnippetToChocolatSnippet_actions + _TMSnippetToChocolatSnippet_to_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 0:
#line 1 "NONE"
	{ts = 0;}
	break;
#line 383 "T2TSnippetConverterLexer.c"
		}
	}

	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	if ( p == eof )
	{
	if ( _TMSnippetToChocolatSnippet_eof_trans[cs] > 0 ) {
		_trans = _TMSnippetToChocolatSnippet_eof_trans[cs] - 1;
		goto _eof_trans;
	}
	}

	}

#line 123 "T2TSnippetConverterLexer.rl"
		
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