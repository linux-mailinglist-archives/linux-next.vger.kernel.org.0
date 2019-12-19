Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D08F1263B9
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 14:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfLSNib (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 08:38:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:40284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbfLSNia (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 08:38:30 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4DFC20684;
        Thu, 19 Dec 2019 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576762709;
        bh=H5+pX1vWjUX3DlsFCPRqcN0cwwYfdIzXOu/G2222Jxs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=d3MpCAgzuIJypT663vxUWNJ9cfpuBGYCw0C/S/hV2VAl6fEdHbRsPSsuoGgbScQ8+
         Y+mVlH6TNbZvh1j542vjahCeRhkCqsVrvBk7nV/bBcKUlqZw5ZIP3WBL/iw0QXNDIm
         cHVqGSro3sY4INMLFivu9y6UtGXaNhSvbPXJyw/A=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 978EE352277E; Thu, 19 Dec 2019 05:38:29 -0800 (PST)
Date:   Thu, 19 Dec 2019 05:38:29 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20191219133829.GZ2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191219115036.4699721c@canb.auug.org.au>
 <20191219012726.GY2889@paulmck-ThinkPad-P72>
 <20191219013151.GA21768@paulmck-ThinkPad-P72>
 <20191219084155.GU2844@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219084155.GU2844@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 19, 2019 at 09:41:55AM +0100, Peter Zijlstra wrote:
> On Wed, Dec 18, 2019 at 05:31:51PM -0800, Paul E. McKenney wrote:
> > On Wed, Dec 18, 2019 at 05:27:26PM -0800, Paul E. McKenney wrote:
> > > On Thu, Dec 19, 2019 at 11:50:35AM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > Today's linux-next merge of the rcu tree got a conflict in:
> > > > 
> > > >   kernel/cpu.c
> > > > 
> > > > between commit:
> > > > 
> > > >   45178ac0cea8 ("cpu/hotplug, stop_machine: Fix stop_machine vs hotplug order")
> > > > 
> > > > from the tip tree and commit:
> > > > 
> > > >   d62c673f4cfc ("cpu/hotplug, stop_machine: Fix stop_machine vs hotplug order")
> > > > 
> > > > from the rcu tree.
> > > > 
> > > > I fixed it up (I just used the tip tree version) and can carry the fix
> > > > as necessary. This is now fixed as far as linux-next is concerned, but
> > > > any non trivial conflicts should be mentioned to your upstream maintainer
> > > > when your tree is submitted for merging.  You may also want to consider
> > > > cooperating with the maintainer of the conflicting tree to minimise any
> > > > particularly complex conflicts.
> > > 
> > > I will pull this one out of the set that I mark for -next.  That way
> > > I can test and you can avoid at least this one conflict.  ;-)
> > 
> > Heh.  And the reason that it conflicts is that I fixed at least one
> > spelling error...  ;-)
> > 
> > Still, the one in tip is the official one, so I will proceed as planned.
> 
> Argh, my bad. I'd forgotten you'd already queued it, and I was holding
> onto it to make sure it didn't get lost. Now we haz it twice.

Better than losing the patch!  ;-)

							Thanx, Paul
