
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.util.*;
import modelos.Cursos;
import modelos.Conexion;

/**
 *
 * @author nikol
 */
public class CursoDAOImpl implements ICursosDAO {

    @Override
    public boolean registrar(Cursos curso) {
        Conexion co = new Conexion();
        String xcod = co.generarCodigo("cursos", "codigo");
        boolean registrar = false;
        Statement stm = null;
        Connection con = null;
        String sql = "INSERT INTO cursos values (" + xcod +","
                + "'" + curso.getNombre() + "','"
                + curso.getCosto() + "','"
                + curso.getFec_ini() + "','"
                + curso.getFec_fin() + "','"
                + curso.getDuracion() + "','"
                + curso.getSesiones() + "','"
                + curso.getCapacidad() + "','"
                + curso.getInscritos() + "','"
                + curso.getEstado() + "')";
        
        try {
            con = co.Conectar();
            stm = con.createStatement();
            
            stm.execute(sql);
            registrar=true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase CursoDAOImpl, "
                    + "metodo registrar");
            e.printStackTrace();
        }
        return registrar;
    }

    @Override
    public List<Cursos> obtener() {
        Connection co =null;
        Statement stm =null;
        ResultSet rs =null;
        String sql="SELECT * FROM cursos ORDER BY codigo";
        List<Cursos> listaAlumnos = new ArrayList<Cursos>();
        
       try {
           Conexion con = new Conexion();
           co = con.Conectar();
           stm = co.createStatement();
           rs = stm.executeQuery(sql);
           while (rs.next()) {
               Cursos curso = new Cursos();
               curso.setCodigo(rs.getInt(1));
               curso.setNombre(rs.getString(2));
               curso.setCosto(rs.getDouble(3));
               curso.setFec_ini(rs.getDate(4));
               curso.setFec_fin(rs.getDate(5));
               curso.setDuracion(rs.getInt(6));
               curso.setSesiones(rs.getInt(7));
               curso.setCapacidad(rs.getInt(8));
               curso.setInscritos(rs.getInt(9));
               curso.setEstado(rs.getString(10));
               listaAlumnos.add(curso);
           }
           stm.close();
           rs.close();
           co.close();
       } catch (SQLException e) {
           System.out.println("Error:Clase CursoDaoImpl,"
                   + "metodo obtener");
       }
       return listaAlumnos;
    }

    @Override
    public boolean actualizar(Cursos curso) {
        Conexion co = new Conexion();
        boolean actualizar = false;
        Statement stm = null;
        Connection con = null;
        String sql = "UPDATE cursos SET "
                + "nombre='" + curso.getNombre() + "',"
                + "costo='" + curso.getCosto() + "',"
                + "fec_ini='" + curso.getFec_ini() + "',"
                + "fec_fin='" + curso.getFec_fin() + "',"
                + "duracion='" + curso.getDuracion() + "',"
                + "sesiones='" + curso.getSesiones() + "',"
                + "capacidad='" + curso.getCapacidad() + "',"
                + "inscritos='" + curso.getInscritos() + "',"
                + "estado='" + curso.getEstado() + "'"
                + " WHERE codigo=" + curso.getCodigo();
        
        try {
            con = co.Conectar();
            stm = con.createStatement();
            
            stm.execute(sql);
            actualizar=true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase CursoDAOImpl, "
                    + "metodo actualizar");
            e.printStackTrace();
        }
        return actualizar; 
    }

    @Override
    public boolean eliminar(String[] datos) {
        Conexion co = new Conexion();
        boolean eliminar = false;
        Statement stm = null;
        Connection con = null;
        
        boolean inicio;
        if ( datos.length <= 0 )
           return eliminar;
        String sql  = "DELETE FROM cursos WHERE codigo in ( ";
        inicio = true;
        for( int xc = 0 ; xc < datos.length ; xc++ ) {
            if ( inicio )
              sql += datos[xc];
            else
              sql += "," + datos[xc];
            inicio = false;
        }
        sql += ")";
        
        try {
            con = co.Conectar();
            stm = con.createStatement();
            
            stm.execute(sql);
            eliminar=true;
            stm.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: Clase CursoDAOImpl, "
                    + "metodo eliminar");
            e.printStackTrace();
        }
        return eliminar; 
    }

    @Override
    public Cursos buscar(int codigo) {
        Connection co =null;
        Statement stm =null;
        ResultSet rs =null;
        String sql="SELECT * FROM cursos WHERE codigo=" + codigo;
        Cursos curso = new Cursos();
        
       try {
           Conexion con = new Conexion();
           co = con.Conectar();
           stm = co.createStatement();
           rs = stm.executeQuery(sql);
           while (rs.next()) {
               curso.setCodigo(rs.getInt(1));
               curso.setNombre(rs.getString(2));
               curso.setCosto(rs.getDouble(3));
               curso.setFec_ini(rs.getDate(4));
               curso.setFec_fin(rs.getDate(5));
               curso.setDuracion(rs.getInt(6));
               curso.setSesiones(rs.getInt(7));
               curso.setCapacidad(rs.getInt(8));
               curso.setInscritos(rs.getInt(9));
               curso.setEstado(rs.getString(10));
           }
           stm.close();
           rs.close();
           co.close();
       } catch (SQLException e) {
           System.out.println("Error:Clase CursoDaoImpl,"
                   + "metodo buscar");
           e.printStackTrace();
       }
       return curso;    
    }
    
}

