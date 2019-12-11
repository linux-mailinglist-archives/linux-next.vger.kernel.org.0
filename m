Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2966A11C026
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 23:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbfLKWwn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 17:52:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:51238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbfLKWwn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Dec 2019 17:52:43 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D979120836;
        Wed, 11 Dec 2019 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576104762;
        bh=tFWaMLyOF8Tf7ivAHYNOKMYRJAyotA/hm9yrVCiwjB8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Bc5/neBO0uaHgtjSc32WFICbeS7jv8RDPIZD8yMxGw2zIQc6wjQum9Gw2wexI2Ven
         20jpK4wrgqIO9odURnd5y4+YeQxn3zRx8kv2AXwclj2ALIshC8+YUy20lSvqkWdff3
         B1HEz2atwRJuWJ+UAU3lF8l2gCNDn5/h/bfBnYVs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 4D04835203C6; Wed, 11 Dec 2019 14:52:42 -0800 (PST)
Date:   Wed, 11 Dec 2019 14:52:42 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Subject: Re: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20191211225242.GJ2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191212074451.18c69a64@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212074451.18c69a64@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 12, 2019 at 07:44:51AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   3b570f534011 ("rcutorture: The rcu_boot_ended variable can be static")
> 
> Fixes tag
> 
>   Fixes: 68ce6668914d ("rcutorture: Suppress forward-progress complaints during early boot")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Did you mean
> 
> Fixes: 7e1204f7a29e ("rcutorture: Suppress forward-progress complaints during early boot")

You know, I should just fold those two commits together.  Thank you for
catching this, Stephen!

							Thanx, Paul
