package com.chiefarchitect;

import java.util.Stack;

public class ChiefArchitectLogic {

	public void chiefArchitect(int array[],int n) {
		// Creating an empty Stack
        Stack<Integer> STACK = new Stack<Integer>();
        int flag = n;
        int j,top=-1;
        for(int i=1; i<=n; i++)  
		{ 
        	STACK.push(array[i]);
        	top++;
        	System.out.println(i+"day");
        	j=i;
        	while(1==1) {
        		
        		if(array[j]==flag) {
        			System.out.print(STACK.pop());
        			top--;
        			flag--;
        			j--;
        		}
        		else {break;}
        	}
        	System.out.println();
		}
        while(top>=0) {
        	System.out.print(STACK.pop());
        	top--;
        }
	}
}
