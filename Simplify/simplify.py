def simplifyExpression(expression):
    if (not expression):
        return expression
    else:
        if (" " in expression):
            expression = expression.replace(" ", "")
    if (expression[0] == '('):
        expression = list(expression)
        numFrontParens = 1
        count = 1
        while (numFrontParens > 0):
            if (expression[count] == '('):
                numFrontParens += 1
                expression[count] = ''
            elif (expression[count] == ')'):
                numFrontParens -= 1
                if (numFrontParens > 0):
                    expression[count] = ''
                elif (numFrontParens == 0):
                    lastParens = count
            count += 1
        tempResult = expression[:lastParens + 1]
        tempResult = ''.join(tempResult)
        tempResult = tempResult.replace('(', '')
        tempResult = tempResult.replace(')', '')
        return tempResult + simplifyExpression(''.join(expression[lastParens + 1]))
    elif ('(' in expression):
        expression = list(expression)
        numFrontParens = 0
        count = 0
        endParens = len(expression) - 1
        for x in expression:
            if (expression[count] == '('):
                numFrontParens += 1
                if (numFrontParens > 1):
                    expression[count] = ''
            elif (expression[count] == ')'):
                numFrontParens -= 1
                if (numFrontParens > 0):
                    expression[count] = ''
                if (numFrontParens == 0):
                    endParens = count
            count += 1
        answer = ''.join(expression[:endParens + 1])
        answer2 = expression[endParens + 1:]
        if (answer2):
            return answer + ''.join(simplifyExpression(answer2))
        else:
            return answer

exp1 = '(ABC)(DEF)'
print (simplifyExpression(exp1))
