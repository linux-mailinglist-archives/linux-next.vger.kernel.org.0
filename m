Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4350434BFA6
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 00:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhC1W5W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 18:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhC1W5A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 28 Mar 2021 18:57:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA0CA61929;
        Sun, 28 Mar 2021 22:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616972220;
        bh=icvWgiSe44sNl4O5dSKaqa4fne9+KXWkECYdq/Nhy6s=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cdrqShjIIQlVc910r50mna70wAMu87wAxhUrmILLz2B8mrPclLmdCuTORftCZ8FLy
         axK7wQhYiQgMLR8JBjrIftO8QoiO27py9VyqHYlrOfejGx0Z3AG5D1xDD4Ibey/8aS
         LGvDpBvNtai+03zj+EpQ6W9fdRnHml1xGYjHuN2BSvE9kWDO9U4SAg5RWp/6/LT5VI
         Z0EhJbC++35oEh1NZPxkaGri2H1lHJUhtF5ZqApUUimtZbqD+hLW6x//iLBJf+IziB
         dUHryvooRkOPqT30i7S12gc6UqyVpapcUTgVdEw6HDf1yAHx/LbI0AmlV0ivW9dfIS
         ygx9j+1zqlEYw==
Date:   Mon, 29 Mar 2021 07:56:57 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
Message-Id: <20210329075657.26841b0a014f4a0af836be5b@kernel.org>
In-Reply-To: <20210329083037.1ca35739@canb.auug.org.au>
References: <20210329083037.1ca35739@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 29 Mar 2021 08:30:37 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   2f706e0e5e26 ("x86/kprobes: Fix to identify indirect jmp and others using range case")
> 
> Fixes tag
> 
>   Fixes: 6256e668b7 ("x86/kprobes: Use int3 instead of debug trap for single-step")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
> 
> I don't think this is worth rebasing to fix, but it can be avoided in
> the future by setting core.abbrev to 12 (or more) or (for git v2.11 or
> later) just making sure it is not set (or set to "auto").

Sorry, it was my mistake. this is the correct tag.

Fixes: 6256e668b7af ("x86/kprobes: Use int3 instead of debug trap for single-step")

Thanks, 

> 
> -- 
> Cheers,
> Stephen Rothwell


-- 
Masami Hiramatsu <mhiramat@kernel.org>
