import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/convert_cubit.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          child: TextFormField(
            controller: context.read<ConvertCubit>().textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^(\d+)?\.?\d{0,2}'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
