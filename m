Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F022D09D4
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 05:49:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbgLGEtW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 23:49:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726482AbgLGEtW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 6 Dec 2020 23:49:22 -0500
Date:   Sun, 6 Dec 2020 20:48:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607316521;
        bh=k9A4ZjiahANn8gsfT1SVU57Lhq9aeLLkNBsXD3AhHm0=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VbcIptQzIhzaXEPytXTvpytzksPn7Xww6mGCKxmWI4/rprgPkggobag8zcUiWdBBS
         p/sSWd2szFuVLeCWyh0CaGVl+5IHnmktPQelC00D8h+c6aB7OgCN/6i2jIsKk4m3zZ
         jyVKUuEremfmgzIJ1g89SE1w2k4ODkNF+kVckMkEvhio7QW12KvEfo0JN+kXPkrZa/
         G/ph+InNpZYC9Vug/PJhbu8jtup6RiFJBy+XBYgZeICAgpHNetVUMf5rFrCANjg4dy
         qA5U1k4ywNzO8ecQv45w9kXThaeq+Jhs7f9awqK5Ka7irtibvuIKJ29cdM/4HP718b
         aBHWab6/QHb1Q==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20201207044841.GD2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201204192526.0b38fb02@canb.auug.org.au>
 <20201204192032.GA1437@paulmck-ThinkPad-P72>
 <20201207083920.2f64f4dc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207083920.2f64f4dc@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 07, 2020 at 08:39:20AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> On Fri, 4 Dec 2020 11:20:32 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >
> > Does the following patch fix things?  (Sigh.  It won't apply on the
> > rcu/next that you used.  Or even on this moment's dev branch.  I will
> > fold it in with attribution and update.  But just to show you what my
> > thought is.)
> 
> Sorry I didn't get the chance to test your patch, but it seems to make
> sense.  I notice that you have added this to the rcu tree for today, so
> I guess we will see :-)

Fair enough!  ;-)

							Thanx, Paul
