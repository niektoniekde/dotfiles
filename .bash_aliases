# make alias for k8s configs
K8S_CONFD="${HOME}/.kube/conf.d"
if [[ -d ${K8S_CONFD} ]]; then
  IFS=$'\n'

  for K8S_CONF in $(ls ${K8S_CONFD}); do
    IFS=' '
    HELM_BIN=""
    KUBE_BIN=""

    if  [[ ${K8S_CONF} =~ ^([a-zA-Z0-9_-]+)$ ]] && [[ -d ${K8S_CONFD}/${K8S_CONF} ]]; then
      if [[ -f ${K8S_CONFD}/${K8S_CONF}/config ]]; then
        if [[ -f ${K8S_CONFD}/${K8S_CONF}/path.env ]]; then
          . ${K8S_CONFD}/${K8S_CONF}/path.env;
        fi

        if [[ -n ${KUBE_BIN} ]]; then
          alias "${K8S_CONF}-k"="${KUBE_BIN} --kubeconfig='${K8S_CONFD}/${K8S_CONF}/config'"
        fi

        if [[ -n ${HELM_BIN} ]]; then
          alias "${K8S_CONF}-h"="${HELM_BIN} --kubeconfig='${K8S_CONFD}/${K8S_CONF}/config'"
        fi
      fi

    fi
  done
fi
