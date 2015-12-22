package net.tngou.util;


import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.AbstractTextPaster;
import com.octo.captcha.component.image.textpaster.RandomTextPaster;
import com.octo.captcha.component.image.textpaster.SimpleTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.wordgenerator.WordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.ImageCaptcha;
import com.octo.captcha.image.ImageCaptchaFactory;
import com.octo.captcha.image.gimpy.GimpyFactory;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import net.tngou.http.HttpRequest;
import net.tngou.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * 验证码设置     初始化验证码图片的样式
 * <p>
 * 初始样式
 * 核对验证码
 */

public class CaptchaServiceSingleton extends ListImageCaptchaEngine {
    private static final Logger log = LoggerFactory.getLogger(CaptchaServiceSingleton.class);

    private static final Integer MIN_WORD_LENGTH = new Integer(4);     //最少字的个数

    private static final Integer MAX_WORD_LENGTH = new Integer(5);     //最多字的个数

    private static final Integer IMAGE_WIDTH = new Integer(100);       //图片的长度

    private static final Integer IMAGE_HEIGHT = new Integer(32);     //图片的高度

    private static final Integer MIN_FONT_SIZE = new Integer(24);     //最小字的大小

    private static final Integer MAX_FONT_SIZE = new Integer(24);    //最大字的大小

    private static final String NUMERIC_CHARS = "0123456789";         // No numeric 0    


    private static CaptchaServiceSingleton instance = new CaptchaServiceSingleton();


    private ArrayList<AbstractTextPaster> textPasterList;


    private ArrayList<GradientBackgroundGenerator> backgroundGeneratorList;


    private ArrayList<RandomFontGenerator> fontGeneratorList;

    static ImageCaptcha imageCaptcha = null;

    /**
     * Private constructor to prevent instantiation
     */
    private CaptchaServiceSingleton() {
    }

    public static CaptchaServiceSingleton getInstance() {
        return instance;
    }

    /**
     * 初始化验证码的图片
     */
    @Override
    @SuppressWarnings({"unchecked", "rawtypes"})
    protected void buildInitialFactories() {
        try {
            textPasterList = new ArrayList();
            backgroundGeneratorList = new ArrayList();
            fontGeneratorList = new ArrayList();

            textPasterList.add(new SimpleTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.black));
            textPasterList.add(new RandomTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.black));
            textPasterList.add(new SimpleTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.black));
            textPasterList.add(new RandomTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.black));
            textPasterList.add(new SimpleTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.blue));
            textPasterList.add(new RandomTextPaster(MIN_WORD_LENGTH,
                    MAX_WORD_LENGTH, Color.blue));

            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.orange, Color.white));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.white, Color.green));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.gray, Color.white));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.white, Color.orange));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.green, Color.white));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.yellow, Color.white));
            backgroundGeneratorList.add(new GradientBackgroundGenerator(
                    IMAGE_WIDTH, IMAGE_HEIGHT, Color.white, Color.magenta));

            fontGeneratorList.add(new RandomFontGenerator(MIN_FONT_SIZE,
                    MAX_FONT_SIZE));// to easy to read    

            WordGenerator words = new RandomWordGenerator(NUMERIC_CHARS);

            for (Iterator fontIter = fontGeneratorList.iterator(); fontIter
                    .hasNext(); ) {
                FontGenerator font = (FontGenerator) fontIter.next();
                for (Iterator backIter = backgroundGeneratorList.iterator(); backIter
                        .hasNext(); ) {
                    BackgroundGenerator back = (BackgroundGenerator) backIter
                            .next();
                    for (Iterator textIter = textPasterList.iterator(); textIter
                            .hasNext(); ) {
                        TextPaster parser = (TextPaster) textIter.next();

                        WordToImage word2image = new ComposedWordToImage(font,
                                back, parser);
                        ImageCaptchaFactory factory = new GimpyFactory(words,
                                word2image);
                        addFactory(factory);
                    }
                }
            }
        } catch (Exception ex) {

        }
    }


    /**
     * 输出验证码的图片
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public void writeCaptchaImage(HttpRequest request,
                                  HttpResponse response, HttpSession session, String value) throws IOException {

        imageCaptcha = getNextImageCaptcha();
//        HttpSession session = request.getSession();    
        session.setAttribute(value, imageCaptcha);
        BufferedImage image = (BufferedImage) imageCaptcha.getChallenge();

        OutputStream outputStream = null;
        try {
            outputStream = response.getOutputStream();
            // render the captcha challenge as a JPEG image in the response    
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            response.setContentType("image/jpeg");

            JPEGImageEncoder encoder = JPEGCodec
                    .createJPEGEncoder(outputStream);
            encoder.encode(image);

            outputStream.flush();
            outputStream.close();
            outputStream = null;// no close twice    
        } catch (IOException ex) {
            log.error("生成验证吗错误");
            throw ex;
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException ex) {
                }
            }
            imageCaptcha.disposeChallenge();
        }
    }

    /**
     * 核对验证码是否正确
     *
     * @param validateCode ：验证码的值
     * @param session      ：当前的session
     * @return 验证码是否正确
     */
    public static boolean validateCaptchaResponse(String validateCode,
                                                  HttpSession session, String value) {

        boolean flag = false;
        imageCaptcha = (ImageCaptcha) session.getAttribute(value);
        if (imageCaptcha == null) {
            return false;
        } else {
            if (validateCode == null) {
                return flag;
            } else {
                validateCode = validateCode.toUpperCase();
                flag = (imageCaptcha.validateResponse(validateCode)).booleanValue();
                session.removeAttribute(value);
                return flag;
            }
        }
    }
}   
