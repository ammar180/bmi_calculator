import 'package:bmi_calculator_provider/providers/bmi_provider.dart';
import 'package:bmi_calculator_provider/result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiPage extends StatelessWidget {
  const BmiPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<BmiProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bmi Calculator"),
        ),
        body: Container(
          height: 1000,
          width: 500,
          color: Colors.black,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: prov.tapMale,
                    child: Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                          color:
                              prov.isMale ? Colors.grey.shade700 : Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://static.vecteezy.com/system/resources/previews/017/178/570/original/male-symbol-isolated-icon-on-transparent-background-free-png.png",
                            width: 120,
                            height: 110,
                          ),
                          Text(
                            "MALE",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: prov.tapFemale,
                    child: Container(
                      width: 150,
                      height: 170,
                      decoration: BoxDecoration(
                          color:
                              !prov.isMale ? Colors.grey.shade700 : Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://static.vecteezy.com/system/resources/previews/017/178/227/non_2x/female-symbol-isolated-icon-on-transparent-background-free-png.png",
                            width: 120,
                            height: 110,
                          ),
                          Text(
                            "Female",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 310,
                height: 170,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Text("HEIGHT",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(prov.sliderValue.toString(),
                        style:
                            const TextStyle(fontSize: 36, color: Colors.white)),
                    Slider(
                      value: prov.sliderValue.toDouble(),
                      min: 50,
                      max: 250,
                      onChanged: (value) => prov.sliderChange(value.toInt()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 150,
                  height: 170,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(prov.weightValue.toString(),
                          style: const TextStyle(
                              fontSize: 36, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: prov.incrementWeightValue,
                            icon: const Icon(Icons.add),
                            style: const ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(5)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.yellow)),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: prov.decrementWeightValue,
                            icon: const Icon(Icons.minimize_sharp),
                            style: const ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(5)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.yellow)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 150,
                  height: 170,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(prov.ageValue.toString(),
                          style: const TextStyle(
                              fontSize: 36, color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: prov.incrementAgeValue,
                            icon: const Icon(Icons.add),
                            style: const ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(5)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.yellow)),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: prov.decrementAgeValue,
                            icon: const Icon(Icons.minimize_sharp),
                            style: const ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.all(5)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.yellow)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      minimumSize: WidgetStatePropertyAll(Size(310, 70)),
                      backgroundColor: WidgetStatePropertyAll(Colors.yellow),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                          side: BorderSide.none))),
                  onPressed: () {
                    prov.calculateResult();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultPage()));
                  },
                  child: Text(
                    "CALUCLATE BMI",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ))
            ],
          ),
        ));
  }
}
