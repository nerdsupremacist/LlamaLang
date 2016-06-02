from Parser.Parser import Parser
from Parser.Data.VariableParser import VariableParser

class VariableDeclarationParser(Parser):

    def __init__(self, text, context):
        super(VariableDeclarationParser, self).__init__(text, context)
        self.internal += [self.parse_declaration]

    def parse_declaration(self):
        if self.advance_string("let"):
            name_field = self.advance_until("=")
            parser = VariableParser(name_field, self.context)
            parsed_var = parser.parse()
            remaining = self.text[self.pos:]
            from Parser.StandardParser import StandardParser
            parsed_remaining = StandardParser(remaining, self.context).parse()
            self.finish()
            if parsed_var is None or parsed_remaining is None:
                return None
            parsed_var = parsed_var.parsedObject
            parsed_remaining = parsed_remaining.parsedObject
            parsed_var.set(parsed_remaining)
            return parsed_var
        else:
            return None