package by.tc.web.service;

public class Validator {

    private static final String NAME_REGEX = "[A-Z][a-z]+";
    private static final String SURNAME_REGEX = "[A-Z][a-z]+";
    private static final String PASSWORD_REGEX = "^(?=^.{6,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$";
    private static final String EMAIL_REG_EXP = "([a-zA-Z0-9]+)(@)([a-zA-Z]+)(\\.)([a-zA-Z]){2,3}";
    private static final String CAR_NUMBER_REGEX = "\\dTAX\\d{4}";


    public static boolean isNameValid(String name) {
        return name != null && name.matches(NAME_REGEX);
    }

    public static boolean isSurnameValid(String surname) {
        return surname != null && surname.matches(SURNAME_REGEX);
    }

    public static boolean isLoginValid(String login) {
        return login != null && login.matches(NAME_REGEX);
    }

    public static boolean isEmailValid(String email){return email != null && email.matches(EMAIL_REG_EXP);}

    public static boolean isPasswordsValid(String firstPassword, String secondPassword) {
        return firstPassword != null && firstPassword.matches(PASSWORD_REGEX) && firstPassword.equals(secondPassword);
    }
    public static boolean isPasswordValid(String password) {
        return password != null && password.matches(PASSWORD_REGEX);
    }
    public static boolean isCarNumberValid(String number) {
        return number != null && number.matches(CAR_NUMBER_REGEX);
    }

    public static boolean isCarModelValid(String model) {
        return model != null;
    }





}
