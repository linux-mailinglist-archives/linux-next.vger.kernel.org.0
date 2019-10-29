Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E53B1E7D8C
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 01:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfJ2Agp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 20:36:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:49760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbfJ2Ago (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 20:36:44 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F782217D6;
        Tue, 29 Oct 2019 00:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572309404;
        bh=dD3wpvsFUJVDToqqueKkD/tHXNeThdVLj7rXMSmQEU8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=yU7D6HV0Y7qJZnxpt6tiORKJnVmor4JnTyiGFqv4jELrctX1tb6lCDQC3hPo400L3
         8XG/kNVqEKplfsTMKIgik5fiqrSXiR4TKgCOk2sh9EDKom0h7HIsl4BaLFw9gya32J
         S4FgSuTdV4o+0c0yOpXU/PENIIJEjk7Nxy4KyJ40=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 1227F3522C0D; Mon, 28 Oct 2019 17:36:44 -0700 (PDT)
Date:   Mon, 28 Oct 2019 17:36:44 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20191029003644.GE20975@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191029075041.7bf3f723@canb.auug.org.au>
 <20191029080116.1ba4849f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029080116.1ba4849f@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 08:01:16AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> [Resending with correct address syntax]
> 
> On Tue, 29 Oct 2019 07:50:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > [Resent with Paul's new (working) address]
> > 
> > In commit
> > 
> >   292d1bb21aba ("rcu: Several rcu_segcblist functions can be static")
> > 
> > Fixes tag
> > 
> >   Fixes: ab2ef5c7b4d1 ("rcu/nocb: Atomic ->len field in rcu_segcblist structure")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Did you mean
> > 
> > Fixes: eda669a6a2c5 ("rcu/nocb: Atomic ->len field in rcu_segcblist structure")

Indeed I did, thank you, Stephen!

							Thanx, Paul
