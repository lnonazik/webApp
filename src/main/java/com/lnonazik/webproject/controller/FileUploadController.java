package com.lnonazik.webproject.controller;

import com.lnonazik.webproject.dto.TrackDTO;
import com.lnonazik.webproject.model.Track;
import com.lnonazik.webproject.service.StorageService;
import com.lnonazik.webproject.service.TrackService;
import com.lnonazik.webproject.service.UserService;
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

import java.security.Principal;

@Controller
public class FileUploadController {

    @Autowired
    private StorageService storageService;
    @Autowired
    private UserService userService;
    @Autowired
    private TrackService trackService;

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
                                   RedirectAttributes redirectAttributes, Principal principal){
        Track track = new Track();
        // We have to retrieve/extract metadata information from audio file
        track.setName(file.getOriginalFilename());
        track.setUser(userService.findOne(principal.getName()).get());
        track.setPath("http://localhost:90/files/"+file.getOriginalFilename());
        storageService.store(file);
        redirectAttributes.addFlashAttribute("message",
                "Your file "+file.getOriginalFilename()+" successfully uploaded!");
        trackService.saveTrack(track);
        return "redirect:/upload";
    }

    @PostMapping("/delete")
    public String deleteTrack(@RequestParam("track_id") long track_id){
        storageService.deleteTrackById(track_id);
        return "redirect:/upload";
    }

    @GetMapping("/upload")
    public String upload(Model model, Principal principal) {
        model.addAttribute("track", new TrackDTO());
        model.addAttribute("trackList", trackService.findAllTracksByUser(userService.findOne(principal.getName()).get()));
        return "upload";
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException e){
        return ResponseEntity.notFound().build();
    }
}
