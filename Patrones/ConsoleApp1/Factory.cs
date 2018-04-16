using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public abstract class AbstractFactory: IFactory
    {
        public Suv autos { get; set; }
        public Cupe autoc { get; set; }
        public virtual Cupe CrearCupe()
        {
            return autoc;
        }

        public  virtual Suv  CrearSuv()
        {
            return autos;
        }
    }
    public class ConcretFactoryFord : AbstractFactory,IFactory
    {

        public override Cupe CrearCupe()
        {
            autoc = new Focus();
            return autoc;
        }

        public override Suv CrearSuv()
        {
            autos = new EcoSport();
            return autos;
        }


    }
    public  class ConcretFactoryBmw :AbstractFactory ,IFactory
    {
        public override Cupe CrearCupe()
        {
            autoc = new Serie4();
            return autoc;
        }

        public override Suv CrearSuv()
        {
            autos = new X1();
            return autos;
        }
    }
    public interface IFactory
    {
        Suv CrearSuv();
        Cupe CrearCupe();
    }
  
    public abstract class Suv { }
    public abstract class Cupe { }

    public class Focus : Cupe { }
    public class EcoSport : Suv { }
    
    public class X1 : Suv { }
    public class Serie4 : Cupe { }

}
