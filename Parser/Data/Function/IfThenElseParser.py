from Parser.Parser import Parser
from Parser.Data.Bool.BoolParser import BoolParser
from Expressions.Control.If import IfThenElse

class IfThenElseParser(Parser):

    def __init__(self, text, context):
        super(IfThenElseParser, self).__init__(text, context)
        self.internal += [self.regular_notation, self.question_mark_notation]

    def regular_notation(self):
        if self.advance_string("if"):
            condition = self.advance_until("then")
            then_block = ''
            else_block = ''
            count = 1
            while count > 0:
                if self.advance_string("if"):
                    then_block += "if"
                    count += 1
                elif self.advance_string("else"):
                    count -= 1
                    if count > 0:
                        then_block += "else"
                else:
                    then_block += self.current_char
                    self.advance()
            while self.current_char is not None:
                else_block += self.current_char
                self.advance()
            if count > 0:
                return None
            c = BoolParser(condition, self.context).parse()
            from Parser.StandardParser import StandardParser
            t = StandardParser(then_block, self.context).parse()
            e = StandardParser(else_block, self.context).parse()
            if c is None or t is None or e is None:
                return None
            return IfThenElse(c, t, e)
        return None

    def question_mark_notation(self):
        condition = self.advance_until("?")
        count = 1
        then_block = ''
        while count > 0 and self.current_char is not None:
            if self.advance_string("?"):
                then_block += "?"
                count += 1
            elif self.advance_string(":"):
                count -= 1
                if count > 0:
                    then_block += ":"
            else:
                then_block += self.current_char
                self.advance()
        if count > 0:
            return None
        else_block = self.text[self.pos:]
        c = BoolParser(condition, self.context).parse()
        if c is None:
            return None
        self.finish()
        return IfThenElse(c, then_block, else_block, self.context)