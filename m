Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B38735C5E
	for <lists+linux-next@lfdr.de>; Mon, 19 Jun 2023 18:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbjFSQpc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jun 2023 12:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232357AbjFSQo5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2023 12:44:57 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF371702
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 09:44:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so9127175a12.1
        for <linux-next@vger.kernel.org>; Mon, 19 Jun 2023 09:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1687193087; x=1689785087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvChMOwZFZ2731U67nUr7jD+9YjSwDaijH2KuLSlnQU=;
        b=dqnDtEgE802DF2yzx1ijAtFdHVLsIX/P86p0xOsCR6lKz7yW5aqZ3sj/lOdPMsgDQu
         qzgtHKxEdk7NV8ucLaVTdGK0UWwcVN5lh+P0LSWCdYVF0dtls/3ZLu/Wa+OMEY/GZFV7
         47tppJTVSaMBhD/EDiy0vfJnyO4yx0X0rMj8Yyi8TK1kuMwzonzbs3uhaX7Y2F+12ejG
         12Y6ELHKmqOLwiO6rHNc6Ndgq5Efm3U32Jwhke6KBjsXQ2mdzQkB0HsOvMFgEEM5Brmg
         y1JuyfhhpqMf0k2DOos/QdIF52t9pK1WZnq336BZ7vE0xCYwWMSkgkLhHarcJdr2miAH
         vXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687193087; x=1689785087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvChMOwZFZ2731U67nUr7jD+9YjSwDaijH2KuLSlnQU=;
        b=bBqMpfaVwPYDl0oVQDMcq+C0wgKZslb2vCJAzXu+Rmq2oqhkwOiV4ndm8GQY+FApdS
         b2o3L1fHkE0OSlvHGdwyLfSb3Nr6IU5w+P/JRDeNBqMPPllef7NdaZso1ecEUF16Fq+r
         5l4UMgHuqYHZVj4Fw4RnLqLiWWTLdmwUcVHc3WOEwwmhD8Wax1ecbvMjDej57ie0Mn+g
         IgvhEz+OUR5j7Lx74kp91mbNZb3Ni0ZAEChdP9VcPk9gcw11PsZIROSsD/gDl9jL1NO8
         K+duJ0AvUWJVmuTfWi5GRTbH0qPFobxikA83OfcSYmW/AjL7OIw3JOkKqbk14EdwMEwu
         elbg==
X-Gm-Message-State: AC+VfDy4sFYHCinWDEntWqHhWKbID4hwiECy74bmaJgn7OZGZdATArlx
        iW+WiOSPX9wRV0b+aIb74Oa5f+f/LpkHzZPdPNmclA==
X-Google-Smtp-Source: ACHHUZ6oSj/i6Pykedq2ySsISQglFJicZjuCcGa7TXEAoC1+pp+dVicruuI7Lb36pj/NzDmsI8BaGgcXUl5VCyUNogo=
X-Received: by 2002:aa7:d64a:0:b0:50b:c456:a72a with SMTP id
 v10-20020aa7d64a000000b0050bc456a72amr9189226edr.19.1687193087364; Mon, 19
 Jun 2023 09:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvtPPhG6w8Ge2_YOdQ6F0nSNA1q-2JLej=6gsyoCT-0ag@mail.gmail.com>
 <ZJBRcG4gPA2wzgax@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZJBRcG4gPA2wzgax@FVFF77S0Q05N.cambridge.arm.com>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 19 Jun 2023 22:14:35 +0530
Message-ID: <CAAhSdy1Kxb0cYteEDA2bun3p_JwFSPbiqrecZfLp9uKFXe7rBg@mail.gmail.com>
Subject: Re: next: arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared
 function 'arch_atomic_long_fetch_or'
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        lkft-triage@lists.linaro.org, Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 19, 2023 at 6:30=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Mon, Jun 19, 2023 at 03:27:47PM +0530, Naresh Kamboju wrote:
> > Following build regressions noticed on Linux next-20230619.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > Regressions found on riscv:
> >
> >  - build/rv32-clang-16-lkftconfig
> >  - build/rv32-clang-16-tinyconfig
> >  - build/rv32-clang-nightly-defconfig
> >  - build/rv32-clang-16-allnoconfig
> >  - build/gcc-12-defconfig
> >  - build/gcc-11-lkftconfig
> >  - build/clang-16-lkftconfig
> >  - build/rv32-clang-16-defconfig
> >  - build/gcc-8-defconfig
> >  - build/rv32-gcc-11-lkftconfig
> >  - build/clang-16-defconfig
> >  - build/rv32-clang-nightly-allnoconfig
> >  - build/rv32-clang-nightly-tinyconfig
> >  - build/clang-nightly-defconfig
> >
> >
> > arch/riscv/kvm/aia_imsic.c:237:9: error: call to undeclared function
> >  'arch_atomic_long_fetch_or'; ISO C99 and later do not support implicit
> >     function declarations [-Wimplicit-function-declaration]
> >         return arch_atomic_long_fetch_or(val, (atomic_long_t *)ptr);
> >                ^
> > arch/riscv/kvm/aia_imsic.c:237:9: note: did you mean 'raw_atomic_long_f=
etch_or'?
> > include/linux/atomic/atomic-long.h:1087:1: note:
> > 'raw_atomic_long_fetch_or' declared here
> > raw_atomic_long_fetch_or(long i, atomic_long_t *v)
> > ^
> > 1 error generated.
>
> It looks like this is because:
>
>   2f68d5420412040e ("RISC-V: KVM: Add in-kernel virtualization of AIA IMS=
IC")
>
> ... added a call to arch_atomic_long_fetch_or(), but we've reworked the a=
tomics
> in the tip locking/core branch such that arch_atomic_long_fetch_or() does=
n't
> exist unless provided directly by the architecture.
>
> Does this actually need to be arch_atomic_long_fetch_or(), i.e. was there=
 a
> specific reason not to use atomic_long_fetch_or() here?
>
> If not, then please use atomic_long_fetch_or() -- that'll work before and=
 after
> the locking/core changes.

There is no specific reason for using arch_atomic_long_fetch_or().
I will update the patch to use atomic_long_fetch_or().

Thanks for catching.

Regards,
Anup
