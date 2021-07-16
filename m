Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CBE3CB7AF
	for <lists+linux-next@lfdr.de>; Fri, 16 Jul 2021 15:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239874AbhGPNHR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Jul 2021 09:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239806AbhGPNHK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Jul 2021 09:07:10 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4882C061764
        for <linux-next@vger.kernel.org>; Fri, 16 Jul 2021 06:04:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id w14so12862461edc.8
        for <linux-next@vger.kernel.org>; Fri, 16 Jul 2021 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EFuCzIh+SeYBpu5UbN36zCvdsMMMavFs1jTakKetLg=;
        b=ZBXdVovlUDWINuH3DenX3yyikHJDRDr2XC5in3PvcE/lwDz61zADYJvdyMUF81uMM6
         XXbcSnjd4cAuovnUKeTRhuLnTGBeV+3C1LcTnX7G2y5kQhmoAQxNnywDdbAL1NXKhVEV
         tcn92roRGng/i79mMnA5uSiT8iQ3UWR6q2CRSTj59A7OzhhwVdyrLXrFPuP2i+EzUap2
         vtsh+A9s1FWLrzYzpRAlaof+1YGrboe85JIclqPon69R9psy5WHKQ89b8FvEk2AR9t7a
         28OTWr6cxiUP23tLSHX9hSN/nEQnGoAkGRQWRp4uL2NyqmsNEEdEGC1Y/MQBFrt1Rb+l
         rRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EFuCzIh+SeYBpu5UbN36zCvdsMMMavFs1jTakKetLg=;
        b=lkefMDN2hmHfkoCfGt+LHFJxPjc1maDQdz/W+wNqUtkecnN6puJ5WCrvPK83KQB0UR
         Cyeq8SMWwDe5157SQhiVzHIO4tr+dpkRTS2Sk55qRQ0YbNJnTOzd7MdHqrIG2bNj+Eb7
         kPUt1qPYSSHZUPH3gHnvHzeO0Q3SaGoCRS9jSRvSMxjbxooDrKm+3/fDYNBPilNcj94A
         7sEXaoeI1GD+IPi4ft/S6ZSdyLqqgcm34gC0AzumFpY82jzvnt6wecDKycafSK5Nwi9w
         G4PH+qnvKwn6qwWsxzRS/Ow/S4S9WY216pa30XKZRyFOSI7ODZDO2EVj48Qh3J2nEbwZ
         yicA==
X-Gm-Message-State: AOAM532ywGkHn0dmTF+YvdCN0zcZ98jxU/9eSjaaLN7Tc3fSvTVb8CiZ
        Tpf6oPwiGJd0JFIxjNmOzxNLeEDrDeBGzNXZIt8fx2kH4mE=
X-Google-Smtp-Source: ABdhPJwF2Vd4OfydUmikO1TlQyiVvg2oS4gN+IeEt5NyFgOSmf6VbmP1pv5jgrwgpt/3hNuw0iZgnsBVM/vCmRXOk+w=
X-Received: by 2002:aa7:d2ca:: with SMTP id k10mr15018511edr.379.1626440653392;
 Fri, 16 Jul 2021 06:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <YO3txvw87MjKfdpq@localhost.localdomain> <YO8ioz4sHwcUAkdt@localhost.localdomain>
 <CADYN=9+ZO1XHu2YZYy7s+6_qAh1obi2wk+d4A3vKmxtkoNvQLg@mail.gmail.com> <YPFa/tIF38eTJt1B@localhost.localdomain>
In-Reply-To: <YPFa/tIF38eTJt1B@localhost.localdomain>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 16 Jul 2021 15:04:01 +0200
Message-ID: <CADYN=9LVpCYc48sY63372EyfA9sepKj=LmwfOwyLqo=V45Uq=Q@mail.gmail.com>
Subject: Re: [PATCH v2] Decouple build from userspace headers
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, hch@infradead.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 16 Jul 2021 at 12:10, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Fri, Jul 16, 2021 at 11:03:41AM +0200, Anders Roxell wrote:
> > On Wed, 14 Jul 2021 at 19:45, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > >
>
> > In file included from
> > /home/anders/src/kernel/testing/crypto/aegis128-neon-inner.c:7:
> > /home/anders/src/kernel/testing/arch/arm64/include/asm/neon-intrinsics.h:33:10:
> > fatal error: arm_neon.h: No such file or directory
> >    33 | #include <arm_neon.h>
> >       |          ^~~~~~~~~~~~
>
> > If I revert this patch I can build it.
>
> Please, see followup fixes or grab new -mm.
> https://lore.kernel.org/lkml/YO8ioz4sHwcUAkdt@localhost.localdomain/

I tried to apply that patch but I got the same build error.

Cheers,
Anders
