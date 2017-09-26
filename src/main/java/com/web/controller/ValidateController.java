package com.web.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.util.ValidateImageUtil;

@Controller
@RequestMapping(value = "/validate")
public class ValidateController {
	
	private final Font mFont = new Font("Arial Black", Font.PLAIN, 15); // 设置字体
	private final int lineWidth = 2; // 干扰线的长度=1.414*lineWidth
	private final int width = 88; // 定义图形大小
	private final int height = 25; // 定义图形大小
	private final int count = 200;
	
	@RequestMapping(value = "/getimage")
	public void getValidateImage(HttpServletRequest request,
						HttpServletResponse response) throws Exception{
		//设置页面不缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/gif");
		
		//在内存中创建图像
		final BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		
		final Graphics2D g = (Graphics2D) image.getGraphics();
		
		final Random random = new Random();
		
		g.setColor(ValidateImageUtil.getRandorColor(200,250));
		
		g.fillRect(0, 0, width, height);

		// 设定字体
		g.setFont(mFont);

		// 画边框
		g.setColor(ValidateImageUtil.getRandorColor(0,20)); // ---2
		g.drawRect(0, 0, width - 1, height - 1);

		// 随机产生干扰线，使图象中的认证码不易被其它程序探测到
		for (int i = 0; i < count; i++) {

			g.setColor(ValidateImageUtil.getRandorColor(150,200)); // ---3

			final int x = random.nextInt(width - lineWidth - 1) + 1; // 保证画在边框之内
			final int y = random.nextInt(height - lineWidth - 1) + 1;
			final int xl = random.nextInt(lineWidth);
			final int yl = random.nextInt(lineWidth);
			g.drawLine(x, y, x + xl, y + yl);
		}

		// 取随机产生的认证码(4位数字)
		String sRand = "";

		for (int i = 0; i < 4; i++) {

			final String rand = String.valueOf(random.nextInt(10));
			sRand += rand;

			// 将认证码显示到图象中,调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
			g.setColor(new Color(20 + random.nextInt(130), 20 + random
					.nextInt(130), 20 + random.nextInt(130))); // --4--50-100

			g.drawString(rand, (13 * i) + 6, 16);

		}

		// 将认证码存入SESSION
		request.getSession().setAttribute("validateCode", sRand);

		// 图象生效
		g.dispose();
		final java.io.OutputStream os = response.getOutputStream();
		// 输出图象到页面
		ImageIO.write(image, "PNG", os);
		os.flush();
		os.close();
		
	}

}
