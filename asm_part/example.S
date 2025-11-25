.data
array:
  .word 1, -2, 3, 4, 5, 6, -7, 8, 9, 10, 11, 12, -13, 14, 15, 16, 17, 18, 19, -20

.text
.globl _start
start:
  li a1, 5
  li a2, 4
  la a0, array
  jal ra, get_min_count

get_min_count:
  li a3, 0 # ind1, от 0 до 4
  li a4, 0 # ind2, от 0 до 3
  li a5, 0 # result
loop:
  mul a6, a3, a2
  add a6, a6, a4      # теперь в а6 лежит индекс
  slli a6, a6, 2      # получаем из индекса адрес памяти
  mv t0, a0           # загружаем адрес массива
  add t0, t0, a6      # адрес нужного элемента
  lw a7, 0(t0)        # загружаем элемент в a7
  bgez a7, index_2m_change     # если этот элемент >= 0, то делаем переход, иначе сделаем следующую команду со сложением 
  addi a5, a5, 1
index_2m_change:
  addi a4, a4, 1
  sub t1, a4, a2
  beqz t1, index_1m_change
  j loop
index_1m_change:
  mv a4, x0
  addi a3, a3, 1
  sub t1, a3, a1
  beqz t1, tran_res_a0
  j loop
tran_res_a0:
  mv a0, a5 
  ret  # возврат из функции