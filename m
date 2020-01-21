Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF1B1437E9
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2020 08:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgAUHzl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 02:55:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:53048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUHzl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 02:55:41 -0500
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FB0924654;
        Tue, 21 Jan 2020 07:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579593340;
        bh=ctHy3qaqeSqwZviUpkYQlV4bYIKMDgmfasvDstEMY8Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w4JJoR+w7PYdOF/z/PneWxlemCgFf0UREZXNwYKBzZhiXmrdqwjjbbCSCTJhdw38y
         sV+KjRcRbIqeEcDFtRrHYwZ2gOiwcbdL8JEMBLUpttPRxGvQnR5kc8hwnhdk2RU+KJ
         /05K0U00dWGgSsO9+xW//uSWmoaBz0SpkqE+TBm0=
Received: by mail-lj1-f172.google.com with SMTP id o13so1712298ljg.4;
        Mon, 20 Jan 2020 23:55:40 -0800 (PST)
X-Gm-Message-State: APjAAAVLFLfWu5FnMloYO8DY30nxfryaBs8CE12XToCJGBPCpC2A2lxr
        DXxc9gx+9s8CtZgRihq7KSiLJ99+p9ZejJskxiU=
X-Google-Smtp-Source: APXvYqzf2rJJ28+KITUl7Ht3WzvzQdEkYVOkARkFyeGRkAdXU82TnDKKOs2vWavqEk8n66tDsNVSvyHsKzW4hG1JYLM=
X-Received: by 2002:a2e:9015:: with SMTP id h21mr16052410ljg.69.1579593338381;
 Mon, 20 Jan 2020 23:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20200107143058.7f821056@canb.auug.org.au> <CAJKOXPcVnjT1R4dvZ+xBdZ2mQ-XS385YEv33Q++qh3K5aw6OjA@mail.gmail.com>
 <20200121172823.62617483@canb.auug.org.au>
In-Reply-To: <20200121172823.62617483@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 21 Jan 2020 08:55:27 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdUhCfrq1xSvPGjAOZDr29YGTK2j_fYSGJ9xchFDE=cmQ@mail.gmail.com>
Message-ID: <CAJKOXPdUhCfrq1xSvPGjAOZDr29YGTK2j_fYSGJ9xchFDE=cmQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 21 Jan 2020 at 07:28, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 7 Jan 2020 09:06:01 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Tue, 7 Jan 2020 at 04:31, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> > > produced these warnings:
> > >
> > > WARNING: unmet direct dependencies detected for I2C_S3C2410
> > >   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
> > >   Selected by [m]:
> > >   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
> > >
> > > WARNING: unmet direct dependencies detected for I2C_S3C2410
> > >   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
> > >   Selected by [m]:
> > >   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
> > >
> > > WARNING: unmet direct dependencies detected for I2C_S3C2410
> > >   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
> > >   Selected by [m]:
> > >   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
> > >
> > > Introduced by commit
> > >
> > >   203b7ee14d3a ("phy: Enable compile testing for some of drivers")
> >
> > The fix is here:
> > https://lore.kernel.org/lkml/CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com/
> > i2c: Enable compile testing for some of drivers
> > Although I need to send v2 of it.
>
> I am still seeing these warnings.

v2 is here:
https://lore.kernel.org/linux-arm-kernel/1578384779-15487-1-git-send-email-krzk@kernel.org/T/#t

Can someone review and/or pick it up?

Best regards,
Krzysztof
