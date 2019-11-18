Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3FA61000DD
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 10:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfKRJAP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 18 Nov 2019 04:00:15 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:49422 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfKRJAP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 04:00:15 -0500
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
        (envelope-from <bigeasy@linutronix.de>)
        id 1iWct6-00051H-PE; Mon, 18 Nov 2019 10:00:00 +0100
Date:   Mon, 18 Nov 2019 10:00:00 +0100
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Message-ID: <20191118090000.hpnibmk6xculuwii@linutronix.de>
References: <20191118150858.1a436a12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20191118150858.1a436a12@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019-11-18 15:08:58 [+1100], Stephen Rothwell wrote:
> Hi all,
Hi,

> Today's linux-next merge of the workqueues tree got a conflict in:
> 
>   kernel/workqueue.c
> 
> between commit:
> 
>   5a6446626d7e ("workqueue: Convert for_each_wq to use built-in list check")
> 
> from the tip tree and commit:
> 
>   49e9d1a9faf2 ("workqueue: Add RCU annotation for pwq list walk")
> 
> from the workqueues tree.

urgh. So the RCU warning is introduced in commit
   28875945ba98d ("rcu: Add support for consolidated-RCU reader checking")

which was merged in v5.4-rc1. I enabled it around -rc7 and saw a few
warnings including in the workqueue code. I asked about this and posted
later a patch which was applied by Tejun. Now I see that the tip tree
has a patch for this warning…
I would vote for the patch in -tip since it also removes the
assert_rcu_or_wq_mutex() macro.
It would be nice if this could be part of v5.4 since once the RCU
warning is enabled it will yell.

Sebastian
