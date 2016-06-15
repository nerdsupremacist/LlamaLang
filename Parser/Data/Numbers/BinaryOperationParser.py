from Parser.Parser import Parser

class BinaryOperationParser(Parser):

    def __init__(self, text, context, op, default):
        super(BinaryOperationParser, self).__init__(text, context)
        self.internal = [self.parse_operation]
        self.sub_parsers = []
        self.op = op
        self.default = default

    def create(self, left, right):
        return None

    def parser_default(self):
        return self.default

    def parse_operation(self):
        index = len(self.text)
        result = None
        while result is None:
            index = self.text.rfind(self.op, 0, index)
            if index > 0:
                left = self.text[:index]
                right = self.text[index+len(self.op):]
                right_parsed = self.default(right, self.context).parse()
                left_parsed = self.default(left, self.context).parse()
                if right_parsed is not None and left_parsed is not None:
                    result = self.create(left_parsed, right_parsed)
                    self.finish()
            if index < 0:
                break
        return result

