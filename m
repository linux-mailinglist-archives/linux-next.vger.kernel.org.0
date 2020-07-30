Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDDF232CB1
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 09:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgG3Hrd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 03:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3Hrc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 03:47:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657A1C061794;
        Thu, 30 Jul 2020 00:47:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so16085060pgq.1;
        Thu, 30 Jul 2020 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtQd0r7mPWp4LCw9V5WruqvGI96T5CfT/3YOE4IYwQ0=;
        b=HWli+F3cevEtYkBYYAuXIgETbH5MGA5ExQ9WlWrGjRuUIvFZ37JydUyNRuJy8P5vPj
         8wj20w+O+qh2W1z22hoZoyjpNes8mHlfrCxmUfkxdsuwoNWp16IbARd6DE7c83M/pEA7
         rV5g81Lgcogtn+Yq+3Im0FMGGiMg3qLLQa4rPN9e++mtzRZ0tOY5pH58CfJ9HZBmx5Mr
         KemeY08AQzmAeJJHE2mxKjhMwfDUWVCmJdcECblJtWkRyQcyy/D0VLHewLaFItoFXrhX
         zoOXeCFFnJzEQqVwTeoayag3F8bzUyoNyuygIMd7HqiS/9zcaMqX1MMDBQSrzO3tftRC
         SWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtQd0r7mPWp4LCw9V5WruqvGI96T5CfT/3YOE4IYwQ0=;
        b=sln+m9hdVYPKr8peJDipqolfbrYI9fG6wsD5tQMADbnlFG6XgfG0KuxNMnQ1LnKj6X
         oHYHL0oDxTC1U6+ddL80HDTOr/v2Zx9RMxAurO0aP/31nLyJFnPGbBkOJ1uv2aiZkonT
         NED+C4/yKQo/CqdeFEbxIWIWtKinI02TByLXtSR0VN+GzaHzBjuBjBZZVgERv2tLIV2Y
         /PinjsbGc6ZLHVV+60V3IZE0ykcDxxVsGAyGbcJzvvcOr+96z5Wlrs+jOZz1uRikDDGv
         uWM/XakOle5inZFnpGzbfG+UuUALGVLRHMWDguQodJ67Ollzm7QtSmBvxgp+gyehu9Z3
         LiPw==
X-Gm-Message-State: AOAM533GuWJpHyKEWlk9Flkek56o7o850lsu9yU8Jpg9Msc3odlewp4n
        SbiX4auQoIcfszogiDC98SS2Do293V+I5NHVAxk=
X-Google-Smtp-Source: ABdhPJyvPhaxkAc8ZiP0Pqc3h7whZYpVSqj5vo0Mt3lDjRMjOkz1Mb4vjCwgIGBpxrGSQlRS1dJC8fjYpwgg3idWIL0=
X-Received: by 2002:a62:7b4e:: with SMTP id w75mr1977914pfc.130.1596095251805;
 Thu, 30 Jul 2020 00:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200729210311.425d0e9b@canb.auug.org.au> <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au> <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com> <20200730005922.GA9710@gondor.apana.org.au>
In-Reply-To: <20200730005922.GA9710@gondor.apana.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 30 Jul 2020 10:47:16 +0300
Message-ID: <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header loop
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Vineet Gupta <vgupta@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc:     Waiman Long <longman@redhat.com>,
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

On Thu, Jul 30, 2020 at 4:00 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Jul 29, 2020 at 06:04:57PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 29, 2020 at 4:35 PM Waiman Long <longman@redhat.com> wrote:
> > > On 7/29/20 8:28 AM, Herbert Xu wrote:
> >
> > ...
> >
> > > This patch series looks good to me. I just wonder if we should also move
> > > ATOMIC64_INIT() to types.h for symmetry purpose. Anyway,
> >
> > Same question here.
>
> Yes I almost started doing it but at least one architecture (arc)
> had a custom atomic64_t so I kept it out just to be on the safe
> side.

We may ask Synopsys folks to look at this as well.
Vineet, any ideas if we may unify ATOMIC64_INIT() across the architectures?

> We certainly could do this as a follow-up patch.

-- 
With Best Regards,
Andy Shevchenko
