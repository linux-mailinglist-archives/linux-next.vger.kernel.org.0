Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E5F314C6E
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 11:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhBIKE2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 05:04:28 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:33636 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhBIKCN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 05:02:13 -0500
Received: by mail-ot1-f45.google.com with SMTP id 63so16978299oty.0;
        Tue, 09 Feb 2021 02:01:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKhdVSr9a9o5NhirinVW6rRyQV4KNd1sg3w4d1Klbwc=;
        b=fX0lB+pImKJE6n1Oq5/v19cZLXfhiUIsAXn7rz94IyGCUv+EukpOhphxxqH4piQbvo
         /ABJs/AM4UGRV7XxMg/iyyjXdbq90/YUAqpnk2hgUxVKs477+bbAtztpbAuyfHQnLDCY
         tj2k6QvcbfWdq07lq6HykJDnqaHGnQm5tXhDKgwyyEncROyqGlRoVZEK/MUfwW57HSYW
         2e6YuYgc8HwJ6jVqrTJPLSkzy2ekKONZAJTAvLrZJaVjD/leo76bvVt0iAkX1YWDQrYC
         WZR48UfcSrkh0AZq/EsJltQJrlOivswY0wXsAv/ZL5BayN4PsvFFnAO16ZKFQSho8sXD
         zAZA==
X-Gm-Message-State: AOAM530u6LwASN4TvDWb3x70v6GWXxxr9rk+0Hb9oAraiEFxknkT9lWD
        ahKi1YUjFjtQzqHYJ3Xj18T8ppOmi+0N98ZLxDA=
X-Google-Smtp-Source: ABdhPJyj3h1h9HmEBPIf42K9YA77FM6YTo4MhH/qN64i09DnJcXpHv+i36nGt3U7lXBfwoncCdTc5XoVkm/lbOrez3g=
X-Received: by 2002:a9d:3604:: with SMTP id w4mr15553100otb.107.1612864885239;
 Tue, 09 Feb 2021 02:01:25 -0800 (PST)
MIME-Version: 1.0
References: <20210128170331.4f2ac87b@canb.auug.org.au>
In-Reply-To: <20210128170331.4f2ac87b@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 Feb 2021 11:01:14 +0100
Message-ID: <CAMuHMdWAOXpJGTRM7O7ix4uG-hpH-kDiueN51oA0YEZ0vJdZfw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 28, 2021 at 7:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
>
>   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
>
> between commit:
>
>   4fd18fc38757 ("arm64: dts: visconti: Add watchdog support for TMPV7708 SoC")
>
> from the arm-soc tree and commit:
>
>   08bc3941b6a4 ("arm: dts: visconti: Add DT support for Toshiba Visconti5 GPIO driver")
>
> from the gpio-brgl tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> index 37da418393e0,950010a290f0..000000000000
> --- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> @@@ -42,7 -42,6 +42,11 @@@
>         clock-names = "apb_pclk";
>   };
>
>  +&wdt {
>  +      status = "okay";
>  +      clocks = <&wdt_clk>;
>  +};
> ++
> + &gpio {
> +       status = "okay";
> + };

Probably some sort order should be taken into account (gpio before uart0),
also avoidng the conflict?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
