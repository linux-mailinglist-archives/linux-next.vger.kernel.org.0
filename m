Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455201AE9B5
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 05:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgDRDyg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 23:54:36 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:56968 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725320AbgDRDyg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 23:54:36 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
        by Forcepoint Email with ESMTP id A07EC6AC594D7362E8A3;
        Sat, 18 Apr 2020 11:54:34 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 18 Apr 2020 11:54:34 +0800
Received: from [10.65.91.233] (10.65.91.233) by dggeme762-chm.china.huawei.com
 (10.3.19.108) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Sat, 18
 Apr 2020 11:54:34 +0800
Subject: Re: Coverity: qm_vf_q_assign(): Error handling issues
To:     coverity-bot <keescook@chromium.org>
CC:     Zaibo Xu <xuzaibo@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        <linux-next@vger.kernel.org>
References: <202004171458.44E8EB82@keescook>
From:   Shukun Tan <tanshukun1@huawei.com>
Message-ID: <878432f5-f7d7-9a3c-c0cc-40bcc6ccc463@huawei.com>
Date:   Sat, 18 Apr 2020 11:54:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <202004171458.44E8EB82@keescook>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.65.91.233]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020/4/18 5:58, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20200417 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Thu Apr 2 14:53:02 2020 +0800
>     cd1b7ae3435c ("crypto: hisilicon - unify SR-IOV related codes into QM")
> 
> Coverity reported the following:
> 
> *** CID 1492651:  Error handling issues  (CHECKED_RETURN)
> /drivers/crypto/hisilicon/qm.c: 2317 in qm_vf_q_assign()
> 2311     	for (i = 1; i <= num_vfs; i++) {
> 2312     		if (i == num_vfs)
> 2313     			q_num += remain_q_num % num_vfs;
> 2314     		ret = hisi_qm_set_vft(qm, i, q_base, q_num);
> 2315     		if (ret) {
> 2316     			for (j = i; j > 0; j--)
> vvv     CID 1492651:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "hisi_qm_set_vft" without checking return value (as is done elsewhere 4 out of 5 times).
> 2317     				hisi_qm_set_vft(qm, j, 0, 0);

This is the rollback of previous hisi_qm_set_vft failure, We will not check the retrun again.

Thanks,
Shukun

> 2318     			return ret;
> 2319     		}
> 2320     		q_base += q_num;
> 2321     	}
> 2322
> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492651 ("Error handling issues")
> Fixes: cd1b7ae3435c ("crypto: hisilicon - unify SR-IOV related codes into QM")
> 
> Thanks for your attention!
> 
