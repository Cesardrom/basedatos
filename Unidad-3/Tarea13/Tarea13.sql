




--Consultas unitabla

    --Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

        --Consulta:
        select nombre, apellido1, apellido2 from persona where tipo='alumno' order by apellido1, apellido2, nombre asc;

        /**
┌──────────┬───────────┬───────────┐
│  nombre  │ apellido1 │ apellido2 │
├──────────┼───────────┼───────────┤
│ Antonio  │ Domínguez │ Guerrero  │
│ Sonia    │ Gea       │ Ruiz      │
│ Juan     │ Gutiérrez │ López     │
│ Pedro    │ Heller    │ Pagac     │
│ Daniel   │ Herman    │ Pacocha   │
│ Irene    │ Hernández │ Martínez  │
│ Ramón    │ Herzog    │ Tremblay  │
│ José     │ Koss      │ Bayer     │
│ Inma     │ Lakin     │ Yundt     │
│ Juan     │ Saez      │ Vega      │
│ Ismael   │ Strosin   │ Turcotte  │
│ Salvador │ Sánchez   │ Pérez     │
└──────────┴───────────┴───────────┘
        **/

    --Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

        --Consulta:
        select nombre, apellido1, apellido2 from persona where telefono is null and tipo='alumno';

        /**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Pedro  │ Heller    │ Pagac     │
│ Ismael │ Strosin   │ Turcotte  │
└────────┴───────────┴───────────┘
        **/

    --Devuelve el listado de los alumnos que nacieron en 1999.

        --Consulta:
        select * from persona where tipo='alumno' and fecha_nacimiento REGEXP '^1999';

        /**
┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘
        **/

    --Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.

        --Consulta:
        select * from persona where tipo='profesor' and telefono is null and nif REGEXP 'K$';

        /**
┌────┬───────────┬───────────┬───────────┬───────────┬─────────┬───────────────────────────┬──────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1 │ apellido2 │ ciudad  │         direccion         │ telefono │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼───────────┼───────────┼─────────┼───────────────────────────┼──────────┼──────────────────┼──────┼──────────┤
│ 16 │ 10485008K │ Antonio   │ Fahey     │ Considine │ Almería │ C/ Sierra de los Filabres │          │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker   │ Upton     │ Almería │ C/ Sierra de Gádor        │          │ 1973/05/05       │ H    │ profesor │
└────┴───────────┴───────────┴───────────┴───────────┴─────────┴───────────────────────────┴──────────┴──────────────────┴──────┴──────────┘
        **/

    --Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

        --Consulta:
        select * from asignatura where curso=3 and id_grado=7 and cuatrimestre=1;+

        /**
┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
└────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
        **/

