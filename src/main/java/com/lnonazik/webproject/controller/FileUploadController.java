package com.lnonazik.webproject.controller;

import com.lnonazik.webproject.service.StorageService;
import com.lnonazik.webproject.serviceImplement.storage.StorageFileNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FileUploadController {

    @Autowired
    private StorageService storageService;

    @GetMapping("/files")
    public String listUploadedFiles(Model model){
        model.addAttribute("files", storageService.loadAll()
                .map(path -> MvcUriComponentsBuilder.fromMethodName(FileUploadController.class,
                        "serveFile",path.getFileName().toString()).build().toString()));
        return "files";
    }

    @GetMapping("/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename){
        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
                "attachment: filename=\""+file.getFilename()+"\"").body(file);

    }

    @PostMapping("/upload")
    public String handleFileUpload(@RequestParam("file") MultipartFile file,
                                   RedirectAttributes redirectAttributes){
        storageService.store(file);
        redirectAttributes.addFlashAttribute("message",
                "Your file "+file.getOriginalFilename()+" successfully uploaded!");
        return "redirect:/upload";
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException e){
        return ResponseEntity.notFound().build();
    }
}
