Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27A8418FBD
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 09:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbhI0HSW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 03:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233035AbhI0HSV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 03:18:21 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B948C061570;
        Mon, 27 Sep 2021 00:16:44 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id h30so17094267vsq.3;
        Mon, 27 Sep 2021 00:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bKQ5SBS3VeZbZeCRmHaBxyFDUPmst2G26fgrNqeDpm8=;
        b=MrqpTAcU9thn2QbLYeP0+Sjx17yCxkEYpOWgbpYpc5ZFjbVrL+CzJQjmZ0yUI+YRTj
         jWS5btM4JRZa2FVIMdBBgAggXiwwG4eOojjhtFFHgY/65F9QDGy7PqaS0Z02Uyh81+78
         NcmE1YjMBP/7O8WsY/KztCM+wtFQEa6VdCJxtC5fzKu/RSlnzDYJHj6qfqtGhbWm/y4q
         4q3FZOm1fE2Kzk2+C9p8hZHCUxh6NznyaL6vfk1lfvYq5Ep4aFod39tuD0NEbBMFwcxg
         L8MgLMclaVLjks3VTY5YZtKCmsdhZWsJsH5C1qWsYjqS7nn1a6oBMRdu9PIjI56tsX7N
         /9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bKQ5SBS3VeZbZeCRmHaBxyFDUPmst2G26fgrNqeDpm8=;
        b=0kYQ4ppW9vYHYAMT9Ko3ETjU3o2Qoc7OlaJr/G0mYpvHhiLXwBuIsnn2TcZpN0OGXE
         757SQldyITim0isvJiykK5nPgMx49OLAlmwg78lwhCcph65uPtwj+rbreuyneBfxU7ee
         +K3ooonhUayk4/N6NfXW9h448KAoWuLgv4ogyR236y4w8GlcQSNLLpTrTMTaPvyrBe38
         d6KRHXzcwXG1FDlz+bYLqtjGgnFL7LwlEGddV25STf8AIR7MzSM19hV8gd2IwaxxQEiI
         3rtcA6bCzSCvXKl4tyXOHAUuAl5e3Y7X7+m3WxboSVnHkDYLAl58ixg71BWalPGlONT+
         Wrzw==
X-Gm-Message-State: AOAM531CPcHRqybsEve+P6NcP1FC0ItdDaHcJFjAXS5VwAZmle/uUBE/
        +bT10frL7oebvXerTnTuVWWCxyyJtfhl+Am9Ssdi+npfXt8=
X-Google-Smtp-Source: ABdhPJzNJhETrryKM63V8MsXDo94avqga9M4AimrMJ3v01oNThXKpvrOWbpSTX7sCnm0Z2RUibewdfiLWA6M33KlruY=
X-Received: by 2002:a67:7247:: with SMTP id n68mr17445711vsc.56.1632727003419;
 Mon, 27 Sep 2021 00:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210927131027.13113c97@canb.auug.org.au>
In-Reply-To: <20210927131027.13113c97@canb.auug.org.au>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Mon, 27 Sep 2021 09:16:29 +0200
Message-ID: <CABgxDo+EtzEhi1p9HvXNucrX-6O8G_uWm7_d2vp7BiXLjpSO4g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rtc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Whoops, my bad, it is probably caused by missing CONFIG_WERROR on my side.
It seems to be fixed by
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git/commit/?=
id=3D27ff63eb076c31086e0a72d41b5c635193a58516

Regards,
Romain

Le lun. 27 sept. 2021 =C3=A0 05:10, Stephen Rothwell <sfr@canb.auug.org.au>=
 a =C3=A9crit :
>
> Hi all,
>
> After merging the rtc tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>
> drivers/rtc/rtc-msc313.c: In function 'msc313_rtc_read_alarm':
> drivers/rtc/rtc-msc313.c:54:12: error: implicit declaration of function '=
readw' [-Werror=3Dimplicit-function-declaration]
>    54 |  seconds =3D readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
>       |            ^~~~~
> drivers/rtc/rtc-msc313.c: In function 'msc313_rtc_alarm_irq_enable':
> drivers/rtc/rtc-msc313.c:75:2: error: implicit declaration of function 'w=
ritew' [-Werror=3Dimplicit-function-declaration]
>    75 |  writew(reg, priv->rtc_base + REG_RTC_CTRL);
>       |  ^~~~~~
>
> Caused by commit
>
>   be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
>
> I have used the rtc tree from next-20210924 for today.
>
> --
> Cheers,
> Stephen Rothwell
