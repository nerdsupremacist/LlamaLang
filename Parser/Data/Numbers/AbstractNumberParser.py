from Parser.Parser import Parser
from EmptyContext import EmptyContext

class AbstractNumberParser(Parser):

    parser = None

    def __init__(self, text, context):
        super(AbstractNumberParser, self).__init__(text, context)

    def parser_default(self):
        return AbstractNumberParser.parser

    @staticmethod
    def default(text, context):
        abstract = AbstractNumberParser.parser
        return abstract(text, context)

    @staticmethod
    def set_parser(new_parser):
        AbstractNumberParser.parser = new_parser

