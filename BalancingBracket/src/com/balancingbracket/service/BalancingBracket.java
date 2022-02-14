package com.balancingbracket.service;



import java.util.Stack;
public class BalancingBracket {

	//function to check if Brackets are balanced
	public  boolean checkingBracketsBalanced(String bracketExpression)
	{
		Stack<Character> stack = new Stack<>();
		for (int i=0;i<bracketExpression.length();i++)
		{
			char character = bracketExpression.charAt(i);
			if (character =='(' || character=='[' || character=='}') {
				stack.push(character);
				continue;
			}
			if(stack.isEmpty())
				return false;
			
			char c;
			switch (character) {
			case '}':
				c = stack.pop();
				if (c=='('|| c=='[')
					return false;
				break;
			case ')':
				c = stack.pop();
				if(c=='{'|| c=='[')
					return false ;
				break;
			case ']':
				c= stack.pop();
				if(c=='('||c=='{')
					return false;
				break;
			}
		}
			return stack.isEmpty();
		
	}
	

}
