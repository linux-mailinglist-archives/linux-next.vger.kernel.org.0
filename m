Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E59F707A55
	for <lists+linux-next@lfdr.de>; Thu, 18 May 2023 08:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjERGrf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 May 2023 02:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjERGrf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2023 02:47:35 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CFD12111;
        Wed, 17 May 2023 23:47:32 -0700 (PDT)
Received: from loongson.cn (unknown [113.200.148.30])
        by gateway (Coremail) with SMTP id _____8BxZ+kDymVkJMYJAA--.16826S3;
        Thu, 18 May 2023 14:47:31 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxi7YBymVkOWxnAA--.44835S3;
        Thu, 18 May 2023 14:47:30 +0800 (CST)
Subject: Re: next: perf: i386: bench/syscall.c:101:22: error: '__NR_execve'
 undeclared (first use in this function)
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-perf-users@vger.kernel.org, lkft-triage@lists.linaro.org
References: <CA+G9fYvgBR1iB0CorM8OC4AM_w_tFzyQKHc+rF6qPzJL=TbfDQ@mail.gmail.com>
Cc:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b28dc2c4-6694-1699-b4a2-a8e71d179073@loongson.cn>
Date:   Thu, 18 May 2023 14:47:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYvgBR1iB0CorM8OC4AM_w_tFzyQKHc+rF6qPzJL=TbfDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Bxi7YBymVkOWxnAA--.44835S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Zw15uF1rJF18CryDAw4kXrb_yoW8AFy3p3
        s2ywn7ta1rCw1Ykw1xAr18Kw43XrZ3G34Utw1UG3y8WF10q3y8Jr42kFWvg3WxXa1vka4Y
        9F4fuw4UXFWktw7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 05/17/2023 11:04 PM, Naresh Kamboju wrote:
> Linux next perf build failing for i386 architecture.
>  - build/gcc-11-lkftconfig-perf
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log:
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/syscall.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/tests/parse-events.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/build-id.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/cacheline.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/config.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/util/copyfile.o
>   CC      /home/tuxbuild/.cache/tuxmake/builds/1/build/bench/mem-functions.o
> bench/syscall.c: In function 'bench_syscall_common':
> bench/syscall.c:101:22: error: '__NR_execve' undeclared (first use in
> this function)

Hi Naresh,

Sorry for that, the __NR_execve definition for i386 was deleted
by mistake in the commit ece7f7c0507c ("perf bench syscall: Add
fork syscall benchmark").

Could you please help to check whether the build error can be
fixed with the following changes? If yes, I will send a formal
patch as soon as possible, thank you.

$ git diff tools/arch/x86/include/uapi/asm/unistd_32.h
diff --git a/tools/arch/x86/include/uapi/asm/unistd_32.h 
b/tools/arch/x86/include/uapi/asm/unistd_32.h
index b8ddfc4..bc48a4d 100644
--- a/tools/arch/x86/include/uapi/asm/unistd_32.h
+++ b/tools/arch/x86/include/uapi/asm/unistd_32.h
@@ -2,6 +2,9 @@
  #ifndef __NR_fork
  #define __NR_fork 2
  #endif
+#ifndef __NR_execve
+#define __NR_execve 11
+#endif
  #ifndef __NR_getppid
  #define __NR_getppid 64
  #endif

Thanks,
Tiezhu

