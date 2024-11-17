import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/transactions/presentation/bloc/transactions_bloc.dart';

import '../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../core/common/widgets/input_field.dart';
import '../../../../core/common/widgets/main_app_button.dart';
import '../../../../core/theme/app_pallete.dart';

class AddTransactionsPage extends StatefulWidget {
  static route(final String projectId) => MaterialPageRoute(
        builder: (context) => AddTransactionsPage(
          projectId: projectId,
        ),
      );

  final String projectId;

  const AddTransactionsPage({super.key, required this.projectId});

  @override
  State<AddTransactionsPage> createState() => _AddTransactionsPageState();
}

class _AddTransactionsPageState extends State<AddTransactionsPage> {
  final _transactionNameController = TextEditingController();
  final _transactionDetailsController = TextEditingController();
  final _transactionPriceController = TextEditingController();
  final _transactionQuantityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedCategory;
  String? selectedType;

  final Map<String, List<String>> typeOptions = {
    'Internal': ['Salary', 'Bonus'],
    'External': ['Material', 'Transport', 'Machinery'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: BlocConsumer<TransactionsBloc, TransactionsState>(
          listener: (context, state) {
            if (state is AddTransactionSuccess) {
              showSnackBar(context, state.response.message ?? "");
              Navigator.pop(context);
            }

            if (state is AddTransactionFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: AppPallete.errorColor,
                    ),
                    child: const Text(
                      "Add Transactions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        InputField(
                          hintText: 'Transaction Name',
                          controller: _transactionNameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Transaction Details',
                          controller: _transactionDetailsController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomDropdown(
                          items: const [
                            'Internal',
                            'External',
                          ],
                          hint: 'Transaction Category',
                          onChanged: (String? value) {
                            setState(() {
                              selectedCategory = value;
                              selectedType = null;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomDropdown(
                          key: ValueKey<String?>(selectedCategory),
                          items: selectedCategory != null
                              ? typeOptions[selectedCategory]!
                              : [],
                          hint: 'Transaction Type',
                          onChanged: (String? value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Transaction Price',
                          controller: _transactionPriceController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputField(
                          hintText: 'Transaction Quantity',
                          controller: _transactionQuantityController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MainAppButton(
                          buttonText: 'Add Transaction',
                          startLoading: state is AddTransactionLoading,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<TransactionsBloc>().add(
                                    AddTransaction(
                                      projectId: widget.projectId,
                                      transactionName:
                                          _transactionNameController.text
                                              .toString(),
                                      transactionDetails:
                                          _transactionDetailsController.text
                                              .toString(),
                                      transactionPrice: double.parse(
                                          _transactionPriceController.text
                                              .toString()),
                                      transactionQuantity: int.parse(
                                          _transactionQuantityController.text
                                              .toString()),
                                      transactionCategory:
                                          selectedCategory.toString(),
                                      transactionType: selectedType.toString(),
                                    ),
                                  );
                            }
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
