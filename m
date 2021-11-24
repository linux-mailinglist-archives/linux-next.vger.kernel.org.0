Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECBC45C945
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 16:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241748AbhKXP7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 10:59:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56834 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbhKXP7f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 10:59:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 57F7C1F45BC8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637769382; bh=zz/xw7PsWQON9rmJZojHTBxXbF24yxYHqhaUVP88TKs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=E/pte9+S/xU8DdTZ/vKpNhA3ylTQYBGSinvyN6mt+xZdQFKKHEb6Mmt84KbEzM5mZ
         OSPyhJ6sCmssRkBBHimK6onWi+F/fiAA5Ypad79m+N+kkn6BrMI3wqjRnjC5w47i2Q
         aPNdfcTSLCdquNNhzIMYwK9OlGuMqJafLR38PMnBjrRL+zm9bD++8vMrP9KIyqazlB
         tbunQevunpoo7PovcVIzyk1G/rHktU5H9JEaZdZEpb0Db+mq5nCjz2SQfKauqW6Gl0
         yoYNuJa5aw5Hl9JNwgtzD1fRyYNxpu0YlbF5Voaz4iL2LRbsvhzZ/6BwDUd1b2lpYs
         25pmRI9iK1Hpw==
Message-ID: <91a64059-f301-4812-56ea-38755ccae5d7@collabora.com>
Date:   Wed, 24 Nov 2021 12:56:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] futex: Wireup futex_waitv syscall
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>, linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org, Waiman Long <longman@redhat.com>,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Rob Landley <rob@landley.net>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Will Deacon <will@kernel.org>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
 <20211124132112.11641-1-andrealmeid@collabora.com>
 <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@collabora.com>
In-Reply-To: <CAK8P3a2BXefTw68yoZ9U0F=ASC3=EZDc5PDQCJ16MmXtynd59g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Às 11:29 de 24/11/21, Arnd Bergmann escreveu:
> On Wed, Nov 24, 2021 at 2:21 PM André Almeida <andrealmeid@collabora.com> wrote:
>>
>> Wireup futex_waitv syscall for all remaining archs.
>>
>> Signed-off-by: André Almeida <andrealmeid@collabora.com>
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> I double-checked that futex_waitv() doesn't need any architecture specific
> hacks, and that the list above is complete.

Thanks!

> 
> Should I take this through the asm-generic tree, or would you send it
> through the
> tip tree?
> 
I think that adding it to asm-generic tree make sense to me.
