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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
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
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("profileImage", "aadharImage", "castCertificateImage", "residenceCertificateImage", "incomeCertificateImage", "tenthMarksheetImage", "twelfthMarksheetImage", "transferCertificateImage");
    }

    @GetMapping("/add/{studentId}")
    public ModelAndView showAddDocumentForm(@PathVariable Long studentId) {
        ModelAndView mav = new ModelAndView("Admission/add-documents");
        mav.addObject("students", studentService.getStudentByStudentId(studentId));
        mav.addObject("document", new Documents());
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
    public ModelAndView saveDocument(@ModelAttribute Documents document,
            @RequestParam("studentId") Long studentId,
            @RequestParam("profileImage") MultipartFile profileImage,
            @RequestParam("aadharImage") MultipartFile aadharImage,
            @RequestParam("tenthMarksheetImage") MultipartFile tenthMarksheetImage,
            @RequestParam("twelfthMarksheetImage") MultipartFile twelfthMarksheetImage,
            @RequestParam("transferCertificateImage") MultipartFile transferCertificateImage,
            @RequestParam("casteCertificateImage") MultipartFile casteCertificateImage,
            @RequestParam("incomeCertificateImage") MultipartFile incomeCertificateImage,
            @RequestParam("residenceCertificateImage") MultipartFile residenceCertificateImage) throws IOException {

        Student student = studentService.getStudentByStudentId(studentId);
        document.setStudent(student);

        document.setProfileImage(profileImage.getBytes());
        document.setAadharImage(aadharImage.getBytes());
        document.setTenthMarksheetImage(tenthMarksheetImage.getBytes());
        document.setTwelfthMarksheetImage(twelfthMarksheetImage.getBytes());
        document.setTransferCertificateImage(transferCertificateImage.getBytes());
        document.setCastCertificateImage(casteCertificateImage.getBytes());
        document.setIncomeCertificateImage(incomeCertificateImage.getBytes());
        document.setResidenceCertificateImage(residenceCertificateImage.getBytes());

        documentsService.createDocument(document);
        return new ModelAndView("redirect:/admission");
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
