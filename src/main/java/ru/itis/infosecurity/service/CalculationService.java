package ru.itis.infosecurity.service;

import org.springframework.stereotype.Service;
import ru.itis.infosecurity.forms.BaseForm;
import ru.itis.infosecurity.forms.ContextForm;
import ru.itis.infosecurity.forms.TimeForm;

import java.util.Map;
import java.util.TreeMap;


@Service
public class CalculationService {

    private static Map<String, Double> params = new TreeMap<>();
    private static double baseScore;
    private static double fImpact;
    private static double exploitability;
    private static double temporalScore;
    private static double environmentalScore;
    private static double impact;

    public double calculateBaseMetrix(BaseForm form) {
        return calculateFunction(getHashMapBase(form));
    }

    private double calculateFunction(Map<String, Double> params) {
        double impactBase = 1 - ((1 - params.get("C")) * (1 - params.get("I")) * (1 - params.get("A")));

        exploitability = 8.22 * params.get("AV") * params.get("AC") * params.get("PR")*params.get("UI");
        if(params.get("S") == 0) {
            impact = 6.42 * impactBase;
        } else {
            impact = 7.42 * (impactBase - 0.029) - 3.25 * (Math.pow(impactBase - 0.02, 15));
        }
        if(impact <= 0) {
            baseScore = 0;
        }else if(params.get("S") == 0) {
            baseScore = Math.min((impact + exploitability), 10);
        } else {
            baseScore = Math.min((1.08 * (impact + exploitability)), 10);
        }
        return baseScore;
    }

    public double calculateTimeMetrix(TimeForm timeForm) {
        addParamsForTime(timeForm);
        temporalScore = baseScore * params.get("E") * params.get("RL") * params.get("RC");
        return temporalScore;
    }

    public double calculateContextMetrix(ContextForm contextForm) {
        addParamsForContext(contextForm);
        double adjustedImpact = Math.min(10, 10.41 * (1 - (1 - params.get("C") * params.get("CR")) *
                (1 - params.get("I") * params.get("IR")) * (1 - params.get("A") * params.get("AR"))));
        double adjustedBaseScore = (((0.6 * adjustedImpact) + (0.4 * exploitability) - 1.5) * fImpact);
        double adjustedTemporal = adjustedBaseScore * params.get("E") * params.get("RL") * params.get("RC");
        environmentalScore = ((adjustedTemporal + (10 - adjustedTemporal) * params.get("CDP"))* params.get("TD"));
        return environmentalScore;
    }

    private Map<String, Double> getHashMapBase(BaseForm form) {
        getValues(params, form);
        return params;
    }

    private void getValues(Map<String, Double> params, BaseForm form) {
        String AV = form.getAV();
        switch (AV) {
            case "N":
                params.put("AV", 0.85);
                break;
            case "A":
                params.put("AV", 0.62);
                break;
            case "L":
                params.put("AV", 0.55);
                break;
            case "P":
                params.put("AV", 0.2);
                break;
        }
        String AC = form.getAC();
        switch (AC) {
            case "L":
                params.put("AC", 0.77);
                break;
            case "H":
                params.put("AC", 0.44);
                break;
        }
        String S = form.getS();
        switch (S) {
            case "U":
                params.put("S", 0.0);
                break;
            case "C":
                params.put("S", 1.0);
                break;
        }
        String PR = form.getPR();
        switch (PR) {
            case "N":
                params.put("PR", 0.85);
                break;
            case "L":
                if(params.get("S") == 1) {
                    params.put("PR", 0.68);
                } else {
                    params.put("PR", 0.62);
                }
                break;
            case "H":
                if(params.get("S") == 1) {
                    params.put("PR", 0.5);
                } else {
                    params.put("PR", 0.27);
                }
                break;
        }

        String UI = form.getUI();
        switch (UI) {
            case "N":
                params.put("UI", 0.85);
                break;
            case "R":
                params.put("UI", 0.62);
                break;
        }
        String c = form.getC();
        switch (c) {
            case "N":
                params.put("C", 0.0);
                break;
            case "L":
                params.put("C", 0.22);
                break;
            case "H":
                params.put("C", 0.56);
                break;
        }
        String i = form.getI();
        switch (i) {
            case "N":
                params.put("I", 0.0);
                break;
            case "L":
                params.put("I", 0.22);
                break;
            case "H":
                params.put("I", 0.56);
                break;
        }
        String a = form.getA();
        switch (a) {
            case "N":
                params.put("A", 0.0);
                break;
            case "L":
                params.put("A", 0.22);
                break;
            case "H":
                params.put("A", 0.56);
                break;
        }

    }

    private void addParamsForTime(TimeForm timeForm) {
        String E = timeForm.getE();
        switch (E) {
            case "X":
                params.put("E", 1.0);
                break;
            case "U":
                params.put("E", 0.91);
                break;
            case "P":
                params.put("E", 0.94);
                break;
            case "F":
                params.put("E", 0.97);
                break;
            case "H":
                params.put("E", 1.0);
                break;
        }
        String RL = timeForm.getRL();
        switch (RL) {
            case "X":
                params.put("RL", 1.0);
                break;
            case "O":
                params.put("RL", 0.95);
                break;
            case "T":
                params.put("RL", 0.96);
                break;
            case "W":
                params.put("RL", 0.97);
                break;
            case "U":
                params.put("RL", 1.0);
                break;
        }
        String RC = timeForm.getRC();
        switch (RC) {
            case "X":
                params.put("RC", 1.0);
                break;
            case "U":
                params.put("RC", 0.92);
                break;
            case "R":
                params.put("RC", 0.96);
                break;
            case "C":
                params.put("RC", 1.0);
                break;
        }
    }

    private void addParamsForContext(ContextForm contextForm) {
        String CDP = contextForm.getCDP();
        switch (CDP) {
            case "ND":
                params.put("CDP", 0.0);
                break;
            case "N":
                params.put("CDP", 0.0);
                break;
            case "L":
                params.put("CDP", 0.1);
                break;
            case "LM":
                params.put("CDP", 0.3);
                break;
            case "MH":
                params.put("CDP", 0.4);
                break;
            case "H":
                params.put("CDP", 0.5);
                break;
        }
        String TD = contextForm.getTD();
        switch (TD) {
            case "ND":
                params.put("TD", 1.0);
                break;
            case "N":
                params.put("TD", 0.0);
                break;
            case "L":
                params.put("TD", 0.25);
                break;
            case "M":
                params.put("TD", 0.75);
                break;
            case "H":
                params.put("TD", 1.0);
                break;
        }
        String CR = contextForm.getCR();
        switch (CR) {
            case "ND":
                params.put("CR", 1.0);
                break;
            case "L":
                params.put("CR", 0.5);
                break;
            case "M":
                params.put("CR", 1.0);
                break;
            case "H":
                params.put("CR", 1.51);
                break;
        }
        String IR = contextForm.getIR();
        switch (IR) {
            case "ND":
                params.put("IR", 1.0);
                break;
            case "L":
                params.put("IR", 0.5);
                break;
            case "M":
                params.put("IR", 1.0);
                break;
            case "H":
                params.put("IR", 1.51);
                break;
        }
        String AR = contextForm.getAR();
        switch (AR) {
            case "ND":
                params.put("AR", 1.0);
                break;
            case "L":
                params.put("AR", 0.5);
                break;
            case "M":
                params.put("AR", 1.0);
                break;
            case "H":
                params.put("AR", 1.51);
                break;
        }
    }
}
