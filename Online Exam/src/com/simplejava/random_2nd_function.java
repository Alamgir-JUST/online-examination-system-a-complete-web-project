package com.simplejava;

import java.util.ArrayList;

public class random_2nd_function {
	public static boolean idCheck(ArrayList<Integer> flag, int index) {
		if(flag.get(index) == 0) {
			return true;
		}
		return false;
	}
}
