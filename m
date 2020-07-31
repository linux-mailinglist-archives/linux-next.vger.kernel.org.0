Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950D923413F
	for <lists+linux-next@lfdr.de>; Fri, 31 Jul 2020 10:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731510AbgGaIbK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 31 Jul 2020 04:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730268AbgGaIbK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2020 04:31:10 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35D4C061575
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 01:31:09 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id e20so2198676uav.3
        for <linux-next@vger.kernel.org>; Fri, 31 Jul 2020 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gfLaTJi3HvuSfdEe5h9GZbRHZDIs/RpxGyTSvuwTLOA=;
        b=dN9reR2Jx4AJzk00vuPel0cO9u2V2RtbysmbLrr08J0dkl3trDKyBVMKXbAe0xcy0O
         CYngVLfEaCZqSXiuRkbdvlvAjOZEiLZD/37ccGgDDkqSA1jPHmToRQ7wEANvm9Or9a6X
         HtsPExfwSZBYUyNwXdNOOFWmYroM2T92pBzsLYP5Wvw0t6muWWk7o3Mig1BO6PeDIWqA
         Iadifv1FqyIKpqzTQ7vXz/VPMxzXRqPm32TSFzpAh4F9Lwuis2IxmoBFCQuYE3XMZklQ
         rO+nG8Z7aHHRDGVpPQ8KYcP2QK+5AGZMK7WDuUeh6WluEIwN2Yv7vTmzYbbr3toRRYTc
         K57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gfLaTJi3HvuSfdEe5h9GZbRHZDIs/RpxGyTSvuwTLOA=;
        b=YewQz5vMI+kFWMrBx58yiVFThek2E90xJ2yXI0gtteYPwrSlaK7639woMZdctONIgD
         vj5esB4xIABv+/NUr8njgrBIoxfLW7a2gk0NsPSfrbUWrWHfzcpARrRbi090sO4JQsCx
         RyLLMalnz2rHfm7+o0L59u3/2YXptlJq9YJOvOdmZZDofSkr/aDdvNT7uNn+2krBsIvv
         jO2xEi4q8xApXuz/COiuRQ92KuVZJwSiRe1mq8YzVsPpPT7t6nK7SJ4+nGXGae05++m1
         zRj/t5Vo+8m6DG118tGHxDTr9ZhdMCFvsz+6RVKU/VIJHg8eemq2DFzQcmCAS/Whj3ir
         RspA==
X-Gm-Message-State: AOAM532mdZWjrqRtvA+Hb4VDgyKbIGDTilzNBZSuUvTT5aVwFb6asejm
        e6nVRO3EYZlka2TlFiMyG8M22BGSyA8CvV11zRw2IQ==
X-Google-Smtp-Source: ABdhPJwQVzirtixovCQtGfXBlIebbtMrPcz4JGVFblBuoP/DuVxyBIaqXQpCcKsqUvXNZUZbc7zxOvP6PHCob34hIeo=
X-Received: by 2002:ab0:5a72:: with SMTP id m47mr1764468uad.86.1596184268349;
 Fri, 31 Jul 2020 01:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200730214659.0fbfdfc4@canb.auug.org.au> <72b073ba-ee41-1a1c-ce6c-ffd8b5936b09@hisilicon.com>
 <20200731140842.46abe589@canb.auug.org.au>
