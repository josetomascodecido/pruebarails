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
    puts " El promedio de notas de #{datos[0]} es: #{promedio}"

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
    puts "Las inasistencias de #{nombre} es de: #{faltas}"
  end
  puts '#----------------------------------------------------------------------------#'

end

def aprobados
  personas = []
  File.open('listado.csv', 'r') { |file| personas = file.readlines.map(&:chomp) }
  notas_de_alumnos = personas.map { |datos| datos.split(', ') }

  promedio = 0
  nombre = 0
  puts 'Escribe la nota con la cual los alumnos pasaran'
  puts ''
  c = gets.chomp.to_f

  notas_de_alumnos.each do |informacion|
    promedio = 0
    suma = 0

    informacion.each do |one_by_one|
      suma += one_by_one.to_f
    end

    nombre = informacion[0]
    promedio = suma / (informacion.length - 1)

    if c == 0
      puts "Alumnos aprobados con nota mayor o igual a 5 #{nombre} Promedio: #{promedio}" if promedio >= 5
    elsif c <= promedio
      puts "Alumnos aprovados con reprobados con nota menor o igual a #{c}| #{nombre} | Promedio: #{promedio}"
    end
  end
  puts '#----------------------------------------------------------------------------#'

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
    aprobados

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
