class TipoUsuario {
  final String value;

  const TipoUsuario._(this.value);

  factory TipoUsuario.marca() = _Marca;
  factory TipoUsuario.influencer() = _Influencer;

  static List<TipoUsuario> getValues() {
    return [TipoUsuario.marca(), TipoUsuario.influencer()];
  }
}

class _Marca extends TipoUsuario {
  const _Marca() : super._('marca');
}

class _Influencer extends TipoUsuario {
  const _Influencer() : super._('influencer');
}