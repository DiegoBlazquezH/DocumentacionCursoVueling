using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public interface IFluentPizzaBuilder
    {
        //En este caso creamos una interfaz fluida, pero podria usarse una clase abstracta 
        //que ya contenga la propiedad Pizza
        IFluentPizzaBuilder Begin();
        IFluentPizzaBuilder Masa();
        IFluentPizzaBuilder CantidadQuesos();
        IFluentPizzaBuilder Ingredientes();
        IFluentPizzaBuilder Gluten();
        Pizza CrearPizza();
        //El último metodo sera el que nos devuelva el producto final
    }
    public class EspecialCasaFluentBuilder : IFluentPizzaBuilder
    {
        private Pizza Pizza;
        public IFluentPizzaBuilder Begin()
        {
            Pizza = new Pizza();
            return this;
        }
    
        public IFluentPizzaBuilder Masa()
        {
            Pizza.masa = TipoMasa.Pan;
            return this;
        }
        public IFluentPizzaBuilder Gluten()
        {
            Pizza.Gluten = false;
            return this;
        } 
        public IFluentPizzaBuilder CantidadQuesos()
        {
            Pizza.Quesos = new string[] { "Mozzarella" };
            return this;
        }
        public IFluentPizzaBuilder Ingredientes()
        {
            Pizza.Ingredinte1 = "Becon";
            Pizza.Ingredinte2 = "Peperoni";
            Pizza.Ingredinte3 = "Champiñones";
            return this;
        }

       
        public Pizza CrearPizza() { return this.Pizza; }
    }
    class FluentBuilder
    {
        public void Director()
        {
            //Como vemos nuestro código también se vuelve mucho mas legible
            IFluentPizzaBuilder InterfazFluente = new EspecialCasaFluentBuilder();
            Pizza selecionada = InterfazFluente.Begin()
                                                .Masa()
                                                .Gluten()
                                                .CantidadQuesos()
                                                .Ingredientes()
                                                .CrearPizza();
        }
        
    }
}