--Consultas multitabla (Join)

    --Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

        --Consulta:
        select p.*, a.id_grado from persona as p JOIN alumno_se_matricula_asignatura as a_m on p.id=a_m.id_alumno and p.sexo='M' join asignatura as a on a.id=a_m.id_asignatura JOIN grado as g on g.id=a.id_grado and g.nombre='Grado en Ingeniería Informática (Plan 2015)' group by p.id;

        /**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┬──────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │ id_grado │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┼──────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │ 4        │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │ 4        │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │ 4        │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┴──────────┘
        **/

    --Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).

        --Consulta:
        select * from asignatura as a join grado as g on g.id=a.id_grado and g.nombre='Grado en Ingeniería Informática (Plan 2015)';

        /**
┌────┬────────────────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┬────┬─────────────────────────────────────────────┐
│ id │                                 nombre                                 │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │ id │                   nombre                    │
├────┼────────────────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┼────┼─────────────────────────────────────────────┤
│ 1  │ Álgegra lineal y matemática discreta                                   │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 2  │ Cálculo                                                                │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 3  │ Física para informática                                                │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 4  │ Introducción a la programación                                         │ 6.0      │ básica      │ 1     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 5  │ Organización y gestión de empresas                                     │ 6.0      │ básica      │ 1     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 6  │ Estadística                                                            │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 7  │ Estructura y tecnología de computadores                                │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 8  │ Fundamentos de electrónica                                             │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 9  │ Lógica y algorítmica                                                   │ 6.0      │ básica      │ 1     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 10 │ Metodología de la programación                                         │ 6.0      │ básica      │ 1     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 11 │ Arquitectura de Computadores                                           │ 6.0      │ básica      │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 12 │ Estructura de Datos y Algoritmos I                                     │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 13 │ Ingeniería del Software                                                │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 14 │ Sistemas Inteligentes                                                  │ 6.0      │ obligatoria │ 2     │ 1            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 15 │ Sistemas Operativos                                                    │ 6.0      │ obligatoria │ 2     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 16 │ Bases de Datos                                                         │ 6.0      │ básica      │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 17 │ Estructura de Datos y Algoritmos II                                    │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 18 │ Fundamentos de Redes de Computadores                                   │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 19 │ Planificación y Gestión de Proyectos Informáticos                      │ 6.0      │ obligatoria │ 2     │ 2            │ 3           │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 20 │ Programación de Servicios Software                                     │ 6.0      │ obligatoria │ 2     │ 2            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 21 │ Desarrollo de interfaces de usuario                                    │ 6.0      │ obligatoria │ 3     │ 1            │ 14          │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 22 │ Ingeniería de Requisitos                                               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 23 │ Integración de las Tecnologías de la Información en las Organizaciones │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 24 │ Modelado y Diseño del Software 1                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 25 │ Multiprocesadores                                                      │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 26 │ Seguridad y cumplimiento normativo                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 27 │ Sistema de Información para las Organizaciones                         │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 28 │ Tecnologías web                                                        │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 29 │ Teoría de códigos y criptografía                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 30 │ Administración de bases de datos                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 31 │ Herramientas y Métodos de Ingeniería del Software                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 32 │ Informática industrial y robótica                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 33 │ Ingeniería de Sistemas de Información                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 34 │ Modelado y Diseño del Software 2                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 35 │ Negocio Electrónico                                                    │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 36 │ Periféricos e interfaces                                               │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 37 │ Sistemas de tiempo real                                                │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 38 │ Tecnologías de acceso a red                                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 39 │ Tratamiento digital de imágenes                                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 40 │ Administración de redes y sistemas operativos                          │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 41 │ Almacenes de Datos                                                     │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 42 │ Fiabilidad y Gestión de Riesgos                                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 43 │ Líneas de Productos Software                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 44 │ Procesos de Ingeniería del Software 1                                  │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 45 │ Tecnologías multimedia                                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 46 │ Análisis y planificación de las TI                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 47 │ Desarrollo Rápido de Aplicaciones                                      │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica                   │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 49 │ Inteligencia del Negocio                                               │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 50 │ Procesos de Ingeniería del Software 2                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
│ 51 │ Seguridad Informática                                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │ 4  │ Grado en Ingeniería Informática (Plan 2015) │
└────┴────────────────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┴────┴─────────────────────────────────────────────┘
        **/

    --Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.

        --Consulta:
        select p.nombre, p.apellido1, p.apellido2, d.nombre from persona as p join profesor as profe on profe.id_profesor=p.id join departamento as d on d.id=profe.id_departamento order by p.nombre, p.apellido1, p.apellido2;

        /**
┌───────────┬────────────┬────────────┬────────────────────┐
│  nombre   │ apellido1  │ apellido2  │       nombre       │
├───────────┼────────────┼────────────┼────────────────────┤
│ Alejandro │ Kohler     │ Schoen     │ Matemáticas        │
│ Alfredo   │ Stiedemann │ Morissette │ Química y Física   │
│ Antonio   │ Fahey      │ Considine  │ Economía y Empresa │
│ Carmen    │ Streich    │ Hirthe     │ Educación          │
│ Cristina  │ Lemke      │ Rutherford │ Economía y Empresa │
│ David     │ Schmidt    │ Fisher     │ Matemáticas        │
│ Esther    │ Spencer    │ Lakin      │ Educación          │
│ Francesca │ Schowalter │ Muller     │ Química y Física   │
│ Guillermo │ Ruecker    │ Upton      │ Educación          │
│ Manolo    │ Hamill     │ Kozey      │ Informática        │
│ Micaela   │ Monahan    │ Murray     │ Agronomía          │
│ Zoe       │ Ramirez    │ Gea        │ Informática        │
└───────────┴────────────┴────────────┴────────────────────┘
        **/

    --Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

        --Consulta:
        select a.nombre, c.anyo_inicio, c.anyo_fin from asignatura as a join alumno_se_matricula_asignatura as a_m on a.id=a_m.id_asignatura join curso_escolar as c on a_m.id_curso_escolar=c.id join persona as p on p.id=a_m.id_alumno and p.nif='26902806M' ;

        /**
┌──────────────────────────────────────┬─────────────┬──────────┐
│                nombre                │ anyo_inicio │ anyo_fin │
├──────────────────────────────────────┼─────────────┼──────────┤
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
│ Cálculo                              │ 2014        │ 2015     │
│ Física para informática              │ 2014        │ 2015     │
└──────────────────────────────────────┴─────────────┴──────────┘
        **/

    --Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

        --Consulta:
        select d.nombre, p.nombre, g.nombre from departamento as d join profesor as profe on profe.id_departamento=d.id join persona as p on p.id=profe.id_profesor join asignatura as a on a.id=p.id join grado as g on g.id=a.id_grado and g.nombre='Grado en Ingeniería Informática (Plan 2015)';

        /**
┌────────────────────┬───────────┬─────────────────────────────────────────────┐
│       nombre       │  nombre   │                   nombre                    │
├────────────────────┼───────────┼─────────────────────────────────────────────┤
│ Informática        │ Zoe       │ Grado en Ingeniería Informática (Plan 2015) │
│ Matemáticas        │ David     │ Grado en Ingeniería Informática (Plan 2015) │
│ Economía y Empresa │ Cristina  │ Grado en Ingeniería Informática (Plan 2015) │
│ Educación          │ Esther    │ Grado en Ingeniería Informática (Plan 2015) │
│ Educación          │ Carmen    │ Grado en Ingeniería Informática (Plan 2015) │
│ Química y Física   │ Alfredo   │ Grado en Ingeniería Informática (Plan 2015) │
│ Informática        │ Manolo    │ Grado en Ingeniería Informática (Plan 2015) │
│ Matemáticas        │ Alejandro │ Grado en Ingeniería Informática (Plan 2015) │
│ Economía y Empresa │ Antonio   │ Grado en Ingeniería Informática (Plan 2015) │
│ Educación          │ Guillermo │ Grado en Ingeniería Informática (Plan 2015) │
│ Agronomía          │ Micaela   │ Grado en Ingeniería Informática (Plan 2015) │
│ Química y Física   │ Francesca │ Grado en Ingeniería Informática (Plan 2015) │
└────────────────────┴───────────┴─────────────────────────────────────────────┘
        **/

    --Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

        --Consulta:
        select p.* from persona as p join alumno_se_matricula_asignatura as a_m on a_m.id_alumno=p.id join curso_escolar as ce on ce.id=a_m.id_curso_escolar and ce.anyo_inicio=2018 and ce.anyo_fin=2019;

        /**
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
        **/

