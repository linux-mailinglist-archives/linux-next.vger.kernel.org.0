Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C83EB647
	for <lists+linux-next@lfdr.de>; Fri, 13 Aug 2021 15:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbhHMNxU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Aug 2021 09:53:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231127AbhHMNxU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Aug 2021 09:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 943A660F11;
        Fri, 13 Aug 2021 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628862773;
        bh=sqXtbAsweP69K+laj3aPbLYAw5spnrPTjCYsrVji+U4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rJOLF0/TwQauuFK48Og23uQa8sTBjXk53YQjsGZJy1rBYqRwg6VN3Oh/xhrMO+jFY
         FK8OKoKtJCFrxW55AUs1HgqMFvfn+iOGWa9jypc1y0T5jE52YuAyomwxqfi3s+kK2K
         +4DA49q1POVTmg5Tk8cOjCqjZ15e09Qtp1wM5Sf6ENPqN4Swz1QLJIwZfQQ4xYyyWS
         ts+9RCYyQ1O+rVLgL2Nl7/EcX9uTzSOeE+m62j9jcciYbeSHXW0nn0c/NIdfjS3YA1
         Qdt1x/EteZd5O+Nx4d/zUjKtXN9iT0maKoNBvuLO3smIriupzWhyvKswkXtOcf6bGP
         VQm0UxdJ5XHUw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 61F285C0373; Fri, 13 Aug 2021 06:52:53 -0700 (PDT)
Date:   Fri, 13 Aug 2021 06:52:53 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the irqchip tree
Message-ID: <20210813135253.GA4126399@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210813140437.79035655@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813140437.79035655@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 13, 2021 at 02:04:37PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/irq/chip.c
> 
> between commit:
> 
>   56707bb845f5 ("genirq, irq-gic-v3: Make NMI flow handlers use ->irq_ack() if available")
> 
> from the irqchip tree and commit:
> 
>   ef62bf7e92d8 ("irq: abstract irqaction handler invocation")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

I had pulled these two in just for testing only because I was chasing
a problem that looked like long-running irq handlers, but which proved
to be something rather different.

ef62bf7e92d8 ("irq: abstract irqaction handler invocation")
2eeaae3c02b9 ("irq: detect long-running IRQ handlers")

I will be dropping these this morning, Pacific Time.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/irq/chip.c
> index 1b1171113437,804c2791315d..000000000000
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@@ -768,11 -744,6 +768,9 @@@ void handle_nmi(struct irq_desc *desc
>   
>   	__kstat_incr_irqs_this_cpu(desc);
>   
>  +	if (chip->irq_ack)
>  +		chip->irq_ack(&desc->irq_data);
>  +
> - 	trace_irq_handler_entry(irq, action);
>   	/*
>   	 * NMIs cannot be shared, there is only one action.
>   	 */
> @@@ -1050,13 -954,7 +1044,10 @@@ void handle_percpu_devid_nmi(struct irq
>   
>   	__kstat_incr_irqs_this_cpu(desc);
>   
>  +	if (chip->irq_ack)
>  +		chip->irq_ack(&desc->irq_data);
>  +
> - 	trace_irq_handler_entry(irq, action);
> - 	res = action->handler(irq, raw_cpu_ptr(action->percpu_dev_id));
> - 	trace_irq_handler_exit(irq, action, res);
> + 	handle_irqaction_percpu_devid(irq, action);
>   
>   	if (chip->irq_eoi)
>   		chip->irq_eoi(&desc->irq_data);


