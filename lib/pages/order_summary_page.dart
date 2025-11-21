// lib/pages/order_summary_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/order_cubit.dart';
import 'checkout_success_page.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ringkasan Keranjang'),
      ),
      body: BlocBuilder<OrderCubit, List<OrderItem>>(
        builder: (context, state) {
          if (state.isEmpty) {
            return const Center(
              child: Text('Keranjang masih kosong'),
            );
          }

          final orderCubit = context.read<OrderCubit>();

          // === Perhitungan original ===
          final totalItems =
              state.fold<int>(0, (sum, item) => sum + item.quantity);

          // subtotal = total setelah DISKON PER ITEM
          final int subtotal = orderCubit.getTotalPrice();

          // === BONUS UTS: Diskon 10% jika subtotal > 100000 ===
          final int totalDiscount =
              subtotal > 100000 ? (subtotal * 0.10).toInt() : 0;

          // total akhir bayar
          final int finalTotal = subtotal - totalDiscount;

          return Column(
            children: [
              // ===== LIST ITEM PESANAN =====
              Expanded(
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final item = state[index];
                    final perItemPrice = item.menu.getDiscountedPrice();
                    final totalItemPrice = perItemPrice * item.quantity;

                    return ListTile(
                      leading: Image.network(
                        item.menu.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image_not_supported);
                        },
                      ),
                      title: Text(item.menu.name),
                      subtitle: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              final newQty = item.quantity - 1;
                              orderCubit.updateQuantity(item.menu, newQty);
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text('${item.quantity}'),
                          IconButton(
                            onPressed: () {
                              final newQty = item.quantity + 1;
                              orderCubit.updateQuantity(item.menu, newQty);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      trailing: Text('Rp $totalItemPrice'),
                    );
                  },
                ),
              ),

              // ===== BAGIAN TOTAL =====
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Total item        : $totalItems'),
                    Text('Subtotal          : Rp $subtotal'),

                    // tampilkan diskon bonus jika ada
                    if (totalDiscount > 0)
                      Text(
                        'Diskon 10%      : -Rp $totalDiscount',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 4),

                    Text(
                      'Total Bayar    : Rp $finalTotal',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ===== TOMBOL CHECKOUT =====
                    ElevatedButton(
                      onPressed: () {
                        orderCubit.clearOrder();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CheckoutSuccessPage(),
                          ),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
