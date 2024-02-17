import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/country.dart';

class CurrencyInput extends StatelessWidget {
  final String value;
  final void Function(String?)? onChanged;
  final List<CurrencyEntity> countries;
  const CurrencyInput(
      {Key? key, required this.value, this.onChanged, required this.countries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'From',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          value: value,
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onChanged: onChanged,
          items: countries.map((c) {
            return DropdownMenuItem<String>(
              value: c.countryCode,
              child: Container(
                child: Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 22,
                        minHeight: 22,
                        maxWidth: 22,
                        maxHeight: 22,
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://flagcdn.com/28x21/${c.countryCode.toLowerCase().substring(0, 2)}.png",
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      c.countryName,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
