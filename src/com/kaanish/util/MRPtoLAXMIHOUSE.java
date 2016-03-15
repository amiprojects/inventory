package com.kaanish.util;

public class MRPtoLAXMIHOUSE {
	public static String getLaxmiHouse(float n) {
		// double num = 12345.345;
		float num = (float) n;
		String LH = "";

		String number = String.valueOf(num);
		for (int i = 0; i < number.length(); i++) {
			int digit = Character.digit(number.charAt(i), 10);
			if (digit == -1) {
				break;
			} else {
				if (digit == 1) {
					LH += 'L';
				}
				if (digit == 2) {
					LH += 'A';
				}
				if (digit == 3) {
					LH += 'X';
				}
				if (digit == 4) {
					LH += 'M';
				}
				if (digit == 5) {
					LH += 'I';
				}
				if (digit == 6) {
					LH += 'H';
				}
				if (digit == 7) {
					LH += 'O';
				}
				if (digit == 8) {
					LH += 'U';
				}
				if (digit == 9) {
					LH += 'S';
				}
				if (digit == 0) {
					LH += 'E';
				}
			}
		}
		return LH;
	}
}
