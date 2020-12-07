Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0ABB2D17D8
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 18:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgLGRtd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 12:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgLGRtd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 12:49:33 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7857CC061794;
        Mon,  7 Dec 2020 09:48:53 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 78916372;
        Mon,  7 Dec 2020 17:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 78916372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607363332; bh=fyQoFY+Z3VXz093ucTvg3vv5zEXw80mK2kWHUSfR8K4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AsyQ83KRqsS+1CPlvQOexG8LrNuvsCfSHWyyfin9w6YzzfrMYyBG+oIHdp1RKjWcp
         HGIeGdJcEqeL6FqR7dyaCW+e3pQI9Ja8dY5aakKnxrR6w0HDwBgtUEVGrqh2PThofc
         ij09Nt3uf9zCl6Yq0F+FRI3rwy7RqCieXIqDjKm99pToTmwWAMcK+jGCDslmEwwAso
         lp5B+SzZF5bmezhoZ1ls3OJWiOyDFeKJ0u1q0Ng1t+YBH/xdC9JuRo7M45nv6xjsgG
         fZBWtfKu3GiZWFWOpDppo0SfFWYZkL1Yhw8ZapM20M8sga5dEerr3xmH310ekr0fsY
         tfhLOvoZNS11w==
Date:   Mon, 7 Dec 2020 10:48:51 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20201207104851.20400bba@lwn.net>
In-Reply-To: <20201207164704.GH2657@paulmck-ThinkPad-P72>
References: <20201207192028.5333e4d7@canb.auug.org.au>
        <20201207164704.GH2657@paulmck-ThinkPad-P72>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 7 Dec 2020 08:47:04 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> I freely confess that I have absolutely no idea what it doesn't like.
> It is complaining about this header comment, correct?
> 
> /**
>  * kmem_last_alloc_stack - Get return address and stack for last allocation
>  * @object: object for which to find last-allocation return address.
>  * @stackp: %NULL or pointer to location to place return-address stack.
>  * @nstackp: maximum number of return addresses that may be stored.
>  *
>  * If the pointer references a slab-allocated object and if sufficient
>  * debugging is enabled, return the return address for the corresponding
>  * allocation.  If stackp is non-%NULL in %CONFIG_STACKTRACE kernels running
>  * the slub allocator, also copy the return-address stack into @stackp,
>  * limited by @nstackp.  Otherwise, return %NULL or an appropriate error
>  * code using %ERR_PTR().
>  *
>  * Return: return address from last allocation, %NULL or negative error code.
>  */

The problem is the %ERR_PTR().  I'm honestly not quite sure why, Sphinx is
being a little weird there.  But in any case the % notation is supposed to
mark a constant, which is not the case here.  I'd just take the % signs
out.

jon
