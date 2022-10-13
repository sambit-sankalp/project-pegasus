import 'package:flutter/material.dart';

class TermsAndPoliciesPage extends StatelessWidget {
  const TermsAndPoliciesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Policies'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          "These terms of service (“Terms of Service”) govern your use of John Wiley & Sons, Inc. and its subsidiaries’ (“Wiley”) websites, services and applications (the “Services”). By using or accessing the Services, you agree to be bound by these Terms of Service, as updated from time to time in accordance with Section 12 below. There may be instances when we offer additional terms specific to a product, application or service. To the extent such additional terms conflict with these Terms of Service, the additional terms associated with the product, application or service, with respect to your use of the product, application or service, will prevail. References to “us,” “we,” and “our” mean John Wiley & Sons, Inc.",
        ),
      ),
    );
  }
}
