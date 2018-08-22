a = ['Escoge una opcion.', '1. Nombre de los alumno y su promedio de notas.', '2. Nombre del los alumnos y sus inasistencias.', '3. Nombre de los alumnos aprobados segun su criterio.', '4, Salir']

def promedio_alumnos
  alumnos = []
  File.open('listado.csv', 'r') {|file| alumnos = file.readlines.map(&:chomp)}
  notas_alumnos = alumnos.map {|notas| notas.split(', ')}

  notas_alumnos.each do |datos|
    suma = 0
    datos.each do |one_by_one|
      suma += one_by_one.to_f
    end

    promedio = suma / (datos.length - 1)
    puts "#{datos[0]} El promedio de notas es: #{promedio}"

    new_file = "#{datos[0]}.txt"
    file_new = File.open(new_file, 'w')
    file_new.puts "Nombre del alumno: #{datos[0]} y Promedio de notas: #{promedio}"
    file_new.close
  end
end


def inasistencias
  personas = []
  File.open('listado.csv', 'r') { |file| personas = file.readlines.map(&:chomp) }

  personas.each do |x|
    data = x.split(', ')
    no_vino = x.split('')
    nombre = data[0]
    faltas = no_vino.count('A')
    puts "#{nombre}| Las inasistencias del alumno es de: #{faltas}"
  end
end


eleccion = 0
while  eleccion != 4
  puts '#----------------------------------------------------------------------------#'
  puts a
  puts '#----------------------------------------------------------------------------#'

  eleccion = gets.chomp.to_f
  case eleccion
  when 1
    promedio_alumnos

  when 2
    inasistencias

  when 3
    alumnos_aprobados

  when 4
    puts '#----------------------------------------------------------------------------#'
    puts 'Que tengas buen dia.'
    puts '#----------------------------------------------------------------------------#'
  else
    puts '#----------------------------------------------------------------------------#'
    puts 'Opción incorrecta.'
    puts '#----------------------------------------------------------------------------#'
   end
end
