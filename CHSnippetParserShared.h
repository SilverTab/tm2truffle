typedef struct {

	int type;
	char payloadChar;
	char *payloadStart;
	char *payloadEnd;

} CHSnippetToken;

id CHParseSnippet(NSString *tmSnippet);
//NSString* CHEscapeSnippetString(NSString *literal);

void *CHSnippet_ParseAlloc(void *(*mallocProc)(size_t));

void CHSnippet_Parse(
  void *yyp,                   /* The parser */
  int yymajor,                 /* The major token code number */
  CHSnippetToken yyminor,       /* The value for the token */
	id output		/* Optional %extra_argument parameter */
);

void CHSnippet_ParseFree(
  void *p,                    /* The parser to be deleted */
  void (*freeProc)(void*)     /* Function used to reclaim memory */
);
