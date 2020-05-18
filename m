Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7709B1D70BB
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 08:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgERGKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 02:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgERGKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 02:10:23 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DE1C061A0C;
        Sun, 17 May 2020 23:10:23 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id e2so7794423eje.13;
        Sun, 17 May 2020 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1dl0gB34L7vj5HB7KjBUrlD+YFZKASRou35LziSn5MA=;
        b=ngXBDPP7V+sFxhfGz7eX1ka++a6pa+l7RKUmwXqrQzbFmjphHHDjWT4Z+t8Tg1bvgL
         azg9fbXA7osrfbYXAPw6LvgiLPLinl5k33BPC+VnSFfIlZnsYtJ642urAY4weP8A1iHp
         7H/KfbbGnRZJfLGocdTw4wtvy9t2h0HYzojcWJ7hmUfDHqG1J1HwshLQXcHeWmQATwF8
         tdq2T8HvfTFUR1XTACvkrBtGMQeoAIONUunb4U8MoG1gU/FkmXOO/cVL+t4X7+XioMad
         JYxNuKHNyTlFeiaPD91hH3b13t2+VjbVwmDvTErQjFAVXgl4w4K95uRWcL/6CSWPoX0j
         NY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1dl0gB34L7vj5HB7KjBUrlD+YFZKASRou35LziSn5MA=;
        b=owSQOp06837w60O+esCpE7s7xVNMg8aKbQfsI1ZoOzQA0h/+TI37xyyLlU35lk24ms
         InYuFLBfRQReEZor5I8EMwXZvXIULL9FBWt821O6ORObUMvbiSnfUYwOeJSF03aJQOUy
         0FhiK6h8SzYQ+06IQKFwXD87q0eTgqF3uGglRu241W9LBbysns4a+D+o1ViCiFnG6FRL
         WRwNGunSC63cdZoaKy9yASNHa46B4DEi2JYqtWkbSE/sV9ie9ijN8ZapEzFYmBKe+VMH
         EM8qR7XdRT98T2jG68WUB4RX7u2km46TMHyATtbdWrDlZAkzY/AzYfqaZeEEsSZLV451
         3SNg==
X-Gm-Message-State: AOAM533OWzxuBsUXz2ijo9WOTj/p/4h69rdJgOXkGpEAs5oj/DTtVgc/
        3eFQbY5KACX76AeplyAN7K2SonTxsEyck6j7cMM=
X-Google-Smtp-Source: ABdhPJxY9gkVeTbo+uTZO0tdm5GZSyegXi7knc+eTXy/57LC+MJDjSOgn9H7OOORDwbcmwGCymDkFiQB/Htl3yTQKoA=
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr14030171ejb.30.1589782222059;
 Sun, 17 May 2020 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200518142720.4c0d9a87@canb.auug.org.au>
In-Reply-To: <20200518142720.4c0d9a87@canb.auug.org.au>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Mon, 18 May 2020 08:10:11 +0200
Message-ID: <CAFBinCDSHCkAtQZUXt0kyk736zmaJQVbWXsMOad91qPgxL1EeQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, May 18, 2020 at 6:27 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/meson-mx-sdhc-clkc.o
> see include/linux/module.h for more information
> ERROR: modpost: "meson_mx_sdhc_register_clkc" [drivers/mmc/host/meson-mx-sdhc.ko] undefined!
>
> Caused by commit
>
>   53ded1b676d1 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
>
> I have used the mmc tree from next-20200515 for today.
brown paperbag time, sorry for this
I just sent a fix, see: [0]


Best regards,
Martin


[0] https://patchwork.kernel.org/patch/11554771/
