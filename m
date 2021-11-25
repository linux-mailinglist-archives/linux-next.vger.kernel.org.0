Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CFC45D58E
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 08:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235163AbhKYHiy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 02:38:54 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:28173 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbhKYHh1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 02:37:27 -0500
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J08hz4ttXz8vdg;
        Thu, 25 Nov 2021 15:32:19 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 15:34:07 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 15:34:06 +0800
Message-ID: <4d951721-caa2-f692-293d-ee8b93e62597@huawei.com>
Date:   Thu, 25 Nov 2021 15:34:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [next] kasan: shadow.c:528:33: error: 'VM_DELAY_KMEMLEAK'
 undeclared
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yongqiang Liu <liuyongqiang13@huawei.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Alexander Potapenko <glider@google.com>
References: <CA+G9fYuLv7491Q2AHcaUAQ2AQeFBQgx8w0DzK95Qf6Fh9gGFfQ@mail.gmail.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CA+G9fYuLv7491Q2AHcaUAQ2AQeFBQgx8w0DzK95Qf6Fh9gGFfQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Sorry for the missing change of VM_DEFER_KMEMLEAK.

I will  add Fixes tag and resend v4.

On 2021/11/25 15:13, Naresh Kamboju wrote:
> [ Please ignore this email if it is already reported ]
>
> While building Linux next 20211125 x86 with CONFIG_KASAN=y gcc-11
> following warnings / errors noticed.
>
> mm/kasan/shadow.c: In function 'kasan_module_alloc':
> mm/kasan/shadow.c:528:33: error: 'VM_DELAY_KMEMLEAK' undeclared (first
> use in this function); did you mean 'VM_DEFER_KMEMLEAK'?
>    528 |                 if (vm->flags & VM_DELAY_KMEMLEAK)
>        |                                 ^~~~~~~~~~~~~~~~~
>        |                                 VM_DEFER_KMEMLEAK
> mm/kasan/shadow.c:528:33: note: each undeclared identifier is reported
> only once for each function it appears in
> make[3]: *** [scripts/Makefile.build:288: mm/kasan/shadow.o] Error 1
>
> Build config:
> https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/config
>
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> meta data:
> -----------
>      git describe: next-20211125
>      git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>      git_sha: f81e94e91878bded599cc60f2881cfd50991aeb9
>      git_short_log: f81e94e91878 (\"Add linux-next specific files for 20211125\")
>      target_arch: x86
>      toolchain: gcc-11
>
> steps to reproduce:
> tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
> --kconfig defconfig \
> --kconfig-add https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/config
>
> https://builds.tuxbuild.com/21OjEyx87iCX9bqOwJrZdl1wFFj/tuxmake_reproducer.sh
>
> --
> Linaro LKFT
> https://lkft.linaro.org
> .
