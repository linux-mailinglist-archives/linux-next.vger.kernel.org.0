Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBA61462FE
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 09:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgAWIDQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 03:03:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:35956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgAWIDQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 23 Jan 2020 03:03:16 -0500
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FE6724673;
        Thu, 23 Jan 2020 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579766595;
        bh=W+B5E/F5JFplL6UXkuYJVtwhzk5JKp5PLXL6ULLfCCg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2PJ9PWIB3yJlywSFA2gUtF3om6H0peRQkjqYOJFOWi/xoPcb9b1t6xSUa/Fw9r7eQ
         Qwxcvmt9dfxjgwLVQeVuyHbE4BKaPegtpKY+lV/nWGOLLBhKMv1IRzaE5C7u2KGJ0Y
         JZCXQfzSWzmxMI+ekiuCoHi9zWov0uHGN2DAekLw=
Received: by mail-lf1-f46.google.com with SMTP id r14so1607763lfm.5;
        Thu, 23 Jan 2020 00:03:15 -0800 (PST)
X-Gm-Message-State: APjAAAWs4p+NqG39vRwWtqt7JQP4HzmcUpBiPsmdcvsm0pe8qkyBFTbg
        9NTjl1L9pXfdOkkPyZUhMd0M6p3vW8YbAIFXPTA=
X-Google-Smtp-Source: APXvYqwjlReg5RfranzuZw4WJT9YEaeunN45Pk1Qpm/E3VosJWD8TxfwfusW93pL08k/Y3081mRrnYJ4QtT/+91WyRs=
X-Received: by 2002:ac2:485c:: with SMTP id 28mr3947023lfy.118.1579766593592;
 Thu, 23 Jan 2020 00:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20200123172101.2f31947c@canb.auug.org.au> <beb9e3a3-4824-6328-12f8-3d005f376374@infradead.org>
In-Reply-To: <beb9e3a3-4824-6328-12f8-3d005f376374@infradead.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 23 Jan 2020 09:03:02 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcJ8V+bLDeJGg+emCaYHtDjuKa--yMk_HRCsB_DrwJGrw@mail.gmail.com>
Message-ID: <CAJKOXPcJ8V+bLDeJGg+emCaYHtDjuKa--yMk_HRCsB_DrwJGrw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 23 (PHY_EXYNOS5250_SATA in drivers/phy/samsung/Kconfig)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 23 Jan 2020 at 08:00, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/22/20 10:21 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200122:
> >
>
> Is linux-next missing some of the COMPILE_TEST fixes?  I am still seeing
> this warning (that I reported on Jan. 9-2020 and that Arnd has sent a
> possible patch for):
>
>
> on i386 or x86_64:
>
> WARNING: unmet direct dependencies detected for I2C_S3C2410
>   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>   Selected by [y]:
>   - PHY_EXYNOS5250_SATA [=y] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]

Hi Randy,

The fix was posted quite some time ago - next to the patches
(unfortunately) introducing the issue.  I posted v2, after review, on
7th of January:
https://lore.kernel.org/linux-arm-kernel/1578384779-15487-1-git-send-email-krzk@kernel.org/T/#t

Maybe I missed someone on Cc there?

Best regards,
Krzysztof
