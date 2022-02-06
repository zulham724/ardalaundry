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
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                        ></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label>Judul</label>
                                <input class="form-control" v-model="content.tittle"/>
                            </div>
                            <div class="form-group">
                                <label>Deskripsi</label>
                                <input class="form-control" v-model="content.description"/>
                            </div> 
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                        >
                            Close
                        </button>
                        <button type="button" class="btn btn-primary">
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div> 
</template>
<script>
export default {
    data() {
        return {
            dialog: false,
            module_id: null,
            content:{}
        };
    },
    methods: {
        openModal(moduleid) {
            this.$refs.openModal.click()
            this.module_id = moduleid
        },
        save() {
            this.$emit("save-callback", {
                value: "Halo",
            });
        },
    },
};
</script>
