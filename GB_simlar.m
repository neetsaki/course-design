function  GB_sim = GB_simlar(L)
%�˺������ں���������GB�����ƶ�,LΪ�ܳ���m��,�˴�������3m��6m�Ĺ�
GB_sim=max(exp(-abs(L-3)),exp(-abs(L-6)));
end

