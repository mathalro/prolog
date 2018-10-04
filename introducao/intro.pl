/* Alexandra, Barbara, e Rosa tem roupas em azul, verde, lilás, vermelho e amarelo.
Nenhuma delas veste amarelo com vermelho. Cada uma delas veste roupas com duas cores,
isto é, roupas tipo blusa e saia. Alexandra está vestindo o azul. Barbara está vestindo o
amarelo mas não o verde. Rosa veste o verde mas não se veste nem de azul e nem lilás. Uma
delas está de vermelho. Uma das cores é usada tanto por Barbara como por Rosa. Alexandra
e Barbara tem 04 cores entre elas. */

pessoa(alexandra).
pessoa(barbara).
pessoa(rosa).

cor(azul).
cor(verde).
cor(lilas).
cor(vermelho).
cor(amarelo).

roupa(blusa).
roupa(saia).

tem_cor(alexandra,azul).
tem_cor(barbara,amarelo).
tem_cor(rosa,verde).

nao_tem_cor(barbara,verde).
nao_tem_cor(rosa,azul).
nao_tem_cor(rosa,lilas).

veste(X, Cor1, Cor2) :-
	pessoa(X),									/* escolhe um X que seja pessoa */
	cor(Cor1),									/* escolhe uma Cor1 existente */
	cor(Cor2),									/* escolhe uma Cor2 existente */
	tem_cor(X,Cor1),							/* X deve ter a Cor1 */
	\+(nao_tem_cor(X,Cor2)),					/* Sabendo que X ja deve ter a Cor1, X deve poder ter a Cor2 */
	Cor1 \== Cor2,								/* As cores Cor1 e Cor2 não podem ser iguais */
	\+(((Cor1 = vermelho),(Cor2 = amarelo));	/* Nao pode haver amarelo e vermelho junto */
	  ((Cor1 = amarelo),(Cor2 = vermelho))).

achar_tudo :-
	veste(X,C1,C2),
	write(X),
	write(' -> '), write(C1), write(' e '), write(C2),
	nl,
	fail.

achar_tudo.