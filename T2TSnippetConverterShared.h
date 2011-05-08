typedef struct {

	int type;
	char payloadChar;
	char *payloadStart;
	char *payloadEnd;

} T2TSnippetToken;

NSString *T2TConvertTextMateSnippetToChocolat(NSString *tmSnippet);
NSString* T2TEscapeSnippetString(NSString *literal);

void *T2TParseAlloc(void *(*mallocProc)(size_t));

void T2TParse(
  void *yyp,                   /* The parser */
  int yymajor,                 /* The major token code number */
  T2TSnippetToken yyminor,       /* The value for the token */
	NSMutableString *output		/* Optional %extra_argument parameter */
);

void T2TParseFree(
  void *p,                    /* The parser to be deleted */
  void (*freeProc)(void*)     /* Function used to reclaim memory */
);
