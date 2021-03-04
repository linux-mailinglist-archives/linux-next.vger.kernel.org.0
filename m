Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8E532CA2E
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 02:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235981AbhCDBs7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 20:48:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:45772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235982AbhCDBs5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Mar 2021 20:48:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 360B464FA3;
        Thu,  4 Mar 2021 01:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614822497;
        bh=a2KXA7WnwL2NzhJ+uXzFZCP1Wr57S1e/uDhPNo9ua7c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ArMDygbjqy+WqxRaVFGljGr6DmEnyw3mcvdvjzP4SmmWEMjaUO8Gygzhd2PO6ChoG
         AKu5YxvPC6NkdVIjroVMhS1bltt/W6rg31ezyhfarDTJiUrB4R/qKo2F2VI6luIGF4
         hsegn+LGJorncuY5ynEwIyrGMJ83YZSer+FUkmsmd9hsVc20jVtsVs/hJdK4rCLNie
         jVYv4GWnOJ7EIaczGTat1jzvc6be2SJtrTI9N6LVYtNmdP94Jly9cDwPFdmUzd1h6T
         KJcqlPyw3LhFVOcODIDfyuL+re8iaeRULGGweFIezn4oODytPctDjP5M1B/eMoYcAZ
         XtjIECzY4UD9g==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id ED158352274A; Wed,  3 Mar 2021 17:48:16 -0800 (PST)
Date:   Wed, 3 Mar 2021 17:48:16 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20210304014816.GM2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210304124105.7844dca6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304124105.7844dca6@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 04, 2021 at 12:41:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> kernel/rcu/tree.c:3824: warning: expecting prototype for start_poll_state_synchronize_rcu(). Prototype was for start_poll_synchronize_rcu() instead
> 
> Introduced by commit
> 
>   7f9a26bbfff2 ("rcu: Provide polling interfaces for Tree RCU grace periods")

Apologies and thank you, will fix!

							Thanx, Paul
