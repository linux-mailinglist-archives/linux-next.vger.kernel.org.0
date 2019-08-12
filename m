Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E23C289FCE
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 15:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728210AbfHLNiS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 09:38:18 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33954 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfHLNiR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 09:38:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id n5so158844763otk.1;
        Mon, 12 Aug 2019 06:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0GQy9440rplVMTrWBYBlc2P+0AD7y5y5pZT2ZFVe+4=;
        b=lh9730GExihR1/PU2xr5fce+Qge72LJVQvx/aIRX3BIwYtEuwu9qFh81mA6wtwoJhK
         r3JRfsdwuvae2WtFiOYmIjRmfI02kbwflAhkNGBZ7b/09Sgk2Sy4dVbYgmhgF/1uISRw
         7bpnzS0Iw99Nt6sA9xG60m6yHBsxnuOrzgGpSEREkHZU+RpOxWU3c/S8KTSeHTvrzoqn
         KLfZJ/lWGH4aI4MGAeJCTltlUe8sFUVmwvPIVYidjeFBkoRTa8pa1I2tv0/WrgvHOi1O
         DE+jiclqyyFu6Kc03VFB35foxJUoi3KueqK9akWDnD2rt3Xkin/VC3MGws+Fr/qTEuZf
         p64A==
X-Gm-Message-State: APjAAAUiEEphr2s7Y3C4dHTndaOC9B6DRVKT1d9NGtgDHPOtIef9DRvD
        DU4ZRV5O/QKVOoZhXu/upZMB72W/tr58gnbtozDPmSfq
X-Google-Smtp-Source: APXvYqw27gDGNaAAtarwyAdPdyuMqJaQBPS6rcd4DQeRfaD7fOVoeRnWkkj8VCnTwwQn4qj947XRJfq1oA9o1N6sIqk=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr30445715otc.250.1565617097081;
 Mon, 12 Aug 2019 06:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190812193146.4939f5f5@canb.auug.org.au>
In-Reply-To: <20190812193146.4939f5f5@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 15:38:06 +0200
Message-ID: <CAMuHMdUEoBj-JBZza4==9TENfFk3BckCPO+mrZjhu1vOr05_0w@mail.gmail.com>
Subject: Re: linux-next: Tree for Aug 12
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Aug 12, 2019 at 11:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you

Looks like commit 8e72ac275c63a44c ("Add linux-next specific files for
20190812")
made it to git.kernel.org, but the tag didn't?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
