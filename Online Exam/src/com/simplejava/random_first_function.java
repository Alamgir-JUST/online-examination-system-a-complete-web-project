package com.simplejava;

import java.util.ArrayList;

public class random_first_function {
	public static boolean check(ArrayList<Integer> flag, int n) { // n == array size
		int c = 0;
		for(int i=0; i<n; i++) {
			if(flag.get(i) == 1) {
				c++;
			}
		}
		if(c == n){
			return true;
		}
		return false;
	}
}
