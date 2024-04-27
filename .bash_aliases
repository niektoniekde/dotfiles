# make alias for k8s configs
K8S_CONFD="${HOME}/.kube/conf.d"
if [[ -d ${K8S_CONFD} ]]; then
  IFS=$'\n'

  for K8S_CONF in $(ls ${K8S_CONFD}); do
    IFS=' '
    HELM_BIN=""
    KUBE_BIN=""
    CALI_PLG=""

    if  [[ ${K8S_CONF} =~ ^([a-zA-Z0-9_-]+)$ ]] && [[ -d ${K8S_CONFD}/${K8S_CONF} ]]; then
      if [[ -f ${K8S_CONFD}/${K8S_CONF}/config ]]; then

        if [[ -f ${K8S_CONFD}/${K8S_CONF}/path.env ]]; then
          . ${K8S_CONFD}/${K8S_CONF}/path.env;
        fi

        if [[ -n ${KUBE_BIN} ]]; then
          alias "${K8S_CONF}__k"="KUBECONFIG='${K8S_CONFD}/${K8S_CONF}/config' ${KUBE_BIN}"
        fi

        if [[ -n ${HELM_BIN} ]]; then
          alias "${K8S_CONF}__h"="KUBECONFIG='${K8S_CONFD}/${K8S_CONF}/config' ${HELM_BIN}"
        fi

        if [[ -n ${CALI_PLG} ]]; then
          alias "${K8S_CONF}__c"="KUBECONFIG='${K8S_CONFD}/${K8S_CONF}/config' ${KUBE_BIN} calico"
        fi
      fi

    fi
  done
fi
