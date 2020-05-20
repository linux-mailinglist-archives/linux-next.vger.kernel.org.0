Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCFB71DB556
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 15:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgETNl6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 09:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETNl6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 May 2020 09:41:58 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458A6C061A0F
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 06:41:58 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id m44so2500037qtm.8
        for <linux-next@vger.kernel.org>; Wed, 20 May 2020 06:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0V2YdmdsPWdKOdrPaJCwbEh29ibmH+HakgeEAIazLoU=;
        b=qC/4F699airF84eCWUHyAnJB2w/aPWBgGWneKHzTy6qapry8QGNFK5UmiB5clWhkUD
         ggrB7niieo2jjQVXpglDBJb7ukXKkzrkVarquFn4tm1uu2dajOKsFVM5z66yImWDvg/n
         e0LSe7TWd8zLwI9BVGuPxyk4wl1zCBkVrtmrEdgy90J45DrtDPZhLrfNNaUSGeqDZb4V
         Ohs7FLbLPjpkLw1yfxZKSavEOB6tO/0daVpWkCS1Zajo6To+piVtmILV8UNr33bAD5uX
         fK1dZdDvTXtkO+JqrxVuanC5knpnBNpif9cuHsTAeKkYe4hPnNM/jDZt16d03+R5FHv7
         VPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0V2YdmdsPWdKOdrPaJCwbEh29ibmH+HakgeEAIazLoU=;
        b=OvubXqYNigwcOxL6BLHDoMBalGQgsd7FHxNv7bqxs0zkcs5QLmgNIjgejHk9lVwJSF
         VwFLE0wy8n6Q5cilJL6SzL6qbgVYKEwRYAKUHm0oMqd9f5bqHdubTRo74n/3hoybinyw
         7uWEzemNmnXB8BFbr+yCmVIG57rqLvEawoAzK5YK08EiKgdChTulcjj2iZlTIim+bR1e
         dN4Sl95mdnI0TMUoOHmzMpQksFUhwa3T7yThS8lQnPMorMpjf5LecesuAEaJ8+9b4bnu
         LTbUrosKtPgABZgylruEbRf+bIL0wm/Gp9R/AzjJ3HMVEnZaRw65PBK/fyzAwVFQaFtw
         xWyg==
X-Gm-Message-State: AOAM533Ck3x8OmgyXj5iY+mjzSIPyD09n7FrE5Gcxqffi8QKeUECABHJ
        5hWycFjRCzfaWAT09e76fyj2Q2uN0g7biqokiJftYg==
X-Google-Smtp-Source: ABdhPJzdPKAs0FcB021TXKJADOyr7L07b4L1TgAmLuJZwsC2A0ftVTV4M5T7ShHJQofye20SE1BJoCJsElyH3SJIfec=
X-Received: by 2002:aed:3668:: with SMTP id e95mr5404706qtb.50.1589982117153;
 Wed, 20 May 2020 06:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000598a2905a60d50cd@google.com> <877dx66ce1.fsf@nanos.tec.linutronix.de>
In-Reply-To: <877dx66ce1.fsf@nanos.tec.linutronix.de>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 20 May 2020 15:41:45 +0200
Message-ID: <CACT4Y+apEBx58B7q7XOMrPzzXZiQ6zvnVLRypD1MxCURwNkkMg@mail.gmail.com>
Subject: Re: linux-next boot error: BUG: Invalid wait context ]
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     syzbot <syzbot+08003d278f04ed0944e0@syzkaller.appspotmail.com>,
        =?UTF-8?B?RnLDqWTDqXJpYyBXZWlzYmVja2Vy?= <fweisbec@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, May 20, 2020 at 2:04 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> syzbot <syzbot+08003d278f04ed0944e0@syzkaller.appspotmail.com> writes:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    fb57b1fa Add linux-next specific files for 20200519
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=17c9196e100000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2522f758a3588c2d
> > dashboard link: https://syzkaller.appspot.com/bug?extid=08003d278f04ed0944e0
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+08003d278f04ed0944e0@syzkaller.appspotmail.com
> >
> > =============================
> > [ BUG: Invalid wait context ]
> > 5.7.0-rc6-next-20200519-syzkaller #0 Not tainted
> > -----------------------------
> > swapper/1/0 is trying to lock:
> > ffff8880ae737518 (&pool->lock){..-.}-{3:3}, at: spin_lock include/linux/spinlock.h:353 [inline]
> > ffff8880ae737518 (&pool->lock){..-.}-{3:3}, at: __queue_work+0x2bf/0x1350 kernel/workqueue.c:1448
>
> Can you please disable CONFIG_PROVE_RAW_LOCK_NESTING for now?
>
> From the help text:
>
> NOTE:
>   There are known nesting problems. So if you enable this option expect
>   lockdep splats until these problems have been fully addressed which is
>   work in progress. This config switch allows to identify and analyze
>   these problems. It will be removed and the check permanentely enabled
>   once the main issues have been fixed.

Hi Thomas,

Done:
https://github.com/google/syzkaller/commit/4afdfa205b55633e7eb9db03a9d099d7aa324801

We can obsolete this then:

#syz invalid
