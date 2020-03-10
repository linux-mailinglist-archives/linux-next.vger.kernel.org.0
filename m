Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7DD17EED0
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 03:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgCJCtn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 22:49:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:44712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgCJCtn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 22:49:43 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D2C92464B;
        Tue, 10 Mar 2020 02:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583808583;
        bh=QIy1GEaOobmUoatTslwL2AQt3mEWOLC33c3RQwb3h8A=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IM/vdzSWmD0fJCRyJ/AR1Joj9fLeughx3E9yK8aSy6RIvdqAaoGQyZKGWvoT33x3f
         86nU8Bd67pLExULqOqktfxDjwDVVMH9O/+o7IOIKjb0tZEOohZfBhg7/Jcpe8oUAIq
         PLMSlrqVS49cfpPhntcCSHQb9jdH6fhUgKV5dyJg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id E54A035226C7; Mon,  9 Mar 2020 19:49:42 -0700 (PDT)
Date:   Mon, 9 Mar 2020 19:49:42 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20200310024942.GX2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200310132709.3b5c6abe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310132709.3b5c6abe@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 01:27:09PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_GPL

Good catch, will fix, thank you!

> Introduced by commit
> 
>   cbd703932774 ("rcu-tasks: Add an RCU-tasks rude variant")
> 
> Why is all that code in a header file?  Do you intend to have those
> functions defined in each C file that includes kernel/rcu/tasks.h?

Same setup as for tree_plugin.h, tree_exp.h, tree_stall.h, and so in
in that same directory.  Plugins of various sorts.

							Thanx, Paul
