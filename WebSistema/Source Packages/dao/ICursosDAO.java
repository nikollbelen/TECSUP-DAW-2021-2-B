/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelos.Cursos;

/**
 *
 * @author nikol
 */
public interface ICursosDAO {
    public boolean registrar(Cursos curso);
    public List<Cursos> obtener();
    public boolean actualizar(Cursos curso);
    public boolean eliminar(String[] datos);
    public Cursos buscar(int codigo);
}
