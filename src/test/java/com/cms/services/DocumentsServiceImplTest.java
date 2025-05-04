package com.cms.services;

import com.cms.entity.Documents;
import com.cms.repository.DocumentsRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class DocumentsServiceImplTest {

    @InjectMocks
    private DocumentsServiceImpl documentsService;

    @Mock
    private DocumentsRepository documentsRepository;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testCreateDocument() {
        Documents document = new Documents();
        when(documentsRepository.save(any(Documents.class))).thenReturn(document);
        Documents createdDocument = documentsService.createDocument(document);
        assertNotNull(createdDocument);
        verify(documentsRepository, times(1)).save(document);
    }

    @Test
    void testGetDocumentById() {
        Documents document = new Documents();
        when(documentsRepository.findById(1L)).thenReturn(Optional.of(document));
        Documents foundDocument = documentsService.getDocumentById(1L);
        assertNotNull(foundDocument);
        verify(documentsRepository, times(1)).findById(1L);
    }

    @Test
    void testUpdateDocument() {
        Documents document = new Documents();
        when(documentsRepository.existsById(1L)).thenReturn(true);
        when(documentsRepository.save(any(Documents.class))).thenReturn(document);
        Documents updatedDocument = documentsService.updateDocument(1L, document);
        assertNotNull(updatedDocument);
        verify(documentsRepository, times(1)).save(document);
    }

    @Test
    void testDeleteDocument() {
        doNothing().when(documentsRepository).deleteById(1L);
        documentsService.deleteDocument(1L);
        verify(documentsRepository, times(1)).deleteById(1L);
    }

}
