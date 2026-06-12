import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/service/paymentservice.dart';

class OrderSummarySheet extends StatefulWidget {
  final ItemBuyclass item;
  final double shipping;

  const OrderSummarySheet({super.key, required this.item, this.shipping = 50});

  @override
  State<OrderSummarySheet> createState() => _OrderSummarySheetState();
}

class _OrderSummarySheetState extends State<OrderSummarySheet> {
  bool loading = false;

  Future<void> confirmOrder() async {
    setState(() => loading = true);

    final service = PaymentService();

    final success = await service.confirmPayment({
      "amount": widget.item.price,
      "currency": "egp",
      "description": widget.item.itemName,
    });

    setState(() => loading = false);

    if (success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Payment Success ✅")));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Payment Failed ❌")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = (widget.item.price / 100) + widget.shipping;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            children: const [
              Icon(Icons.shopping_bag_outlined),
              SizedBox(width: 10),
              Text(
                'Order Summary',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://osama.alwaysdata.net/files/v1/download/${widget.item.imageId}',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.itemName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text('Qty: 1'),
                  ],
                ),
              ),

              Text(
                '${widget.item.price / 100} EGP',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('${widget.item.price / 100} EGP'),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text('Shipping'), Text('${widget.shipping} EGP')],
          ),

          const SizedBox(height: 10),
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                '$total EGP',
                style: const TextStyle(
                  color: Color(0xfff43f06),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff43f06),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: loading ? null : confirmOrder,
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Confirm Order',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
