Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC5A5232CBB
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 09:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgG3H4C (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 03:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3H4C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 03:56:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493D2C061794;
        Thu, 30 Jul 2020 00:56:02 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id a9so3455345pjd.3;
        Thu, 30 Jul 2020 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PQGzmtHcZlmJDRA7C6eLtrj5BCXF8PWaD3UmOYHI95k=;
        b=Ftgmt6rTc5uD14dGMD6Ky10v3ihn13lLXDnqfXbLSj72U/gKwWfAbZFtViwi34HNGX
         LRHCIHnlD4L+irqmZRbyFI0lFPTjzP1FWRkrgtI6lmsE0t2umtjvK1I+lmFD+ZxKpK8c
         xqPkXLNE62813jeCAiFgpptbKv/HGqxh1ChttbgkOkCRr/mmWIqIGDSgM2SxDm9WL6DC
         Ej6Fp5SLuv3B60s6+YoYQo1bFuwkWL6ivnPTbHWPD/i+L7BDTqsirzGRn/tVq7L1JSFj
         J7mwfzLRO5LHAW28fl3dLoHcEkj942qSP2lqo6D2oD84b+mNh1TdSVr3nYlfuiguqc5E
         WBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PQGzmtHcZlmJDRA7C6eLtrj5BCXF8PWaD3UmOYHI95k=;
        b=BeFO357GuxV51XhTW2EhopLeiUOosLJQGSoJ3R1x5WObGpPl4uoOy2AzHni3PlYc/N
         UrAfWPv/wZWpWjpD6N+W7sQUeeKgEsWj1qorxby4VMJ/h1JYGbBhPNYo8lEzl8Zfomkz
         8ASP35dqdY1fv7TMFPkZ3z2P6k8b3DnWGW15N/ptK6VB9KZcJFtoHiqwfXU0HCSRaWZw
         Mpyp9707fENDqi54ma7vUpBuHfqoUZTnuBuleOCzijz8CgcGDZ9Hm0V7hmSlTVtoLg+i
         RNLaLswNC1fPkyggXzX4DjJVKHsPii9p8vlHP2CpiZDM5sTx+3r05r75lN9LFz+E0AI6
         VnRg==
X-Gm-Message-State: AOAM531Y09+f6yQz15a++ClVkwSzscR8GkFR3T7w/zPXs95GQDi8LQPn
        PzRUG1Q/SHgSadp2ofYxFdYGR/KwtepmxbC+ojE=
X-Google-Smtp-Source: ABdhPJyBJavli4Hdt+Udc/wbdITtWpymY2JOOasLOYjpYX5MFDBd8NRGAAT7oZb3PJJoy/GAEsXNW4CbMC524A8Yux0=
X-Received: by 2002:a17:90a:a393:: with SMTP id x19mr14302660pjp.228.1596095761476;
 Thu, 30 Jul 2020 00:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200729210311.425d0e9b@canb.auug.org.au> <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au> <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
 <20200730005922.GA9710@gondor.apana.org.au> <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
 <20200730075040.GA21623@gondor.apana.org.au>
In-Reply-To: <20200730075040.GA21623@gondor.apana.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Jul 2020 10:55:46 +0300
Message-ID: <CAHp75Vde7nVV0RzELF7wtbRGVf3hhAKb-104F+VTMLoNj5sfvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header loop
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 30, 2020 at 10:51 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
> On Thu, Jul 30, 2020 at 10:47:16AM +0300, Andy Shevchenko wrote:
> >
> > We may ask Synopsys folks to look at this as well.
> > Vineet, any ideas if we may unify ATOMIC64_INIT() across the architectures?
>
> I don't think there is any technical difficulty.  The custom
> atomic64_t simply adds an alignment requirement so the initialisor
> remains the same.
>
> I just didn't want to add more complexity to the existing patch.
> As a follow-up patch it should be quite straightforward.

Ah, I see what you mean. I considered the follow up patch as well, I
thought there were some bigger impediments.

-- 
With Best Regards,
Andy Shevchenko
