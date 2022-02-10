<template>
  <div class="container">
    <h2>Halaman Tambah Modul</h2>
    <div class="col-12">
      <form ref="form">
        <div class="form-group">
          <label>Judul</label>
          <input
            :disabled="module.id || loading"
            type="text"
            class="form-control"
            v-model="module.tittle"
          />
        </div>
        <div class="form-group pt-3">
          <label>Level minimal</label>
          <input
            :disabled="module.id || loading"
            type="number"
            class="form-control"
            v-model.number="module.min_level"
          />
        </div>
        <div class="form-group pt-3">
          <label>Banner</label>
          <input
            :disabled="module.id || loading"
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
            :disabled="module.id || loading"
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
          <div
            class="col-sm-1 p-4"
            v-for="(content, c) in module.contents"
            :key="c"
          >
            <button
              type="button"
              @click="previewContent(content.id, c)"
              class="btn btn-success"
              style="width: 50px"
            >
              {{ c + 1 }}
            </button>
            <button type="button" @click="removeContent(content.id, c)">
              <span class="material-icons-outlined"> delete </span>
            </button>
          </div>
        </div>
        <preview-content-component
          ref="previewContent"
        ></preview-content-component>

        <div class="form-group pt-3" v-if="module.id">
          <button class="btn btn-success" type="button" @click="openModal()">
            Tambah Content
          </button>
        </div>

        <button
          v-if="!module.id"
          :disabled="loading"
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
      loading: false,
    };
  },
  mounted() {},
  methods: {
    openModal() {
      this.$refs.content.openModal(this.module.id);
      // console.log(this.$refs.content)
    },
    previewContent(id, index) {
      let number = index + 1;
      this.$refs.previewContent.openContent(id, number);
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
      this.loading = true;
      let formData = this.jsonToFormData(this.module);
      axios
        .post(`/api/module`, formData)
        .then((res) => {
          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Modul berhasil disimpan",
          });
          this.module.id = res.data.id;
        })
        .finally(() => {
          this.loading = false;
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
    removeContent(id, index) {
      Swal.fire({
        title: "Yakin ingin menghapus data ini?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yakin",
        cancelButtonText: "Tidak",
        preConfirm: () => {
          const access = {
            id: id,
            _method: "delete",
          };
          return axios
            .post(`/api/module-content/${access.id}`, access)
            .then((res) => {
              this.module.contents.splice(index, 1);
              console.log(res);
              if (res.status != 200) {
                throw new Error(res.statusText);
              }
              return res.data;
            })
            .catch((error) => {
              Swal.showValidationMessage(`Request failed: ${error}`);
            });
        },
        allowOutsideClick: () => !Swal.isLoading(),
      }).then((result) => {
        console.log(result);
        if (result.isConfirmed) {
          Swal.fire({
            title: "Berhasil",
            text: "data berhasil dihapus",
            icon: "success",
          });
        }
      });
    },
  },
};
</script>
