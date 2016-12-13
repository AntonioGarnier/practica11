#encoding: UTF-8
require 'spec_helper'
require './lib/practica8/list'
require './lib/practica8/dieta'


describe Dieta do 
    before :all do
      x=["Desayuno",0,15]
      y=["Leche desnatada, 1 vaso, 200 ml", "Cacao instantaneo, 1 c/sopera, 10 g", "Cereales de desayuno en hojuelas, 1 bol peque~no, 40 g", "Almendras laminadas (10 unidades) 2 c/soperas, 10 g"]
      z=[388.0, 17, 21, 62]
      a="Verduras y otras hortalizas"
      @menu1=Dieta::Alimento.new(x, y, z, a)
    
      x=["Media Mañana",0,10]
      y=["Cerezas, 10-12 unidades medianas, 120 g", "Galletas bifidus con s´esamo, 4 unidades, 40 g"]
      z=[255.5, 7, 24, 69]
      a="Leche, huevos, pescado, carne y frutos secos"
      @menu2=Dieta::Alimento.new(x, y, z, a)
      
      x=["Almuerzo",30,35]
      y=["Macarrones con salsa de tomate y queso parmesano, 1 1/2 cucharón, 200 g", "Escalope de ternera, 1 bistec mediano, 100 g", "Ensalada básica con zanahoria rallada, guarnición de 120 g", "Mandarina, 1 grande, 180 g", " Pan de trigo integral, 1 rodaja, 20 g"]
      z=[785.9, 19, 34, 47]
      a="Cereales, legumbres y feculas"
      @menu3=Dieta::Alimento.new(x, y, z, a)
      
      x=["Merienda",0,15]
      y=["Galletas de leche con chocolate y yogur, 4 unidades, 46 g", "Flan de vainilla sin huevo, 1 unidad, 110 g"]
      z=[116.6, 10, 30, 60]
      a="De 4 a 9 años"
      @menu4=Dieta::Edad.new(x, y, z, a)
      
      x=["Cena",25,30]
      y=["Crema de bubango, 2 cucharones, 200 g", "Tortilla campesina con espinacas, 1 cuna grande, 150 g", "Tomate en dados con atun, 5 a 6 c/soperas, 150 g", "Pina natural o en su jugo picada, 5 c/soperas, 120 g", "Pan de trigo integral, 1 rodaja, 20 g"]
      z=[461.6, 19, 40, 41]
      a="De 9 a 13 años"
      @menu5=Dieta::Edad.new(x, y, z, a)
      
      x=["Desayuno",0,15]
      y=["Leche desnatada, 1 vaso, 200 ml", "Cacao instantaneo, 1 c/sopera, 10 g", "Cereales de desayuno en hojuelas, 1 bol peque~no, 40 g", "Almendras laminadas (10 unidades) 2 c/soperas, 10 g"]
      z=[388.0, 17, 21, 62]
      a="Verduras y otras hortalizas"
      @menu6=Dieta::Alimento.new(x, y, z, a)

      @conj_menus=[@menu1, @menu2, @menu3, @menu4, @menu5]
      @conj_menus_ordenados=[@menu4, @menu2, @menu1, @menu5, @menu3]
      
    end

    describe Node do
      
      before :each do
        @nodo1 = Node.new(nil,@menu1,nil)
      end
      
      it "Existe un nodo con sus datos, su siguiente y su previo" do
        expect(@nodo1.value).to eq(@menu1)
        expect(@nodo1.prev).to eq(nil)            
        expect(@nodo1.next).to eq(nil)
      end
    end

    describe List do
      
      before :each do
        @list= List::List.new()
      end
      
      it "Existe una lista con su cabeza" do
        @list.inserta_final(@menu1)
        expect(@list.final.value).to eq(@menu1)
      end

      it "Se puede insertar un elemento en la lista al final" do
        @list.inserta_final(@menu1)
        @list.inserta_final(@menu2)
        expect(@list.final.value).to eq(@menu2)
      end

      it "Se puede insertar un elemento en la lista al inicio" do
        @list.inserta_inicio(@menu1)
        @list.inserta_inicio(@menu2)
        expect(@list.inicio.value).to eq(@menu2)
      end

      it "Se extrae el primer elemento de la lista" do
        @list.inserta_final(@menu1)
        @list.inserta_final(@menu2)
        expect(@list.extrae_inicio()).to eq(@menu1)
      end
      
      it "Se extrae el ultimo elemento de la lista" do
        @list.inserta_final(@menu1)
        @list.inserta_final(@menu2)
        expect(@list.extrae_final()).to eq(@menu2)
      end
      
      it "Se pueden insertar varios elementos al final" do
        @list.inserta_muchos_final(@conj_menus)
        expect(@list.final.value).to eq(@menu5)
      end

      it "Se pueden insertar varios elementos al inicio" do
        @list.inserta_muchos_inicio(@conj_menus)
        expect(@list.inicio.value).to eq(@menu5)
      end

      it "La lista no está vacia" do
        @list.inserta_final(@menu1)
        expect(@list.vacio()).to eq(false)
      end

      it "La lista está vacía" do
        expect(@list.vacio()).to eq(true)
      end
      
    end
    
    describe Dieta do
      
      it "Pertenece a la clase Alimento" do
        expect(@menu1.instance_of?Dieta::Alimento).to eq(true)
      end
      
      it "Pertenece a la jerarquia de Dieta" do
        expect(@menu1.kind_of?Dieta::Dieta).to eq(true)
      end
      
      it "No pertenece a la clase Edad" do
        expect(@menu1.instance_of?Dieta::Edad).to eq(false)
      end
      
      it "Se introduce bien el nuevo campo de Alimento" do
        expect(@menu1.salud()).to eq("\nGrupo de alimentos: Verduras y otras hortalizas")
      end
      
      it "Se introduce bien el nuevo campo de Edad" do
        expect(@menu4.rango()).to eq("\nIntervalos de edad: De 4 a 9 años")
      end

      it "Pertenece a la clase Edad" do
        expect(@menu5.instance_of?Dieta::Edad).to eq(true)
      end
      
      it "Pertenece a la jerarquia de Dieta" do
        expect(@menu5.kind_of?Dieta::Dieta).to eq(true)
      end
      
      it "No pertenece a la clase Alimento" do
        expect(@menu5.instance_of?Dieta::Alimento).to eq(false)
      end
      
    end
    
    describe Comparable do
    
      it "Menu1 tiene mas caracteres que menu2" do
        expect(@menu1>@menu2).to eq(true)
      end
      
      it "Menu2 tiene menos caracteres que menu1" do
        expect(@menu2<@menu1).to eq(true)
      end
      
      it "Menu1 tiene igual numero de caracteres que menu6" do
        expect(@menu1==@menu6).to eq(true)
      end
      
      it "Comprobando el between entre dos menus: entre el 4 y el 1 esta el menu2" do
        expect(@menu2.between?(@menu4, @menu1)).to eq(true)
      end
      
      it "Ordenando menus: conj_menus2 ordenado es igual a conj_menus_ordenados" do
        expect(@conj_menus.sort).to eq(@conj_menus_ordenados)
      end
      
    end
    
    describe Enumerable do
      
      before :each do
        @list= List::List.new()
        @list2= List::List.new()
        @list.inserta_muchos_final(@conj_menus)
      end
      
      it "Comprobando la lista, no devuelve nil" do
        expect(@list.all?).to eq(true)
      end
      
      it "Comprobando la lista 2, devuelve nil" do
        expect(@list2.all?).to eq(false)
      end
      
      it "Maximo de la lista, es menu3" do
        expect(@list.max).to eq(@menu3)
      end
      
      it "Minimio de la lista, es menu4" do
        expect(@list.min).to eq(@menu4)
      end
      
      it "Ordenando la lista, debe ser igual a conj_menus_ordenados" do
        expect(@list.sort).to eq(@conj_menus_ordenados)
      end
      
      it "Comprobrando el metodo any" do
        expect(@list.any?).to eq(true)
        expect(@list2.any?).to eq(false)
      end 
        
      it "Comprobando el metodo take" do
        expect(@list.take(2)).to eq([@menu1, @menu2])
      end
      
      it "Comprobando el metodo find" do
        expect(@list.find{|i| i == @menu2}).to eq(@menu2)
      end
      
      it "Comprobando metodo count" do
        expect(@list.count).to eq(@conj_menus.size())
      end
      
    end
    
end
