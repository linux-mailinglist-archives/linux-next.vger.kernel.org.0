Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D568E2ABD54
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 14:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgKINpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 08:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730582AbgKINpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 08:45:15 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A00AC0613D3;
        Mon,  9 Nov 2020 05:45:15 -0800 (PST)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1604929514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TMKySgGJgC1fqz614HZz1ur6mH4gmtdE+AG/O021Ias=;
        b=m2cDXe8Z/AnJJ/BZv3cB/VhCAmw2qIm951Tn09Z4Tlsg9tErFUH5YZO3+ab0+PmFfiI+T3
        gRUX2QiiFf9FAmZjVWj+jVzvAA5vVwo1mstJ/0Q9fV3mGrJibfDIj/ST9cytivOjk+Fpvt
        g/MYphUc/wNUghBy7R/L992qE2BqF93+N563fPvQvHhmUswPO8eaTm5IVxDgJEG5BaoBZy
        6WdQMzJq1Uh1OkI5dT3ggLFj6oWypw8UNJniv0rc8FzKLdsdcpJ9o9oUj2LQl7lv0jGzH2
        DZOEflje1GH+OOWGRStYipDNwdkzfn/tRpYjGmMHl5IaChzK9+64SAPPWttRDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1604929514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TMKySgGJgC1fqz614HZz1ur6mH4gmtdE+AG/O021Ias=;
        b=3yphkHe0cvkfQQ6zuhIs4vXWijI48wy30HySpUaTMakqdXd2tELtHlJWch85RL6u8HtKTg
        B44WLCjTJFrZ2/CA==
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the block tree
In-Reply-To: <20201109141446.3370914b@canb.auug.org.au>
References: <20201109141446.3370914b@canb.auug.org.au>
Date:   Mon, 09 Nov 2020 14:45:13 +0100
Message-ID: <871rh2k5jq.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 09 2020 at 14:14, Stephen Rothwell wrote:
> Today's linux-next merge of the tip tree got a conflict in:
>
>   include/linux/sched/signal.h
>   include/linux/tracehook.h
>   kernel/signal.c
>   kernel/task_work.c
>
> between commits:
>
>   fdb5f027ce66 ("task_work: use TIF_NOTIFY_SIGNAL if available")
>   bf6996650675 ("task_work: remove legacy TWA_SIGNAL path")
>   ceb39b7c17b7 ("kernel: remove checking for TIF_NOTIFY_SIGNAL")
>
> from the block tree and commit:
>
>   114518eb6430 ("task_work: Use TIF_NOTIFY_SIGNAL if available")
>   12db8b690010 ("entry: Add support for TIF_NOTIFY_SIGNAL")
>
> from the tip tree.

Jens, how is that supposed to work?

You need to merge the 'core-entry-notify-signal' tag from the tip tree
into your next branch to make the follow up changes actually work.

Ideally you send the whole arch + core cleanup muck my way once the
architecture people are happy.

Thanks,

        tglx
