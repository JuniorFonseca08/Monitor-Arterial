import 'package:controle_pressao_arterial/componentes/espacamento_componente.dart';
import 'package:controle_pressao_arterial/entities/afazer_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatelessWidget {
  final AfazerEntity item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String dataHoraFormatada =
        DateFormat('dd-MM-yyyy   HH:mm').format(item.data!);

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dataHoraFormatada,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const EspacamentoComponente(size: 8),
              Row(
                children: [
                  const Text('Pressão: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const EspacamentoComponente(size: 12, isHorizontal: true),
                  Text(item.pressaoMax.toString(),
                      style: const TextStyle(fontSize: 14)),
                  const EspacamentoComponente(size: 4, isHorizontal: true),
                  const Text('/'),
                  const EspacamentoComponente(size: 4, isHorizontal: true),
                  Text(item.pressaoMin.toString(),
                      style: const TextStyle(fontSize: 14)),
                ],
              ),
              const EspacamentoComponente(size: 8),
              Row(
                children: [
                  const Text('Obs: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const EspacamentoComponente(size: 12, isHorizontal: true),
                  Text(item.comentario, style: const TextStyle(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
