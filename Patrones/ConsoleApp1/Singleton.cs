using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    //Estas dos interface son incompatibles dentro de la misma clase ya que comparten metodos con el mismo nombre
    public sealed class Singleton
    {
        //La informacion que queremos que sea fija la definiremos en el constructor
        //y sera de solo lectura ya que no queremos que se modifique
        public readonly string[] Provincias;
        //Declaramos un objeto estatico que será la instancia del singleton , ya que solo queremos una instancia en toda la ejecucion
        private static Singleton instance;
        //El objeto padock nos ayudará para cuando haya mas de un trhead en el programa no puedan dos trhead instanciar el singleton a la vez
        private static Object padock = new Object();
        private Singleton()
        {
            Provincias = new string[] { "Burgos", "Barcelona" };
        }
        //Si el objeto estatico instance es null lo creará , sino devuelcve el ya construido
        //lock nos ayuda con el multitrheading peromitiendo que solo un hilo de ejecucion acceda al constructor.
        public static Singleton Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padock)
                    {
                        if (instance == null)
                        {
                            instance = new Singleton();
                        }
                    }
                }
                return instance;
            }
        }
    }
}
