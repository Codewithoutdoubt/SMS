package com.cms.util;

import java.io.File;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;  // Updated import for Jakarta

public class FileUploadUtility {

    private static final String ABS_PATH = "//home//ms-alsabagh//Documents//workspace1//collage-management-system//src//main//webapp//static//images//";
    private static String REAL_PATH = null;
    private static final Logger logger = LoggerFactory.getLogger(FileUploadUtility.class);

    public static void uploadFile(HttpServletRequest request, MultipartFile file, String code) {
        
        // Update for Jakarta API
        REAL_PATH = request.getServletContext().getRealPath("/static/images/");

        logger.info("File upload path: " + REAL_PATH);

        // Create directories if they do not exist
        File realPathDir = new File(REAL_PATH);
        File absPathDir = new File(ABS_PATH);

        if (!realPathDir.exists()) {
            realPathDir.mkdirs();
        }
        if (!absPathDir.exists()) {
            absPathDir.mkdirs();
        }

        try {
            // Transfer the file to both locations
            File realFile = new File(REAL_PATH + File.separator + code + ".jpg");
            File absFile = new File(ABS_PATH + File.separator + code + ".jpg");

            file.transferTo(realFile);
            file.transferTo(absFile);

            logger.info("File uploaded successfully: " + realFile.getAbsolutePath());
        } catch (IOException ex) {
            logger.error("File upload failed!", ex);
        } catch (NullPointerException n) {
            logger.error("NullPointerException during file upload", n);
        }
    }
}
