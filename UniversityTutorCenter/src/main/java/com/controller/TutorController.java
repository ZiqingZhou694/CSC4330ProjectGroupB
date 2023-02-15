package com.controller;

import com.pojo.Tutor;
import com.service.impl.TutorServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/tutor")
public class TutorController {
//    @Autowired
//    private TutorServiceImpl tutorServiceImpl;
//
//    @GetMapping("/{tutorId}")
//    public Tutor getTutor(@PathVariable String tutorId) {
//        return tutorServiceImpl.getTutorById(tutorId);
//    }
//
//    @GetMapping
//    public List<Tutor> getTutors() {
//        return tutorServiceImpl.getTutors();
//    }
//
//    @GetMapping("/search")
//    public List<Tutor> searchTutors(@RequestParam String keyword) {
//        return tutorServiceImpl.searchTutors(keyword);
//    }
//
//    @PostMapping
//    public void createTutor(@RequestBody Tutor tutor) {
//        tutorServiceImpl.createTutor(tutor.getTutorId(), tutor.getFirstName(), tutor.getLastName(),
//                tutor.getEmail(), tutor.getPassword(), tutor.getSubject());
//    }
//
//    @PutMapping("/{tutorId}")
//    public void updateTutor(@PathVariable String tutorId, @RequestBody Tutor tutor) {
//        tutorServiceImpl.updateTutor(tutorId, tutor.getFirstName(), tutor.getLastName(),
//                tutor.getEmail(), tutor.getPassword(), tutor.getSubject());
//    }
//
//    @DeleteMapping("/{tutorId}")
//    public void deleteTutor(@PathVariable String tutorId) {
//        tutorServiceImpl.deleteTutor(tutorId);
//    }
}
