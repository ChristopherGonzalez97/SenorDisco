/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import Clases.Venta;
import java.io.IOException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author pc
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        Venta ve=(Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa",2).getSingleResult();
        //SendMail.Prueba(ve.getBoletaLegal());
        SendMail.VentaEstado("christophergonzalez1234@gmail.com",ve);
    }
    
    
}
