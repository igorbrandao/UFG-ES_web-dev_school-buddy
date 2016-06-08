(function() {
                'use strict';
                function remoteModal(idModal){
                    var vm = this;
                    vm.modal = $(idModal);

                    if( vm.modal.length == 0 ) {
                        return false;
                    }

                    if( window.location.hash == idModal ){
                        openModal();
                    }

                    var services = {
                        open: openModal,
                        close: closeModal
                    };

                    return services;
                    ///////////////

                    // método que mostra o modal
                    function openModal(){
                        vm.modal.modal('show');
                    }

                    // método que fecha o modal
                    function closeModal(){
                        vm.modal.modal('hide');
                    }
                }
                Window.prototype.remoteModal = remoteModal;
            })();

            $(function(){
                window.remoteModal('#myModal');
            });
