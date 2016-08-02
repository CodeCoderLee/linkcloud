package cn.ac.bcc.util.helper;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016-06-06.
 */
public class Freq implements Serializable{
    private String frq;
    private int strength;
    private int snr;
    private ArrayList<ScanFreqProgram> programList;

    public String getFrq() {
        return frq;
    }

    public void setFrq(String frq) {
        this.frq = frq;
    }

    public int getStrength() {
        return strength;
    }

    public void setStrength(int strength) {
        this.strength = strength;
    }

    public int getSnr() {
        return snr;
    }

    public void setSnr(int snr) {
        this.snr = snr;
    }

    public ArrayList<ScanFreqProgram> getProgramList() {
        return programList;
    }

    public void setProgramList(ArrayList<ScanFreqProgram> programList) {
        this.programList = programList;
    }
}
