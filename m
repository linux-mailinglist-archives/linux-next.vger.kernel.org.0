Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912D82972F3
	for <lists+linux-next@lfdr.de>; Fri, 23 Oct 2020 17:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464045AbgJWPzG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Oct 2020 11:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464044AbgJWPzG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2020 11:55:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2FCFC0613CE
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 08:55:05 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d24so2664481lfa.8
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
        b=GD436E2U3ELljPkL4nM1PYvlFMy+YQnW7aen5YTspfRl7ksFgb2HDAmkn6V4t+JDaG
         dMMQj13VpeQs7o/RmxbX2tP6MlGCxWLIBdmEqKZM5NLiH7YFdLHZUROFosyHo2YrU1Oc
         /mkd7zfPG7SEUfxCAGBxjhO9Vpkj4+BC/pLM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CVCIDlW+4rSCxQwC/0UuCHmyl6vLpGQY3YbrIv0lS7k=;
        b=TPLcYC4TOvB/cCk9PoewjkgSWw8FAon5IhYkbnv4fGXva+NCjyi7ViOL7Aq4exH2Cg
         zK9nfYY7MI+1LZT5RWXkRORqD6MJ/QmpNV6aZyGsU/11iBSLr9yP8rMXyGQgK/ZDz+K5
         Zrp2/0lHERqdrPRVcyIv/IUC5D6rqYx5YFCRyUcqP8xh/BALYzMt4yjI+eoO90mRfHkw
         UF7fITv5htteJ+96IhtvRfmWmYHRyhpEL4hYrWYKGW6RFU2Zu700tNy37jz+htDACk7a
         Pma/4P1knFWUL/kwjtUhYQPUWVBuYlaZAhnC3kWK+W7/eWEvsbSmatbK1GHrT6dn2XPb
         za8Q==
X-Gm-Message-State: AOAM53037gSo/ryBC4lbDsYUfV/JzDYb6qyGmcyjapBkZpNdN+Z2IFH5
        748wr1B2/x2rT3SKM/7Plsi3aKYkPUwM+g==
X-Google-Smtp-Source: ABdhPJxJVhACbB3pdiT05xp/dq3fosmwVSTAXfPOqQpROjwaGVr9cLja+CF64tmk3Eu/pkAYrPEJdw==
X-Received: by 2002:a19:c811:: with SMTP id y17mr1082692lff.259.1603468503453;
        Fri, 23 Oct 2020 08:55:03 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 131sm172487lff.198.2020.10.23.08.55.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 08:55:01 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id c21so2104956ljj.0
        for <linux-next@vger.kernel.org>; Fri, 23 Oct 2020 08:55:01 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr1227378ljh.312.1603468500894;
 Fri, 23 Oct 2020 08:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHze+hKROmiB0uL90S8h9ppO9S9Xe7RWwv808QwOd_Yw@mail.gmail.com>
 <CAHk-=wg5-P79Hr4iaC_disKR2P+7cRVqBA9Dsria9jdVwHo0+A@mail.gmail.com>
 <CA+G9fYv=DUanNfL2yza=y9kM7Y9bFpVv22Wd4L9NP28i0y7OzA@mail.gmail.com>
 <CA+G9fYudry0cXOuSfRTqHKkFKW-sMrA6Z9BdQFmtXsnzqaOgPg@mail.gmail.com>
 <CAHk-=who8WmkWuuOJeGKa-7QCtZHqp3PsOSJY0hadyywucPMcQ@mail.gmail.com>
 <CAHk-=wi=sf4WtmZXgGh=nAp4iQKftCKbdQqn56gjifxWNpnkxw@mail.gmail.com>
 <CAEUSe78A4fhsyF6+jWKVjd4isaUeuFWLiWqnhic87BF6cecN3w@mail.gmail.com>
 <CAHk-=wgqAp5B46SWzgBt6UkheVGFPs2rrE6H4aqLExXE1TXRfQ@mail.gmail.com>
 <20201023050214.GG23681@linux.intel.com> <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
In-Reply-To: <356811ab-cb08-7685-ca01-fe58b5654953@rasmusvillemoes.dk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 23 Oct 2020 08:54:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
Message-ID: <CAHk-=whFb3wk0ff8jb3BCyoNvNJ1TSZxoYRKaAoW=Y43iQFNkw@mail.gmail.com>
Subject: Re: [LTP] mmstress[1309]: segfault at 7f3d71a36ee8 ip
 00007f3d77132bdf sp 00007f3d71a36ee8 error 4 in libc-2.27.so[7f3d77058000+1aa000]
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Sean Christopherson <sean.j.christopherson@intel.com>,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        zenglg.jy@cn.fujitsu.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        X86 ML <x86@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mm <linux-mm@kvack.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Ingo Molnar <mingo@redhat.com>, LTP List <ltp@lists.linux.it>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 23, 2020 at 12:14 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> That's certainly garbage. Now, I don't know if it's a sufficient fix (or
> could break something else), but the obvious first step of rearranging
> so that the ptr argument is evaluated before the assignment to __val_pu

Ack. We could do that.

I'm more inclined to just bite the bullet and go back to the ugly
conditional on the size that I had hoped to avoid, but if that turns
out too ugly, mind signing off on your patch and I'll have that as a
fallback?

             Linus
