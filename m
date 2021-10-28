Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8E43E462
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 16:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhJ1O7n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 10:59:43 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:26203 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhJ1O7n (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 10:59:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hg7sT2FS0z8ttS;
        Thu, 28 Oct 2021 22:55:41 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 22:57:04 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 22:57:03 +0800
Message-ID: <3555118a-914f-8c21-d5c9-7f3d969d357e@huawei.com>
Date:   Thu, 28 Oct 2021 22:57:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: riscv: delay.c:77:17: error: implicit declaration of function
 'cpu_relax' [-Werror=implicit-function-declaration]
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        <lkft-triage@lists.linaro.org>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "Stephen Rothwell" <sfr@canb.auug.org.au>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
References: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CA+G9fYs6X5ce1BhynpivZLU7MvPq+vkrJCM7oSJf8GJBApCqZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

 From c83a7b83ff96ba77a7c26090ccdd42aa7722788f Mon Sep 17 00:00:00 2001
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Date: Thu, 28 Oct 2021 23:03:13 +0800
Subject: [PATCH] riscv: Fix implicit declaration of function 'cpu_relax'

Including <asm/processor.h> to fix the implicit declaration of function
'cpu_relax'.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
After  "include/linux/delay.h: replace kernel.h with the necessary 
inclusions", we need this include.

  arch/riscv/lib/delay.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
index f51c9a03bca1..8148dcdee894 100644
--- a/arch/riscv/lib/delay.c
+++ b/arch/riscv/lib/delay.c
@@ -8,6 +8,8 @@
  #include <linux/timex.h>
  #include <linux/export.h>

+#include <asm/processor.h>
+
  /*
   * This is copies from arch/arm/include/asm/delay.h
   *
-- 
2.26.2


