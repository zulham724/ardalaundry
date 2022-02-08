<template>
  <div class="container">
    <h2>Halaman Tambah Modul</h2>
    <div class="col-12">
      <form ref="form">
        <div class="form-group">
          <label>Judul</label>
          <input
            :disabled="module.id"
            type="text"
            class="form-control"
            v-model="module.tittle"
          />
        </div>
        <div class="form-group pt-3">
          <label>Level minimal</label>
          <input
            :disabled="module.id"
            type="number"
            class="form-control"
            v-model.number="module.min_level"
          />
        </div>
        <div class="form-group pt-3">
          <label>Banner</label>
          <input
            :disabled="module.id"
            class="form-control"
            type="file"
            @input="saveImage"
          />

          <img
            v-if="bannerPreview"
            :src="bannerPreview"
            width="200px"
            class="pt-4"
          />
        </div>
        <div class="form-group pt-3">
          <label>Deskripsi</label>
          <textarea
            :disabled="module.id"
            type="text"
            class="form-control"
            v-model="module.description"
          >
          </textarea>
        </div>

        <module-content
          v-on:save-callback="getContent"
          ref="content"
        ></module-content>

        <div class="row">
          <div class="col-sm-1 p-4" v-for="(content, c) in module.contents" :key="c">
            <button class="btn btn-success" style="width: 50px">
              {{ c + 1 }}
            </button>
            <button><span class="material-icons-outlined"> delete </span></button>
            
          </div>
        </div>

        <div class="form-group pt-3" v-if="module.id">
          <button class="btn btn-success" type="button" @click="openModal()">
            Tambah Content
          </button>
        </div>

        <button
          v-if="!module.id"
          @click="save()"
          type="button"
          class="btn btn-success mt-5 float-end"
        >
          Simpan
        </button>
      </form>
    </div>
  </div>
</template>
<script>
import ModulContentComponent from "./ModuleContentComponent.vue";
import Swal from "sweetalert2";
export default {
  components: {
    "module-content": ModulContentComponent,
  },
  data() {
    return {
      module: {
        id: null,
        contents: [],
      },
      bannerPreview: null,
      content: {},
    };
  },
  mounted() {},
  methods: {
    openModal() {
      this.$refs.content.openModal(this.module.id);
      // console.log(this.$refs.content)
    },
    toBase64(file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () =>
          resolve({
            type: file.type,
            src: reader.result,
          });
        reader.onerror = (error) => reject(error);
      });
    },
    getContent(value) {
      this.module.contents.push(value);
    },
    save() {
      // let formData = new FormData();
      let formData = this.jsonToFormData(this.module);
      axios.post(`/api/module`, formData).then((res) => {
        Swal.fire({
          icon: "success",
          title: "Berhasil",
          text: "Modul berhasil disimpan",
        });
        this.module.id = res.data.id;
      });
    },
    saveImage(value) {
      this.module.banner = value.target.files[0];
      this.toBase64(value.target.files[0]).then((res) => {
        this.bannerPreview = res.src;
      });
    },
    jsonToFormData(data) {
      const formData = new FormData();

      this.buildFormData(formData, data);

      return formData;
    },
    buildFormData(formData, data, parentKey) {
      if (
        data &&
        typeof data === "object" &&
        !(data instanceof Date) &&
        !(data instanceof File)
      ) {
        Object.keys(data).forEach((key) => {
          this.buildFormData(
            formData,
            data[key],
            parentKey ? `${parentKey}[${key}]` : key
          );
        });
      } else {
        const value = data == null ? "" : data;

        formData.append(parentKey, value);
      }
    },
  },
};
</script>
