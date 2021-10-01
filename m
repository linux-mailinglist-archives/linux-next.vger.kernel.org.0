Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079DE41F594
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 21:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354549AbhJATOq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 15:14:46 -0400
Received: from mout.gmx.net ([212.227.15.19]:48913 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhJATOp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 Oct 2021 15:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1633115573;
        bh=1/tD9+i6K79wJvk6mIUgFY5BXkVQQ7kg9CSnpwZJmy4=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=FXt3MCG81EhlBPWLYL2tltIxPJPCK3WXrbF7cNtj9+pInkpHo7bejF1wwI4pO2hbA
         nkB4wZ4ilE4jLfGuSg50D+eudNNMCKAdjLMOwHXg97C5YngEhLKDMubfxBM10vLOtA
         nmaw2eZQM1qODJco+oJNV7lgCYXffC2ASxM0UJ7s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.147.253]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1moalu3HJ8-00uoGT; Fri, 01
 Oct 2021 21:12:52 +0200
Message-ID: <2ef5185a-9a0f-5ee0-23fc-37e0b1dd1099@gmx.de>
Date:   Fri, 1 Oct 2021 21:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: parisc/unwind: call callback with toplevel address
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-parisc@vger.kernel.org
Cc:     Sven Schnelle <svens@stackframe.org>,
        James.Bottomley@hansenpartnership.com,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
References: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <CA+G9fYtsteSfwTQKV8o6VtBQDoz-+nwOf0s0X8BCkQHgAc6sdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m4bcQkSWj0lpLhyoxxSrxte4MHqoI3/QJ8CtZN1qb4ts3rsZxhw
 fSGMRLTYdCWL/xEY+sp2T6P1Fy9VKcJ1M9E5trpBZXTEaWzn+LE74awyOEqrbnYml/bFMw6
 BgIbLbMb/hNGs3lIA37JktxozVnDqFzjRj4qrWc0Jpyd7Km4I86pzCF+PFZz8TJIuqmvqMT
 DG7j4d/ShOWhMe5BF7Z5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vZJTgfu7RVY=:iI7xQry8ZZODMpie1mGAC4
 XL3Bh8CR9G5vNYd/8UlHHsw8W6HRUD3kL5Bl4JceR8KoNmCT8HoObzOH0+Wq7uGFRd4cdxVK1
 NfAlKQzhYJcLSc+fWzF5t3POV3MyWPwVDxKq2pVt8bDrOvQb+oupFBsghKxRa/3KhF5koknLG
 mi+/IKyU41UJA6tS6Cfsq1U5qHO0Zlwv0duPPBbO+QV3YIz98JDiHNYX6Gpt+Tl4VwknSjCc/
 6ISLNbqBWQtGXAw5M3SWzGIT9h2vhGcOaNNLnY2fmLRxmj3b97Z41nDdTQ6Vq1c8Aj50QDh39
 Uyf+9dVvmxA5pHGg9dVBJ/EXrhZ9aNd9tCMEDSptYUsnlURejf3DIMFnyN2ayYr/oxuWbC5Xw
 l9mspghsO5qio2S6anPQS0UFnhQn6Dei68Hrspc1qLKnQ5kkAmyw6QFwwuGRoLU7sAuOJRAwx
 Iu3rBmF6+g22JC6G4e6O0fWpwLhg4lrqUb2M6yHzyncDAUOTVrHFMTQ+BJUiMNNoGt9IrHqqR
 g7TgVk+Fy/q1qvmYWd7LBKZbMSLDiuDcvvqevsgq62PrckyhUBDUWbm/k3tihQhGbewl7W9c2
 8ObKLAUYsZD8oDJ8bzeNrUzALphLu3RpJznoVojhdjLrmyas/Zif7Nhi2FgtRfqrlsBcbLUe2
 x39eAZ1jKkiiD9qjV51+RxImlV/C/nNUr2zktAbd5EjJWCl5GCnrGoUuRiteyfkxAoXzL+Lvy
 qW6V9IyOCyjG7FhOxF8qmLMi43GXUSu0ZAV69Bi8nwww1KfVK5ISAId7PaExnjmjuIZ2QVHVw
 jCkh8wd6Ej0++tXJFYaEX6OTbxXUGRVivQtz3sq4NxkkN1SlLCab46akRBIb49iEynZPu55nw
 G0aenmRMOEeoQ8dvJo7+n4PRgxmHiDC8mREkdo6wUohm097qaMj3BnvvF37ogCUIZSwlpLTyX
 rzZgzB6btgLu85pG4OGe1FpxIFVKJ4AXRqJsGMgqNSOWZWe6+hXzR1pez9AHXfA4Hc7WrV8gL
 EXoZ5L1idGmGJHfFLQgJWq91SdOqpPXpl71uDuUed3zMexa7O9u64fGApUvYHNeMpJ2HIGtiu
 pNbm87LxSy6cmY=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/1/21 12:30, Naresh Kamboju wrote:
> Following build errors noticed while building Linux next 20211001
> with gcc-11 for parisc architecture.
>
> arch/parisc/kernel/stacktrace.c: In function 'dump_trace':
> arch/parisc/kernel/stacktrace.c:20:13: error: 'regs' undeclared (first
> use in this function)
>    20 |         if (regs)
>       |             ^~~~
> arch/parisc/kernel/stacktrace.c:20:13: note: each undeclared
> identifier is reported only once for each function it appears in
> arch/parisc/kernel/stacktrace.c:21:22: error: implicit declaration of
> function 'fn' [-Werror=3Dimplicit-function-declaration]
>    21 |                 if (!fn(cookie, regs->iaoq[0]))
>       |                      ^~
> arch/parisc/kernel/stacktrace.c:21:25: error: 'cookie' undeclared
> (first use in this function)
>    21 |                 if (!fn(cookie, regs->iaoq[0]))
>       |                         ^~~~~~
> cc1: some warnings being treated as errors
> make[3]: *** [scripts/Makefile.build:288:
> arch/parisc/kernel/stacktrace.o] Error 1
>
> Build config:
> https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/config
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

I've dropped that patch.

Thanks!
Helge



> meta data:
> -----------
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_sha: a25006a77348ba06c7bc96520d331cd9dd370715
>     git_short_log: a25006a77348 (\"Add linux-next specific files for 202=
11001\")
>     kconfig:  defconfig
>     kernel_version: 5.15.0-rc3
>     target_arch: parisc
>     toolchain: gcc-11
>
> steps to reproduce:
> https://builds.tuxbuild.com/1ytbtyEg5SDSQgS2Oj9RsCM4ZmS/tuxmake_reproduc=
er.sh
>
> --
> Linaro LKFT
> https://lkft.linaro.org
>

