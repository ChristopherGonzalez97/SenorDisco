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
public class PaqueteChileExpress {
    private double weight;
    private int height;
    private int width;
    private int length;

    public PaqueteChileExpress() {
        this.weight = 0;
        this.height = 0;
        this.width = 0;
        this.length = 0;
    }

    public PaqueteChileExpress(double weight, int height, int width, int length) {
        this.weight = weight;
        this.height = height;
        this.width = width;
        this.length = length;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
    
    
}
