Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602BB4758C0
	for <lists+linux-next@lfdr.de>; Wed, 15 Dec 2021 13:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242408AbhLOMWU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Dec 2021 07:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237046AbhLOMWU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Dec 2021 07:22:20 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02129C06173E
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 04:22:20 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r25so73474166edq.7
        for <linux-next@vger.kernel.org>; Wed, 15 Dec 2021 04:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=oSus18PkSQk7gaytbRQXd7Pr8Yd4R6m1hBQBrNUfHLE=;
        b=y+eQK2rhs+UjIgjo9x69K8aIQYOroKmJuPG1jDDKFceYUMCfHo6EmOe3EMcbHiyttE
         tqz2hYNwc/xY/rDNVE3WQUF11ihYsWNBzyEVHWwxszBhUWkH7msjY+ZCSibR8SQqnG+/
         e++mBzxIudYCY1s4bQ4oynQOnVMYbOYO9Vu/dbqZ/t3zRkMryKnE1uwbLe9pryRW0rtn
         cswMA13TK0ufoF/ziCW8GSKl4ecNRNE8F2kVlk4/DHYcqG+teXY0IBSS9NyNhInjkycg
         kcqXh0Gjl2lSdRrOT2pqAUaCju16VBsJhLNaYm2nnN/ohGpvTnuY0jloFd6N/j8dz1AY
         UOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=oSus18PkSQk7gaytbRQXd7Pr8Yd4R6m1hBQBrNUfHLE=;
        b=wgoqENhgNLnoerphuyaPBKZRyp5R2AuoG758gWFlGlpORCtohoT4kXLE/5T6CXAN97
         0k9gog+X18GcXC1bUc02t14FkHNVKW0BHSlPRkMthpgYh9GLsmQnWdzEg0xGwP618zgt
         NwffzAjRYrPNAKziZJfjYabi2QJobU+k1a+pIQ8kan56mDV8rT02av1S8AB6KokR77pn
         AXXxEKbLM8BlpNqpovf2W0av4u2I53xfFfYCxMoiGC8F4/CjStFBXQscrxOfmnlgyqYi
         cInYalzbRPNjuD8Ni8ewTydCWCyuj040k6SYt/LBP9GxTFEWTEyxGktEl5UpwYLd9Q43
         jEcA==
X-Gm-Message-State: AOAM5302/1cX5XtRRrdL8Z3yKNFW1eU1o4BrPeTGkLS7fiA/lz8SS5XO
        JOF9gAO+ygG0kuCMLovK76W13XrB43Ge1Cp/Nz1UAWHPtcl8xQ==
X-Google-Smtp-Source: ABdhPJy38NvrpRrwmbljzVqKw93QXJ7vvsNCwOQ8Hn0fVKX84lb8CHKTNhIy4Af2FXOEV/Puop9I4HxysphjKkl6Blk=
X-Received: by 2002:a05:6402:4312:: with SMTP id m18mr14249776edc.273.1639570937702;
 Wed, 15 Dec 2021 04:22:17 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 15 Dec 2021 17:52:06 +0530
Message-ID: <CA+G9fYua-LEU7u3OA0=c8HnBjoU6WENh9Avc18GGLg8Dbf9ZAw@mail.gmail.com>
Subject: [next] powerpc: book3s_hv.c:4591:27: error: 'struct kvm_vcpu' has no
 member named 'wait'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Marc Zyngier <maz@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[ Please ignore this email if it is already reported ]

While building Linux next 20211214 powerpc defconfig with gcc-8/9/10/11
following warnings / errors noticed.

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/current ARCH=powerpc
CROSS_COMPILE=powerpc64le-linux-gnu- 'CC=sccache
powerpc64le-linux-gnu-gcc' 'HOSTCC=sccache gcc'
arch/powerpc/kvm/book3s_hv.c: In function 'kvmhv_run_single_vcpu':
arch/powerpc/kvm/book3s_hv.c:4591:27: error: 'struct kvm_vcpu' has no
member named 'wait'
   prepare_to_rcuwait(&vcpu->wait);
                           ^~
arch/powerpc/kvm/book3s_hv.c:4608:23: error: 'struct kvm_vcpu' has no
member named 'wait'
   finish_rcuwait(&vcpu->wait);
                       ^~
make[3]: *** [scripts/Makefile.build:289: arch/powerpc/kvm/book3s_hv.o] Error 1

meta data:
-----------
    git describe: next-20211214
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_sha: 0bafb8f3ebc84525d0ae0fcea22d12151b99312f
    git_short_log: 0bafb8f3ebc8 (\"Add linux-next specific files for 20211214\")
    target_arch: powerpc
    toolchain: gcc-8

steps to reproduce:
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch powerpc --toolchain gcc-8
--kconfig defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
https://builds.tuxbuild.com/22IPCvkz8z9pqpgCMPoNw7OstPD/

--
Linaro LKFT
https://lkft.linaro.org
