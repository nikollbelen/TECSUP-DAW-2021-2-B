/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelos.Alumnos;

/**
 *
 * @author nikol
 */
public interface IAlumnosDAO {
    public boolean registrar(Alumnos alumno);
    public List<Alumnos> obtener();
    public boolean actualizar(Alumnos alumno);
    public boolean eliminar(String[] datos);
    public Alumnos buscar(int codigo);
}
