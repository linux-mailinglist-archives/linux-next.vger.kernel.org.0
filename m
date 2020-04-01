Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82B7B19A72E
	for <lists+linux-next@lfdr.de>; Wed,  1 Apr 2020 10:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbgDAIYP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Apr 2020 04:24:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36328 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgDAIYP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Apr 2020 04:24:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id l23so25070758otf.3;
        Wed, 01 Apr 2020 01:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vo7v3hANyUdQNEMlcVhlSk/PSBNwxY407hISvnXqDQ=;
        b=QziwAt3PnjIK9UDHnILAUTBBcYj1gMxTi9iRj51kLZLAU2O0YzxwrykCe4KpG9p+Id
         mXmn4ZGnq38Ma1Htw+e0WXKvWgQMoRm4gvRK+TMWyIjWUVksup9WENiUNynwqyqdSJMw
         D2lykltITwJEvz2nTz8BjpRs9A2xmTW9EH3dmyg4V/DeGFJATusfV2IeDJX8cfJS+ZSG
         Eqce696lqLb/apzI/8sm5kE/xsplVZUIKpmQsBR+iMnzifydyLxQCxSmVFc7hi5UGqgg
         BC6cdzfsGXRvH4Mi9jv8hHw5/0uV+isQoerlOwT3XBeetrG8/h2rKT8CjC06i1iiplHt
         39ZQ==
X-Gm-Message-State: ANhLgQ2mNMnPA6csMlpzWbo34dl2g5VcYGFEwf54gQ9PxoHYYDdpzJt4
        ETOLRsxLKO4rigFtZmEHDNWwB0ATLPJK7CZYXjU=
X-Google-Smtp-Source: ADFU+vtF02ulNxvdGpxMJCuYuu0xIf1H76NF2cxxeeRDJLwiAHi86aGGQTy2tH4GSvezo6P1tNSGBkTbYVNjBSZRtZQ=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr4825311otl.145.1585729454391;
 Wed, 01 Apr 2020 01:24:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200401151904.6948af20@canb.auug.org.au> <CAMuHMdXFHWFucxZbChxaM6w4q9Gu5pccMBP46N4Av1E2rNKddA@mail.gmail.com>
 <CACRpkdbP9gMLDnDSR6czN88Hjwu6HXSZ2jyYOo-iuq0W073Hbg@mail.gmail.com>
In-Reply-To: <CACRpkdbP9gMLDnDSR6czN88Hjwu6HXSZ2jyYOo-iuq0W073Hbg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Apr 2020 10:24:03 +0200
Message-ID: <CAMuHMdXPCwdd2-Hn0_N7nLgBatS8smnvLnxZD06Qsk+qGJKc7A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gpio tree
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Linus,

On Wed, Apr 1, 2020 at 10:19 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 1, 2020 at 9:49 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > +EXPORT_SYMBOL_GPL(of_pinctrl_get);
> >
> > As exporting symbols has its (space) cost, and of_pinctrl_get() is a tiny
> > function, what about making it an inline function in
> > include/linux/pinctrl/pinctrl.h instead?
>
> I'm all for it! :)

Want me to send a patch?
Which base?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
