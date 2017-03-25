/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package haskgrap;

import java.io.File;

/**
 *
 * @author User
 */
public class HaskGrap {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String path="C:\\Users\\User\\Documents\\NetBeansProjects\\HaskGrap\\src\\CompiladorHG\\scanner1.flex";
        generarLexema(path);
        String cadena[] = new String[5];
        cadena[0]="-destdir";
        cadena[1]="C:\\Users\\User\\Documents\\NetBeansProjects\\HaskGrap\\src\\CompiladorHG";
        cadena[2]="-parser";
        cadena[3]="parser";
        cadena[4]="C:\\Users\\User\\Documents\\NetBeansProjects\\HaskGrap\\src\\CompiladorHG\\parser1.cup";
        try{
        java_cup.Main.main(cadena);
        }catch(Exception e){
            System.out.println(e);
        }
        
        ventanaP nVentana= new ventanaP();
        System.out.printf("hola mundo");
        nVentana.show();
    }
    
    
public static void generarLexema(String path){
	File file= new File(path);
	jflex.Main.generate(file);
}
    
    
}
