Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8163684F9
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 18:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236693AbhDVQhW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 12:37:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:36684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232670AbhDVQhV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 12:37:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B46C261424;
        Thu, 22 Apr 2021 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619109406;
        bh=fg/L0LsFWhXL8NfM+puv8P931c9U8iaZWIiB+Tj8fLo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=udBiQfP6XCu90KZgEaUcdamYI7R3kLPssNs5hNlOe5Trdpw62zN2Db/SKecMXLh7m
         ZGdnDV8TtsQ4oD/XrdRHwPicM0p/pLZ+KZjDMwfwhXd0DCSXAfodGw0u8nEV06tAuF
         PgezMQtdLtCD9K7MVHK8maarxjUeOPhPPD/RmBrkamKcCMtRHovlgU1NQd3U+ouS6c
         B8uGz3dStaP5SG90vrPV042SqGI94WHO4NdwCp0D/1mWxiX5uNqoPGDzzJLtCkKl7h
         Yx38vT7faP98MjTuvpNdA+UzNJDNp1TWc+1StQz5d3I3bZlfdcOItldPkz22GFQ50+
         8PpmpzNL1t7Cw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 530485C00B4; Thu, 22 Apr 2021 09:36:46 -0700 (PDT)
Date:   Thu, 22 Apr 2021 09:36:46 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20210422163646.GG975577@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210422141016.656f50bc@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422141016.656f50bc@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Apr 22, 2021 at 02:10:16PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from kernel/rcu/update.c:584:
> kernel/rcu/tasks.h:1404:20: error: static declaration of 'show_rcu_tasks_gp_kthreads' follows non-static declaration
>  1404 | static inline void show_rcu_tasks_gp_kthreads(void) {}
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from kernel/rcu/update.c:49:
> kernel/rcu/rcu.h:440:6: note: previous declaration of 'show_rcu_tasks_gp_kthreads' was here
>   440 | void show_rcu_tasks_gp_kthreads(void);
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   4bf02dd6048d ("tasks-rcu: Make show_rcu_tasks_gp_kthreads() be static inline")
> 
> I have used the rcu tree from next-20210421 for today.

Well, that is one commit that isn't going into the upcoming merge window!

I have (allegedly) fixed it with attribution, but also moved it out of
my -next pile.  I will update rcu/next after a quick round of tests.

Apologies for the hassle!

							Thanx, Paul
