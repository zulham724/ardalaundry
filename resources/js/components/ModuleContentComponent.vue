<template>
  <div>
    <button
      v-show="false"
      type="button"
      class="btn btn-primary"
      data-bs-toggle="modal"
      data-bs-target="#exampleModal"
      ref="openModal"
    >
      Launch demo modal
    </button>

    <div class="modal fade" tabindex="-1" ref="exampleModal" id="exampleModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Tambah Content</h5>
          </div>
          <div class="modal-body">
            <form ref="form">
              <div class="form-group">
                <label>Judul</label>
                <input
                  :disabled="loading"
                  class="form-control"
                  v-model="content.tittle"
                  required
                />
              </div>
              <div class="form-group">
                <label>Deskripsi</label>
                <wysiwyg :disabled="loading" v-model="content.description" />
              </div>
              <div class="form-group">
                <label>Durasi (Menit)</label>
                <input
                  
                  class="form-control"
                  v-model="content.duration"
                />
              </div>
              <div class="form-group">
                <label>Video</label>
                <input
                  :disabled="loading"
                  type="file"
                  class="form-control"
                  @input="saveVideo"
                  ref="inputVideo"
                />

                <div class="pt-4">
                  <!-- <vue-plyr ref="plyr" id="plyr" > -->
                  <video
                    v-if="videoPreview"
                    width="250"
                    height="250"
                    ref="video"
                    controls
                    crossorigin
                    playsinline
                  ></video>
                  <!-- </vue-plyr> -->
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              :disabled="loading"
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
              @click="reset()"
            >
              Batal
            </button>
            <button
              :disabled="loading"
              type="button"
              class="btn btn-primary"
              @click="save()"
            >
              Simpan
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import Swal from "sweetalert2";
export default {
  data() {
    return {
      dialog: false,
      module_id: null,
      content: {},
      videoPreview: false,
      loading: false,
    };
  },
  methods: {
    openModal(moduleid) {
      this.$refs.openModal.click();
      this.module_id = moduleid;
      // let modal = document.getElementById("exampleModal");
      // console.log(this.$refs.video);
    },
    save() {
      this.loading = true;
      this.content.module_id = this.module_id;
      let formData = this.jsonToFormData(this.content);
      axios
        .post("/api/module-content", formData)
        .then((res) => {
          this.$emit("save-callback", res.data);

          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Modul berhasil disimpan",
          });

          this.$refs.exampleModal.click();
          this.content = {};
          this.$refs.inputVideo.value = null;
          this.$refs.video.src = "";
          this.videoPreview = false;
        })
        .finally(() => {
          this.loading = false;
        });
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
    async saveVideo(value) {
      this.videoPreview = true;
      this.content.video = value.target.files[0];
      await this.toBase64(value.target.files[0]).then((res) => {
        this.$refs.video.src = res.src;
      });

      // let vid = document.getElementById("video");
      // vid.onloadedmetadata = () => {
      //   this.content.duration = (vid.duration / 60).toFixed(2);
      //   this.$forceUpdate();
      // };
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
    reset() {
      this.content = {};
      this.$refs.video.value = null;
      this.videoPreview = null;
    },
  },
};
</script>
