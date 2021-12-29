package bkosmo.mvc.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Controller
public class QRController {
   
   @RequestMapping("/")
      public String makeqr(HttpSession session, Model m) throws WriterException, IOException { 
      try {
            File file = null;
            // ť���̹����� ������ ���丮 ����
            file = new File("C:\\kosmo91\\workspace__\\1111111111111\\WebContent\\resources\\images\\QRCode");
            if(!file.exists()) {
                file.mkdirs();
            }
            String qraddr = "https://222.112.247.95/garbagecollector/loginForm?mobile=mobile";
            String codeurl = new String(qraddr.getBytes("UTF-8"), "ISO-8859-1");
            // �ڵ��νĽ� ��ũ�� URL�ּ�
            // ť���ڵ� ���ڵ� ����
            int qrcodeColor =   0x6CCFF7;
            // ť���ڵ� ������
            int backgroundColor = 0xF5F7FF;
             
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            // 3,4��° parameter�� : width/height�� ����
            BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,314, 298);
            //
            MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
            // ImageIO�� ����� ���ڵ� ���Ͼ���
            ImageIO.write(bufferedImage, "png", new File(file+"\\qrcode.png"));
             
        } catch (Exception e) {
            e.printStackTrace();
        }  
         return "qrpage_origin"; 
   }
	
}