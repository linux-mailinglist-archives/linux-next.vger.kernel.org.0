Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30649380678
	for <lists+linux-next@lfdr.de>; Fri, 14 May 2021 11:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhENJrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 May 2021 05:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhENJrG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 May 2021 05:47:06 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8D1C06174A
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 02:45:54 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id di13so34038316edb.2
        for <linux-next@vger.kernel.org>; Fri, 14 May 2021 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6Qmp+RccQaxdzALO6v4g1kv976Ka2lpKYW4G5pC6mxc=;
        b=H0ZgaAtV/qgmajkYofHy4Jl64BMzxDXTCZOWbrS87/XJHvtmz0x2MTAjX+tj+6V/Sx
         NGhiHe41B0FafmHCx++/otmptF7/7y7EKBkUh+uvMZDV/FadmJC4WUPCkAGq95b+bWeT
         7Q59T8ogJHKodDvTUcjQIailDdXiU119nPj+rNcPmOp4nzd37H+G3h7YaIu6R72X1eMy
         2LdwYtLFvaz7kZsKfkkhjugFOA3zZZT9PljBelvV845WQoah3XcMI6XuS1hbL3rn+Eh5
         qaVyrbDCCH2+vkIHmdT2sjdA0TjG7aldL3MlThQT5wLFEL3xdkOoDjziBEgwQinbC+2t
         1Gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6Qmp+RccQaxdzALO6v4g1kv976Ka2lpKYW4G5pC6mxc=;
        b=EqLiayoZj3WPAjM9gUjWV/ramKm8aR1/AS/StOOBdnGv9k4/WuV7KAdKlbU/rgxxm6
         e3LI0cNkDybbG/eqbdg931dZ/QRzVrQXLJlWrNU9pYojzgDyXmOKz45zSLSVrlu9Bs6/
         uaNv9UqJSmIhyIyTGB3b5boFKe3XbWMr56Avg50sm9kjQfy7AlwKsbnnJucMKuo5CDYW
         ckPqgwIMFJmQUYk0EaCgnCMPYSP+oFflCCuEOv+IQfVA9uelf55X4SoAkyK5AbTJXkGo
         DfX5KimFaMlNqNWmsDwxkZDAsasUTtMbIG4lzSFi/Ab0YsW88xBwi9OAAOUOZx7WSzry
         w+OQ==
X-Gm-Message-State: AOAM532whVsSISIuXmPQRA2sekJXzBQhF8QJMQnhrHRmWRKOfSjwXiib
        dP9CBjFKrvfRK1hzwXmsnlwMHHAEXxpq3fM/KrvZ7g==
X-Google-Smtp-Source: ABdhPJzwcrp92fEomlUb7zJDWtc5z87XJjNPMQBZbwTmf59+peMYaugHOGpPSSowEUO/VFFAHvq3dU2j0CrWG6Vb4CY=
X-Received: by 2002:aa7:c349:: with SMTP id j9mr54146167edr.230.1620985552748;
 Fri, 14 May 2021 02:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210513044710.MCXhM_NwC%akpm@linux-foundation.org>
 <151ddd7f-1d3e-a6f7-daab-e32f785426e1@infradead.org> <54055e72-34b8-d43d-2ad3-87e8c8fa547b@csgroup.eu>
 <20210513134754.ab3f1a864b0156ef99248401@linux-foundation.org> <a3ac0b42-f779-ffaf-c6d7-0d4b40dc25f2@infradead.org>