In-Reply-To: <20200731140842.46abe589@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 31 Jul 2020 14:00:57 +0530
Message-ID: <CA+G9fYvykg9Ly=tRXLrf4hvd4siYKAt5eM0EMnwMgqVDHnbVYQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 30 [build failure on arm64]
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@lst.de>
Cc:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 31 Jul 2020 at 09:38, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> On Fri, 31 Jul 2020 10:46:52 +0800 Shaokun Zhang <zhangshaokun@hisilicon.=
com> wrote:
> >
> > There's a build failure on arm64:
> >
> > In file included from ./include/linux/compat.h:17:0,
> >                  from ./arch/arm64/include/asm/stat.h:13,
> >                  from ./include/linux/stat.h:6,
> >                  from ./include/linux/sysfs.h:22,
> >                  from ./include/linux/kobject.h:20,
> >                  from ./include/linux/of.h:17,
> >                  from ./include/linux/irqdomain.h:35,
> >                  from ./include/linux/acpi.h:13,
> >                  from ./include/acpi/apei.h:9,
> >                  from ./include/acpi/ghes.h:5,
> >                  from ./include/linux/arm_sdei.h:8,
> >                  from arch/arm64/kernel/asm-offsets.c:10:
> > ./include/linux/fs.h: In function =E2=80=98vfs_whiteout=E2=80=99:
> > ./include/linux/fs.h:1709:32: error: =E2=80=98S_IFCHR=E2=80=99 undeclar=
ed (first use in this function)
> >   return vfs_mknod(dir, dentry, S_IFCHR | WHITEOUT_MODE, WHITEOUT_DEV);
> >                                 ^
> > ./include/linux/fs.h:1709:32: note: each undeclared identifier is repor=
ted only once for each
> > function it appears in
> > ./include/linux/fs.h: At top level:
> > ./include/linux/fs.h:1855:46: warning: =E2=80=98struct kstat=E2=80=99 d=
eclared inside parameter list
> >   int (*getattr) (const struct path *, struct kstat *, u32, unsigned in=
t);
> >                                               ^
> > ./include/linux/fs.h:1855:46: warning: its scope is only this definitio=
n or declaration, which is
> > probably not what you want
> > ./include/linux/fs.h: In function =E2=80=98__mandatory_lock=E2=80=99:
> > ./include/linux/fs.h:2325:25: error: =E2=80=98S_ISGID=E2=80=99 undeclar=
ed (first use in this function)
> >   return (ino->i_mode & (S_ISGID | S_IXGRP)) =3D=3D S_ISGID;
> >                          ^
> > ./include/linux/fs.h:2325:35: error: =E2=80=98S_IXGRP=E2=80=99 undeclar=
ed (first use in this function)
> >   return (ino->i_mode & (S_ISGID | S_IXGRP)) =3D=3D S_ISGID;
> >                                    ^
> > ./include/linux/fs.h: In function =E2=80=98invalidate_remote_inode=E2=
=80=99:
> > ./include/linux/fs.h:2588:6: error: implicit declaration of function =
=E2=80=98S_ISREG=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
> >       ^
> > ./include/linux/fs.h:2588:32: error: implicit declaration of function =
=E2=80=98S_ISDIR=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >   if (S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
> >                                 ^
> > ./include/linux/fs.h:2589:6: error: implicit declaration of function =
=E2=80=98S_ISLNK=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >       S_ISLNK(inode->i_mode))
> >       ^
> > ./include/linux/fs.h: In function =E2=80=98execute_ok=E2=80=99:
> > ./include/linux/fs.h:2768:26: error: =E2=80=98S_IXUGO=E2=80=99 undeclar=
ed (first use in this function)
> >   return (inode->i_mode & S_IXUGO) || S_ISDIR(inode->i_mode);
>
> Presumably caused by commit
>
>   b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")

I have reverted this commit
  b902bfb3f0e9 ("arm64: stop using <asm/compat.h> directly")

and rebuilt arm64 failed due to below errors/warnings.

make -sk KBUILD_BUILD_USER=3DTuxBuild -C/linux -j16 ARCH=3Darm64
CROSS_COMPILE=3Daarch64-linux-gnu- HOSTCC=3Dgcc CC=3D"sccache
aarch64-linux-gnu-gcc" O=3Dbuild Image
#
In file included from ../include/linux/stat.h:6,
                 from ../include/linux/sysfs.h:22,
                 from ../include/linux/kobject.h:20,
                 from ../include/linux/of.h:17,
                 from ../include/linux/irqdomain.h:35,
                 from ../include/linux/acpi.h:13,
                 from ../include/acpi/apei.h:9,
                 from ../include/acpi/ghes.h:5,
                 from ../include/linux/arm_sdei.h:8,
                 from ../arch/arm64/kernel/asm-offsets.c:10:
../arch/arm64/include/asm/stat.h:20:2: error: unknown type name =E2=80=98co=
mpat_u64=E2=80=99
   20 |  compat_u64 st_dev;
      |  ^~~~~~~~~~
../arch/arm64/include/asm/stat.h:31:2: error: unknown type name =E2=80=98co=
mpat_u64=E2=80=99
   31 |  compat_u64 st_rdev;
      |  ^~~~~~~~~~
../arch/arm64/include/asm/stat.h:34:2: error: unknown type name =E2=80=98co=
mpat_s64=E2=80=99
   34 |  compat_s64 st_size;
      |  ^~~~~~~~~~
../arch/arm64/include/asm/stat.h:36:2: error: unknown type name =E2=80=98co=
mpat_u64=E2=80=99
   36 |  compat_u64 st_blocks; /* Number of 512-byte blocks allocated. */
      |  ^~~~~~~~~~
../arch/arm64/include/asm/stat.h:47:2: error: unknown type name =E2=80=98co=
mpat_u64=E2=80=99
   47 |  compat_u64 st_ino;
      |  ^~~~~~~~~~
make[2]: *** [../scripts/Makefile.build:114:
arch/arm64/kernel/asm-offsets.s] Error 1

- Naresh
