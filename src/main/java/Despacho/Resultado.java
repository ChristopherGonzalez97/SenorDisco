/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

/**
 *
 * @author chris
 */
public class Resultado {
    private int serviceTypeCode;
    private String serviceDescription;
    private String didUseVolumetricWeight;
    private int finalWeight;
    private int serviceValue;
    private String conditions;
    private int deliveryType;
    private String additionalServices;
    private int coberturaExtendida;

    public Resultado() {
        this.serviceTypeCode = 0;
        this.serviceDescription = "";
        this.didUseVolumetricWeight = "";
        this.finalWeight = 0;
        this.serviceValue = 0;
        this.conditions = "";
        this.deliveryType = 0;
        this.coberturaExtendida = 0;
        this.additionalServices = "";
    }

    public Resultado(int serviceTypeCode, String serviceDescription, String didUseVolumetricWeight, int finalWeight, int serviceValue, String conditions, int deliveryType, String additionalServices , int coberturaExtendida) {
        this.serviceTypeCode = serviceTypeCode;
        this.serviceDescription = serviceDescription;
        this.didUseVolumetricWeight = didUseVolumetricWeight;
        this.finalWeight = finalWeight;
        this.serviceValue = serviceValue;
        this.conditions = conditions;
        this.deliveryType = deliveryType;
        this.additionalServices = additionalServices;
        this.coberturaExtendida = coberturaExtendida;
    }

    public int getCoberturaExtendida() {
        return coberturaExtendida;
    }

    public void setCoberturaExtendida(int coberturaExtendida) {
        this.coberturaExtendida = coberturaExtendida;
    }
    
    public int getServiceTypeCode() {
        return serviceTypeCode;
    }

    public void setServiceTypeCode(int serviceTypeCode) {
        this.serviceTypeCode = serviceTypeCode;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getDidUseVolumetricWeight() {
        return didUseVolumetricWeight;
    }

    public void setDidUseVolumetricWeight(String didUseVolumetricWeight) {
        this.didUseVolumetricWeight = didUseVolumetricWeight;
    }

    public int getFinalWeight() {
        return finalWeight;
    }

    public void setFinalWeight(int finalWeight) {
        this.finalWeight = finalWeight;
    }

    public int getServiceValue() {
        return serviceValue;
    }

    public void setServiceValue(int serviceValue) {
        this.serviceValue = serviceValue;
    }

    public String getConditions() {
        return conditions;
    }

    public void setConditions(String conditions) {
        this.conditions = conditions;
    }

    public int getDeliveryType() {
        return deliveryType;
    }

    public void setDeliveryType(int deliveryType) {
        this.deliveryType = deliveryType;
    }

    public String getAdditionalServices() {
        return additionalServices;
    }

    public void setAdditionalServices(String additionalServices) {
        this.additionalServices = additionalServices;
    }

    
}
