# mac intel fortran コンパイラ

# ダウンロードリンク
https://registrationcenter-download.intel.com/akdlm/IRC_NAS/2516a0a0-de4d-4f3d-9e83-545b32127dbb/m_BaseKit_p_2023.1.0.45568.dmg
https://registrationcenter-download.intel.com/akdlm/IRC_NAS/a99cb1c5-5af6-4824-9811-ae172d24e594/m_HPCKit_p_2023.1.0.44543.dmg

# コマンド
```bash
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true
touch .zshrc
ifort
```

# .zshrc
```bash
source /opt/intel/oneapi/setvars.sh
ulimit -s unlimited
ifx(){
ifort "$@" 2>&1 | grep -v -E "(ld: warning|-macosx_version_min)"
}
```


# omp_num.f90
```fortran
program omp_thread_example
   use omp_lib
   implicit none

   ! 宣言
   integer :: num_threads, thread_id

   ! 並列領域
   !$omp parallel private(thread_id)
   ! スレッド番号を取得
   thread_id = omp_get_thread_num()

   ! スレッド数を取得 (マスタースレッドのみ取得)
   !$omp master
   num_threads = omp_get_num_threads()
   print *, 'Total number of threads = ', num_threads
   !$omp end master

   ! 各スレッドの番号を出力
   print *, 'Thread ID = ', thread_id, ' out of ', omp_get_num_threads()
   !$omp end parallel

end program omp_thread_example
```
# コマンド
```bash
cd documents
ifx –qopenmp omp_num.f90 –o omp_num
./omp_num
```

