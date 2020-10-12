Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8404428BE8A
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 18:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390763AbgJLQ4Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 12:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390534AbgJLQ4M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Oct 2020 12:56:12 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54855C0613D0
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 09:56:11 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k6so18365507ior.2
        for <linux-next@vger.kernel.org>; Mon, 12 Oct 2020 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uGtCXDE+yC85EATgAOWUy4OTm5QzADu4nBEjXio7les=;
        b=sxb8k/hwI80eNFQLW8lSIbzTmeApaNpfv6ABK6bk3K/LiMAEfK9TvfMXucceZ/iZbE
         v2m0frgqW08gpea1+w4hvt4IXC6RJklW+UikIz2ciDsmSedBAykU9y0aTnLE5efQSqjq
         GPQFww8YoMOV7vS+ODWAh1hWTmHiQYIS0/nCJYoXrdL4Arz/i6rADS50od0KSsxuSUHg
         CYzzh3z6i9KAlkLMklJQ6KaqZO3GPl0lYNmyzimbaDTYAW4hiSogWx3Cq08hZi5sTlul
         qq3dc/NCGjPox7yiYHs8Cj03B5GZpOq11yUk0X5bJEkFKAIhUwDstOXsSmYByCBI9JaP
         Zq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uGtCXDE+yC85EATgAOWUy4OTm5QzADu4nBEjXio7les=;
        b=MOQjT1tD21UPj8jm20bH2of2y4NpMhKyXU5ARAKh9Sw8cInOWGcrDySSSowuGDvUFx
         yIFCcjw/IDNOn0wp06ZvdE2HLY1+51eIPpGx+qkw6gvL0N2roDUb3kG4q5fP2pZf+cL0
         ZxFRFvikLGw3RQcykjCuKvV/sX844QcizCg1tyyhMR7VYjMlg8KPMVcXZ+/kgVj+SGiK
         e3FXHhOGNWn5dsFADLfe2By+mk8eK71bJNvZV6AR8eZsLYXvEPFbF5h+CaxGhv3snaDr
         Vke42vs8RlqxKyCZTkYAPQSCRlyRSQY/mXisL5JkHCFoFlNqdbFLOR5Wwc4UG2Onpfqy
         m71Q==
X-Gm-Message-State: AOAM530yIzDkNuzCa52OK6vR/8wqIRpES37mBC2qwuqhEwtQgtwOTtt3
        saWfdMWLd7JdjPm5DOAzIS8nV61UFmW5bdcta9L+FWidLaVGsQ==
X-Google-Smtp-Source: ABdhPJwwoRyVM9yiqq135MM0Bel7b1I4N7nqmFTIUEhp6P10fswBgBayivHOj1k6ZvjPFWHFEQPQdp9Cea9aH51MAwo=
X-Received: by 2002:a02:7817:: with SMTP id p23mr19909334jac.57.1602521770491;
 Mon, 12 Oct 2020 09:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201012095158.779c6d9d@canb.auug.org.au> <CAK8P3a2gLDw8rOYPgg=-hnNcK_5NW-fGHmiJ3ntb0dbf1EjQOQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2gLDw8rOYPgg=-hnNcK_5NW-fGHmiJ3ntb0dbf1EjQOQ@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 12 Oct 2020 22:25:59 +0530
Message-ID: <CA+G9fYu-YKfCSE58+y83UgXDDTHVgnpNLOgWwAaCr2W63nFQbQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the asm-generic tree
To:     Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>, Qian Cai <cai@redhat.com>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 12 Oct 2020 at 13:33, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Oct 12, 2020 at 12:52 AM Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the arm64 tree got a conflict in:
> >
> >   arch/arm64/include/asm/mmu_context.h
> >
> > between commit:
> >
> >   f911c2a7c096 ("arm64: use asm-generic/mmu_context.h for no-op impleme=
ntations")
> >
> > from the asm-generic tree and commit:
> >
> >   48118151d8cc ("arm64: mm: Pin down ASIDs for sharing mm with devices"=
)
> >
> > from the arm64 tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tre=
e
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularl=
y
> > complex conflicts.
> >
>
> Sorry about that, I had pushed my asm-generic branch to the correct
> location on Friday after I noticed it was missing. Removed it again now
> until the end up the merge window.


arm64 build failed on today's tag 20201012.


make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
aarch64-linux-gnu-gcc" O=3Dbuild Image
#
In file included from ../arch/arm64/include/asm/mmu_context.h:257,
                 from ../arch/arm64/include/asm/efi.h:10,
                 from ../arch/arm64/xen/../../arm/xen/enlighten.c:19:
../include/asm-generic/mmu_context.h:34:19: error: redefinition of
=E2=80=98init_new_context=E2=80=99
   34 | static inline int init_new_context(struct task_struct *tsk,
      |                   ^~~~~~~~~~~~~~~~
In file included from ../arch/arm64/include/asm/efi.h:10,
                 from ../arch/arm64/xen/../../arm/xen/enlighten.c:19:
../arch/arm64/include/asm/mmu_context.h:180:1: note: previous
definition of =E2=80=98init_new_context=E2=80=99 was here
  180 | init_new_context(struct task_struct *tsk, struct mm_struct *mm)
      | ^~~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:283:
arch/arm64/xen/../../arm/xen/enlighten.o] Error 1
In file included from ../arch/arm64/include/asm/mmu_context.h:257,
                 from ../include/linux/mmu_context.h:5,
                 from ../kernel/sched/sched.h:54,
                 from ../kernel/sched/core.c:13:
../include/asm-generic/mmu_context.h:34:19: error: redefinition of
=E2=80=98init_new_context=E2=80=99
   34 | static inline int init_new_context(struct task_struct *tsk,
      |                   ^~~~~~~~~~~~~~~~
In file included from ../include/linux/mmu_context.h:5,
                 from ../kernel/sched/sched.h:54,
                 from ../kernel/sched/core.c:13:
../arch/arm64/include/asm/mmu_context.h:180:1: note: previous
definition of =E2=80=98init_new_context=E2=80=99 was here
  180 | init_new_context(struct task_struct *tsk, struct mm_struct *mm)
      | ^~~~~~~~~~~~~~~~

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

ref:
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/jobs/785569731

>
>        Arnd


- Naresh
