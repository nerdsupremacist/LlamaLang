from Expressions.Number import Number
from Expressions.Operations.Plus import Plus
from Expressions.Operations.Minus import Minus
from Expressions.Var import Var
from Expressions.String import String

class Interpreter(object):

    def __init__(self, context, text):
        self.context = context
        self.text = text
        self.pos = 0
        self.current_token = None
        self.current_char = self.text[self.pos]
        self.eaten = []
        self.ops = []

    def advance(self):
        self.pos += 1
        if self.pos > len(self.text) - 1:
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]

    def go_back(self):
        self.pos -= 1
        if self.pos < 0:
            self.current_char = None
        else:
            self.current_char = self.text[self.pos]

    def error(self):
        raise Exception("Invalid Format")

    def skip_whitespace(self):
        while self.current_char is not None and self.current_char.isspace():
            self.advance()

    def string(self):
        result = ''
        self.advance()
        while self.current_char is not None:
            if self.current_char == '"':
                self.advance()
                return String(result)
            result += self.current_char
            self.advance()
        return String("")

    def integer(self):
        result = ''
        while self.current_char is not None and self.current_char.isdigit():
            result += self.current_char
            self.advance()
        if len(result) > 0:
            return Number(int(result))
        else:
            return None

    def brackets(self):
        result = ''
        bracket_count = 1
        self.advance()
        while self.current_char is not None:
            if self.current_char == "(":
                bracket_count += 1
            if self.current_char == ")":
                bracket_count -= 1
            if bracket_count == 0:
                self.advance()
                return Interpreter(self.context, result).parse()
            result += self.current_char
            self.advance()
        return Number(0)

    def advance_string(self, str):
        for i in range(len(str)):
            char = str[i]
            if self.current_char != char:
                for j in range(i):
                    self.go_back()
                return False
            self.advance()
        return True

    def var_declaration(self):
        if self.advance_string("let "):
            self.skip_whitespace()
            name = ''
            value = ''
            while self.current_char is not None and self.current_char.isalpha():
                name += self.current_char
                self.advance()
            if len(name) <= 0:
                raise Exception("Invalid declaration")
            self.skip_whitespace()
            if self.current_char != "=":
                raise Exception("Invalid declaration")
            self.advance()
            self.skip_whitespace()
            while self.current_char is not None:
                value += self.current_char
                self.advance()
            if len(value) > 0:
                value_result = Interpreter(self.context, value).parse()
                self.context.setValueForVar(name, value_result)
                return Var(name, self.context)
            return Number(0)
        else:
            return Number(0)

    def var(self):
        result = ''
        while self.current_char is not None and self.current_char.isalpha():
            result += self.current_char
            self.advance()
        if len(result) > 0:
            return Var(result, self.context)
        else:
            return None

    def eat(self, item):
        self.eaten.append(item)

    def eatBinaryOp(self, op):
        self.ops.append(op)

    def parse(self):
        current = Number(0)
        while self.current_char is not None:
            if self.current_char.isspace():
                self.skip_whitespace()
                continue
            if self.current_char.isdigit():
                current = self.integer()
                if len(self.ops) > 0 and len(self.eaten) > 0:
                    op = self.ops.pop()
                    last = self.eaten.pop()
                    current = op(last, current)
                continue
            if self.current_char == '+':
                self.advance()
                self.eat(current)
                self.eatBinaryOp(Plus)
                continue
            if self.current_char == '-':
                self.advance()
                self.eat(current)
                self.eatBinaryOp(Minus)
                continue
            if self.current_char == '(':
                current = self.brackets()
                if len(self.ops) > 0 and len(self.eaten) > 0:
                    op = self.ops.pop()
                    last = self.eaten.pop()
                    current = op(last, current)
                continue
            if self.current_char == 'l':
                item = self.var_declaration()
                if isinstance(item, Var):
                    current = item
                continue
            if self.current_char == '"':
                current = self.string()
                if len(self.ops) > 0 and len(self.eaten) > 0:
                    op = self.ops.pop()
                    last = self.eaten.pop()
                    current = op(last, current)
                continue
            else:
                current = self.var()
                if len(self.ops) > 0 and len(self.eaten) > 0:
                    op = self.ops.pop()
                    last = self.eaten.pop()
                    current = op(last, current)
                continue
        return current

    def result(self):
        return self.parse().eval()