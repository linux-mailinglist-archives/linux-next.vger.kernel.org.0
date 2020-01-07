Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6E51320FC
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 09:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgAGIGP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 03:06:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:38346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgAGIGP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 03:06:15 -0500
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2273207FD;
        Tue,  7 Jan 2020 08:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578384375;
        bh=DOk3UZ+3UKE/Je3PgZ7/ME++FhgdPvtRLVhfPi4N7VY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EVqyLomEibHqfsh/fdjOw+R9PIdJSvOtuKzk9puRKfAmx8hxV35Mr6nolU5JheeX1
         NY/NF4v7ewi11/nBxoD+V1zCXW4Moh30qTW4y6760aU6BUsMNXvPgHN0YfRxiBwqHf
         xR4DVJ/1ZuB/4A3HjH168lBfxsiRYoW0IEeKkEdE=
Received: by mail-lf1-f48.google.com with SMTP id i23so38217678lfo.7;
        Tue, 07 Jan 2020 00:06:14 -0800 (PST)
X-Gm-Message-State: APjAAAV3S9UGxsuNmBFMpuoNiDLsdB61MkCfXSdisnbggk2/X/vXORuO
        uoEN6/K7eIrEZujuJ7uKjc3y1yCZL5lrfZzhBdE=
X-Google-Smtp-Source: APXvYqyt0jfw/VuteoYYKjbIy1ZfUPeHaleVOxSewKNVGU59FN/Y9Q5Kf3dKIxGJau9eJkWcZcdx7ELAWHvghj1P9b4=
X-Received: by 2002:a19:4849:: with SMTP id v70mr58350017lfa.30.1578384372775;
 Tue, 07 Jan 2020 00:06:12 -0800 (PST)
MIME-Version: 1.0
References: <20200107143058.7f821056@canb.auug.org.au>
In-Reply-To: <20200107143058.7f821056@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 7 Jan 2020 09:06:01 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcVnjT1R4dvZ+xBdZ2mQ-XS385YEv33Q++qh3K5aw6OjA@mail.gmail.com>
Message-ID: <CAJKOXPcVnjT1R4dvZ+xBdZ2mQ-XS385YEv33Q++qh3K5aw6OjA@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the usb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 7 Jan 2020 at 04:31, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
> produced these warnings:
>
> WARNING: unmet direct dependencies detected for I2C_S3C2410
>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>   Selected by [m]:
>   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
>
> WARNING: unmet direct dependencies detected for I2C_S3C2410
>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>   Selected by [m]:
>   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
>
> WARNING: unmet direct dependencies detected for I2C_S3C2410
>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>   Selected by [m]:
>   - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]
>
> Introduced by commit
>
>   203b7ee14d3a ("phy: Enable compile testing for some of drivers")

Hi,

The fix is here:
https://lore.kernel.org/lkml/CAMuHMdUXJo3=x32xbfSUXs3O3JHaFpfxt0mHupEb+vzi=5+S4g@mail.gmail.com/
i2c: Enable compile testing for some of drivers
Although I need to send v2 of it.

Best regards,
Krzysztof
