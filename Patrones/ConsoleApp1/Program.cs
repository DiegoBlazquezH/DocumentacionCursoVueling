using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            //Factory
            AbstractFactory factoryFord = new ConcretFactoryFord();
            Cupe Focus = factoryFord.CrearCupe();
            Suv EcoSport = factoryFord.CrearSuv();

            AbstractFactory factoryBmw = new ConcretFactoryBmw();
            Cupe Serie4 = factoryBmw.CrearCupe();
            Suv X1 = factoryBmw.CrearSuv();
            //Buider
            IPizzaBuilder pizzaElegida = new EspecialCasaBuilder();
            DirectorPizaa directorPizza = new DirectorPizaa(pizzaElegida);
            directorPizza.CrearPizza();
            Pizza pedido=directorPizza.EntregarPizza();

            IPizzaBuilder pizzaElegida1 = new CuatroQuesosBuilder();
            DirectorPizaa directorPizza1 = new DirectorPizaa(pizzaElegida);
            directorPizza1.CrearPizza();
            Pizza pedido1 = directorPizza1.EntregarPizza();
        }
    }
}
