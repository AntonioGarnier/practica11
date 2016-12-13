
module Dieta
    class Dieta
        
        attr_accessor :cabecera, :descrip, :vct
        
        include Comparable
        
        def initialize (a,b,c)
            @cabecera, @descrip, @vct = a, b, c
        end
    
        #Comparamos segun la cantidad de calorias del menu
        def <=> (otro)
            @vct[0] <=> otro.vct[0]
        end
    
        def to_s
    
            out = get_titulo
            out << get_platos
            out << get_footer
            out
            
        end
        
        def get_titulo
    
            out ="#{@cabecera[0]}"
            out << get_porc_inges_diaria
            out        
        end
    
        def get_porc_inges_diaria
    
            out = " ("
            out << "#{@cabecera[1]}"
            out << " - "
            out << "#{@cabecera[2]}"
            out << "%)\n"
            out
        end
        
        def get_plato(i)
    
            out = "#{@descrip[i]}"
            out
        end
    
        def get_platos
    
            out=""
            i=0
            @descrip.each do
                out << "- "
                out << get_plato(i)
                out << "\n"
                i+=1
            end
            out    
        end
        
        def get_vct
    
            out = "V.C.T. | %    "
            out << "#{@vct[0]}" 
            out << " kcal | "
            out       
        end
    
        def get_porc_prot
    
            out = "#{@vct[1]}" 
            out << "% - "
            out       
        end
    
        def get_porc_gras
    
            out = "#{@vct[2]}" 
            out << "% - "
            out       
        end
    
        def get_porc_hdc
    
            out = "#{@vct[3]}" 
            out << "%"
            out       
        end
        
        def get_footer
    
            out = get_vct
            out << get_porc_prot
            out << get_porc_gras
            out << get_porc_hdc
            out 
        end
        
    end
    
    class Alimento < Dieta
        attr_accessor :saludable
        
        def initialize(a,b,c,d)
            @cabecera, @descrip, @vct, @saludable = a, b, c, d
        end
        
        def salud()
            out = "\nGrupo de alimentos: #{@saludable}"
            out
        end
        
        def to_s
            out = super.to_s
            out << salud()
            out
        end
    end
    
    class Edad < Dieta
        attr_accessor :rango_edad
        
        def initialize(a,b,c,d)
            @cabecera, @descrip, @vct, @rango_edad = a, b, c, d
        end
        
        def rango()
            out = "\nIntervalos de edad: #{@rango_edad}"
            out
        end
        
        def to_s
            out = super.to_s
            out << rango()
            out
        end    
    end
end