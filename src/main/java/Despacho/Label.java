/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

/**
 *
 * @author pc
 */
public class Label {
    private String labelData;
    private String labelType;

    public Label(String labelData, String labelType) {
        this.labelData = labelData;
        this.labelType = labelType;
    }

    public Label() {
        this.labelData = "";
        this.labelType = "";
    }

    public String getLabelData() {
        return labelData;
    }

    public void setLabelData(String labelData) {
        this.labelData = labelData;
    }

    public String getLabelType() {
        return labelType;
    }

    public void setLabelType(String labelType) {
        this.labelType = labelType;
    }

    @Override
    public String toString() {
        return "Label{" + "labelData=" + labelData + ", labelType=" + labelType + '}';
    }
    
    
}
