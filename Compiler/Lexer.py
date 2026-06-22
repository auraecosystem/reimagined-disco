import re

TOKENS = [
    ('NUMBER', r'\d+'),
    ('IDENT', r'[A-Za-z_][A-Za-z0-9_]*'),
    ('LBRACE', r'\{'),
    ('RBRACE', r'\}'),
    ('LPAREN', r'\('),
    ('RPAREN', r'\)'),
    ('STRING', r'"[^"]*"'),
    ('SKIP', r'[ \t\n]+')
]

def tokenize(code):
    pattern = '|'.join(
        f'(?P<{name}>{regex})'
        for name, regex in TOKENS
    )

    for match in re.finditer(pattern, code):
        kind = match.lastgroup

        if kind != 'SKIP':
            yield (kind, match.group())
