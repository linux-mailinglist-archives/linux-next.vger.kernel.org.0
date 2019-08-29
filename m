Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10108A0EF2
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 03:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfH2BfI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 21:35:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36603 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfH2BfI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 21:35:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so1684102wrd.3;
        Wed, 28 Aug 2019 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4NPHzGMHYMzghz4vKjLIpWBlZHhRzQQTSD/2+ZhOAgo=;
        b=kPQ59wqqXRr0CkbdnV6M+GImGU0tRXa3NIERwuxH/oG/TjykEADyx9NArTdkfBMJnY
         VreCFgHWkH03xi2DcMcInAkEBn6aNILJ3vPPEKp5+h+T35lJSLSFlmk9ZLdzrllvjbdf
         WN6bQyEF87/Tus2z3cPZ+Z/YdN3L/zJdPcl3XPO5isQCTiBbkzL99Y5/pTLAnAhc5Vyw
         /oHgaTZ7MCox8HIwWq02jDJKOPu6tiej0gCSKwKU4sDG7g5ITU3IVNjeW6odzzXOB28E
         FYbzv3zKu7aS8ljaFwH/Iji7SNhkO9xT+77OCtAUhZnVBProcedSmN9mdlGGDEEQX3vl
         NIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4NPHzGMHYMzghz4vKjLIpWBlZHhRzQQTSD/2+ZhOAgo=;
        b=Y2jlxlGl7L8nb8RInSWbdKgzAAgSZ9XQFQPfz5TDS/MOLr/uZL3euseW1zsQoNRCfo
         ycBTznzToXPrqPzQGn54YAuCugeTX9x5pHBFItOoa1MdhTzzwa16QELlVOzwlCmz+SxM
         IcaMLFxVkmeLmZNp8BF7ZucnDSAeGa1wY9nk70CRIwFUx+lwpRWdsJbOwBAXkKg8blrS
         BfOCbN6yfb+dBQywKLqGeEDIXdSVDnbEmN2XH8AT9U85e13+5U4dV4vfENaFCsGnUqkb
         10Yn7HtltwmJB0DfFJwmjxUb7+0DStHFSlX3wEhPbuIbU7bOaJlX2dutskJ4ThnpSJo6
         yVTQ==
X-Gm-Message-State: APjAAAUmbke619NaOpq0uxL7H05aOpBgFU94TbjFbgVunAS4OD1+wdfn
        FHXs0Ve0fzhlyE9IuKGA/zd6mcqoJxy5jmbJljs=
X-Google-Smtp-Source: APXvYqy1x5d0HaAGunnwgLR34YPhchUNwyWv5vgSZJs18Lzq9eEMkHulEXF12ksY9MfJcJYlNgY+HMEMxKNQliKecdc=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr7714375wrw.70.1567042505463;
 Wed, 28 Aug 2019 18:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190829075530.6fb7341c@canb.auug.org.au>
In-Reply-To: <20190829075530.6fb7341c@canb.auug.org.au>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Thu, 29 Aug 2019 09:34:29 +0800
Message-ID: <CAAfSe-v3uxWn8P1iJypFD2BCX-75SAMpo=dVtO7jMdt6E41tsg@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the mmc-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 29 Aug 2019 at 05:55, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   f93be8a7a366 ("mmc: sdhci-sprd: clear the UHS-I modes read from registers")
>
> Fixes tag
>
>   Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   218258427ce0 ("mms: sdhci-sprd: add SDHCI_QUIRK_BROKEN_CARD_DETECTION")
>
> Fixes tag
>
>   Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   1236e62ef8de ("mmc: sdhci-sprd: add SDHCI_QUIRK2_PRESET_VALUE_BROKEN")
>
> Fixes tag
>
>   Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   8180519b1be0 ("mmc: sdhci-sprd: add get_ro hook function")
>
> Fixes tag
>
>   Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   b4e4296cc206 ("mmc: sdhci-sprd: fixed incorrect clock divider")
>
> Fixes tag
>
>   Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more tha one line - even if the line
> is more than 80 characters.

I will send another patch-set.

Thanks,
Chunyan

>
> --
> Cheers,
> Stephen Rothwell
