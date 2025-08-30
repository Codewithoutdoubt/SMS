package com.sms.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sms.entity.Documents;
import com.sms.entity.Student;
import com.sms.services.DocumentsService;
import com.sms.services.StudentService; 

@Controller
@RequestMapping("/documents")
public class DocumentController {
    @Autowired
    private DocumentsService documentsService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddDocumentForm(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/add-documents");
        mav.addObject("students", studentService.getStudentByStudentId(studentId));
        return mav;
    }

    
    @PostMapping("/update-document")
    public ModelAndView updateDoc(@RequestParam("documentId") Long documentId,
            @RequestParam("studentId") Long studentId,
            @ModelAttribute Documents updatedDocument) {
        documentsService.updateDocument(documentId, updatedDocument);
        return new ModelAndView("redirect:/admission");
    }

    @GetMapping("/editdocument")
    public ModelAndView editDocument(@RequestParam("documentId") Long documentId) {
        Documents document = documentsService.getDocumentById(documentId);
        ModelAndView mav = new ModelAndView("Admission/edit-document-details");
        mav.addObject("document", document);
        return mav;
    }

    @PostMapping("/save")
    public ModelAndView saveDocument(@RequestParam("studentId") Long studentId,
                                   @RequestParam("aadharNo") String aadharNo,
                                   @RequestParam("castCertificateNo") String castCertificateNo,
                                   @RequestParam("residenceCertificateNo") String residenceCertificateNo,
                                   @RequestParam("incomeCertificateNo") String incomeCertificateNo,
                                   @RequestParam("tenthMarksheetNo") String tenthMarksheetNo,
                                   @RequestParam("twelfthMarksheetNo") String twelfthMarksheetNo,
                                   @RequestParam("transferCertificateNo") String transferCertificateNo,
                                   @RequestParam("profileImage") MultipartFile profileImage,
                                   @RequestParam("aadharImage") MultipartFile aadharImage,
                                   @RequestParam("10thMarksheetImage") MultipartFile marksheet10thImage,
                                   @RequestParam("12thMarksheetImage") MultipartFile marksheet12thImage,
                                   @RequestParam("transferCertificateImage") MultipartFile transferCertificateImage,
                                   @RequestParam("casteCertificateImage") MultipartFile casteCertificateImage,
                                   @RequestParam("incomeCertificateImage") MultipartFile incomeCertificateImage,
                                   @RequestParam("residenceCertificateImage") MultipartFile residenceCertificateImage) {
        
        Documents document = new Documents();
        Student student = studentService.getStudentByStudentId(studentId);
        document.setStudent(student);
        document.setAadharNo(aadharNo);
        document.setCastCertificateNo(castCertificateNo);
        document.setResidenceCertificateNo(residenceCertificateNo);
        document.setIncomeCertificateNo(incomeCertificateNo);
        document.setTenthMarksheetNo(tenthMarksheetNo);
        document.setTwelfthMarksheetNo(twelfthMarksheetNo);
        document.setTransferCertificateNo(transferCertificateNo);
        
        try {
            // Process and save profile image
            if (!profileImage.isEmpty()) {
                document.setProfileImage(compressImage(profileImage));
            }

            // Process and save aadhar image
            if (!aadharImage.isEmpty()) {
                document.setAadharImage(compressImage(aadharImage));
            }

            // Process and save 10th marksheet image
            if (!marksheet10thImage.isEmpty()) {
                document.setTenthMarksheetImage(compressImage(marksheet10thImage));
            }

            // Process and save 12th marksheet image
            if (!marksheet12thImage.isEmpty()) {
                document.setTwelfthMarksheetImage(compressImage(marksheet12thImage));
            }

            // Process and save transfer certificate image
            if (!transferCertificateImage.isEmpty()) {
                document.setTransferCertificateImage(compressImage(transferCertificateImage));
            }

            // Process and save caste certificate image
            if (!casteCertificateImage.isEmpty()) {
                document.setCastCertificateImage(compressImage(casteCertificateImage));
            }

            // Process and save income certificate image
            if (!incomeCertificateImage.isEmpty()) {
                document.setIncomeCertificateImage(compressImage(incomeCertificateImage));
            }

            // Process and save residence certificate image
            if (!residenceCertificateImage.isEmpty()) {
                document.setResidenceCertificateImage(compressImage(residenceCertificateImage));
            }

            documentsService.createDocument(document);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ModelAndView mav = new ModelAndView("redirect:/addstudent?message=Student%20documents%20saved%20successfully");
        return mav;
    }

    @GetMapping("/student/{studentId}")
    public ModelAndView getDocumentsByStudent(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/student-documents");
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        mav.addObject("documents", documents);
        mav.addObject("studentId", studentId);
        return mav;
    }

    @GetMapping("/image/profile/{studentId}")
    public ResponseEntity<byte[]> getProfileImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getProfileImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getProfileImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/aadhar/{studentId}")
    public ResponseEntity<byte[]> getAadharImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getAadharImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getAadharImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/caste/{studentId}")
    public ResponseEntity<byte[]> getCasteCertificateImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getCastCertificateImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getCastCertificateImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/income/{studentId}")
    public ResponseEntity<byte[]> getIncomeCertificateImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getIncomeCertificateImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getIncomeCertificateImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/residence/{studentId}")
    public ResponseEntity<byte[]> getResidenceCertificateImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getResidenceCertificateImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getResidenceCertificateImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/tenth/{studentId}")
    public ResponseEntity<byte[]> getTenthMarksheetImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getTenthMarksheetImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getTenthMarksheetImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/twelfth/{studentId}")
    public ResponseEntity<byte[]> getTwelfthMarksheetImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getTwelfthMarksheetImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getTwelfthMarksheetImage());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/image/transfer/{studentId}")
    public ResponseEntity<byte[]> getTransferCertificateImage(@PathVariable Long studentId) {
        Documents documents = documentsService.getDocumentsByStudentId(studentId);
        if (documents != null && documents.getTransferCertificateImage() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_JPEG)
                    .body(documents.getTransferCertificateImage());
        }
        return ResponseEntity.notFound().build();
    }

    private byte[] compressImage(MultipartFile multipartFile) throws IOException {
        BufferedImage image = ImageIO.read(new ByteArrayInputStream(multipartFile.getBytes()));
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        
        ImageWriter imageWriter = ImageIO.getImageWritersByFormatName("jpg").next();
        ImageWriteParam writeParam = imageWriter.getDefaultWriteParam();
        writeParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        writeParam.setCompressionQuality(0.5f);
        
        imageWriter.setOutput(ImageIO.createImageOutputStream(outputStream));
        imageWriter.write(null, new IIOImage(image, null, null), writeParam);
        
        return outputStream.toByteArray();
    }

}
