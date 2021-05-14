Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E01A38071A
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 12:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhENKY3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 06:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbhENKY3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 May 2021 06:24:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D76FC061574
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 03:23:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m12so44008411eja.2
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qFvlD/6BZ28fWecjReUkM0S+uIcLjLXGLnAAXqLleOE=;
        b=DFjSplouAYxk8g+uU6Lmm98zjOYeoXUdkR3CRH8faIsFhibzsRykoB2DZhkNbhQ7QL
         TPhnR0j8RnnW3plqP+6O0Wxnpw6XlPuyHhGvi+jQV2QHxWG66sUB7m/mRcZLNYhfGXhy
         7CoUll/tJVrk2GFia2iGHneRPtlOpj1t/VC5rDD3u8zf/tr663x5oJT8ng1NWwqBFTOP
         kIt+nykxS07El/02YYYfKyjv/yfpCJozD9lpQOsztnavynYi7rqMyrPwKw2mgjQetwy8
         2R+4mOAny4f7A5tEVNw8YoW7Uazq99rE6YJqfnWZgFBN/8xgj2QceC1kovlcKyyJ3Y54
         iDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qFvlD/6BZ28fWecjReUkM0S+uIcLjLXGLnAAXqLleOE=;
        b=AeUwbS3LzkSmWUwWhADZlpCvaCY155G5qPwVqx1Wn695lKs6o5v93HE6pTNAQMG9SE
         dfe243qFGnFHR77J7jS0qtaF77Cvex6QynBjmGHvftRf0HZ3ae2OwNYCQoWsPa4P7zAX
         MWO+SPl8W7DUPtanm1eYLVrxpw7YVmFh6rnhbNKTIF3VtTxMO+kmf66zeHp9qcjM34lc
         qu1q5r+LBXdWtXfuzMTkgOottWXe5seT4buzSIbvUo7QtpsiaQeqIYaHHW8hOKWj6/Ok
         mqp2GXc9pTHKhFnE0zRO5wD0oX3iIR8cWGP/Ek0xOsE90KcWhP/iCwJn4kLEADpTEzM6
         NrRg==
X-Gm-Message-State: AOAM530He/54Bv1Twn0qELFE6HMY4J6ce1xVWOiNHe/Wa6uAvoF8lbkl
        ZAPtveb0Rqaz3xyaYdYoKDiGrWDi4MePkDr16o08Zw==
X-Google-Smtp-Source: ABdhPJy3xvOAXq45yI7qPsRL45PJ5C0F2LADSb0+HTVKyVLapOesgozoqdN35AGPQ1Be6TQ4mpGJ7eYkCDwk8eNu8Mk=
X-Received: by 2002:a17:906:fcdc:: with SMTP id qx28mr16285817ejb.375.1620987796824;
 Fri, 14 May 2021 03:23:16 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 14 May 2021 15:53:05 +0530
Message-ID: <CA+G9fYvX2hBci5ywRYYWrA0oD2ezAPG04YZkCgykRV-4QdW2AA@mail.gmail.com>
Subject: Re : mm/mremap: use range flush that does TLB and page walk cache flush
To:     linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        lkft-triage@lists.linaro.org, Chengyang Fan <cy.fan@huawei.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Joel Fernandes <joel@joelfernandes.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The LKFT build system detected these build warnings and errors.

Regressions found on parisc:
  - build/gcc-9-defconfig
  - build/gcc-9-tinyconfig
  - build/gcc-10-allnoconfig
  - build/gcc-10-tinyconfig
  - build/gcc-9-allnoconfig
  - build/gcc-10-defconfig


make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=parisc
CROSS_COMPILE=hppa-linux-gnu- 'CC=sccache hppa-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from /builds/linux/arch/parisc/include/asm/cacheflush.h:7,
                 from /builds/linux/include/linux/highmem.h:12,
                 from /builds/linux/include/linux/pagemap.h:11,
                 from /builds/linux/include/linux/ksm.h:13,
                 from /builds/linux/mm/mremap.c:14:
/builds/linux/mm/mremap.c: In function 'flush_pte_tlb_pwc_range':
/builds/linux/arch/parisc/include/asm/tlbflush.h:20:2: error: 'return'
with a value, in function returning void [-Werror=return-type]
   20 |  __flush_tlb_range((vma)->vm_mm->context, start, end)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:219:9: note: in expansion of macro 'flush_tlb_range'
  219 |  return flush_tlb_range(vma, start, end);
      |         ^~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:214:33: note: declared here
  214 | #define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/builds/linux/mm/mremap.c:215:20: note: in expansion of macro
'flush_pte_tlb_pwc_range'
  215 | static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[2]: *** [/builds/linux/scripts/Makefile.build:273: mm/mremap.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

steps to reproduce:
---------------------------

#!/bin/sh

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.


tuxmake --runtime podman --target-arch parisc --toolchain gcc-9
--kconfig allnoconfig


--
Linaro LKFT
https://lkft.linaro.org
