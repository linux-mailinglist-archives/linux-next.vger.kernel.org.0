Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9434A45A612
	for <lists+linux-next@lfdr.de>; Tue, 23 Nov 2021 15:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbhKWOxR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Nov 2021 09:53:17 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:38644 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbhKWOxR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Nov 2021 09:53:17 -0500
Date:   Tue, 23 Nov 2021 15:50:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1637679007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vwnOCI+L+B20iIZ44o/E6m8Rm/1smT3oBiLTmdpwUYU=;
        b=sDjeOJx56OO+a6iNaTtYNZLIZkoWZ8KkYGaaqIBk3jBVZOMCzhsxbhoE4dcnZaAezL2zoO
        UebXzP+5tCuWZn0gbgsku8TfqMwxWuWP2/tIj58w8jPFMw0pvGe8KiAftc3HLHTnWInUbR
        NTKriFyP2HeQUwkqnHeuwLU8TDVFrGIBlx7/7NbmDiB3MVSgPgFoN5hKBsNg2+4LZv2aeH
        kXG7QAS79t7USuDeE6dKMjwZ56AMl6f9vjP3Ewecvf56kFd43Y/NJKbACfpVzFhojPSeJ9
        3JmQFgumt1oFj7AYkL3GQGvEMF0v4DWw4lFzJNkNlXV4jwq3eMu0F3154nRRAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1637679007;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vwnOCI+L+B20iIZ44o/E6m8Rm/1smT3oBiLTmdpwUYU=;
        b=6aE+5JtfaqdDSPnOH9qRB61+IjPm1E7I4EWXam35206nLoKs1vVya6voSkw7o4J9PK77rM
        kIufRD2m++OPbxDQ==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Galbraith <umgwanakikbuti@gmail.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, lkft-triage@lists.linaro.org
Subject: Re: spinlock.c:306:9: error: implicit declaration of function
 '__raw_write_lock_nested'
Message-ID: <20211123145006.bon3usz4ilhw6ymg@linutronix.de>
References: <CA+G9fYtH2JR=L0cPoOEqsEGrZW_uOJgX6qLGMe_hbLpBtjVBwA@mail.gmail.com>
 <CAK8P3a1NhpNxWfj3gDnuf4bWK_fiE8cjcRyN7e8j95NmvOzbGw@mail.gmail.com>
 <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVuoUAM-6H2BXYtUH++4yXhRCGLAdbzx2GqAJk64FYO=A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021-11-23 15:48:34 [+0100], Geert Uytterhoeven wrote:
> Except for:
> 
>     kernel/locking/spinlock.c:306:9: error: implicit declaration of
>     function '__raw_write_lock_nested'; did you mean
>     '_raw_write_lock_nested'? [-Werror=implicit-function-declaration]
>       306 |         __raw_write_lock_nested(lock, subclass);
>           |         ^~~~~~~~~~~~~~~~~~~~~~~
>           |         _raw_write_lock_nested
> 
> Which was also reported for other architectures:
> https://lore.kernel.org/all/202111201111.c2ApGeHR-lkp@intel.com/

I'm on it. Almost done.

> Gr{oetje,eeting}s,
> 
>                         Geert

Sebastian