--Consultas multitabla (Where)

    --Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.

        --Consulta:
        

        /**

        **/

    --Devuelve un listado con los profesores que no están asociados a un departamento.

        --Consulta:
        SELECT p.* from persona as p, profesor as profe, departamento as d where p.id=profe.id_profesor and profe.id_departamento<>d.id;

        /**
┌────┬───────────┬───────────┬────────────┬────────────┬─────────┬───────────────────────────┬───────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1  │ apellido2  │ ciudad  │         direccion         │ telefono  │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼────────────┼────────────┼─────────┼───────────────────────────┼───────────┼──────────────────┼──────┼──────────┤
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 3  │ 11105554G │ Zoe       │ Ramirez    │ Gea        │ Almería │ C/ Marte                  │ 618223876 │ 1979/08/19       │ M    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 14 │ 82937751G │ Manolo    │ Hamill     │ Kozey      │ Almería │ C/ Duero                  │ 950263514 │ 1977/01/02       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
└────┴───────────┴───────────┴────────────┴────────────┴─────────┴───────────────────────────┴───────────┴──────────────────┴──────┴──────────┘
        **/

    --Devuelve un listado con los departamentos que no tienen profesores asociados.

        --Consulta:
        select p.* from persona as p, profesor as profe where p.id=profe.id_profesor and profe.id_departamento is null;

        /**

        **/

    --Devuelve un listado con los profesores que no imparten ninguna asignatura.

        --Consulta:
        select distinct(p.id) from persona as p, profesor as profe, asignatura as a where p.id=profe.id_profesor and a.id_profesor is null;

        /**
┌────┐
│ id │
├────┤
│ 3  │
│ 5  │
│ 8  │
│ 10 │
│ 12 │
│ 13 │
│ 14 │
│ 15 │
│ 16 │
│ 17 │
│ 18 │
│ 20 │
└────┘
        **/

    --Devuelve un listado con las asignaturas que no tienen un profesor asignado.

        --Consulta:
        select a.* from asignatura as a  where a.id_profesor is null;

        /**
┌────┬────────────────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                                 nombre                                 │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼────────────────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                               │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 23 │ Integración de las Tecnologías de la Información en las Organizaciones │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 24 │ Modelado y Diseño del Software 1                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 25 │ Multiprocesadores                                                      │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 26 │ Seguridad y cumplimiento normativo                                     │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 27 │ Sistema de Información para las Organizaciones                         │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 28 │ Tecnologías web                                                        │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 29 │ Teoría de códigos y criptografía                                       │ 6.0      │ optativa    │ 3     │ 1            │             │ 4        │
│ 30 │ Administración de bases de datos                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 31 │ Herramientas y Métodos de Ingeniería del Software                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 32 │ Informática industrial y robótica                                      │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 33 │ Ingeniería de Sistemas de Información                                  │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 34 │ Modelado y Diseño del Software 2                                       │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 35 │ Negocio Electrónico                                                    │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 36 │ Periféricos e interfaces                                               │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 37 │ Sistemas de tiempo real                                                │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 38 │ Tecnologías de acceso a red                                            │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 39 │ Tratamiento digital de imágenes                                        │ 6.0      │ optativa    │ 3     │ 2            │             │ 4        │
│ 40 │ Administración de redes y sistemas operativos                          │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 41 │ Almacenes de Datos                                                     │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 42 │ Fiabilidad y Gestión de Riesgos                                        │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 43 │ Líneas de Productos Software                                           │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 44 │ Procesos de Ingeniería del Software 1                                  │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 45 │ Tecnologías multimedia                                                 │ 6.0      │ optativa    │ 4     │ 1            │             │ 4        │
│ 46 │ Análisis y planificación de las TI                                     │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 47 │ Desarrollo Rápido de Aplicaciones                                      │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 48 │ Gestión de la Calidad y de la Innovación Tecnológica                   │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 49 │ Inteligencia del Negocio                                               │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 50 │ Procesos de Ingeniería del Software 2                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 51 │ Seguridad Informática                                                  │ 6.0      │ optativa    │ 4     │ 2            │             │ 4        │
│ 52 │ Biologia celular                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
│ 53 │ Física                                                                 │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
│ 54 │ Matemáticas I                                                          │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
│ 55 │ Química general                                                        │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
│ 56 │ Química orgánica                                                       │ 6.0      │ básica      │ 1     │ 1            │             │ 7        │
│ 57 │ Biología vegetal y animal                                              │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
│ 58 │ Bioquímica                                                             │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
│ 59 │ Genética                                                               │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
│ 60 │ Matemáticas II                                                         │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
│ 61 │ Microbiología                                                          │ 6.0      │ básica      │ 1     │ 2            │             │ 7        │
│ 62 │ Botánica agrícola                                                      │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
│ 63 │ Fisiología vegetal                                                     │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
│ 64 │ Genética molecular                                                     │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
│ 65 │ Ingeniería bioquímica                                                  │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
│ 66 │ Termodinámica y cinética química aplicada                              │ 6.0      │ obligatoria │ 2     │ 1            │             │ 7        │
│ 67 │ Biorreactores                                                          │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
│ 68 │ Biotecnología microbiana                                               │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
│ 69 │ Ingeniería genética                                                    │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
│ 70 │ Inmunología                                                            │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
│ 71 │ Virología                                                              │ 6.0      │ obligatoria │ 2     │ 2            │             │ 7        │
│ 72 │ Bases moleculares del desarrollo vegetal                               │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                                                      │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas                              │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                                              │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas                                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas                                        │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 78 │ Bioinformática                                                         │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
│ 79 │ Biotecnología de los productos hortofrutículas                         │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
│ 80 │ Biotecnología vegetal                                                  │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
│ 81 │ Genómica y proteómica                                                  │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
│ 82 │ Procesos biotecnológicos                                               │ 6.0      │ obligatoria │ 3     │ 2            │             │ 7        │
│ 83 │ Técnicas instrumentales avanzadas                                      │ 4.5      │ obligatoria │ 3     │ 2            │             │ 7        │
└────┴────────────────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
        **/

    --Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.

        --Consulta:
        select d.nombre, a.nombre from departamento as d, profesor as profe, asignatura as a, alumno_se_matricula_asignatura as a_m, curso_escolar as c where d.id=profe.id_departamento and profe.id_profesor=a.id_profesor and a.id
        =a_m.id_asignatura and a_m.id_curso_escolar is null;

        /**

        **/

