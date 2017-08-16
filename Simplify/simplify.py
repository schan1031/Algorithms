# Code by Serena Chan

def simplifyExpression(expression):
    #Base case, if expression is null, return expression
    if (not expression):
        return expression
    #Get rid of whitespace
    else:
        if (" " in expression):
            expression = expression.replace(" ","")
    #Scenario to remove parentheses from only the first subexpression
    if (expression[0] == '('):
        expression = list(expression)
        numFrontParens = 1
        count = 1
        while (numFrontParens > 0):
            if (expression[count] == '('):
                numFrontParens = numFrontParens + 1
                expression[count] = ''
            elif (expression[count] == ')'):
                numFrontParens = numFrontParens - 1
                if (numFrontParens > 0):
                    expression[count] = ''
                elif (numFrontParens == 0):
                    lastParens = count
            count = count + 1
        tempResult = expression[:lastParens+1]
        tempResult = ''.join(tempResult)
        tempResult = tempResult.replace('(','')
        tempResult = tempResult.replace(')','')
        return tempResult + simplifyExpression(''.join(expression[lastParens+1:]))
    #simplifying the rest of the subtree
    elif('(' in expression):
        expression = list(expression)
        numFrontParens = 0
        count = 0
        endParens = len(expression) - 1
        for x in expression:
            if (expression[count] == '('):
                numFrontParens = numFrontParens + 1
                if (numFrontParens > 1):
                    expression[count] = ''
            elif (expression[count] == ')'):
                numFrontParens = numFrontParens - 1
                if (numFrontParens > 0):
                    expression[count] = ''
                if (numFrontParens == 0):
                    endParens = count
            count = count + 1
        answer = ''.join(expression[:endParens+1])
        answer2 = expression[endParens+1:]
        if (answer2):
            return answer + ''.join(simplifyExpression(answer2))
        else:
            return answer
    else:
        return expression

#evaluate the expression
def solveExpression(operations, expression):
    x = 0
    if (operations):
        while (x < len(operations)):
            if operations[x] == 'R':
                expression = reverseExpression(expression)
            if operations[x] == 'S':
                expression = simplifyExpression(expression)
            x = x + 1
    return expression


exp = '(ABCDEF)'
exp2 = 'A(BC)'
exp3 = '(BC)A'
exp4 = 'C(BA)'
print simplifyExpression(exp2)
