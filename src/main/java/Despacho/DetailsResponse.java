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
public class DetailsResponse {
    private double transportOrderNumber;
    private String reference;
    private String productoDescription;
    private String ServiceDescription;
    private String genericString1;
    private String genericString2;
    private String deliveryTypeCode;
    private String destinationCoverageAreaName;
    private String additionalProductDescription;
    private String barcode;
    private String clasificationData;
    private String printedDate;
    private String labelVersion;
    private String distributionDescription;
    private String companyName;
    private String recipient;
    private String address;
    private String groupReference;
    private String createdDate;

    public DetailsResponse(double transportOrderNumber, String reference, String productoDescription, String ServiceDescription, String genericString1, String genericString2, String deliveryTypeCode, String destinationCoverageAreaName, String additionalProductDescription, String barcode, String clasificationData, String printedDate, String labelVersion, String distributionDescription, String companyName, String recipient, String address, String groupReference, String createdDate) {
        this.transportOrderNumber = transportOrderNumber;
        this.reference = reference;
        this.productoDescription = productoDescription;
        this.ServiceDescription = ServiceDescription;
        this.genericString1 = genericString1;
        this.genericString2 = genericString2;
        this.deliveryTypeCode = deliveryTypeCode;
        this.destinationCoverageAreaName = destinationCoverageAreaName;
        this.additionalProductDescription = additionalProductDescription;
        this.barcode = barcode;
        this.clasificationData = clasificationData;
        this.printedDate = printedDate;
        this.labelVersion = labelVersion;
        this.distributionDescription = distributionDescription;
        this.companyName = companyName;
        this.recipient = recipient;
        this.address = address;
        this.groupReference = groupReference;
        this.createdDate = createdDate;
    }

    public DetailsResponse() {
        this.transportOrderNumber = 0;
        this.reference = "";
        this.productoDescription = "";
        this.ServiceDescription = "";
        this.genericString1 = "";
        this.genericString2 = "";
        this.deliveryTypeCode = "";
        this.destinationCoverageAreaName = "";
        this.additionalProductDescription = "";
        this.barcode = "";
        this.clasificationData = "";
        this.printedDate = "";
        this.labelVersion = "";
        this.distributionDescription = "";
        this.companyName = "";
        this.recipient = "";
        this.address = "";
        this.groupReference = "";
        this.createdDate = "";
    }

    public double getTransportOrderNumber() {
        return transportOrderNumber;
    }

    public void setTransportOrderNumber(double transportOrderNumber) {
        this.transportOrderNumber = transportOrderNumber;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getProductoDescription() {
        return productoDescription;
    }

    public void setProductoDescription(String productoDescription) {
        this.productoDescription = productoDescription;
    }

    public String getServiceDescription() {
        return ServiceDescription;
    }

    public void setServiceDescription(String ServiceDescription) {
        this.ServiceDescription = ServiceDescription;
    }

    public String getGenericString1() {
        return genericString1;
    }

    public void setGenericString1(String genericString1) {
        this.genericString1 = genericString1;
    }

    public String getGenericString2() {
        return genericString2;
    }

    public void setGenericString2(String genericString2) {
        this.genericString2 = genericString2;
    }

    public String getDeliveryTypeCode() {
        return deliveryTypeCode;
    }

    public void setDeliveryTypeCode(String deliveryTypeCode) {
        this.deliveryTypeCode = deliveryTypeCode;
    }

    public String getDestinationCoverageAreaName() {
        return destinationCoverageAreaName;
    }

    public void setDestinationCoverageAreaName(String destinationCoverageAreaName) {
        this.destinationCoverageAreaName = destinationCoverageAreaName;
    }

    public String getAdditionalProductDescription() {
        return additionalProductDescription;
    }

    public void setAdditionalProductDescription(String additionalProductDescription) {
        this.additionalProductDescription = additionalProductDescription;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getClasificationData() {
        return clasificationData;
    }

    public void setClasificationData(String clasificationData) {
        this.clasificationData = clasificationData;
    }

    public String getPrintedDate() {
        return printedDate;
    }

    public void setPrintedDate(String printedDate) {
        this.printedDate = printedDate;
    }

    public String getLabelVersion() {
        return labelVersion;
    }

    public void setLabelVersion(String labelVersion) {
        this.labelVersion = labelVersion;
    }

    public String getDistributionDescription() {
        return distributionDescription;
    }

    public void setDistributionDescription(String distributionDescription) {
        this.distributionDescription = distributionDescription;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGroupReference() {
        return groupReference;
    }

    public void setGroupReference(String groupReference) {
        this.groupReference = groupReference;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "DetailsResponse{" + "transportOrderNumber=" + transportOrderNumber + ", reference=" + reference + ", productoDescription=" + productoDescription + ", ServiceDescription=" + ServiceDescription + ", genericString1=" + genericString1 + ", genericString2=" + genericString2 + ", deliveryTypeCode=" + deliveryTypeCode + ", destinationCoverageAreaName=" + destinationCoverageAreaName + ", additionalProductDescription=" + additionalProductDescription + ", barcode=" + barcode + ", clasificationData=" + clasificationData + ", printedDate=" + printedDate + ", labelVersion=" + labelVersion + ", distributionDescription=" + distributionDescription + ", companyName=" + companyName + ", recipient=" + recipient + ", address=" + address + ", groupReference=" + groupReference + ", createdDate=" + createdDate + '}';
    }
    
    
    
}
