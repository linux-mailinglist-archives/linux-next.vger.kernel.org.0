Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D23B2A65CB
	for <lists+linux-next@lfdr.de>; Wed,  4 Nov 2020 15:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgKDODL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Nov 2020 09:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgKDODI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Nov 2020 09:03:08 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EC6C061A4A
        for <linux-next@vger.kernel.org>; Wed,  4 Nov 2020 06:03:07 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id 2so23041407ljj.13
        for <linux-next@vger.kernel.org>; Wed, 04 Nov 2020 06:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TUOQw0C83wZfEL0vEup/xV0E+W5h+AKs5vycRQsvjmk=;
        b=raQ1wmnUEl63wrrZsnFBDbMoFPzK5nRNKLILZeo5aYFJrlpJ4EMbKcaVYWlcRqhd5Q
         9JceN7D81bdsCn7xyrmzL+VPYfZbb38QnZ4DgIPBdRe3NcI/6uuckPM8zoA/ZljFknTo
         K9Tf6B/DAp/DEPo7pxKHdBZA/1Po7ziPEcFc3PcVFa8UNUISSOAdfNisp3szoifmcJIb
         r4xNO1pnrDPkQ+GhrPlQU9fksElEUcVDjstOjmVj00hKPrSRFqQqMiD0E+MUmzLXBYAb
         pWiyWjPzGpbvWPiV4itF5WKkQfygO1I/aE+DP4EaIKqhYEx4YyidhFOXkRT7lfJ6K+NH
         /1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TUOQw0C83wZfEL0vEup/xV0E+W5h+AKs5vycRQsvjmk=;
        b=lzMkBWDnq80lKc5Ubj6q5ynesOS4JDzq+l3qbvMVzQY4RfUD+syVwXRqKQZKDNjazp
         FbnrV+kyLijMnIimq38OP0QniO00HwbBFiZkvFECdJEWwEKxiUWZ9GZgSR0RGIPfQiZY
         iIGBRjvhUBDc8/AyHOimH2av4pPWkjvUGrGwLRjSaZ6KHJH+wR7wJG0FOzXKL+ovviCc
         8mPBDmMBIiXAKv3Ejuy/yteTUwD1KV9NosP8Qkit9KWKRNA+pbzUi2hbvd5/7KL6LyJF
         kMDf+I9KeX3pFpFQf5K2S4i9JViq7oR0rjYg6DDIow17uIoDr1ZGtpjJQJhRdHoMULSI
         faIA==
X-Gm-Message-State: AOAM5332RrEAlN83W3yMco6mk3gPOh8D5z8H/kBv/3keimNv2SeWlJpB
        15wkfMy7j1TPmL+KQyLoYxR6GcrWBIOsF4oa76HuBw==
X-Google-Smtp-Source: ABdhPJxJfDGybgkcfLyyKPT71AH6IePQ76BjG68XIsddYjhuHabhUDy5nZrfYUIrvly8VjC5PCwy2mTrOMdxwkUl5ug=
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr11512268ljg.286.1604498585007;
 Wed, 04 Nov 2020 06:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20201030125016.3423d2fe@canb.auug.org.au> <20201104141028.420c9274@canb.auug.org.au>
In-Reply-To: <20201104141028.420c9274@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Nov 2020 15:02:53 +0100
Message-ID: <CACRpkdY0H1Jt2pAgq0hLHjbh2xdezKBYK7kK=ZfyfxFHXsfEOA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 4, 2020 at 4:10 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Fri, 30 Oct 2020 12:50:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the pinctrl tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: modpost: "irq_gc_set_wake" [drivers/pinctrl/pinctrl-rockchip.ko] undefined!
> >
> > Caused by commit
> >
> >   6c684f5e79ea ("pinctrl: rockchip: make driver be tristate module")
> >
> > I have reverted that commit for today.
>
> I am still getting this failure.

Sorry for the mess, I dropped this commit now.

I think we need a separate patch to export that call
before we make Rockchip tristate.

Yours,
Linus Walleij
