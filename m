Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC1975088BF
	for <lists+linux-next@lfdr.de>; Wed, 20 Apr 2022 15:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378747AbiDTNH0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Apr 2022 09:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378746AbiDTNHZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Apr 2022 09:07:25 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA99F3ED3B
        for <linux-next@vger.kernel.org>; Wed, 20 Apr 2022 06:04:38 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id t67so2744951ybi.2
        for <linux-next@vger.kernel.org>; Wed, 20 Apr 2022 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zh9xrdg7JGVlbXGj1KLrJNtfkiMVGaQ5+QuOrZAABFs=;
        b=c0iU3u/Hkrb6Nhm2878WxfDrRS0GnecQywOou3pKLWWjNi3SxMHL+dInbFHJRsGyPg
         cvyGPFJr05vddC+8pdRjV/5iUGGdyx7Y9XMdT4Ox6LxwREnuU3eJr4oCCDI5+9IERm6o
         Tf21VI1fJtFTBusLKMKeUP/FruxWUmGckqjFE85Q4SIQ9JkPHsnBWhZXXR4fjKTHChvk
         mCtfr4O1t/hd3z7V+zwt0VYt3ITzGxM3g11oyjbJl23zvWMPoKzQ/4LQ0CH/IcXzE8Ow
         tKo5UKB+dFxNGWplSZO+G4PI4OYpJcqntysXgfC3mfbBTRhdgDliN6g9aDa5AY99VH7V
         RzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zh9xrdg7JGVlbXGj1KLrJNtfkiMVGaQ5+QuOrZAABFs=;
        b=gXr8F9jBAh4OQtj/TyJTCmKGhFmlE0AuKw12LYbidklE8dW8RoySsipQGdQ8wHwfgi
         x9jvYOBmiW2K+NXrhwt5/q1rEjcd9KCeVb1mRhu+ZFd70BQklv8DfJ65kZbiD4Pk6Ato
         1kDTzJ7vj+1d+cQa29CvCtiEqfjSMvWhLHnbx58H/RicsqAR30wDhYe+942H+I2pyiw8
         tglLGliueRYqO8yOQLdNA8F4iYGlOEebG34PFs2Fq61eKOTO1nbw1Xke97ROvoeJ/Gxr
         Y0pa5UaJJSwPajufz2lvpFJzgh6ezmcyyxCbFn523qBZgJoxS4MofQ5KHGw3KbW58/uB
         V4Bw==
X-Gm-Message-State: AOAM530CVkCwdQRRSaq672vMmXZGoI+AVdD/t82ZCYRRcY1Kdn42JhOn
        LYmJD6E9EVt5/331ToBzpYFTB80QcYTC0xpF2MyywQ==
X-Google-Smtp-Source: ABdhPJz59FbR+guYw/1W41GaZq4cDR2IawSiZvI//U+BtW1SR2+3zD1vpud+R1BVbToxwZB9dBiWl5Yg9qd1wJcwZ8U=
X-Received: by 2002:a5b:d4c:0:b0:645:3fb3:fa9e with SMTP id
 f12-20020a5b0d4c000000b006453fb3fa9emr7525143ybr.474.1650459877838; Wed, 20
 Apr 2022 06:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuACgY2hcAgh_LwVb9AURjodMJbV6SsJb90wj-0aJKUOw@mail.gmail.com>
 <CAMj1kXFKzi14UCoiDOMwS5jyNz61_UzxGXm+ke0EWEt4nn6E1g@mail.gmail.com> <9eb0c1a4f805a75e3e9f24dfcae3077b772a06c0.camel@gmail.com>
In-Reply-To: <9eb0c1a4f805a75e3e9f24dfcae3077b772a06c0.camel@gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 20 Apr 2022 18:34:25 +0530
Message-ID: <CA+G9fYsJtp6YtDF=jHuq23BN8e=CZ-FQZm+7nYt_kG=NL5-2fQ@mail.gmail.com>
Subject: Re: [next] arm: boot failed - PC is at cpu_ca15_set_pte_ext
To:     Max Krummenacher <max.oss.09@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        max.krummenacher@toradex.com, Shawn Guo <shawnguo@kernel.org>,
        Stefano Stabellini <stefano.stabellini@xilinx.com>,
        Christoph Hellwig <hch@lst.de>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Max,

On Wed, 20 Apr 2022 at 13:20, Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Am Mittwoch, den 20.04.2022, 09:31 +0200 schrieb Ard Biesheuvel:
> > On Tue, 19 Apr 2022 at 12:59, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > Linux next 20220419 boot failed on arm architecture qemu_arm and BeagleBoard
> > > x15 device.
> > >
> > > kernel crash log from x15:
> > > -----------------
> > > [    6.866516] 8<--- cut here ---
> > > [    6.869598] Unable to handle kernel paging request at virtual
> > > address f000e62c

<trim>

> > Unfortunately, the vmlinux.xz file I downloaded from the link below
> > seems to be different from the one that produced the crash, given that
> > the LR address of c04cfeb8 does not seem to correspond with
> > handle_mm_fault+0x60c/0xed0.
> >
> > Can you please double check the artifacts?
>
> Commit "mm: check against orig_pte for finish_fault()" introduced this,
> i.e. on yesterdays next reverting a066bab3c0eb made a i.MX6 boot again.

Thanks for the pointers,
I have reverted the suggested commit and boot pass now.

Revert "mm: check against orig_pte for finish_fault()"
       This reverts commit a066bab3c0eb8f6155257f1345f07d1f6550bc4a.

> A fix is discussed here:
> https://lore.kernel.org/all/YliNP7ADcdc4Puvs@xz-m1.local/
>
> Max

- Naresh
