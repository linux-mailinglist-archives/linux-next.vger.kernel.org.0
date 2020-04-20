Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFD71B161E
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 21:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDTToh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 15:44:37 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48273 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725896AbgDTTog (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2020 15:44:36 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M7sYM-1jMkSm1vDG-0053pr; Mon, 20 Apr 2020 21:44:34 +0200
Received: by mail-qt1-f178.google.com with SMTP id w29so9661864qtv.3;
        Mon, 20 Apr 2020 12:44:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuYoALa4sLLrMnt1pUNuGr/C6Fz2eFN26ec64BXUS1pSSHuiE+sf
        bw/jAlU/zbQ4fzdCtyPX0KOmWVYG/Q3mXLhmfFM=
X-Google-Smtp-Source: APiQypIQ/d1G7kkipasQ9Xx8TSOfP/G9AkgCeJ084oCa3E5yGJoAUJ8JtONcb4zbeOgvQqIRkO6e4rHHZmSKchIZTzo=
X-Received: by 2002:ac8:2bce:: with SMTP id n14mr6857624qtn.18.1587411873264;
 Mon, 20 Apr 2020 12:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200420081154.597ffa59@canb.auug.org.au> <20200420081323.4fb9889b@canb.auug.org.au>
 <20200420151843.GS37466@atomide.com>
In-Reply-To: <20200420151843.GS37466@atomide.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Apr 2020 21:44:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Ln+hkSQnQ8jzYSWvJ=bZ9V5juzDYcJoZvx0y-QpfrtA@mail.gmail.com>
Message-ID: <CAK8P3a1Ln+hkSQnQ8jzYSWvJ=bZ9V5juzDYcJoZvx0y-QpfrtA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Tony Lindgren <tony@atomide.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ExlieJouP1/VpeLaoThqXQuMV7d8wotKI9pINbIO64zgCrRGTwB
 vorL1upYmxt/gVGLXHdciGrjlgddD/AU4D3KB916n3Y0rsR4k9ztGFiMB3Qt/igZR+4qGv2
 wmcCmDEUbvoFxJY6FBgF6+RssJbnoWdm9Ulgd2cdKDpBSRPBFqCvxO2sRYwKmvO21uObjGj
 3YOtynxeeD/K8mRFLtGzw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s7CYPavXeN8=:/j2AV2kY2iO9xeu999XoFF
 3Elne8znV2CtqgLilfGnE/Roaiz0bQyUKH57GZZqgBz5rhbo7kGM0bSdzFDjp+egwtg8viYE8
 ekTv5M/H4Lg4Ngrrod5YCadTI0wE7Itbz0VbJ8IYtbgRqNao74YJr+TaIxMFhlgsRwDv8cRT/
 8IQRyhdLtuzEwlJNGBPQfTb6eNdgu3AcNLRAhNEw2K7LNEMErWve+VNadnKVsZF+KcaznjpLz
 5OjGjxCHjMTlS1Hgsc2lRe92PHpCw06uJuNWOyOIV/1HynAtJDVs2H8OSuONGqmlI2fY/FN6Y
 oRv2q75s435fc9QFMnffqILsisfagPIo9pHhT9LBTTFq9cxFRzoxYTcxGhchg3BzT7F2Gcpg1
 rBWEKwLn4hJaWQ98FBHeTmyYUZO0RKhWQjoFxVR9+tABlaZGZ8Zwte0y+3izmrUQT48PzVr/e
 S4O2gnqKF+38pIPajaMi7EhPb9LTSqdhVk4dnPPfAcb1+QCuyXxyAL4bVD28QQYET/rWytKR6
 nxCQuPY7vAZxSM2FwxAe4yffTRPcGXOlmjXVJGf3KYnA++1nLzQ+wrCDLcMS0WnF1AF4cwP1n
 ZwdDd6ktdwsjH5Pm447Z5hQ23CihHcazVLEY9eK0upqm3V18dUZtSq43y1ogchJ0HnRIU3GMG
 7O618izAB+h3lMG7a+4b9gvvq+3kPJRJIm+e7JzMNFuySPKWOTIMJHePDceZOF2Ddm44JBrjs
 3KgMRszmtDKlivN1UBTfLjdbwxDGHD7yxZ9L+IopL2wWV5xerTg359DbjfHsgdhHyMxj2Gd4k
 q1tHw9rXKfm9aKQ7Mf0v97fE85OMpO2uaHb6a+6fg5n+mu9/64=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 20, 2020 at 5:18 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Stephen Rothwell <sfr@canb.auug.org.au> [200419 22:14]:
> > Hi all,
> >
> > On Mon, 20 Apr 2020 08:11:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > >
> > > Commit
> > >
> > >   512e8d40f91d ("ARM: dts: OMAP3: disable RNG on N950/N9")
> > >
> > > is missing a Signed-off-by from its committer.
> >
> > Sorry, that is in the arm-soc-fixes tree.
>
> Hmm so the commit I sent a pull request [0] for does have Signed-off-by
> for commit 07bdc492cff6 ("ARM: dts: OMAP3: disable RNG on N950/N9").
>
> Seems like some commits in arm-soc-fixes accidentally got rebased?

Indeed, I found my mistake now and uploaded a fixed branch.

      Arnd
