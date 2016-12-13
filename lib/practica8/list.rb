Node= Struct.new(:prev, :value, :next)

module List
    
    class List
        
        attr_reader :inicio, :final
        
        include Enumerable
        
        def initialize()
            @inicio= nil
            @final= nil
        end
            
        def each
            aux = @inicio
            if (@inicio == nil)
                yield nil
            elsif (@inicio == @fin)
                yield @inicio.value
            else
                while (aux != nil)
                    yield aux.value
                    aux = aux.next
                end
            end
        end
            
        def extrae_final()
            if (@final != nil)
                aux = @final.value
                @final = @final.prev
                return aux
            else
                return nil
            end
        end
        
        def extrae_inicio()
            if (@inicio != nil)
                aux = @inicio.value
                @inicio = @inicio.next
                return aux
            else
                return nil
            end
        end
            
        def inserta_final(valor)
            nodo = Node.new(nil,valor,nil)
            if(@inicio == nil)
                @inicio= nodo
                @final=nodo
            else
                nodo.prev = @final
                @final.next = nodo
                @final= nodo
            end
        end
        
        def inserta_inicio(valor)
            nodo = Node.new(nil,valor,nil)
            if(@inicio == nil)
                @inicio= nodo
                @final=nodo
            else
                nodo.next = @inicio
                @inicio.prev = nodo
                @inicio= nodo
            end
        end
        
        def inserta_muchos_final(valores)
            valores.each do |elemento|
                inserta_final(elemento)
            end
        end
    
        def inserta_muchos_inicio(valores)
            valores.each do |elemento|
                inserta_inicio(elemento)
            end
        end
    
        def vacio()
            if(@inicio == nil)
                return true
            else
                return false
            end
        end
    end
end