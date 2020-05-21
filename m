Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139101DD485
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 19:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbgEURf1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 13:35:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:51558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbgEURf1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 May 2020 13:35:27 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62813207F7;
        Thu, 21 May 2020 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590082526;
        bh=ULRJjH8DB81nFnWAtqD3OSOtQ+UAs0ih7wQ2qI2tOYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fyeTHZAHDDA9O+WxxYXDV3LCxr47qHrGbTjsLzJxPNNSNSrSXIBjSKDpGYUiaupLv
         6J5ptxVUFBsjegH/Mq1AxMTX3vdCWHeJCcBh0ja6Us+VBTmFc3vHST1dWLjnEpukbe
         goVPimB9RJuYSode6OAZF03Eeys/nMv22VGaovRg=
Date:   Thu, 21 May 2020 18:35:22 +0100
From:   Will Deacon <will@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com, bp@alien8.de
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200521173520.GL6608@willie-the-truck>
References: <20200522033119.1bbd99c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522033119.1bbd99c5@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

[+Marco and Boris]

On Fri, May 22, 2020 at 03:31:19AM +1000, Stephen Rothwell wrote:
> After merging the tip tree, all my linux-next builds took signficantly
> longer and used much more memory.  In some cases, builds would seg fault
> due to running out of memory :-(
> 
> I have eventaully bisected it to commit
> 
>   cdd28ad2d811 ("READ_ONCE: Use data_race() to avoid KCSAN instrumentation")
> 
> For my (e.g.) x86_64 allmodconfig builds (cross compiled on PowerPC le,
> -j80) the elapsed time went from around 9 minutes to over 17 minutes
> and the maximum resident size (as reported by /usr/bin/time) from around
> 500M to around 2G (I saw lots of cc1 processes over 2G in size).
> 
> For tomorrow's linux-next (well, later today :-() I will revert that
> commit (and its child) when I merge the tip tree.

Sorry about that, seems we can't avoid running into compiler problems with
this lot. The good news is that there's a series to fix this here:

https://lore.kernel.org/r/20200521142047.169334-1-elver@google.com

so hopefully this be fixed in -tip soon (but I agree that reverting the
thing in -next in the meantime makes sense).

Will
