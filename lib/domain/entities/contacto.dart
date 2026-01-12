class Contacto {
  final int? id;
  final String nombre;
  final String descripcion;
  final String foto;
  final String correo;
  final String telefono;
  final bool esFavorito;

  Contacto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.foto,
    required this.correo,
    required this.telefono,
    this.esFavorito = false,
  });

  Contacto.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int?,
        nombre = map['nombre'] as String,
        descripcion = map['descripcion'] as String,
        foto = map['foto'] as String,
        correo = map['correo'] as String,
        telefono = map['telefono'] as String,
        esFavorito = (map['esFavorito'] as int) == 1;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'foto': foto,
      'correo': correo,
      'telefono': telefono,
      'es_favorito': esFavorito ? 1 : 0,
    };
  }

  Contacto copyWith({
    int? id,
    String? nombre,
    String? descripcion,
    String? foto,
    String? correo,
    String? telefono,
    bool? esFavorito,
  }) {
    return Contacto(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      descripcion: descripcion ?? this.descripcion,
      foto: foto ?? this.foto,
      correo: correo ?? this.correo,
      telefono: telefono ?? this.telefono,
      esFavorito: esFavorito ?? this.esFavorito,
    );
  }

  @override
  String toString() {
    return 'Contacto(id: $id, nombre: $nombre, correo: $correo, telefono: $telefono, esFavorito: $esFavorito)';
  }

  /**************/
  /* VALIDATORS */
  /// ***********

  bool get esValido {
    return nombre.trim().isNotEmpty &&
        correo.trim().isNotEmpty &&
        telefono.trim().isNotEmpty &&
        _esCorreoValido(correo) &&
        _esTelefonoValido(telefono);
  }

  static bool _esCorreoValido(String correo) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(correo);
  }

  static bool validarCorreo(String correo) {
    return _esCorreoValido(correo);
  }

  static bool _esTelefonoValido(String telefono) {
    final soloNumeros = telefono.replaceAll(RegExp(r'[^\d]'), '');
    return soloNumeros.length >= 7 && soloNumeros.length <= 15;
  }

  static bool validarTelefono(String telefono) {
    return _esTelefonoValido(telefono);
  }

  String get telefonoFormateado {
    final soloNumeros = telefono.replaceAll(RegExp(r'[^\d]'), '');
    if (soloNumeros.length == 10) {
      return '${soloNumeros.substring(0, 3)}-${soloNumeros.substring(3, 6)}-${soloNumeros.substring(6)}';
    }
    return telefono;
  }

  String get iniciales {
    final palabras = nombre.trim().split(' ');
    if (palabras.isEmpty) return '?';
    if (palabras.length == 1) {
      return palabras[0].substring(0, 1).toUpperCase();
    }
    return (palabras[0].substring(0, 1) + palabras[1].substring(0, 1))
        .toUpperCase();
  }

  bool get tieneFoto => foto.isNotEmpty;

}