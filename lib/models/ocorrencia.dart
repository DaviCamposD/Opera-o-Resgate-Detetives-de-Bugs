import 'package:cloud_firestore/cloud_firestore.dart';

class Ocorrencia {
  final String id;
  final String titulo;
  final String local;
  final String descricao;
  final String autorId;
  final String autorNome;
  final bool resolvido;
  final DateTime? criadoEm;

  const Ocorrencia({
    required this.id,
    required this.titulo,
    required this.local,
    required this.descricao,
    required this.autorId,
    required this.autorNome,
    required this.resolvido,
    required this.criadoEm,
  });

  factory Ocorrencia.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) =>
      Ocorrencia.fromData(doc.id, doc.data() ?? const <String, dynamic>{});

  /// Constrói uma ocorrência a partir dos campos armazenados no Firestore.
  /// Separada de [fromDoc] para permitir testes sem conexão ao Firebase.
  factory Ocorrencia.fromData(String id, Map<String, dynamic> data) {
    return Ocorrencia(
      id: id,
      titulo: data['titulo'] as String? ?? '',
      local: data['local'] as String? ?? '',
      descricao: data['descricao'] as String? ?? '',
      autorId: data['autorId'] as String? ?? '',
      autorNome: data['autorNome'] as String? ?? 'Anônimo',
      resolvido: data['resolvido'] as bool? ?? false,
      criadoEm: (data['criadoEm'] as Timestamp?)?.toDate(),
    );
  }
}
