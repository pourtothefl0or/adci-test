<template>
  <div id="app">
    <div class="container mt-4">
      <h1>Регистрация</h1>
      <div class="mx-auto">
        <form @submit.prevent="registerUser" novalidate>
          <div v-show="step === 1" class="step">
              <!-- === INPUTS === -->
              <div class="form-group">
                <label for="name" class="form-label">Имя:</label>
                <input 
                @blur="$v.formRegister.name.$touch()" v-model="formRegister.name"
                :class="status('name')"
                type="text" class="form-control" id="name" placeholder="Введите своё имя">

                <div v-if="!$v.formRegister.name.required" class="invalid-feedback">
                  {{ errorRequired }}
                </div>
              </div>
              <!-- === / INPUTS === -->

              <!-- === BUTTONS === -->
              <div class="mt-2">
                <button
                @click="nextStep"
                :disabled="$v.formRegister.name.$invalid"
                type="button" class="btn btn-primary">Далее</button>
              </div>
              <!-- === / BUTTONS === -->
          </div>
          
          <div v-show="step === 2" class="step">
            <!-- === INPUTS === -->
            <div class="form-group">
              <label for="surname" class="form-label">Фамилия:</label>
              <input 
              @blur="$v.formRegister.surname.$touch()" v-model="formRegister.surname"
              :class="status('surname')"
              type="text" class="form-control" id="surname" placeholder="Введите свою фамилию">

              <div v-if="!$v.formRegister.surname.required" class="invalid-feedback">
                {{ errorRequired }}
              </div>
            </div>
            <!-- === / INPUTS === -->

            <!-- === BUTTONS === -->
            <div class="mt-2">
              <button @click="backStep" type="button" class="btn btn-secondary me-2">Назад</button>
              <button
              @click="nextStep"
              :disabled="$v.formRegister.surname.$invalid"
              type="button" class="btn btn-primary">Далее</button>
            </div>
            <!-- === / BUTTONS === -->
          </div>
  
          <div v-show="step === 3" class="step">
            <!-- === INPUTS === -->
            <div class="form-group">
              <label for="email" class="form-label">Почта:</label>
              <input
              @blur="$v.formRegister.email.$touch()" v-model="formRegister.email"
              :class="status('email')"
              type="email" class="form-control" id="email" placeholder="Введите свою почту">

              <div v-if="!$v.formRegister.email.required" class="invalid-feedback">
                {{ errorRequired }}
              </div>

              <div v-if="!$v.formRegister.email.email" class="invalid-feedback">
                {{ errorEmail }}
              </div>
            </div>
            <!-- === / INPUTS === -->

            <!-- === BUTTONS === -->
            <div class="mt-2">
              <button @click="backStep" type="button" class="btn btn-secondary me-2">Назад</button>
              <button
              type="submit"
              :disabled="$v.formRegister.email.$invalid"
              class="btn btn-primary">Завершить</button>
            </div>
          <!-- === / BUTTONS === -->
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { required, email } from 'vuelidate/lib/validators'

export default {
  data() {
    return {
        step: 1,
        formRegister: {
            name: '',
            surname: '',
            email: '',
        },
        errorRequired: 'Поле обязательно для заполнения',
        errorEmail: 'Поле должно быть email адресом',
    }
  },
  
  methods: {
    nextStep() {
        if (this.step < 3) {
            this.step++
        }
    },

    backStep() {
        if (this.step > 1) {
            this.step--
        }
    },

    status(validator) {
      return {
        'is-invalid': this.$v.formRegister[validator].$error
      }
    },

    registerUser() {
        alert('Спасибо!')
        window.location.reload()
    }
  },

  validations: {
    formRegister: {
      name: {
        required
      },

      surname: {
        required
      },

      email: {
        required,
        email
      }
    }
  }
}
</script>