package com.balancingbracket.driver;

import com.balancingbracket.service.BalancingBracket;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String bracketExpression = "([[{}]])";
		Boolean result;
		//result = checkingBracketsBalanced(bracketExpression);
		BalancingBracket object = new BalancingBracket();
		result =object.checkingBracketsBalanced(bracketExpression);
		//result = checkingBracketsBalanced(bracketExpression);
		
		if (result)
			System.out.println("The entered String has Balanced");
		else 
			System.out.println("Unbalanced");
	}

	
}
