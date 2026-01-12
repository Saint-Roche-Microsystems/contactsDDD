class Contacto {
  final int? id;
  final String nombre;
  final String descripcion;
  final String foto;
  final String correo;
  final bool esFavorito;

  Contacto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.foto,
    required this.correo,
    this.esFavorito = false,
  });

  Contacto.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int?,
        nombre = map['nombre'] as String,
        descripcion = map['descripcion'] as String,
        foto = map['foto'] as String,
        correo = map['correo'] as String,
        esFavorito = (map['esFavorito'] as int) == 1;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'foto': foto,
      'correo': correo,
      'es_favorito': esFavorito ? 1 : 0,
    };
  }

  /* VALIDATORS */
  static bool _esCorreoValido(String correo) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(correo);
  }

  static bool validarCorreo(String correo) {
    return _esCorreoValido(correo);
  }

}