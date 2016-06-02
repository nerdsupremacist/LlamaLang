from Parser.Parser import Parser
from Expressions.Operations.Function import Function

class FunctionDeclarationParser(Parser):
    
    def __init__(self, text, context):
        super(FunctionDeclarationParser, self).__init__(text, context)
        self.internal += [self.parse_declaration]

    def parse_declaration(self):
        index = self.text.find("->")
        if index > 0:
            vars_as_string = self.text[:index-1]
            vars_as_array = self.text.split("[ ]+")
            for item in vars_as_array:
                if not item.isalpha:
                    return None
            code = self.text[index+2:]
            return Function(vars_as_array, self.context, code, True)