--Consultas resúmen (Funciones)

    --Devuelve el número total de alumnas que hay.

        --Consulta:
        select count(id) as cantidad_mujeres from persona where sexo='M';

        /**
┌──────────────────┐
│ cantidad_mujeres │
├──────────────────┤
│ 7                │
└──────────────────┘
        **/

    --Calcula cuántos alumnos nacieron en 1999.

        --Consulta:
        select count(id) as nacidos_1999 from persona where fecha_nacimiento REGEXP '^1999';

        /**
┌──────────────┐
│ nacidos_1999 │
├──────────────┤
│ 2            │
└──────────────┘
        **/

    --Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

        --Consulta:
        select d.nombre, count(profe.id_profesor) as cantidad_profesores from departamento as d, profesor as profe where d.id=profe.id_departamento group by d.id order by cantidad_profesores desc;

        /**
┌────────────────────┬─────────────────────┐
│       nombre       │ cantidad_profesores │
├────────────────────┼─────────────────────┤
│ Educación          │ 3                   │
│ Química y Física   │ 2                   │
│ Economía y Empresa │ 2                   │
│ Matemáticas        │ 2                   │
│ Informática        │ 2                   │
│ Agronomía          │ 1                   │
└────────────────────┴─────────────────────┘
        **/

    --Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.

        --Consulta:
        select d.*, count(profe.id_profesor) from departamento as d join profesor as profe on d.id=profe.id_departamento and d.id not in(d.id=profe.id_departamento) group by d.id ;

        /**
┌────┬────────────────────┬──────────────────────────┐
│ id │       nombre       │ count(profe.id_profesor) │
├────┼────────────────────┼──────────────────────────┤
│ 2  │ Matemáticas        │ 2                        │
│ 3  │ Economía y Empresa │ 2                        │
│ 4  │ Educación          │ 3                        │
│ 5  │ Agronomía          │ 1                        │
│ 6  │ Química y Física   │ 2                        │
└────┴────────────────────┴──────────────────────────┘
        **/

    --Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

        --Consulta:
        select g.nombre, count(a.id) as cantidad_asignaturas from grado as g join asignatura as a on g.id=a.id_grado and g.id not in(g.id=a.id_grado) group by g.id order by cantidad_asignaturas desc;


        /**
┌─────────────────────────────────────────────┬──────────────────────┐
│                   nombre                    │ cantidad_asignaturas │
├─────────────────────────────────────────────┼──────────────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51                   │
│ Grado en Biotecnología (Plan 2015)          │ 32                   │
└─────────────────────────────────────────────┴──────────────────────┘
        **/

    --Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

        --Consulta:
        

        /**

        **/

    --Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.

        --Consulta:
        SELECT g.nombre, sum(creditos) as total_creditos, a.tipo from grado as g join asignatura as a on g.id=a.id_grado group by a.tipo order by total_creditos desc; 

        /**
┌─────────────────────────────────────────────┬────────────────┬─────────────┐
│                   nombre                    │ total_creditos │    tipo     │
├─────────────────────────────────────────────┼────────────────┼─────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 180.0          │ optativa    │
│ Grado en Ingeniería Informática (Plan 2015) │ 174.0          │ obligatoria │
│ Grado en Ingeniería Informática (Plan 2015) │ 132.0          │ básica      │
└─────────────────────────────────────────────┴────────────────┴─────────────┘
        **/

    --Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

        --Consulta:
        select c.anyo_inicio, count(p.id) as cantidad_alumnos from persona as p join alumno_se_matricula_asignatura as a_m on p.id=a_m.id_alumno join curso_escolar as c on c.id=a_m.id_curso_escolar group by c.id;

        /**
┌─────────────┬──────────────────┐
│ anyo_inicio │ cantidad_alumnos │
├─────────────┼──────────────────┤
│ 2014        │ 9                │
│ 2018        │ 30               │
└─────────────┴──────────────────┘
        **/

    --Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

        --Consulta:
        select p.id, p.apellido1, p.apellido2, count(a.id) as numero_asignaturas from persona as p JOIN profesor as profe on profe.id_profesor=p.id join asignatura as a on a.id_profesor=profe.id_profesor and a.id_profesor not in(profe.id_profesor=a.id_profesor) group by a.id_profesor order by numero_asignaturas desc;

        /**
┌────┬───────────┬───────────┬────────────────────┐
│ id │ apellido1 │ apellido2 │ numero_asignaturas │
├────┼───────────┼───────────┼────────────────────┤
│ 14 │ Hamill    │ Kozey     │ 11                 │
│ 3  │ Ramirez   │ Gea       │ 10                 │
└────┴───────────┴───────────┴────────────────────┘
        **/

