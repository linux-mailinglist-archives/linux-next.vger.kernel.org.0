Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 736F119A688
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 09:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732037AbgDAHtO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 03:49:14 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35911 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730426AbgDAHtN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 03:49:13 -0400
Received: by mail-oi1-f196.google.com with SMTP id k18so21426799oib.3;
        Wed, 01 Apr 2020 00:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FYrdAKp2CgTne275+66tY8BoA72AYx10GTI3baIhzE0=;
        b=DnmMyDvlNYACZ5et5YM0KvBnJHyO+FNOKNrs914QpsGpOsehhYdm4dkohEPnHkCyOU
         m1edCziVtcWDNzle2HcMlKaiNxIcbOf1nNUXWdMsyGu533Vbu4WK2F0mCy53ieZQAfWD
         eTYeGCIzhyBPYCoVhOug+eRJCNd/ALbpT0VdhDTi74bRRX/YajKLbzEqUFerexgWou8z
         Uk1KFVHYv9eDRLv9cHZa7AxxmJeciSEQ13bkEP/84BMPlwCz6VCTOQAIyxM8DL+u8nS4
         pjD81SByzMAUyDo/volDkbQieQsMoFFVtJdzf3nwp9lBk9o8Hdt2VNJrLEeCRjrtO14A
         Gxdw==
X-Gm-Message-State: AGi0PuZykFxcO5QlW1DBIa4YAgrUuuiwJC1z41ZcE2sBgUuW6U7jnox1
        ATIOu6RrqIWAtkcUJuQUtCmPp+fNLUzTF43jpVw=
X-Google-Smtp-Source: APiQypLMfOLDMJcHXmUP3QwXPgDS+k345dnEZWOlap5XBnijfxMYRnmrLE2cFly1Zejuc+pWjuRhfKqZAV49JE+ZmAU=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr1822269oib.148.1585727351875;
 Wed, 01 Apr 2020 00:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200401151904.6948af20@canb.auug.org.au>
In-Reply-To: <20200401151904.6948af20@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Apr 2020 09:49:00 +0200
Message-ID: <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, LinusW,

On Wed, Apr 1, 2020 at 6:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 1 Apr 2020 15:14:32 +1100
> Subject: [PATCH] gpio: export of_pinctrl_get to modules
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks for your patch, which I assume is a quick build fix.
I see LinusW has already applied it...

> --- a/drivers/pinctrl/devicetree.c
> +++ b/drivers/pinctrl/devicetree.c
> @@ -103,6 +103,7 @@ struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
>  {
>         return get_pinctrl_dev_from_of_node(np);
>  }
> +EXPORT_SYMBOL_GPL(of_pinctrl_get);
>
>  static int dt_to_map_one_config(struct pinctrl *p,
>                                 struct pinctrl_dev *hog_pctldev,

As exporting symbols has its (space) cost, and of_pinctrl_get() is a tiny
function, what about making it an inline function in
include/linux/pinctrl/pinctrl.h instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
