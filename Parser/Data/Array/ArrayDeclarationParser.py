from Parser.Parser import Parser
from Expressions.Array import Array

class ArrayDeclarationParser(Parser):
    
    def __init__(self, text, context):
        super(ArrayDeclarationParser, self).__init__(text, context)
        self.internal += [self.parse_array]

    def parser_default(self):
        return ArrayDeclarationParser

    def next_item(self):
        result = ''
        bracket_count = 0
        brace_count = 0
        while self.current_char is not None:
            if self.current_char == "[":
                bracket_count += 1
            if self.current_char == "]":
                if bracket_count == 0:
                    break
                bracket_count -= 1
            if self.current_char == "{":
                brace_count += 1
            if self.current_char == "}":
                brace_count -= 1
            if self.current_char == "," and brace_count == bracket_count == 0:
                self.advance()
                break
            result += self.current_char
            self.advance()
        if result != '':
            return result
        return None

    def parse_array(self):
        if self.current_char == "[":
            self.advance()
            items = []
            item = self.next_item()
            while item is not None:
                items.append(item)
                item = self.next_item()
            self.skip_whitespace()
            if self.current_char == "]":
                self.advance()
                from Parser.StandardParser import StandardParser
                parsed_items = []
                for item in items:
                    parser = StandardParser(item, self.context)
                    parsed = parser.parse()
                    if parsed is None:
                        return None
                    parsed_items.append(parsed)
                return Array(parsed_items)
        return None