In-Reply-To: <a3ac0b42-f779-ffaf-c6d7-0d4b40dc25f2@infradead.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 14 May 2021 15:15:41 +0530
Message-ID: <CA+G9fYv79t0+2W4Rt3wDkBShc4eY3M3utC5BHqUgGDwMYExYMw@mail.gmail.com>
Subject: Re: mmotm 2021-05-12-21-46 uploaded (arch/x86/mm/pgtable.c)
To:     Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Mark Brown <broonie@kernel.org>, linux-fsdevel@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        mhocko@suse.cz, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 14 May 2021 at 02:38, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/13/21 1:47 PM, Andrew Morton wrote:
> > On Thu, 13 May 2021 19:09:23 +0200 Christophe Leroy <christophe.leroy@c=
sgroup.eu> wrote:
> >
> >>
> >>
> >>> on i386:
> >>>
> >>> ../arch/x86/mm/pgtable.c:703:5: error: redefinition of =E2=80=98pud_s=
et_huge=E2=80=99
> >>>   int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
> >>>       ^~~~~~~~~~~~
> >>> In file included from ../include/linux/mm.h:33:0,
> >>>                   from ../arch/x86/mm/pgtable.c:2:
> >>> ../include/linux/pgtable.h:1387:19: note: previous definition of =E2=
=80=98pud_set_huge=E2=80=99 was here
> >>>   static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot=
_t prot)
> >>>                     ^~~~~~~~~~~~
> >>> ../arch/x86/mm/pgtable.c:758:5: error: redefinition of =E2=80=98pud_c=
lear_huge=E2=80=99
> >>>   int pud_clear_huge(pud_t *pud)
> >>>       ^~~~~~~~~~~~~~
> >>> In file included from ../include/linux/mm.h:33:0,
> >>>                   from ../arch/x86/mm/pgtable.c:2:
> >>> ../include/linux/pgtable.h:1391:19: note: previous definition of =E2=
=80=98pud_clear_huge=E2=80=99 was here
> >>>   static inline int pud_clear_huge(pud_t *pud)

These errors are noticed on linux next 20210514 tag on arm64.
Regressions found on arm64 for the following configs.

  - build/gcc-9-defconfig-904271f2
  - build/gcc-9-tinyconfig
  - build/gcc-8-allnoconfig
  - build/gcc-10-allnoconfig
  - build/clang-11-allnoconfig
  - build/clang-10-allnoconfig
  - build/clang-12-tinyconfig
  - build/gcc-10-tinyconfig
  - build/clang-10-tinyconfig
  - build/clang-11-tinyconfig
  - build/clang-12-allnoconfig
  - build/gcc-8-tinyconfig
  - build/gcc-9-allnoconfig

make --silent --keep-going --jobs=3D8
O=3D/home/tuxbuild/.cache/tuxmake/builds/current ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu- 'CC=3Dsccache aarch64-linux-gnu-gcc'
'HOSTCC=3Dsccache gcc'
/builds/linux/arch/arm64/mm/mmu.c:1341:5: error: redefinition of 'pud_set_h=
uge'
 1341 | int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
      |     ^~~~~~~~~~~~
In file included from /builds/linux/include/linux/mm.h:33,
                 from /builds/linux/include/linux/pid_namespace.h:7,
                 from /builds/linux/include/linux/ptrace.h:10,
                 from /builds/linux/include/linux/elfcore.h:11,
                 from /builds/linux/include/linux/crash_core.h:6,
                 from /builds/linux/include/linux/kexec.h:18,
                 from /builds/linux/arch/arm64/mm/mmu.c:15:
/builds/linux/include/linux/pgtable.h:1387:19: note: previous
definition of 'pud_set_huge' was here
 1387 | static inline int pud_set_huge(pud_t *pud, phys_addr_t addr,
pgprot_t prot)
      |                   ^~~~~~~~~~~~
/builds/linux/arch/arm64/mm/mmu.c:1369:5: error: redefinition of
'pud_clear_huge'
 1369 | int pud_clear_huge(pud_t *pudp)
      |     ^~~~~~~~~~~~~~
In file included from /builds/linux/include/linux/mm.h:33,
                 from /builds/linux/include/linux/pid_namespace.h:7,
                 from /builds/linux/include/linux/ptrace.h:10,
                 from /builds/linux/include/linux/elfcore.h:11,
                 from /builds/linux/include/linux/crash_core.h:6,
                 from /builds/linux/include/linux/kexec.h:18,
                 from /builds/linux/arch/arm64/mm/mmu.c:15:
/builds/linux/include/linux/pgtable.h:1391:19: note: previous
definition of 'pud_clear_huge' was here
 1391 | static inline int pud_clear_huge(pud_t *pud)
      |                   ^~~~~~~~~~~~~~
make[3]: *** [/builds/linux/scripts/Makefile.build:273:
arch/arm64/mm/mmu.o] Error 1


Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>


Steps to reproduce:
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

tuxmake --runtime podman --target-arch arm64 --toolchain gcc-9
--kconfig tinyconfig


--
Linaro LKFT
https://lkft.linaro.org
