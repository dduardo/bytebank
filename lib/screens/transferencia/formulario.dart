import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _tituloAppBar = 'Criando Transfêrencia';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _rotuloCampoValor = 'Valor';
const _dicaCampovalor = '0.00';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controlladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controlladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controlador: _controlladorCampoNumeroConta,
                rotulo: _rotuloCampoNumeroConta,
                dica: _dicaCampoNumeroConta),
            Editor(
                controlador: _controlladorCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _dicaCampovalor,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(_botaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controlladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controlladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
