package com.pk.zpi.cashflow.controllers;

import com.pk.zpi.cashflow.services.dataModels.Expense;
import com.pk.zpi.cashflow.services.dataModels.MoneyAccount;
import com.pk.zpi.cashflow.model.request.GetExpensesRequest;
import com.pk.zpi.cashflow.model.request.NewIncomeOutcomeRequest;
import com.pk.zpi.cashflow.model.request.NewTransferRequest;
import com.pk.zpi.cashflow.model.ExpenseService;
import com.pk.zpi.cashflow.model.MoneyAccountService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/expense")
public class ExpensesController {
    private ExpenseService expenseService = new ExpenseService();

    @PostMapping(value = "/get", consumes = "application/json", produces = "application/json")
    public ResponseEntity<List<Expense>> createNewCategory(@RequestBody GetExpensesRequest ger) {
        List<Expense> result = expenseService.getExpenses(ger.getStartDateTime(), ger.getEndDateTime(), ger.id_user);

        if (result == null) {
            return new ResponseEntity("Error when processing query.", HttpStatus.EXPECTATION_FAILED);
        }

        return new ResponseEntity(result, HttpStatus.OK);
    }

    @GetMapping(value = "/sum/{idUser}", produces = "application/json")
    public ResponseEntity<Map<String, Long>> getSum(@PathVariable int idUser) {
        long result = expenseService.getMoneySum(idUser);
        if (-1 == result) {
            return new ResponseEntity("Error when processing query.", HttpStatus.EXPECTATION_FAILED);
        }

        Map<String, Long> map = new HashMap<>();
        map.put("amount", result);
        return new ResponseEntity(map, HttpStatus.OK);
    }

    @PutMapping(value = "/newIncomeOutcome", consumes = "application/json")
    public ResponseEntity<Void> createIncomeOutcome(@RequestBody NewIncomeOutcomeRequest nior) {
        if (!nior.isAllData()) {
            return new ResponseEntity("Missing some arguments!", HttpStatus.NOT_ACCEPTABLE);
        }

        if (expenseService.newIncomeOutcome(nior.amount, nior.date, nior.note, nior.id_subcategory, nior.id_m_acc, nior.type)) {
            return new ResponseEntity(HttpStatus.OK);
        }
        return new ResponseEntity("Error when processing insert.", HttpStatus.EXPECTATION_FAILED);
    }

    @PutMapping(value = "/newTransfer", consumes = "application/json")
    public ResponseEntity<Void> transfer(@RequestBody NewTransferRequest ntr) {
        if (!ntr.isAllData()) {
            return new ResponseEntity("Missing some arguments!", HttpStatus.NOT_ACCEPTABLE);
        }

        MoneyAccountService mAccount = new MoneyAccountService();
        List<MoneyAccount> listMoneyAccount = mAccount.getUserMoneyAccounts(ntr.id_user);

        MoneyAccount sourceMoneyAccount = null, destinationMoneyAccount = null;
        for (MoneyAccount item : listMoneyAccount) {
            if (item.getId_m_acc() == ntr.sourceAccountId) {
                sourceMoneyAccount = item;
            }

            if (item.getId_m_acc() == ntr.destinationAccountId) {
                destinationMoneyAccount = item;
            }
        }

        if (sourceMoneyAccount == null || destinationMoneyAccount == null) {
            return new ResponseEntity("Not found money account!", HttpStatus.NOT_ACCEPTABLE);
        }

        String note = "";
        note = note + sourceMoneyAccount.getAccountName() + " &rarr; ";
        note = note + destinationMoneyAccount.getAccountName();
        if (ntr.note.length() > 0) {
            note = note + " (" + ntr.note + ")";
        }

        if (expenseService.newTransfer(ntr.amount, ntr.sourceAccountId, ntr.destinationAccountId, ntr.date, note)) {
            return new ResponseEntity(HttpStatus.OK);
        }
        return new ResponseEntity("Error when processing insert.", HttpStatus.EXPECTATION_FAILED);
    }
}
