# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
topics = 1
#1
Question.create(question: '¿Se debería requerir a los empleadores a que pagasen a hombres y mujeres el mismo salario por el mismo trabajo?', topic_id: topics, answers: 'no,si')
#2
Question.create(question: '¿Debería exigirse a las empresas que ofrezcan bajas pagadas a empleados por tener un hijo o por enfermedad de un familiar?', topic_id: topics, answers: 'no,si')
#3
Question.create(question: '¿Está a favor de los estándares nacionales básicos comunes?', topic_id: topics, answers: 'no,si')
#4
Question.create(question: '¿Estás a favor de que se aumenten los impuestos para los ricos para así reducir los tipos de interés de los préstamos estudiantiles?', topic_id: topics, answers: 'no,si')
#5
Question.create(question: '¿Debe seguir siendo nuestro país en la OTAN?', topic_id: topics, answers: 'no,si')
#6
Question.create(question: '¿Debería restringirse más el procedimiento actual de compra de armas?', topic_id: topics, answers: 'no,si')
#7
Question.create(question: '¿Deberían tener el derecho a votar los delincuentes en prisión?', topic_id: topics, answers: 'no,si')
#8
Question.create(question: '¿Debe el gobierno aumentar o disminuir la cantidad de visas de trabajo temporales otorgados a trabajadores inmigrantes altamente cualificados?', topic_id: topics, answers: 'Disminuir,Mantenerse,Aumentar')
#9
Question.create(question: '¿Debería todo ciudadano de 18 años cumplir al menos un año de servicio militar?', topic_id: topics, answers: 'no,si')
#10
Question.create(question: '¿El gobierno debería aumentar o reducir el gasto militar?', topic_id: topics, answers: 'Reducir,Mantenerse,Aumentar')
#11
Question.create(question: '¿Deberían los EE.UU. derrocar al presidente Assad de Siria?', topic_id: topics, answers: 'no,si')
#12
Question.create(question: '¿Debe el gobierno aumentar o disminuir el gasto de la ayuda externa?', topic_id: topics, answers: 'Disminuir,Mantenerse,Aumentar')

User.create(name: 'Trump', party: 'Republican', picture: 'https://lh5.googleusercontent.com/-Sv0q6lkSAGM/AAAAAAAAAAI/AAAAAAAAAVA/9wS9aK9rScw/s0-c-k-no-ns/photo.jpg',         dataset: [1, 1, 2, 2, 3, 1, 4, 1, 5, 1, 6, 1, 7,1, 8, 1, 9, 2, 10, 3, 11, 1, 12, 1])
User.create(name: 'Hillary', party: 'Democrat', picture: 'https://upload.wikimedia.org/wikipedia/commons/2/27/Hillary_Clinton_official_Secretary_of_State_portrait_crop.jpg', dataset: [1, 2, 2, 2, 3, 2, 4, 2, 5, 2, 6, 2, 7,2, 8, 3, 9, 1, 10, 2, 11, 2, 12, 3])
User.create(name: 'Garry', party: 'Libertarian', picture: 'http://thelibertarianrepublic.com/wp-content/uploads/2016/01/Gary-Johnsonx-large-1.jpg',                           dataset: [1, 1, 2, 1, 3, 1, 4, 1, 5, 2, 6, 1, 7,2, 8, 3, 9, 1, 10, 1, 11, 1, 12, 1])
User.create(name: 'Stein', party: 'Green', picture: 'https://pbs.twimg.com/profile_images/756593715833995264/58FJ0pQJ.jpg',                                                   dataset: [1, 2, 2, 2, 3, 1, 4, 2, 5, 1, 6, 2, 7,2, 8, 3, 9, 1, 10, 1, 11, 1, 12, 3])