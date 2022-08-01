# -*- coding: utf-8 -*-

require './utils.rb'
$:.push 'modelos/'
require 'linha.rb'
require 'tipo.rb'

def imprimeTipo(tipo)
    puts "#{tipo.id} - #{tipo.nome} (#{tipo.cor})"
end

def listaTipos(atributos)
    begin
        tipos = buscaTipo(atributos)
    rescue NenhumRegistroError => e
        puts e.message
        return
    rescue VariosRegistros => e
        tipos = e.registros
    end

    tipos.each do |t|
        imprimeTipo t
    end
end

# -------------------- EXCLUSAO ---------------------
def excluiTipo(atributos)
    tipos = buscaTipo(atributos)
    tip = tipos.first    
    print "Destruindo  "
    imprimeTipo tip
    tip.destroy
    puts "Tipo destruido"
    
    rescue => e
        puts e.message
end
