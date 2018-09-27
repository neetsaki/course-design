function  GB_sim = GB_simlar(L)
%此函数用于衡量管子与GB的相似度,L为管长（m）,此处仅考虑3m和6m的管
GB_sim=max(exp(-abs(L-3)),exp(-abs(L-6)));
end

