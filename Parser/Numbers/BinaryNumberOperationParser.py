from Parser.Numbers.AbstractNumberParser import AbstractNumberParser

class BinaryNumberOperationParser(AbstractNumberParser):

    def __init__(self, text, context):
        super(BinaryNumberOperationParser, self).__init__(text, context)
        self.internal = [self.parse_operation]
        self.sub_parsers = []

    def create(self, left, right):
        return None

    def operation_string(self):
        return " "

    def parse_operation(self):
        index = 0
        result = None
        while result is None:
            index = self.text.find(self.operation_string(), index)
            if index > 0:
                left = self.text[:index - 1]
                right = self.text[index + 1:]
                right_parsed = AbstractNumberParser.default(right, self.context).parse()
                left_parsed = AbstractNumberParser.default(left, self.context).parse()
                if right_parsed is not None and left_parsed is not None:
                    result = self.create(left_parsed.parsedObject, right_parsed.parsedObject)
                    self.pos = len(self.text)
                    self.advance()
            if index < 0:
                break
        return result

