package com.web.util;

import java.awt.Color;
import java.util.Random;

public class ValidateImageUtil {
	
	public static Color getRandorColor(int fc,int bc){
		final Random random = new Random();
		if (fc > 255) {

			fc = 255;
		}

		if (bc > 255) {

			bc = 255;
		}

		final int r = fc + random.nextInt(bc - fc);
		final int g = fc + random.nextInt(bc - fc);
		final int b = fc + random.nextInt(bc - fc);

		return new Color(r, g, b);
	}
}