--Subconsultas

    --Devuelve todos los datos del alumno más joven.

        --Consulta:
        SELECT * FROM Alumnos WHERE FechaNacimiento = (SELECT MIN(FechaNacimiento) FROM Alumnos);


        /**

        **/

    --Devuelve un listado con los profesores que no están asociados a un departamento.

        --Consulta:
        SELECT * FROM Profesores WHERE (SELECT COUNT(*) FROM Departamentos WHERE Profesores.DepartamentoID = Departamentos.DepartamentoID) = 0;


        /**

        **/

    --Devuelve un listado con los departamentos que no tienen profesores asociados.

        --Consulta:
        SELECT * FROM Departamentos WHERE DepartamentoID NOT IN (SELECT DepartamentoID FROM Profesores WHERE DepartamentoID IS NOT NULL);

        /**

        **/

    --Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

        --Consulta:
        SELECT * FROM Profesores WHERE DepartamentoID IS NOT NULL AND ProfesorID NOT IN (SELECT ProfesorID FROM Asignaturas WHERE Asignaturas.ProfesorID IS NOT NULL);

        /**

        **/

    --Devuelve un listado con las asignaturas que no tienen un profesor asignado.

        --Consulta:
        SELECT * FROM Asignaturas WHERE ProfesorID IS NULL;

        /**

        **/

    --Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

        --Consulta:
        SELECT * FROM Departamentos WHERE DepartamentoID NOT IN (SELECT DepartamentoID FROM Asignaturas WHERE DepartamentoID IS NOT NULL);

        /**

        **/
