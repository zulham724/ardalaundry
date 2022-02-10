<template>
  <div>
    <button
      v-show="false"
      type="button"
      class="btn btn-primary"
      data-bs-toggle="modal"
      data-bs-target="#previewContent"
      ref="openContent"
    >
      Launch demo modal
    </button>

    <div class="modal fade" tabindex="-1" id="previewContent">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Content {{ number }}</h5>
          </div>
          <div class="modal-body">
            <form ref="form">
              <div class="form-group">
                <label>Judul</label>
                <input
                  disabled
                  class="form-control"
                  v-model="content.tittle"
                  required
                />
              </div>
              <div class="form-group">
                <label>Deskripsi</label>
                <wysiwyg disabled v-model="content.description" />
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
                <!-- <input
                  disabled
                  type="text"
                  class="form-control"
                  v-model="content.video"
                /> -->

                <div class="pt-4">
                  <vue-plyr ref="plyr" id="plyr" v-if="content.video">
                    <video
                      controls
                      crossorigin
                      playsinline
                      :src="`/storage/${content.video.src}`"
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
            >
              Tutup
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
      content: {},
      number: null,
    };
  },
  methods: {
    openContent(contentid, index) {
      this.number = index;
      axios.get(`/api/module-content/${contentid}`).then((res) => {
        this.content = res.data;
        this.$refs.openContent.click();
      });
    },
  },
};
</script>
