class Parser:

    def __init__(self, tokens):
        self.tokens = list(tokens)
        self.pos = 0

    def current(self):
        return self.tokens[self.pos]

    def parse(self):
        program = Program()

        while self.pos < len(self.tokens):
            token = self.current()

            if token[1] == "agent":
                program.statements.append(
                    self.parse_agent()
                )
            else:
                self.pos += 1

        return program
