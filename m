Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABC5342C55
	for <lists+linux-next@lfdr.de>; Sat, 20 Mar 2021 12:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhCTLkA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Mar 2021 07:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCTLjc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Mar 2021 07:39:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92CC061764;
        Fri, 19 Mar 2021 23:08:08 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 8so543485ybc.13;
        Fri, 19 Mar 2021 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9b/gI/Y8C2M3ITolu7fT0Rqbq/JBTn9cm6d+0pcaHfc=;
        b=Y6B3nKQMoV4PHyfV3kFnNcY+E0YnL4szQZ8YM1Wz1R9L7WK1nvyTHYG6qp8y1LMQKB
         JFhAV4KuyV7QKC671TD4l6ro2H5TGlOGGi2xaf0P6SzNW2LvRv2ppQAXL/SCVcMvlNOx
         5FmY02eSv80T82Qwi9ajGzcv+/yQ3TmdKLubGJz3gEuZgwgyojQ0IarbAFGN5VTTCIQj
         h1y+4Tg9pE7SizrAUHsNFbfHZ8Yr7ZZUFv7S8TQoEbo9qjwrwtFpFeO7QB29AFj8m5uw
         qvgf/V+B/m3FCPwy+jkIhntVSiPOfIeu351aPrq1gLcWDxyggPnE5RKT5E2cWg2xhsRW
         jExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9b/gI/Y8C2M3ITolu7fT0Rqbq/JBTn9cm6d+0pcaHfc=;
        b=ZwCsYktA/Z0hMOW3IwHgc00XoUi0X64XM+/Kj4JMhDVsjR6I4H4Kyiz+5NbZIRjy9d
         K6qc2Tin2I1JTUNoIXQXTgkjf/QCyAcMsU/Q8nJc8p/jS4/7HGAtIAOLkAnKg0/1Uhoq
         RnK4SRE/uH1NBq7G1ZbW0qNpKpMBV/cZSzxFu8yJkyIcqGiE88ug1CIEd8ReFpxkkpc6
         AlK4HXvnUNFrfit64TR1Sm/aSt6cwmr70Ef9xk6NQ/N4IJcj4NHwLTPXYGIMVEemw5aK
         1dH7L0ctqc3JRc5391fH/0s4WCNtwJ90ZG4VIgy+cdjkQbgNWLRTpmiedYywot4XEI3x
         EAiQ==
X-Gm-Message-State: AOAM5325maon+UKAa8do9L5jXM7MS/QqHs1DfRD5zjH5tovBh/GWtbgy
        aI8sK1viA9k5YEhJoj/+bTU+eko5DCGgjsKE97U=
X-Google-Smtp-Source: ABdhPJzMGoiuSwIk+T2zYSq/zT/Q/iTVkz824OQLK5ExS/aRGEHQqtpPGbWmNr8z7Zs2XIGndn2DC5zNKBLU1bH6apo=
X-Received: by 2002:a25:d6d5:: with SMTP id n204mr10970837ybg.22.1616220487932;
 Fri, 19 Mar 2021 23:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210319175950.509fcbd0@canb.auug.org.au> <YFS1h6h+71sRlwFR@osiris>
 <20210320162734.1630cc55@elm.ozlabs.ibm.com>
In-Reply-To: <20210320162734.1630cc55@elm.ozlabs.ibm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 20 Mar 2021 07:07:57 +0100
Message-ID: <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 19
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Mar 20, 2021 at 6:33 AM Stephen Rothwell <sfr@rothwell.id.au> wrote:
>
> Daniel Axtens reported the same breakage on powerpc.  I bisected it to
> the same commit.  More experimentation shows that if you reverse just
> the change to include/linux/moduleparam.h the above warnings go away.
> So
>
> -#define MAX_PARAM_PREFIX_LEN (256 - sizeof(unsigned long))
> +#define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
>
> fixes it up.  Not sure what that does to the rust support ...

Sorry for that, and thanks a lot for taking a look. For the Rust
support I had to increase a few limits, mainly the symbol length. Let
me check and I'll report back.

Cheers,
Miguel
