package com.chiefarchitect;
import java.util.Scanner;
import java.util.Stack;

public class Main {

	private static final boolean True = false;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n;  
		Scanner sc=new Scanner(System.in);  
		System.out.print("Enter the number of elements you want to store: ");  
		//reading the number of elements from the that we want to enter  
		n=sc.nextInt();  
		//creates an array in the memory of length 10  
		int[] array = new int[100];  
		System.out.println("Enter the elements of the array: ");  
		for(int i=1; i<=n; i++)  
		{  
		//reading array elements from the user   
		array[i]=sc.nextInt();  
		}
		ChiefArchitectLogic object = new ChiefArchitectLogic();
		object.chiefArchitect(array,n);
		// Creating an empty Stack
        //Stack<Integer> STACK = new Stack<Integer>();
        //int flag = n;
        //int j,top=-1;
        //for(int i=1; i<=n; i++)  
		//{ 
        //	STACK.push(array[i]);
        //	top++;
        //	System.out.println(i+"day");
        //	j=i;
        //	while(1==1) {
        /*		
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
        */
	}


}
