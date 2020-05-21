Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3841DCE3C
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 15:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgEUNfo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 09:35:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:39284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729197AbgEUNfn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 May 2020 09:35:43 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 230D620721;
        Thu, 21 May 2020 13:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590068143;
        bh=vPCtfItAKZs5tbKxa7/e57pZbNrUtY2q3ZoV6TDHbK4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=n7QdvfyZVoAbp1uztI0xitoVDwlqGOazkK7OJk+40jrBX9SB9CD31Tc/1GkzIrtF1
         KI8wPzAPNWnZsweUtt9wMuMKkcWvtaszTt3Z4HucljfFJc3LC9kr3G1VVNe9YR7zX8
         GdcRMWdEPN9qjvOGqlBog6znVuHi4TFNd7obmaHI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 087C03520CB7; Thu, 21 May 2020 06:35:43 -0700 (PDT)
Date:   Thu, 21 May 2020 06:35:43 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
Message-ID: <20200521133543.GX2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200519172316.3b37cbae@canb.auug.org.au>
 <20200521145124.48ae408b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521145124.48ae408b@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 21, 2020 at 02:51:24PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 19 May 2020 17:23:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the rcu tree got a conflict in:
> > 
> >   arch/powerpc/kernel/traps.c
> > 
> > between commit:
> > 
> >   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounting")
> > 
> > from the powerpc tree and commit:
> > 
> >   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
> > 
> > from the rcu tree.
> > 
> > I fixed it up (I used the powerpc tree version for now) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> 
> This is now a conflict between the powerpc commit and commit
> 
>   69ea03b56ed2 ("hardirq/nmi: Allow nested nmi_enter()")
> 
> from the tip tree.  I assume that the rcu and tip trees are sharing
> some patches (but not commits) :-(

We are sharing commits, and in fact 187416eeb388 in the rcu tree came
from the tip tree.  My guess is version skew, and that I probably have
another rebase coming up.

Why is this happening?  There are sets of conflicting commits in different
efforts, and we are trying to resolve them.  But we are getting feedback
on some of those commits, which is probably what is causing the skew.

							Thanx, Paul
