/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pc
 */
public class Response {
    private HeaderResponse header;
    private List<DetailsResponse> detail;
    private List<Label> label;

    public Response(HeaderResponse header, List<DetailsResponse> detail, List<Label> label) {
        this.header = header;
        this.detail = detail;
        this.label = label;
    }

    public Response() {
        this.header = new HeaderResponse();
        this.detail = new ArrayList<DetailsResponse>();
        this.label = new ArrayList<Label>(); 
    }
    
    
    
    public HeaderResponse getHeader() {
        return header;
    }

    public void setHeader(HeaderResponse header) {
        this.header = header;
    }

    public List<DetailsResponse> getDetail() {
        return detail;
    }

    public void setDetail(List<DetailsResponse> detail) {
        this.detail = detail;
    }

    public List<Label> getLabel() {
        return label;
    }

    public void setLabel(List<Label> label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "Response{" + "header=" + header + ", detail=" + detail + ", label=" + label + '}';
    }

    
}

