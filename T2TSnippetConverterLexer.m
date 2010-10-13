
#line 1 "T2TSnippetConverterLexer.rl"
#import "T2TSnippetConverterLexer.h"
#import "T2TSnippetConverterParser.h"
#import "T2TSnippetConverterShared.h"


#line 9 "T2TSnippetConverterLexer.c"
static const char _TMSnippetToChocolatSnippet_actions[] = {
	0, 1, 2, 1, 6, 1, 7, 1, 
	8, 1, 9, 1, 10, 1, 11, 1, 
	12, 1, 13, 1, 14, 1, 15, 1, 
	16, 1, 17, 1, 18, 2, 0, 1, 
	2, 3, 4, 2, 3, 5
};

static const char _TMSnippetToChocolatSnippet_key_offsets[] = {
	0, 0, 2, 4, 6, 6, 6, 13, 
	16, 18, 20, 32, 33, 35, 41, 43, 
	50
};

static const char _TMSnippetToChocolatSnippet_trans_keys[] = {
	47, 92, 47, 92, 47, 92, 95, 48, 
	57, 65, 90, 97, 122, 36, 92, 96, 
	92, 96, 92, 96, 36, 47, 58, 92, 
	96, 125, 48, 57, 65, 90, 95, 122, 
	123, 47, 92, 48, 57, 65, 90, 97, 
	122, 48, 57, 95, 48, 57, 65, 90, 
	97, 122, 92, 96, 0
};

static const char _TMSnippetToChocolatSnippet_single_lengths[] = {
	0, 2, 2, 2, 0, 0, 1, 3, 
	2, 2, 6, 1, 2, 0, 0, 1, 
	2
};

static const char _TMSnippetToChocolatSnippet_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 3, 0, 
	0, 0, 3, 0, 0, 3, 1, 3, 
	0
};

static const char _TMSnippetToChocolatSnippet_index_offsets[] = {
	0, 0, 3, 6, 9, 10, 11, 16, 
	20, 23, 26, 36, 38, 41, 45, 47, 
	52
};

static const char _TMSnippetToChocolatSnippet_trans_targs[] = {
	0, 5, 2, 3, 5, 2, 0, 4, 
	12, 12, 2, 15, 15, 15, 15, 0, 
	10, 10, 10, 0, 9, 10, 8, 9, 
	16, 8, 11, 1, 10, 7, 8, 10, 
	14, 6, 6, 0, 10, 10, 13, 4, 
	12, 13, 13, 13, 10, 14, 10, 15, 
	15, 15, 15, 10, 9, 10, 8, 10, 
	10, 10, 10, 10, 10, 10, 10, 10, 
	0
};

static const char _TMSnippetToChocolatSnippet_trans_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	32, 32, 0, 0, 0, 0, 0, 0, 
	3, 5, 7, 0, 0, 15, 0, 0, 
	35, 0, 0, 0, 11, 0, 0, 13, 
	0, 0, 0, 0, 9, 17, 0, 0, 
	32, 0, 0, 0, 19, 0, 23, 0, 
	0, 0, 0, 21, 0, 15, 0, 27, 
	27, 27, 17, 19, 19, 23, 21, 25, 
	0
};

static const char _TMSnippetToChocolatSnippet_to_state_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 29, 0, 0, 0, 0, 0, 
	0
};

static const char _TMSnippetToChocolatSnippet_from_state_actions[] = {
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 0, 0, 0, 0, 0, 
	0
};

static const char _TMSnippetToChocolatSnippet_eof_trans[] = {
	0, 0, 0, 0, 58, 0, 0, 0, 
	58, 58, 0, 59, 61, 61, 62, 63, 
	64
};

static const int TMSnippetToChocolatSnippet_start = 10;
static const int TMSnippetToChocolatSnippet_first_final = 10;
static const int TMSnippetToChocolatSnippet_error = 0;

static const int TMSnippetToChocolatSnippet_en_main = 10;


#line 8 "T2TSnippetConverterLexer.rl"



#line 30 "T2TSnippetConverterLexer.rl"



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
	
#line 145 "T2TSnippetConverterLexer.c"
	{
	cs = TMSnippetToChocolatSnippet_start;
	ts = 0;
	te = 0;
	act = 0;
	}

#line 69 "T2TSnippetConverterLexer.rl"
	
#line 155 "T2TSnippetConverterLexer.c"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_acts = _TMSnippetToChocolatSnippet_actions + _TMSnippetToChocolatSnippet_from_state_actions[cs];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 ) {
		switch ( *_acts++ ) {
	case 2:
#line 1 "NONE"
	{ts = p;}
	break;
#line 176 "T2TSnippetConverterLexer.c"
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
	case 3:
#line 1 "NONE"
	{te = p+1;}
	break;
	case 4:
#line 23 "T2TSnippetConverterLexer.rl"
	{act = 8;}
	break;
	case 5:
#line 28 "T2TSnippetConverterLexer.rl"
	{act = 11;}
	break;
	case 6:
#line 15 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('$'); }}
	break;
	case 7:
#line 16 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('\\'); }}
	break;
	case 8:
#line 17 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_char('`'); }}
	break;
	case 9:
#line 19 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(DOLLAR_CURLY); }}
	break;
	case 10:
#line 21 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(COLON); }}
	break;
	case 11:
#line 22 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit(CURLY); }}
	break;
	case 12:
#line 28 "T2TSnippetConverterLexer.rl"
	{te = p+1;{ emit_shell(); }}
	break;
	case 13:
#line 20 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(DOLLAR); }}
	break;
	case 14:
#line 23 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(REGEX); }}
	break;
	case 15:
#line 25 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(IDENTIFIER); }}
	break;
	case 16:
#line 26 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit(NUMERIC); }}
	break;
	case 17:
#line 28 "T2TSnippetConverterLexer.rl"
	{te = p;p--;{ emit_shell(); }}
	break;
	case 18:
#line 1 "NONE"
	{	switch( act ) {
	case 0:
	{{cs = 0; goto _again;}}
	break;
	case 8:
	{{p = ((te))-1;} emit(REGEX); }
	break;
	case 11:
	{{p = ((te))-1;} emit_shell(); }
	break;
	}
	}
	break;
#line 316 "T2TSnippetConverterLexer.c"
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
	case 1:
#line 1 "NONE"
	{act = 0;}
	break;
#line 333 "T2TSnippetConverterLexer.c"
		}
	}

	if ( cs == 0 )
		goto _out;
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

	_out: {}
	}

#line 70 "T2TSnippetConverterLexer.rl"
	
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