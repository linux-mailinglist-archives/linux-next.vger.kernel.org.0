Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE5B2C9D68
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 10:40:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729466AbgLAJXA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 04:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729460AbgLAJW7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 04:22:59 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A136C0613D3
        for <linux-next@vger.kernel.org>; Tue,  1 Dec 2020 01:22:13 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id t12so864750pjq.5
        for <linux-next@vger.kernel.org>; Tue, 01 Dec 2020 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wb51w+UCqgl6Rh3obfAP7ATnbPgDXE43SFkK4C8Azv4=;
        b=OfbGM5YScMkpWSgo5bcbRfWo5USISi0TOyfYjb1CChXcEZsK2h7bv2Hnv0ollA1KKW
         b3PZOSrXz2MslWlyIEBTYqjovFKWfyFC18mNW8vHXbZbE+Xx0Zgp/NNNF9uq8GvnRS1R
         TvacHgfkywihwXzPKio6FLgprNkJk1xNaqKARoNzwwsNqR/JwqMYbACwLUpEcCYrrAQY
         QDnPru2mOd5qptjM8RRENQiM7i8gDV0baxm1MfUjQoM9TokPi4QWeycJTBmv+c8kQTN2
         Ww0exlriyrCuwIYWgsNdrzqC3L6UcEzY2sO5bbdtwK3gUFSz8Ne31JD0p63/Tsz0PUqa
         avnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wb51w+UCqgl6Rh3obfAP7ATnbPgDXE43SFkK4C8Azv4=;
        b=tl8nhnXuYqm3sfRo3RaP7ubJdvE7hqfmq2ZvY0SwxrcPBExKgKEeWl9Tpe4IjPNPpl
         AzsmaGl++q6MkZAXpj4CeY6f70rMAOF0/DtpQlxCD7mMBcyYfSaSXwuwkOhDEsThIDQC
         XA7EjiHLrmNZKp3mNxLphiXXECnDCNRCp8ADTCmj7zDPy8IWykd5DGwgIM+0cj5YfYU3
         e/mcgDpMaoGmWTdTZx3Qi0ZYtH1eo4QFmVm9YCMBcoF0QeFhvxRACd/3i87olcfj6Fw7
         m4Ggx0NENM40sOOn4qI/rbp9QZ9dySTH2yaR4j2JYg2cC6Gld+6DRPsPN3mNurC+iolW
         iSsA==
X-Gm-Message-State: AOAM532SQcF7YEtTDeluiIgK57wq3elGngwcQAlNR7JaB+zl2w/Q97sA
        d6h0PEFf8gj035FXzullGEkDImplOh9Wqw89l5WuAw==
X-Google-Smtp-Source: ABdhPJzk8nYQ32DoI37/o9IauIVvInDQCL13OdGcbkD+mj+MBzl+gKvwwJZk045dG/EYVCzwJ+IR+tCRQyBPSkclrJY=
X-Received: by 2002:a17:902:fe05:b029:da:7345:c773 with SMTP id
 g5-20020a170902fe05b02900da7345c773mr2227181plj.20.1606814532992; Tue, 01 Dec
 2020 01:22:12 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtk3fKy7ct-rT=T8iFDhE4CbjGgdfxsOBrKT9y8ntwXyg@mail.gmail.com>
 <58f66f22-fd5f-685d-e608-99c35d89c1a3@linux.alibaba.com> <CA+G9fYs8jzvh6c3sfaMoCetQydtSrzsmcUvG4DpPW33bad7Q0A@mail.gmail.com>
In-Reply-To: <CA+G9fYs8jzvh6c3sfaMoCetQydtSrzsmcUvG4DpPW33bad7Q0A@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 1 Dec 2020 17:21:36 +0800
Message-ID: <CAMZfGtV2esvLeuXnQHC79xUHtuBKf2kkHOCGAVO1jcaRVvkiew@mail.gmail.com>
Subject: Re: [External] Re: BUG: KASAN: null-ptr-deref in workingset_eviction+0xf2/0x1e0
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>, inux-kernel@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, Cgroups <cgroups@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        alexander.h.duyck@linux.intel.com,
        Yafang Shao <laoar.shao@gmail.com>, richard.weiyang@gmail.co,
        Michal Hocko <mhocko@suse.com>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 1, 2020 at 5:09 PM Naresh Kamboju <naresh.kamboju@linaro.org> w=
rote:
>
> Hi Alex,
>
> On Tue, 1 Dec 2020 at 13:14, Alex Shi <alex.shi@linux.alibaba.com> wrote:
> >
> >
> >
> > =E5=9C=A8 2020/12/1 =E4=B8=8A=E5=8D=883:52, Naresh Kamboju =E5=86=99=E9=
=81=93:
> > > Crash log:
> > > -----------
> > > ioctl_sg01.c:81: TINFO: Found SCSI device /dev/sg1
> > > [  285.862123] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [  285.863025] BUG: KASAN: null-ptr-deref in workingset_eviction+0xf2=
/0x1e0
> > > [  285.863025] Read of size 4 at addr 00000000000000c8 by task kswapd=
0/245
> >
> > Hi Naresh,
> >
> > Good to know you again. :)
>
> Same here :)
>
> >
> > Would you like to use command to check whichh line cause the panic:
> >
> > scripts/faddr2line vmlinux workingset_eviction+0xf2/0x1e0
>
> scripts/faddr2line vmlinux workingset_eviction+0xf2/0x1e0
> workingset_eviction+0xf2/0x1e0:
> workingset_eviction at ??:?
>
>
> vmlinux and system.map files available in this location,
> https://builds.tuxbuild.com/1l0FDtgxYSNunuG5ERIXtvPjZ7R/
>
> >
> > I can't reproduce it. and my gcc version mismatch with yours.
>
> Please run below easy steps to reproduce.
> you may install docker and tuxmake.
>
> Please share if you have any debug patch or proposed fix patch,
> I would be happy to test.

This is the fix patch. Thanks.

https://lore.kernel.org/linux-mm/20201130132345.GJ17338@dhcp22.suse.cz/T/#m=
963f10e3e7f588156432131019136d53b7178bac

>
> Steps to reproduce:
> --------------------
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
> # tuxmake --runtime docker --target-arch x86_64 --toolchain gcc-9 \
> --kconfig defconfig \
> --kconfig-add https://builds.tuxbuild.com/1l0FDtgxYSNunuG5ERIXtvPjZ7R/con=
fig
>
> # run LTP
> # cd /opt/ltp
> # ./runltp -s ioctl_sg01
> # you see below crash
>
> - Naresh



--=20
Yours,
Muchun
