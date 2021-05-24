Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31A7E38DFEF
	for <lists+linux-next@lfdr.de>; Mon, 24 May 2021 05:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhEXDuu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 23 May 2021 23:50:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232120AbhEXDuu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 May 2021 23:50:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05AF4611CE;
        Mon, 24 May 2021 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621828163;
        bh=CPTcYLUWzWRfdZnPklmPTnUyh7UXD6Lm+snEqADhKdY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=W0da8PUHYONEqZoGWCm7ac+MdmIJEdCFWa+5D/dR7ktREOaIxTPF66ZS4IXQmnqLf
         5r1/oNYI8GciWeIvyGy0jhiPGprYxoDFQWrH9gh9JvnHy8Fz7ZC6ysnftdAwwY5JJ5
         Yhjr5PnsjJhy3qQrZfNhQ1zYuXk8AiNZSr4lCj32RAE4Jo3kvIfR7vsqTgOcrCKG74
         /6o43xo0Roy9cC1tgxhT5L+cjDD8PXPdVE4GIhawAvYriSW9LnZeJ+U5W5FWihZ0aa
         ypEbSIBVrEzrnd72mPfk8moMkQtXfJ+hY9nlpZktahe3f9j2xzoPzfXSSMYuWjeS6y
         g7kPby1ruoxmA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id C0B285C018D; Sun, 23 May 2021 20:49:22 -0700 (PDT)
Date:   Sun, 23 May 2021 20:49:22 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210524034922.GI4441@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210523130244.1f672253@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210523130244.1f672253@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, May 23, 2021 at 01:02:44PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   5f47b19cd121 ("rcu: Do not disable gp stall detection in rcu_cpu_stall_reset()")
>   96100b1ecfd7 ("rcu/tree: Handle VM stoppage in stall detection")
>   399a8f91964e ("Documentation/RCU: Fix nested inline markup")
> 
> are missing a Signed-off-by from their committer.

You would think that I could remember to add the "-s", wouldn't you?
Apologies for the hassle -- will fix on next rebase.

							Thanx, Paul
