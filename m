Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57FC316A17
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 16:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhBJPZe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 10:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbhBJPZX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 10:25:23 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91141C061756
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 07:24:41 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id l25so4893535eja.9
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 07:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4aW7+bqzSkwg4GkezviAvU8O+1pGE5lGyhjOL2uEFFc=;
        b=WKu4dVPxki/iRV7Ygrt2fHQ86P6H3AXhQiayLdJf6MXq/7d8tehEzPvBmPLIl4i3mH
         wGpRzaLUjLW2343x/GoQhNMt/gYQ7Bn/+gOw8ReeaoLq3FsUloHoczUogsPxbuk83aSm
         pvbYbs3l1C+7ShjE+F/vdiMcCw4/bonOYBWw+UPsWXiHWSgnG7QxL4CwSQYy1qzMyomA
         x35zoyp2W5pwKRwgNPeRhbLijgjc6Vz6luFnTLarvF71S0pcEyi/8T5xiUho3c9LHS7q
         E5yy+b6OhQfrk/S/QivJgtsE3LrglQSySi5QGhNxa/kP9BtvUHuxBQHQPXELoftePz6Q
         IK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4aW7+bqzSkwg4GkezviAvU8O+1pGE5lGyhjOL2uEFFc=;
        b=WIUnJwaOUte49j83rcRVDkMkvGxelQcurD4TEX/350nL6mxNweeromYxQXIoFsujF+
         My/ROFhySmauwTTie/gCbsNIlMIraNZT3WqljGZQBf7YbfG0s+De2sJqF0/QX5Xq9fwQ
         0Q2hqBgcuPGa0n6qoTnDAUf5/tmrVJQFdV6/7ipUkSJWKMZ0m52/0S74fJX6zaDj96xi
         3560u3wHy7CeN/6aaE8+Ce2v4sw9P7D/b6QWPlsWULCXh3sXOaeI8RN5s4lhnfwR4U2Z
         yMhjqsDHHSmw/xDtjmnRXT7eYRcw8ADX9lN/rPZ68zgo26JRGOlfnUjnOc1XB0kZg+f/
         4vBQ==
X-Gm-Message-State: AOAM533C7ZtpgRzrnJ36nBNJvyl/sbwhBtdVm8GUi8yhhEguP5gqTlid
        oneMXl1o5OFXFxV58rZmLZFLOl3naIbtYX1G8r+2Ag==
X-Google-Smtp-Source: ABdhPJxYhVyRhFYeu14oygGNiBEYx0kkZcWCucEoUMbfsyJUNG7oMa6NJWoFfQf6Xigon3DpfILd1rY3a40h4YWsPJE=
X-Received: by 2002:a17:906:24d1:: with SMTP id f17mr3398125ejb.503.1612970680122;
 Wed, 10 Feb 2021 07:24:40 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtkWdeL7-nfXW8+VbaCK7swinU_Ksn67RW4FFD+cx8VYg@mail.gmail.com>
 <8e1322cf-4498-43b6-1dbd-665b7f016815@redhat.com>
In-Reply-To: <8e1322cf-4498-43b6-1dbd-665b7f016815@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 10 Feb 2021 20:54:28 +0530
Message-ID: <CA+G9fYvM7Tv0fe0EEqiW1x3ODSe6cc-aqA9h-BMf+_gFOKL_Lw@mail.gmail.com>
Subject: Re: [next] [mips] spinlock.h:17:28: error: redefinition of 'queued_spin_unlock'
To:     Waiman Long <longman@redhat.com>
Cc:     linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Paul Burton <paul.burton@mips.com>,
        Will Deacon <will@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 10 Feb 2021 at 20:32, Waiman Long <longman@redhat.com> wrote:
>
> On 2/10/21 12:30 AM, Naresh Kamboju wrote:
> > While building Linux next tag 20210209 mips uImage.gz failed with below configs
> >
> >    - mips (cavium_octeon_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
> >    - mips (malta_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
> >    - mips (nlm_xlp_defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
> >    - mips (defconfig) with gcc-8, gcc-9 and gcc-10 - FAILED
> >
> > make --silent --keep-going --jobs=8
> > O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=mips
> > CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
> > 'HOSTCC=sccache gcc' uImage.gz
> > In file included from /include/linux/spinlock.h:90,
> >                   from /include/linux/ipc.h:5,
> >                   from /include/uapi/linux/sem.h:5,
> >                   from /include/linux/sem.h:5,
> >                   from /include/linux/compat.h:14,
> >                   from /arch/mips/kernel/asm-offsets.c:12:
> > /arch/mips/include/asm/spinlock.h:17:28: error: redefinition of
> > 'queued_spin_unlock'
> >     17 | #define queued_spin_unlock queued_spin_unlock
> >        |                            ^~~~~~~~~~~~~~~~~~
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >
> > build link,
> > https://builds.tuxbuild.com/1oF9lkBAeWM2WvR11O2Yun8ERNT/
> >
> I have just posted a patch to reorder qspinlock.h and qrwlock.h include
> ordering. Hopefully that can fix the compilation problem though I don't
> have a mips building environment to verify that.


That was a global problem now it is getting solved by "tuxmake "

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

tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig cavium_octeon_defconfig

build link,
https://builds.tuxbuild.com/1oF9lkBAeWM2WvR11O2Yun8ERNT/

- Naresh
