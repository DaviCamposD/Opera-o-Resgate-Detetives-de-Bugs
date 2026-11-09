Bug 01 — Erro que impedia a compilação

Arquivo: lib/pages/central_page.dart
Erro: a legenda do cartão tinha uma quebra de linha escrita de um jeito que o Dart não aceitava.
Correção: troquei por \n, que faz a quebra de linha corretamente.
Teste: rodar flutter analyze e conferir se não aparece erro nesse trecho.

Bug 02 — ID do responsável estava errado

Arquivo: lib/models/ocorrencia.dart
Erro: o app pegava o nome da pessoa como se fosse o ID da conta.
Correção: agora pega o campo autorId e deixa o nome em autorNome.
Teste: abrir uma ocorrência e conferir se o responsável e o ID da conta ficam separados.

Bug 03 — Situação do objeto aparecia ao contrário

Arquivo: lib/models/ocorrencia.dart
Erro: objetos resolvidos apareciam como abertos, e vice-versa.
Correção: removi a inversão do valor salvo.
Teste: conferir uma ocorrência aberta e outra resolvida.

Bug 04 — O cadastro salvava o e-mail no lugar do ID

Arquivo: lib/services/central_service.dart
Erro: o cadastro usava o e-mail como identificação do responsável.
Correção: agora salva o UID da conta em autorId.
Teste: cadastrar um objeto e conferir se o autorId é igual ao UID da conta que cadastrou.

Bug 05 — O botão do filtro invertia a seleção

Arquivo: lib/pages/central_page.dart
Erro: ao clicar no filtro, o valor podia ficar ao contrário do que foi selecionado.
Correção: o app agora usa o valor recebido pelo controle.
Teste: ligar e desligar “Somente não resolvidos” e observar a lista.

Bug 06 — O filtro mostrava os objetos resolvidos

Arquivo: lib/pages/central_page.dart
Erro: com o filtro ligado, apareciam os casos resolvidos.
Correção: o filtro agora mostra os que ainda estão em aberto.
Teste: deixar um caso aberto e outro resolvido; com o filtro ligado, só o aberto deve aparecer.

Bug 07 — O detalhe não recebia o objeto selecionado

Arquivo: lib/pages/central_page.dart
Erro: faltava mandar a ocorrência para a tela de detalhes.
Correção: agora a tela recebe o objeto clicado.
Teste: abrir dois cartões diferentes e conferir se cada tela mostra as informações certas.

Bug 08 — O cadastro aceitava campos faltando

Arquivo: lib/pages/central_page.dart
Erro: dava para cadastrar sem título ou sem local.
Correção: agora o app avisa se faltar qualquer um desses campos.
Teste: tentar cadastrar primeiro sem título e depois sem local; os dois envios devem ser bloqueados.

Bug 09 — O app não aceitava uma pista preenchida

Arquivo: lib/pages/detalhe_page.dart
Erro: a verificação fazia o app parar justamente quando havia texto no campo.
Correção: agora só para quando a pista está vazia.
Teste: tentar enviar uma pista com texto e outra em branco.

Bug 10 — A pista era enviada vazia

Arquivo: lib/pages/detalhe_page.dart
Erro: o app mandava um texto vazio para o serviço, mesmo quando o usuário escrevia uma pista.
Correção: agora envia o texto digitado.
Teste: enviar uma frase e conferir se ela aparece na ocorrência.

Bug 11 — A pista era salva no lugar errado

Arquivo: lib/services/central_service.dart
Erro: todas as pistas podiam ser gravadas ligadas ao mesmo documento, em vez do objeto certo.
Correção: agora a pista é salva dentro da ocorrência aberta.
Teste: mandar pistas para dois objetos diferentes e conferir se cada uma aparece no lugar certo.

Bug 12 — Marcar como resolvido não mudava o status

Arquivo: lib/services/central_service.dart
Erro: o app salvava o status antigo em vez de trocar para o contrário.
Correção: agora alterna entre aberto e resolvido. Mantive a verificação de que só o responsável pode mudar o status e incluí regras do Firestore em firestore.rules.
Teste: tentar mudar o status com a conta responsável e depois com outra conta; só a responsável deve conseguir.

