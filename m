Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938DA3B282C
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 09:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbhFXHIB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Jun 2021 03:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhFXHIA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2021 03:08:00 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80DBC06175F
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 00:05:41 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id u2so2774042qvp.13
        for <linux-next@vger.kernel.org>; Thu, 24 Jun 2021 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uyb2tZAPltFwu0/3f+8N1Whypmr/BCkiRPdpo/+aATQ=;
        b=1k4BwsViMRanh9l3pCxYXbVk+Oyx377MNyaN+A7H1GoOF1uRYXQGng5Of4MMTa9UU3
         vORjZS6xeUVPxvspcQ+l+7w1fTkM0/00RGXBi45WRT5KU/9WAV/KPULzqMKBijts9khK
         F/lF/vsX/G4rPWOQsLPLocaEyCyCWwzGBf8kLIPp+hHU3hyhLJl3VUbudhMPApe30AUw
         RCSulmDgTqH92L5VXwVSOkzK+czifbqwhrLaP/jTRp1bG/lKc1y127f3Ieh+WAUpA4nc
         IaehzvKKDdPzLdpQu/ioAXIcbwjbMwFLZwax+0y3VVLjhiGZ1wN5ESUfl8EJFlxVCzcG
         c9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uyb2tZAPltFwu0/3f+8N1Whypmr/BCkiRPdpo/+aATQ=;
        b=a4HvRy1ltMoMwosBt95ksNVv2UssWgklvG48nLKO0gwtCtV96s7v3iG1OGXDTSbeEm
         IMD84Hb8shUM08o4Vr1H7rDXmwnXo8eJpwaDD6eJszQCLndiJoaZ8prImNGBhP0uu2K7
         0Yw9KE08Zbds+RVx/0E7TM9RjvSu4/6AOdkJE5wL3UFOAGWezdxvdkCOfKjrEY868whM
         UYYTnqbsxicZgxEobEOkQwVYHs7UKeK4kpFqNgd5q4rqj+h0d/Xc6w2iMOxQho7A7zYQ
         NDxZbUzdNqi9I0UGkx5DG2NtERtHvIF+K+j8CzecOVSTUXh0dQJiJ7wvWVJNZz+7fKrz
         HS9Q==
X-Gm-Message-State: AOAM533gEqmqOI0qC5XmyByE6dFny88R49ZYbMWZos/07POptj2ZdA4W
        +RdaYJ3BEcHPUXi+zkAnOOllUcNl6ZoNOCxV++b9Jg==
X-Google-Smtp-Source: ABdhPJyGJSZUCvOO+Zj3YeyJ93PvQJ+8PxOIr1FJk6NHef4t2hFw140HmPxZ6bPSrcxq2Ngz0CZqAkTIcWAnx9n6EWM=
X-Received: by 2002:a05:6214:a0f:: with SMTP id dw15mr4071409qvb.10.1624518340902;
 Thu, 24 Jun 2021 00:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210624082911.5d013e8c@canb.auug.org.au> <CAPv3WKfiL+sR+iK_BjGKDhtNgjoxKEPv49bU1X9_7+v+ytdR1w@mail.gmail.com>
 <YNPt91bfjrgSt8G3@Ryzen-9-3900X.localdomain> <CA+G9fYtb07aySOpB6=wc4ip_9S4Rr2UUYNgEOG6i76g--uPryQ@mail.gmail.com>
In-Reply-To: <CA+G9fYtb07aySOpB6=wc4ip_9S4Rr2UUYNgEOG6i76g--uPryQ@mail.gmail.com>
From:   Marcin Wojtas <mw@semihalf.com>
Date:   Thu, 24 Jun 2021 09:05:28 +0200
Message-ID: <CAPv3WKdPxhS6_kAe5Z=sJcss=kYf4CR4DThLL_Sdete3Hk95Dg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the net-next tree
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi All,


czw., 24 cze 2021 o 08:13 Naresh Kamboju <naresh.kamboju@linaro.org> napisa=
=C5=82(a):
>
> Hi Marcin,
>
> On Thu, 24 Jun 2021 at 07:59, Nathan Chancellor <nathan@kernel.org> wrote=
:
> >
> > On Thu, Jun 24, 2021 at 12:46:48AM +0200, Marcin Wojtas wrote:
> > > Hi Stephen,
> > >
> > > czw., 24 cze 2021 o 00:29 Stephen Rothwell <sfr@canb.auug.org.au> nap=
isa=C5=82(a):
> > > >
> > > > Hi all,
> > > >
> > > > Today's linux-next build (x86_64 modules_install) failed like this:
> > > >
> > > > depmod: ../tools/depmod.c:1792: depmod_report_cycles_from_root: Ass=
ertion `is < stack_size' failed.
>
> LKFT test farm found this build error.
>
> Regressions found on mips:
>
>  - build/gcc-9-malta_defconfig
>  - build/gcc-10-malta_defconfig
>  - build/gcc-8-malta_defconfig
>
> depmod: ERROR: Cycle detected: fwnode_mdio -> of_mdio -> fwnode_mdio
> depmod: ERROR: Found 2 modules in dependency cycles!
> make[1]: *** [/builds/linux/Makefile:1875: modules_install] Error 1
>
> > > Thank you for letting us know. Not sure if related, but I just found
> > > out that this code won't compile for the !CONFIG_FWNODE_MDIO. Below
> > > one-liner fixes it:
> > >
> > > --- a/include/linux/fwnode_mdio.h
> > > +++ b/include/linux/fwnode_mdio.h
> > > @@ -40,7 +40,7 @@ static inline int fwnode_mdiobus_register(struct mi=
i_bus *bus,
> > >          * This way, we don't have to keep compat bits around in driv=
ers.
> > >          */
> > >
> > > -       return mdiobus_register(mdio);
> > > +       return mdiobus_register(bus);
> > >  }
> > >  #endif
> > >
> > > I'm curious if this is the case. Tomorrow I'll resubmit with above, s=
o
> > > I'd appreciate recheck.
>
> This proposed fix did not work.
>
> > Reverting all the patches in that series fixes the issue for me.
>
> Yes.
> Reverting all the (6) patches in that series fixed this build problem.
>
> git log --oneline | head
> 3752a7bfe73e Revert "Documentation: ACPI: DSD: describe additional MAC
> configuration"
> da53528ed548 Revert "net: mdiobus: Introduce fwnode_mdbiobus_register()"
> 479b72ae8b68 Revert "net/fsl: switch to fwnode_mdiobus_register"
> 92f85677aff4 Revert "net: mvmdio: add ACPI support"
> 3d725ff0f271 Revert "net: mvpp2: enable using phylink with ACPI"
> ffa8c267d44e Revert "net: mvpp2: remove unused 'has_phy' field"
> d61c8b66c840 Add linux-next specific files for 20210623
>
> steps to reproduce, config and build log located here in this link,
> https://builds.tuxbuild.com/1uNjGjPUAI4XwwcwKFr5FUxkwzy/
>

Thank you for your reports. I'm currently trying to reproduce and come
back with a fix asap.

Best regards,
Marcin

>
> # TuxMake is a command line tool and Python library that provides
> # portable and repeatable Linux kernel builds across a variety of
> # architectures, toolchains, kernel configurations, and make targets.
> #
> # TuxMake supports the concept of runtimes.
> # See https://docs.tuxmake.org/runtimes/, for that to work it requires
> # that you install podman or docker on your system.
> #
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
>
>
> tuxmake --runtime podman --target-arch mips --toolchain gcc-10
> --kconfig malta_defconfig
>
>
> - Naresh
