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

    <div class="modal fade" tabindex="-1" id="exampleModal">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Tambah Content</h5>
          </div>
          <div class="modal-body">
            <form ref="form">
              <div class="form-group">
                <label>Judul</label>
                <input class="form-control" v-model="content.tittle" required />
                
              </div>
              <div class="form-group">
                <label>Deskripsi</label>
                <wysiwyg v-model="content.description"/>
              </div>
              <div class="form-group">
                <label>Durasi (Menit)</label>
                <input
                  disabled
                  class="form-control"
                  v-model="content.duration"
                />
              </div>
              <div class="form-group">
                <label>Video</label>
                <input type="file" class="form-control" @input="saveVideo" />

                <div class="pt-4">
                  <vue-plyr ref="plyr" id="plyr" v-if="videoPreview">
                    <video
                      controls
                      crossorigin
                      playsinline
                      :src="videoPreview"
                    ></video>
                  </vue-plyr>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
              @click="content = {}"
            >
              Batal
            </button>
            <button type="button"  class="btn btn-primary" @click="save()">
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
      videoPreview: null,
    };
  },
  methods: {
    openModal(moduleid) {
      this.$refs.openModal.click();
      this.module_id = moduleid;
      // let modal = document.getElementById("exampleModal");
      // console.log(modal)
    },
    save() {
      this.content.module_id = this.module_id;

      let formData = this.jsonToFormData(this.content);
      axios.post("/api/module-content", formData).then((res) => {
        this.$emit("save-callback", res.data);

        Swal.fire({
          icon: "success",
          title: "Berhasil",
          text: "Modul berhasil disimpan",
        });

        let modal = document.getElementById("exampleModal");
        modal.toggle();
        this.content = {}
        this.videoPreview = null
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
      this.content.video = value.target.files[0];
      await this.toBase64(value.target.files[0]).then((res) => {
        this.videoPreview = res.src;
      });

      let vid = document.getElementById("plyr");
      vid.onloadedmetadata = () => {
        this.content.duration = (vid.duration / 60).toFixed(2);
        this.$forceUpdate();
      };
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
