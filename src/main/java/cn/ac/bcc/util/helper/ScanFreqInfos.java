package cn.ac.bcc.util.helper;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2016-06-06.
 */
public class ScanFreqInfos implements Serializable{

    private boolean scanEnded;
    private int progress;
    private int frqsNum;
    private List<Freq> freqList;

    public boolean isScanEnded() {
        return scanEnded;
    }

    public void setScanEnded(boolean scanEnded) {
        this.scanEnded = scanEnded;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public int getFrqsNum() {
        return frqsNum;
    }

    public void setFrqsNum(int frqsNum) {
        this.frqsNum = frqsNum;
    }

    public List<Freq> getFreqList() {
        return freqList;
    }

    public void setFreqList(List<Freq> freqList) {
        this.freqList = freqList;
    }
}
