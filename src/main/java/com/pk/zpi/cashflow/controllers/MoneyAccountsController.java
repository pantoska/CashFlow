package com.pk.zpi.cashflow.controllers;

import com.pk.zpi.cashflow.services.dataModels.MoneyAccount;
import com.pk.zpi.cashflow.model.request.EditMoneyAccountRequest;
import com.pk.zpi.cashflow.model.request.NewMoneyAccountRequest;
import com.pk.zpi.cashflow.model.MoneyAccountService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/moneyAccount")
public class MoneyAccountsController {
    private MoneyAccountService mas = new MoneyAccountService();

    @GetMapping(value = "/getAll/{idUser}", produces = "application/json")
    public ResponseEntity<String> getUserId(@PathVariable int idUser) {
        List<MoneyAccount> moneyAccounts = mas.getUserMoneyAccounts(idUser);
        if (moneyAccounts == null) {
            return new ResponseEntity("Error when quering.", HttpStatus.EXPECTATION_FAILED);
        }
        return new ResponseEntity(moneyAccounts, HttpStatus.OK);
    }

    @PutMapping(value = "/create")
    public ResponseEntity<Void> create(@RequestBody NewMoneyAccountRequest nmar) {
        if (!nmar.isAllData()) {
            return new ResponseEntity("Miss some parameters.", HttpStatus.NOT_ACCEPTABLE);
        }

        if (!mas.createMoneyAccount(nmar.id_user, nmar.accountName)) {
            return new ResponseEntity("Error when quering.", HttpStatus.EXPECTATION_FAILED);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @DeleteMapping(value = "/delete/{accountId}/{userId}")
    public ResponseEntity<Void> delete(@PathVariable int accountId, @PathVariable int userId) {

        if (!mas.deleteMoneyAccount(accountId, userId)) {
            return new ResponseEntity("Error when deleting.", HttpStatus.EXPECTATION_FAILED);
        }
        return new ResponseEntity(HttpStatus.OK);
    }

    @PostMapping(value = "/edit")
    public ResponseEntity<Void> edit(@RequestBody EditMoneyAccountRequest emar) {
        if (!emar.isAllData()) {
            return new ResponseEntity("Miss some parameters.", HttpStatus.NOT_ACCEPTABLE);
        }

        if (!mas.editMoneyAccount(emar.id_user, emar.accountName, emar.moneyAccountId)) {
            return new ResponseEntity("Error when updating.", HttpStatus.EXPECTATION_FAILED);
        }
        return new ResponseEntity(HttpStatus.OK);
    }
}
