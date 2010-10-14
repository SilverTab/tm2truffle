typedef struct {

	int type;
	char payloadChar;
	char *payloadStart;
	char *payloadEnd;

} T2TSnippetToken;


void *ParseAlloc(void *(*mallocProc)(size_t));

void Parse(
  void *yyp,                   /* The parser */
  int yymajor,                 /* The major token code number */
  T2TSnippetToken yyminor,       /* The value for the token */
	NSMutableString *output		/* Optional %extra_argument parameter */
);

void ParseFree(
  void *p,                    /* The parser to be deleted */
  void (*freeProc)(void*)     /* Function used to reclaim memory */
);