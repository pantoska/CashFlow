package com.pk.zpi.cashflow.controllers;

import com.pk.zpi.cashflow.model.CategoryService;
import com.pk.zpi.cashflow.model.request.NewCategoryRequest;
import com.pk.zpi.cashflow.model.request.NewSubcategoryRequest;
import com.pk.zpi.cashflow.services.dataModels.Category;
import com.pk.zpi.cashflow.services.dataModels.Color;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/category")
public class CategoryController {
    private CategoryService categoryService = new CategoryService();

    @GetMapping(value = "/all/{idUser}", produces = "application/json")
    public ResponseEntity<List<Category>> getAllCategoryAndSubcategory(@PathVariable int idUser) {
        return new ResponseEntity(categoryService.getAllCategory(idUser), HttpStatus.OK);
    }

    @PutMapping(value = "/create", consumes = "application/json")
    @ResponseBody
    public ResponseEntity<Void> createNewCategory(@RequestBody NewCategoryRequest ncr) {
        if (!ncr.isAllData()) {
            return new ResponseEntity("Missing some arguments!", HttpStatus.NOT_ACCEPTABLE);
        }

        if (categoryService.createCategory(ncr.getId_user(), ncr.getCategoryName(), ncr.getId_color(), ncr.isIs_income())) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity("Error when processing query.", HttpStatus.EXPECTATION_FAILED);
        }
    }

    @PutMapping(value = "/subcategory/create", consumes = "application/json")
    @ResponseBody
    public ResponseEntity<Void> createNewCategory(@RequestBody NewSubcategoryRequest nsr) {
        if (!nsr.isAllData()) {
            return new ResponseEntity("Missing some arguments!", HttpStatus.NOT_ACCEPTABLE);
        }

        if (categoryService.createNewSubcategory(nsr.name, nsr.id_category) != -1) {
            return new ResponseEntity(HttpStatus.OK);
        } else {
            return new ResponseEntity("Error when processing query.", HttpStatus.EXPECTATION_FAILED);
        }
    }

    @GetMapping(value = "/colors", produces = "application/json")
    public ResponseEntity<List<Color>> getAllCategoryAndSubcategory() {
        List<Color> cList = categoryService.getColors();
        if (cList == null)
            return new ResponseEntity("Error when processing query.", HttpStatus.EXPECTATION_FAILED);

        return new ResponseEntity(cList, HttpStatus.OK);
    }
}
