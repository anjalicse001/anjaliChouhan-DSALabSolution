package com.longestpath.driver;
import java.util.ArrayList;

import com.longestpath.driver.Main.Node;

public class FindLongestPath {
	
	
	public static ArrayList<Integer> FindLongestPath(Node root){
		//Driver Code
		
	
	if (root == null) {
		ArrayList<Integer> output = new ArrayList<>();
		return output;
	}
	//Recursive call on root.rightNode
	ArrayList<Integer> rightArray = FindLongestPath(root.rightNode);
	
	//Recursive call on root.leftNode
	ArrayList<Integer> leftArray = FindLongestPath(root.leftNode);
	
	//Compare the size of the two ArrayList
	//and insert current node accordingly
	if (rightArray.size() < leftArray.size()) {
		leftArray.add(root.nodeData);
	} else {
		rightArray.add(root.nodeData);
	}
		//Return the appropriate ArrayList
	return(leftArray.size() > rightArray.size() ? leftArray : rightArray);
	
	}

}
