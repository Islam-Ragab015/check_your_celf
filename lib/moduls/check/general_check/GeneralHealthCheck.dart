// ignore_for_file: file_names

import 'package:diseases_checker/moduls/check/general_check/general_result_page.dart';
import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({
    super.key,
  });

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  bool firstSelected = false;
  bool secondSelected = false;
  PageController pageController = PageController();
  int moiIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              /// AppBar
              Row(
                children: [
                  if (index != 0)
                    IconButton(
                      onPressed: () {
                        if (moiIndex != 0) {
                          pageController.animateToPage(--moiIndex,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.bounceInOut);
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  if (index == 0)
                    const SizedBox(
                      width: 30,
                    ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      data[index]["title"]!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      '${index + 1}/${data.length}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              /// body
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.blue,
                child: Center(
                  child: Text(
                    data[index]["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        data[index]["description"]!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1} Do you have ${data[index]["title"]!}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Radio(
                          value: firstSelected ? true : false,
                          groupValue: true,
                          onChanged: (value) {
                            firstSelected = !firstSelected;
                            secondSelected = false;
                            setState(() {});
                          },
                        ),
                        const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        Radio(
                          value: secondSelected ? true : false,
                          groupValue: true,
                          onChanged: (value) {
                            firstSelected = false;
                            secondSelected = !secondSelected;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: MaterialButton(
                        color: Colors.blue,
                        minWidth: double.infinity,
                        onPressed: () {
                          if (firstSelected || secondSelected) {
                            finalChoices.add(Choices(
                                title: data[index]["title"]!,
                                choice: secondSelected ? 'Yes' : 'No'));
                            setState(() {
                              firstSelected = false;
                              secondSelected = false;
                              if (moiIndex < data.length - 1) {
                                pageController.animateToPage(++moiIndex,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.bounceInOut);
                              } else {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GeneralResultsPage()),
                                    (route) => false);
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select an option.'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            moiIndex = value;
            setState(() {});
          },
          controller: pageController,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

List<Map<String, String>> data = [
  {
    "title": "itching",
    "description":
        "Itching is an irritating sensation that makes you want to scratch your skin. Sometimes it can feel like pain, but it is different. Often, you feel itchy in one area in your body, but sometimes you may feel itching all over. Along with the itching, you may also have a rash or hives.",
  },
  {
    "title": "shivering",
    "description":
        "Involuntary shaking of the body, as with cold. It is caused by contraction or twitching of the muscles, and is a physiologic method of heat production in humans and other mammals. As a form of aerobic skeletal muscle activity, vigorous shivering uses about as much energy as riding a bicycle or shoveling snow. Weak or debilitated patients tolerate this activity poorly. Patients commonly feel helpless when experiencing contractions of muscles normally under voluntary control. Increased metabolic rate and oxygen demand caused by shivering are particularly stressful for patients with heart or lung disease.",
  },
  {
    "title": "joint_pain",
    "description":
        "Joint pain can be discomfort, pain or inflammation arising from any part of a joint. Including cartilage, bone, ligaments, tendons or muscles. Most commonly, however, joint pain refers to arthritis or arthralgia, which is inflammation or pain from within the joint itself.",
  },
  {
    "title": "acidity	",
    "description":
        "Acidity occurs when the gastric glands produce a large amount of acid, more than what is needed for the digestion process. This condition is characterized by a burning sensation just above the stomach, or right below the breastbone.",
  },
  {
    "title": "ulcers_on_tongue	",
    "description":
        "Tongue ulcers are whiteish sores on the tongue. Also called canker sores, a 2019 article notes that these ulcers most often develop on the inside of the lips and cheeks. However, they can sometimes appear in other areas of the mouth, such as the gums, tongue, and roof of the mouth.",
  },
  {
    "title": "spotting_ urination",
    "description":
        "Some people develop chronic UTI(Urinary Tract Infection), which is an ongoing infection or frequently recurring infections. Along with the symptoms of acute UTI, chronic UTIs can cause spotting or blood in your urine. Severe UTIs can spread to your kidneys. If you develop a kidney infection, you might notice kidney pain, nausea, or a fever.",
  },
  {
    "title": "weight_gain",
    "description":
        "Weight gain is an increase in body weight. This can involve an increase in muscle mass, fat deposits, excess fluids such as water or other factors. Weight gain can be a symptom of a serious medical condition.",
  },
  // {
  //   "title": "anxiety	",
  //   "description":
  //       "Anxiety is a feeling of fear, dread, and uneasiness. It might cause you to sweat, feel restless and tense, and have a rapid heartbeat. It can be a normal reaction to stress. For example, you might feel anxious when faced with a difficult problem at work, before taking a test, or before making an important decision.",
  // },
  // {
  //   "title": "cold_hands_and_feets	",
  //   "description":
  //       "Is a condition that makes your fingers or sometimes other parts of your body feel cold or numb. It results from the narrowing of arteries in your hands or feet, which stops the blood from having normal circulation.",
  // },
  // {
  //   "title": "mood_swings",
  //   "description":
  //       "The mood swing phenomenon is a common concept used to describe rapidly and intensely fluctuating emotions. People often describe mood swings as a “roller coaster” of feelings from happiness and contentment to anger, irritability, and even depression.",
  // },
  // {
  //   "title": "weight_loss",
  //   "description":
  //       "Weight loss is a decrease in body weight resulting from either voluntary (diet, exercise) or involuntary (illness) circumstances. Most instances of weight loss arise due to the loss of body fat, but in cases of extreme or severe weight loss, protein and other substances in the body can also be depleted.",
  // },
  // {
  //   "title": "restlessness",
  //   "description":
  //       "Restlessness is feeling the need to constantly move, being unable to calm your mind, or a combination of the two. You may also experience hyperactivity, anxiety, palpitations, agitation, or insomnia. People with motor restlessness often feel they have cramps in their arms or legs whenever they're not moving.",
  // },
  // {
  //   "title": "irregular_sugar_level",
  //   "description":
  //       "An abnormality in blood sugar stability. This can include hypoglycemia (low blood sugar) or hyperglycemia (high blood sugar). Blood sugar is regulated through insulin. Insulin is a hormone produced in the pancreas.",
  // },
  // {
  //   "title": "sunken_eyes",
  //   "description":
  //       "While the exact appearance may differ from person to person, sunken eyes are often described in the following ways: a hollowing under the eyes. a dark shadow over the lower eyelid. dark circles underneath the eyes. thin-looking skin under the eyes.",
  // },
  // {
  //   "title": "breathlessness",
  //   "description":
  //       "Shortness of breath.Known medically as dyspnea — is often described as an intense tightening in the chest, air hunger, difficulty breathing, breathlessness or a feeling of suffocation. Very strenuous exercise, extreme temperatures, obesity and higher altitude all can cause shortness of breath in a healthy person.",
  // },
  // {
  //   "title": "dehydration",
  //   "description":
  //       "Dehydration occurs when you use or lose more fluid than you take in, and your body doesn't have enough water and other fluids to carry out its normal functions. If you don't replace lost fluids, you will get dehydrated.",
  // },
  // {
  //   "title": "yellowish_skin",
  //   "description":
  //       "Yellow skin is most commonly caused by a condition called jaundice, which occurs when there is a high level of bilirubin in the blood. Bilirubin is a yellowish compound that is formed when old or damaged red blood cells break down.",
  // },
  // {
  //   "title": "dark_urine",
  //   "description":
  //       "Dark urine is most commonly due to dehydration. However, it may be an indicator that excess, unusual, or potentially dangerous waste products are circulating in the body. For example, dark brown urine may indicate liver disease due to the presence of bile in the urine.",
  // },
  // {
  //   "title": "constipation",
  //   "description":
  //       "Being constipated means your bowel movements are tough or happen less often than normal. Almost everyone goes through it at some point. Although it's not usually serious, you'll feel much better when your body is back on track. The normal length of time between bowel movements varies widely from person to person.",
  // },
  // {
  //   "title": "yellow_urine",
  //   "description":
  //       "Urine that falls in the pale yellow category signals that you're healthy and hydrated. That yellowish color, by the way, is caused by a pigment called urochrome produced by your body.",
  // },
  // {
  //   "title": "yellowing_of_eyes",
  //   "description":
  //       "Jaundice is a condition in which the skin, sclera (whites of the eyes) and mucous membranes turn yellow. This yellow color is caused by a high level of bilirubin, a yellow-orange bile pigment. Bile is fluid secreted by the liver. Bilirubin is formed from the breakdown of red blood cells.",
  // },
  // {
  //   "title": "swelled_lymph_nodes",
  //   "description":
  //       "Lymph nodes are located in many parts of the body, including the neck, armpit, chest, abdomen (belly), and groin. They contain immune cells that can help fight infection by attacking and destroying germs that are carried in through the lymph fluid. There are hundreds of lymph nodes throughout the body.Swollen lymph nodes are a sign that your body is fighting off an infection or an illness. Most of the time, they return to normal size when their job is done. Lymph nodes are round, bean-shaped glands, and you have them throughout your body.",
  // },
  // {
  //   "title": "phlegm",
  //   "description":
  //       "Abnormal amounts of mucus, especially as expectorated from the mouth. The thick viscous substance secreted by the mucous membranes of the respiratory passages, especially when produced in excessive quantities during a cold.",
  // },
  // {
  //   "title": "throat_irritation",
  //   "description":
  //       "Throat irritation can refer to a dry cough, a scratchy feeling at the back of the throat, a sensation of a lumpy feeling, something stuck at the back of the throat, or possibly a feeling of dust in the throat.",
  // },
  // {
  //   "title": "redness_of_eyes",
  //   "description":
  //       "Red eyes can indicate minor irritation or a more serious condition, such as an infection. Red or bloodshot eyes occur when small blood vessels on the surface of the eye become enlarged and congested with blood. Red eyes alone are not usually a reason for concern.",
  // },
  // {
  //   "title": "sinus_pressure",
  //   "description":
  //       "Sinus pressure occurs when membranes around nasal passages become inflamed or swollen. Sinus congestion and pain can make sufferers uncomfortable, but there are ways to find relief.",
  // },
  // {
  //   "title": "runny_nose",
  //   "description":
  //       "A runny nose is excess nasal drainage. It may be a thin clear fluid, thick mucus or something in between. The drainage may run out of your nose, down the back of your throat or both. The terms rhinorrhea and rhinitis are often used to refer to a runny nose.",
  // },
  // {
  //   "title": "congestion",
  //   "description":
  //       "Abnormal accumulation of fluid, usually blood, in a body part, organ, or area.To cause an excessive accumulation especially of blood or mucus in (such as an organ or part)",
  // },
  // {
  //   "title": "fast_heart_rate",
  //   "description":
  //       "Heart rates that are consistently above 100, even when the person is sitting quietly, can sometimes be caused by an abnormal heart rhythm. A high heart rate can also mean the heart muscle is weakened by a virus or some other problem that forces it to beat more often to pump enough blood to the rest of the body.",
  // },
  // {
  //   "title": "neck_pain",
  //   "description":
  //       "Neck pain is a common complaint. Neck muscles can be strained from poor posture — whether it's leaning over your computer or hunching over your workbench. Osteoarthritis also is a common cause of neck pain. Rarely, neck pain can be a symptom of a more serious problem.",
  // },
  // {
  //   "title": "cramps",
  //   "description":
  //       "A cramp is a sudden, involuntary muscle contraction or overshortening; while generally temporary and non-damaging, they can cause significant pain and a paralysis-like immobility of the affected muscle.",
  // },
  // {
  //   "title": "bruising",
  //   "description":
  //       "A bruise, or contusion, is skin discoloration from a skin or tissue injury. This injury damages blood vessels underneath the skin, causing them to leak. When blood pools under the skin, it causes black, blue, purple, brown, or yellow discoloration. There's no external bleeding unless the skin breaks open.",
  // },
  // {
  //   "title": "obesity",
  //   "description":
  //       "Obesity is a complex disease involving an excessive amount of body fat. Obesity isn't just a cosmetic concern. It's a medical problem that increases the risk of other diseases and health problems, such as heart disease, diabetes, high blood pressure and certain cancers.",
  // },
  // {
  //   "title": "swollen_legs",
  //   "description":
  //       "Swelling in the ankles, feet and legs is often caused by a build-up of fluid in these areas, called oedema. Oedema is usually caused by: standing or sitting in the same position for too long. eating too much salty food. being overweight.",
  // },
  // {
  //   "title": "swollen_blood_vessels",
  //   "description":
  //       "Vasculitis involves inflammation of the blood vessels. The inflammation can cause the walls of the blood vessels to thicken, which reduces the width of the passageway through the vessel. If blood flow is restricted, it can result in organ and tissue damage. There are many types of vasculitis, and most of them are rare.",
  // },
  // {
  //   "title": "puffy_face_and_eyes",
  //   "description":
  //       "Facial swelling is a common symptom with a range of possible causes, including injuries, allergic reactions, and infections. Rarely, facial swelling can be a sign of anaphylaxis, which is a medical emergency that requires immediate treatment.",
  // },
  // {
  //   "title": "enlarged_thyroid",
  //   "description":
  //       "A goitre (sometimes spelled goiter) is a swelling of the thyroid gland that causes a lump in the front of the neck. The lump will move up and down when you swallow. The thyroid gland is a small butterfly-shaped gland in the neck, just in front of the windpipe (trachea).",
  // },
  // {
  //   "title": "brittle_nails",
  //   "description":
  //       "Brittleness of the nails, meaning that the nails easily become cracked, chipped, split, or peeled, can be observed as a sign of aging or in response to the long-term use of nail polish or exposure to moist conditions (including frequent swimming or dishwashing).",
  // },
  // {
  //   "title": "swollen_extremeties",
  //   "description":
  //       "Edema is swelling caused by excess fluid trapped in your body's tissues. Although edema can affect any part of your body, you may notice it more in your hands, arms, feet, ankles and legs.",
  // },
  // {
  //   "title": "drying_and_tingling_lips",
  //   "description":
  //       "Tingling lips, a feeling of “pins and needles” in your lips, can have a number of causes, including chapped lips, allergic reactions to food or facial products, and cold sores. Tingling lips can also be caused by nerve damage from extreme heat or cold or from toxic substances.",
  // },
  // {
  //   "title": "slurred_speech",
  //   "description":
  //       "Slurred speech or speech disorders are a symptom characterized by the poor pronunciation of words, mumbling, or a change in speed or rhythm during a conversation. The medical term for speech disorders is dysarthria.",
  // },
  // {
  //   "title": "knee_pain",
  //   "description":
  //       "Knee pain is a common complaint that affects people of all ages. Knee pain may be the result of an injury, such as a ruptured ligament or torn cartilage. Medical conditions — including arthritis, gout and infections — also can cause knee pain. Many types of minor knee pain respond well to self-care measures.",
  // },
  // {
  //   "title": "hip_joint_pain",
  //   "description":
  //       "Problems within the hip joint itself tend to result in pain on the inside of your hip or your groin. Hip pain on the outside of your hip, upper thigh or outer buttock is usually caused by problems with muscles, ligaments, tendons and other soft tissues that surround your hip joint.",
  // },
  // {
  //   "title": "muscle_weakness",
  //   "description":
  //       "Muscle weakness is a lack of strength in the muscles. They may not contract or move as easily as before. Some chronic medical conditions can cause the muscles to wear out more quickly or cause a person to feel fatigued.",
  // },
  // {
  //   "title": "stiff_neck",
  //   "description":
  //       "Rigidity of neck resulting from spasm of neck muscles. It is a symptom of many disorders.",
  // },
  // {
  //   "title": "swelling_joints",
  //   "description":
  //       "Joint swelling is the buildup of fluid in the soft tissue surrounding the joint.",
  // },
  // {
  //   "title": "movement_stiffness",
  //   "description":
  //       "Joint stiffness is the feeling that the motion of a joint is limited or difficult. The feeling is not caused by weakness or reluctance to move the joint due to pain. Some people with stiffness are capable of moving the joint through its full range of motion, but this movement can require force.",
  // },
  // {
  //   "title": "loss_of_balance",
  //   "description":
  //       "Losing your balance while walking, or feeling imbalanced, can result from: Vestibular problems. Abnormalities in your inner ear can cause a sensation of a floating or heavy head and unsteadiness in the dark. Nerve damage to your legs (peripheral neuropathy).",
  // },
  // {
  //   "title": "weakness_of_one_body_side",
  //   "description":
  //       "Hemiparesis is a mild or partial weakness or loss of strength on one side of the body. Hemiplegia is a severe or complete loss of strength or paralysis on one side of the body.",
  // },
  // {
  //   "title": "loss_of_smell",
  //   "description":
  //       "If you lose your sense of smell, you'll miss more than a variety of scents. Without a good sense of smell, you may find that food tastes bland and it's hard to tell different foods apart. Loss of smell can be partial (hyposmia) or complete (anosmia), and may be temporary or permanent, depending on the cause.",
  // },
  // {
  //   "title": "bladder_discomfort",
  //   "description":
  //       "If you lose your sense of smell, you'll miss more than a variety of scents. Without a good sense of smell, you may find that food tastes bland and it's hard to tell different foods apart. Loss of smell can be partial (hyposmia) or complete (anosmia), and may be temporary or permanent, depending on the cause.",
  // },
  // {
  //   "title": "continuous_feel_of_urine",
  //   "description":
  //       "If a person has a constant urge to pee but little comes out when they go, they may have an infection or other health condition. If a person frequently needs to pee but little comes out when they try to go, it can be due to a urinary tract infection (UTI), pregnancy, an overactive bladder, or an enlarged prostate",
  // },
  // {
  //   "title": "passage_of_gases",
  //   "description":
  //       "Also known as farting, passing wind, or having gas, flatulence is a medical term for releasing gas from the digestive system through the anus. It happens when gas collects inside the digestive system and is a normal process. Gas collects in the digestive tract when your body breaks down food.",
  // },
  // {
  //   "title": "internal_itching",
  //   "description":
  //       "Itching on the whole body might be a symptom of an underlying illness, such as liver disease, kidney disease, anemia, diabetes, thyroid problems, multiple myeloma or lymphoma.",
  // },
  // {
  //   "title": "toxic_look_(typhos)",
  //   "description":
  //       "Typhus, also known as typhus fever, is a group of infectious diseases that include epidemic typhus, scrub typhus, and murine typhus. Common symptoms include fever, headache, and a rash. Typically these begin one to two weeks after exposure.",
  // },
  // {
  //   "title": "depression",
  //   "description":
  //       "Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Also called major depressive disorder or clinical depression, it affects how you feel, think and behave and can lead to a variety of emotional and physical problems.",
  // },
  // {
  //   "title": "muscle_pain",
  //   "description":
  //       "Muscle pain is most often related to tension, overuse, or muscle injury from exercise or hard physical work. The pain tends to involve specific muscles and starts during or just after the activity. It is often obvious which activity is causing the pain.",
  // },
  // {
  //   "title": "altered_sensorium",
  //   "description":
  //       "A clouded sensorium, also known as an altered sensorium, is a medical condition characterized by the inability to think clearly or concentrate. It is usually synonymous with, or substantially overlapping with, altered level of consciousness.",
  // },
  // {
  //   "title": "belly_pain",
  //   "description":
  //       "Abdominal pain is pain that you feel anywhere between your chest and groin. This is often referred to as the stomach region or belly. Since the abdominal area contains many different organs it is divided in smaller areas.",
  // },
  // {
  //   "title": "abnormal_menstruation",
  //   "description":
  //       "Typically, menstrual periods last four to seven days. Examples of menstrual problems include periods that occur less than 21 days or more than 35 days apart, missing three or more periods in row, and menstrual flow that is much heavier or lighter than usual.",
  // },
  // {
  //   "title": "watering_from_eyes",
  //   "description":
  //       "Watering eye, also known as epiphora or tearing, is a condition in which there is an overflow of tears onto the face, often without a clear explanation. Epiphora happens when there is either an overproduction of tears or insufficient tear film drainage from the eye or eyes.",
  // },
  // {
  //   "title": "increased_appetite",
  //   "description":
  //       "Increased appetite means you have an excess desire for food.",
  // },
  // {
  //   "title": "polyuria",
  //   "description":
  //       "Polyuria has generally been defined as a urine output exceeding 3 L/day in adults and 2 L/m2 in children. It must be differentiated from the more common complaints of frequency or nocturia, which may not be associated with an increase in the total urine output."
  //           "Use of diuretics and uncontrolled diabetes mellitus are common causes of polyuria. In the absence of diabetes mellitus and diuretic use, the most common causes of chronic polyuria are primary polydipsia, central diabetes insipidus, and nephrogenic diabetes insipidus.",
  // },
  // {
  //   "title": "family_history",
  //   "description":
  //       "A family health history can identify people with a higher-than-usual chance of having common disorders, such as heart disease, high blood pressure, stroke, certain cancers, and type 2 diabetes. These complex disorders are influenced by a combination of genetic factors, environmental conditions, and lifestyle choices.",
  // },
  // {
  //   "title": "rusty_sputum",
  //   "description":
  //       "A descriptor for the sputum produced in pneumonia caused by S pneumoniae and K pneumoniae; which is composed of bacteria, hemorrhage, mucus, sloughed necrotic lung tissue.",
  // },
  // {
  //   "title": "lack_of_concentration",
  //   "description":
  //       "When you're unable to concentrate, you can't think clearly, focus on a task, or maintain your attention. Your performance at work or school could be affected if you can't concentrate. You may also find that you can't think as well, which can affect your decision-making.",
  // },
  // {
  //   "title": "visual_disturbances",
  //   "description":
  //       "Visual disturbance is when you experience a short spell of flashing or shimmering of light in your sight. The symptoms normally last around twenty minutes before your sight returns to normal. Usually, there is no headache during the visual disturbance.",
  // },
  // {
  //   "title": "receiving_blood_transfusion",
  //   "description":
  //       "A blood transfusion is a routine medical procedure in which donated blood is provided to you through a narrow tube placed within a vein in your arm. This potentially life-saving procedure can help replace blood lost due to surgery or injury.",
  // },
  // {
  //   "title": "receiving_unsterile_injections",
  //   "description":
  //       "Use of unsterilized or improperly sterilized needles and syringes is common and causes millions of cases of viral hepatitis B and C as well as contributing to the spread of human immunodeficiency virus (HIV) and other bloodborne pathogens.",
  // },
  // {
  //   "title": "prominent_veins_on_calf",
  //   "description":
  //       "Varicose veins are swollen and enlarged veins that usually occur on the legs and feet. They may be blue or dark purple, and are often lumpy, bulging or twisted in appearance. Other symptoms include: aching, heavy and uncomfortable legs. swollen feet and ankles.If the valves weaken or are damaged, the blood can flow backwards and collect in the vein, eventually causing it to be swollen and enlarged (varicose). Certain things can increase your chances of developing varicose veins, such as: being female. having a close family member with varicose veins.",
  // },
  // {
  //   "title": "palpitations",
  //   "description":
  //       "Heart palpitations are feelings of having a fast-beating, fluttering or pounding heart. Stress, exercise, medication or, rarely, a medical condition can trigger them.Most of the time, they're caused by stress and anxiety, or because you've had too much caffeine, nicotine, or alcohol. They can also happen when you're pregnant. In rare cases, palpitations can be a sign of a more serious heart condition.",
  // },
  // {
  //   "title": "painful_walking",
  //   "description":
  //       "The most common reason for pain while walking is simply weakness of important muscles that help stabilize our joints while we're moving. When we take steps, the muscles in our trunk and hips turn on to keep our spine and pelvis from jostling side to side",
  // },
  // {
  //   "title": "pus_filled_pimples",
  //   "description":
  //       "A pustule is a bulging patch of skin that's full of a yellowish fluid called pus. It's basically a big pimple. Several conditions, ranging from something as common as acne to the once-deadly disease smallpox, can cause pustules.Pimples with pus appear from both inflammation and as an immune response to the clogged substances in your pores. Pus only occurs in inflammatory acne. Noninflammatory acne (like blackheads and whiteheads) also involve clogged pores, but the resulting comedones are filled with hardened oil and dead skin cells, not pus.",
  // },
  // {
  //   "title": "blackheads",
  //   "description":
  //       "A small plug of darkened sebum and dead skin cells that fills a pore of the skin especially on the face.Blackheads form when a clog or plug develops in the opening of hair follicles in your skin. Each follicle contains one hair and a sebaceous gland that produces oil. This oil, called sebum, helps keep your skin soft. Dead skin cells and oils collect in the opening to the skin follicle, producing a bump called a comedo.",
  // },
  // {
  //   "title": "scurring",
  //   "description":
  //       "To run away, especially fearfully. Move hurriedly with short quick steps.",
  // },
];

List<Choices> finalChoices = [];

class Choices {
  //modal class for Person object
  String title, choice;

  Choices({
    required this.title,
    required this.choice,
  });
}
