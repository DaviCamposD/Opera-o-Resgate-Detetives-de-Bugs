import 'package:central_achados/models/ocorrencia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Ocorrencia.fromData', () {
    test('preserva o UID do autor separado do nome exibido', () {
      final item = Ocorrencia.fromData('ocorrencia-1', {
        'titulo': 'Mochila',
        'autorId': 'uid-aluno-1',
        'autorNome': 'Ana Silva',
        'resolvido': false,
      });

      expect(item.autorId, 'uid-aluno-1');
      expect(item.autorNome, 'Ana Silva');
    });

    test('preserva o valor real do status resolvido', () {
      final aberta = Ocorrencia.fromData('aberta', {'resolvido': false});
      final resolvida = Ocorrencia.fromData('resolvida', {'resolvido': true});

      expect(aberta.resolvido, isFalse);
      expect(resolvida.resolvido, isTrue);
    });

    test('converte o timestamp do Firestore para DateTime', () {
      final criadoEm = DateTime.utc(2026, 1, 2, 3, 4);
      final item = Ocorrencia.fromData('ocorrencia-2', {
        'criadoEm': Timestamp.fromDate(criadoEm),
      });

      expect(item.criadoEm, criadoEm);
    });
  });
}
