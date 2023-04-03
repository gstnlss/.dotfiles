PERL5_DIR="${HOME}/.perl5"

export PERL_MB_OPT="--install_base \"${PERL5_DIR}\""
export PERL_MM_OPT="INSTALL_BASE=${PERL5_DIR}"
export PERL5LIB="${PERL5_DIR}/lib/perl5"
export PATH="${PERL5_DIR}/bin:${PATH}"
export PERL_LOCAL_LIB_ROOT="${PERL5_DIR}:${PERL_LOCAL_LIB_ROOT}"
