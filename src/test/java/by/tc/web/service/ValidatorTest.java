package by.tc.web.service;

import org.junit.Test;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

public class ValidatorTest {

    @Test
    public void isNameValid() {

        boolean result = Validator.isNameValid("A31");
        assertThat(result, is(false));
    }

    @Test
    public void isSurnameValid() {
        boolean result = Validator.isNameValid("B21");
        assertThat(result, is(false));
    }

    @Test
    public void isLoginValid() {
        boolean result = Validator.isNameValid("Pop3123");
        assertThat(result, is(false));
    }

    @Test
    public void isEmailValid() {
        boolean result = Validator.isNameValid("mail.mail.ru");
        assertThat(result, is(false));
    }

    @Test
    public void isPasswordsValid() {
        boolean result = Validator.isNameValid("qwerty");
        assertThat(result, is(false));
    }

    @Test
    public void isCarNumberValid() {
        boolean result = Validator.isNameValid("12532");
        assertThat(result, is(false));
    }

    @Test
    public void isCarModelValid() {
        boolean result = Validator.isNameValid("A212");
        assertThat(result, is(false));
    }
}