using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    public enum TipoMasa { Fina,Pan,Queso}
    public class Pizza
    {//Este es el producto a construir
        public string[] Quesos{ get; set; }
        public TipoMasa masa { get; set; }
        public string Ingredinte1 { get; set; }
        public string Ingredinte2 { get; set; }
        public string Ingredinte3 { get; set; }
        public bool Gluten { get; set; }
    }
    public interface IPizzaBuilder
    {
        //En este caso creamos una interfaz , pero podria usarse una clase abstracta 
        //que ya contenga la propiedad Pizza
        void Masa();
        void CantidadQuesos();
        void Ingredientes();
        void Gluten();
        Pizza CrearPizza();
    }
    public class CuatroQuesosBuilder : IPizzaBuilder
    {
        //Los constructores concretos generan las pizzas con diferentes caracteristicas
        private Pizza Pizza { get; }
        public void CantidadQuesos()
        {
            Pizza.Quesos=new string[]{ "Mozzarella","Gorgonzola","Grand Apadano","Parmichiano"};
        }


        public void Gluten() => Pizza.Gluten = true;

        public void Ingredientes()
        {
            Pizza.Ingredinte1="Tomate";
            Pizza.Ingredinte2 = null;
            Pizza.Ingredinte3 = null;
        }

        public void Masa() => Pizza.masa = TipoMasa.Fina;

        public Pizza CrearPizza()
        {
           return this.Pizza;
        }
    }
    public class EspecialCasaBuilder : IPizzaBuilder
    {
        private Pizza Pizza { get; }
        public void CantidadQuesos()
        {
            Pizza.Quesos = new string[] { "Mozzarella" };
        }

        public Pizza CrearPizza() { return this.Pizza; }

        public void Gluten() => Pizza.Gluten = false;

        public void Ingredientes()
        {
            Pizza.Ingredinte1 = "Becon";
            Pizza.Ingredinte2 = "Peperoni";
            Pizza.Ingredinte3 = "Champiñones";
        }

        public void Masa() => Pizza.masa = TipoMasa.Pan;
    }
    public class DirectorPizaa
    {
        //El director es el encargado de llamar a el constructor específico y entrgar la Pizza en este caso
        private IPizzaBuilder _builder;

        public DirectorPizaa(IPizzaBuilder PizzaParaCrear)
        {
            _builder = PizzaParaCrear;
        }
        public void CrearPizza()
        {
            _builder.CantidadQuesos().
            Masa()
            .Gluten()
            .Ingredientes();
        }
        public Pizza EntregarPizza()
        {
            return _builder.CrearPizza();
        }
    }
}
