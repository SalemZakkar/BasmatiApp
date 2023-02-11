// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Ibtisamati`
  String get app_name {
    return Intl.message(
      'Ibtisamati',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark_mode {
    return Intl.message(
      'Dark',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light_mode {
    return Intl.message(
      'Light',
      name: 'light_mode',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get no_data {
    return Intl.message(
      'No Data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Sing In`
  String get sign_in {
    return Intl.message(
      'Sing In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get don_not_have_account {
    return Intl.message(
      'Don\'t have account?',
      name: 'don_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have account?`
  String get already_have_account {
    return Intl.message(
      'Already have account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forget_password {
    return Intl.message(
      'Forget password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get first_name {
    return Intl.message(
      'First name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get three_name {
    return Intl.message(
      'Full name',
      name: 'three_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get user_name {
    return Intl.message(
      'User name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get help_center {
    return Intl.message(
      'Help Center',
      name: 'help_center',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get log_out {
    return Intl.message(
      'Log Out',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Call Helping Center`
  String get call_helping_center {
    return Intl.message(
      'Call Helping Center',
      name: 'call_helping_center',
      desc: '',
      args: [],
    );
  }

  /// `Edit Personal Info`
  String get edit_personal_info {
    return Intl.message(
      'Edit Personal Info',
      name: 'edit_personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notification {
    return Intl.message(
      'Notifications',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Date Of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date Of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message(
      'Messages',
      name: 'messages',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Code`
  String get confirm_code {
    return Intl.message(
      'Confirm Code',
      name: 'confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `Please connect to network !`
  String get network_error {
    return Intl.message(
      'Please connect to network !',
      name: 'network_error',
      desc: '',
      args: [],
    );
  }

  /// `is less than 2 digits`
  String get is_less_than_2_digits {
    return Intl.message(
      'is less than 2 digits',
      name: 'is_less_than_2_digits',
      desc: '',
      args: [],
    );
  }

  /// `is less than 8 digits`
  String get is_less_than {
    return Intl.message(
      'is less than 8 digits',
      name: 'is_less_than',
      desc: '',
      args: [],
    );
  }

  /// `is more than 20 digits`
  String get is_more_than {
    return Intl.message(
      'is more than 20 digits',
      name: 'is_more_than',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Uploading...`
  String get uploading {
    return Intl.message(
      'Uploading...',
      name: 'uploading',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Please Give Permission !`
  String get permissions {
    return Intl.message(
      'Please Give Permission !',
      name: 'permissions',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Card Information`
  String get card_information {
    return Intl.message(
      'Card Information',
      name: 'card_information',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get card_number {
    return Intl.message(
      'Card Number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name`
  String get card_holder_name {
    return Intl.message(
      'Card Holder Name',
      name: 'card_holder_name',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get pay_now {
    return Intl.message(
      'Pay Now',
      name: 'pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Enter Confirm Code`
  String get enter_confirm_code {
    return Intl.message(
      'Enter Confirm Code',
      name: 'enter_confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend confirm code`
  String get resend_confirm_code {
    return Intl.message(
      'Resend confirm code',
      name: 'resend_confirm_code',
      desc: '',
      args: [],
    );
  }

  /// `Rewrite the password`
  String get rewrite_new_password {
    return Intl.message(
      'Rewrite the password',
      name: 'rewrite_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personal_info {
    return Intl.message(
      'Personal Info',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Phone/Password is wrong`
  String get error_auth_phone_number {
    return Intl.message(
      'Phone/Password is wrong',
      name: 'error_auth_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Email/Password is wrong`
  String get error_auth_email {
    return Intl.message(
      'Email/Password is wrong',
      name: 'error_auth_email',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Video`
  String get please_choice_video {
    return Intl.message(
      'Please Choose Video',
      name: 'please_choice_video',
      desc: '',
      args: [],
    );
  }

  /// `Sending : `
  String get sending {
    return Intl.message(
      'Sending : ',
      name: 'sending',
      desc: '',
      args: [],
    );
  }

  /// `Total Upload : `
  String get total_upload {
    return Intl.message(
      'Total Upload : ',
      name: 'total_upload',
      desc: '',
      args: [],
    );
  }

  /// `presenting : `
  String get presenting {
    return Intl.message(
      'presenting : ',
      name: 'presenting',
      desc: '',
      args: [],
    );
  }

  /// `Card Number is not valid`
  String get card_no_not_valid {
    return Intl.message(
      'Card Number is not valid',
      name: 'card_no_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder name is not valid`
  String get card_holder_name_is_not_valid {
    return Intl.message(
      'Card Holder name is not valid',
      name: 'card_holder_name_is_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Video Type should be mp4 , mov , 3gp , mpeg`
  String get not_supported_video {
    return Intl.message(
      'Video Type should be mp4 , mov , 3gp , mpeg',
      name: 'not_supported_video',
      desc: '',
      args: [],
    );
  }

  /// `Please don't close the app !`
  String get keep_the_app_open {
    return Intl.message(
      'Please don\'t close the app !',
      name: 'keep_the_app_open',
      desc: '',
      args: [],
    );
  }

  /// `Publish date`
  String get publish_date {
    return Intl.message(
      'Publish date',
      name: 'publish_date',
      desc: '',
      args: [],
    );
  }

  /// `is wrong`
  String get is_wrong {
    return Intl.message(
      'is wrong',
      name: 'is_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `did u forget ur password?`
  String get did_u_forget_password {
    return Intl.message(
      'did u forget ur password?',
      name: 'did_u_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your phone number to receive ur confirmation code`
  String get enter_data_to_send_confirm {
    return Intl.message(
      'Please Enter your phone number to receive ur confirmation code',
      name: 'enter_data_to_send_confirm',
      desc: '',
      args: [],
    );
  }

  /// `we have sent a confirmation code to `
  String get we_send_code {
    return Intl.message(
      'we have sent a confirmation code to ',
      name: 'we_send_code',
      desc: '',
      args: [],
    );
  }

  /// `Surf Products`
  String get surf_products {
    return Intl.message(
      'Surf Products',
      name: 'surf_products',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Start shopping`
  String get start_shopping {
    return Intl.message(
      'Start shopping',
      name: 'start_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Identity`
  String get confirm_identity {
    return Intl.message(
      'Confirm Identity',
      name: 'confirm_identity',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
