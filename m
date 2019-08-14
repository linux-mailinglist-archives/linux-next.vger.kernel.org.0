Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC7398D183
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 12:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbfHNKw2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 06:52:28 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:32974 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727564AbfHNKw1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 06:52:27 -0400
Received: by mail-qt1-f194.google.com with SMTP id v38so17206765qtb.0;
        Wed, 14 Aug 2019 03:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIlI8GZP2jKHJrudr0IHxwtNWdUm8jTFI/qGZBpe/rY=;
        b=NMpP8OBM6peGKogkv3UbRxJYH7NejLW4sj2XL4VTDp0aUh1QaF87tvx63+Z24WY+Q5
         ElTRsoCugr6F4/pQFiEruyAWcgfSAc0gSXy97vA20sH/Ad70o+JKbVnpFzrSTnO6numz
         GzhWToIrnd+4ZPwvspUb6E1sqfX/mges7S/cQ4Rj/v9Q+0u7XXFLzJgoUp/8VTKdw6To
         jIPek+U2GwwGrfr+dSnz+RUomG6gfwIxx+BsWteHt9a0yOgM5iUTEJF4vWdu1jaCdQ/2
         WOJDHJZ2JzlKih8gd5Yi2Ch3PM1UNZX+5CV0Kpd7TiKUiiDpEzqzo8fiWdq4jYB93KBA
         tzXA==
X-Gm-Message-State: APjAAAW32vAIjDodlGX5Wfp+ANFOMzueO9BofPhsD+TMcLMvaNqF0rFR
        rf8oyZ2lpEn/3GoZKD9r3EW/gjeDd5s3Fs/bYcI=
X-Google-Smtp-Source: APXvYqzb85S16/2mVtcRLSk4l+uLQbceGTBlDXqCp+iONwPetFR/QG8krUCqT1RuruE/1KPh7tvRoIkeZDjvB+UNth4=
X-Received: by 2002:aed:3363:: with SMTP id u90mr37420132qtd.7.1565779944278;
 Wed, 14 Aug 2019 03:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190814084949.70867809@canb.auug.org.au>
In-Reply-To: <20190814084949.70867809@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 14 Aug 2019 12:52:07 +0200
Message-ID: <CAK8P3a0CMAHLUPs8=8DttW_kFWdYbR_De04s5aNSEWkHgHLJOg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 14, 2019 at 12:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> arch/arm/Kconfig:720: syntax error
> arch/arm/Kconfig:719: invalid statement
> arch/arm/Kconfig:720: can't open file "arch/arm/mach-ks8695/Kconfig"
>
> Caused by commit
>
>   eb4f78f8b8cb ("ARM: remove ks8695 platform")
>
> I applied the following patch for today
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 14 Aug 2019 08:46:39 +1000
> Subject: [PATCH] arm-soc: fix up bad rebase?
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>


Thanks for the report. I folded your fix into the original patch now.

       Arnd
