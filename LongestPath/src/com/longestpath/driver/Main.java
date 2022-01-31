package com.longestpath.driver;
//import FindLongestpath.*;
import com.longestpath.driver.FindLongestPath;
import java.util.ArrayList;
//import FindLongestpath.FindLongestPath;
//import findLongestpath.findLongestPath.Node;

public class Main {

	static class Node {
		Node leftNode;
		Node rightNode;
		int nodeData;
	}
	//private static final findLongestpath.Node Node = null;
	static Node newNode(int nodeData) {
		Node temp = new Node();
		temp.nodeData = nodeData;
		temp.leftNode = null;
		temp.rightNode = null;
		
		return temp;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		
		Node root = newNode(100);
		root.leftNode=newNode(20);
		root.rightNode=newNode(130);
		root.leftNode.leftNode=newNode(10);
		root.leftNode.rightNode=newNode(50);
		root.rightNode.leftNode=newNode(110);
		root.rightNode.rightNode=newNode(140);
		root.leftNode.leftNode.leftNode=newNode(5);
		//5,10,20,100
		//FindLongestPath object = new FindLongestPath();
		FindLongestPath s = new FindLongestPath();
		
		
		ArrayList<Integer> output;
		output = s.FindLongestPath(root);
		int size = output.size();//4
		System.out.print(output.get(size - 1));
		for (int i = size - 2; i >=0;i--) {
			System.out.print("->" + output.get(i));
		}
	}	
}
