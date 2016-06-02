import re

# Magic regular expressions

number_expression = "(([ ]*([-]?)(([0-9]+([.][0-9]+)?))[ ]*))"

item_expression = "(([(].*[)])|" + number_expression + ")"

class PrecedenceManager(object):

    @staticmethod
    def get_regular_expression(operation):
        return item_expression + operation + item_expression

    @staticmethod
    def prepare_precedence(text):
        precedent = ["[*][*]", "[/]", "[*]"]
        for operation in precedent:
            ex = PrecedenceManager.get_regular_expression(operation)
            text = re.sub(ex, r"(\g<0>)", text)
        return text

