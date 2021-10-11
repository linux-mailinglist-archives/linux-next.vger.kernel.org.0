Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC50428800
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhJKHqa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbhJKHqa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:46:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C399EC061570;
        Mon, 11 Oct 2021 00:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=uCL2BhWgnJ5aifK5wLuP65uCS+7S+xexMcWu2I1mfDA=; b=kJ/VtLpkwV5Tys4Qh4y+FkPp5j
        6+zpc6uuymsA9LCB7aOz8XhzP9rL+1XBLfpvl5cqAQPuQxMYdotmahMZVZ9yQ7FRuobBYbhJnKZ4r
        3HXkoy8pXVH4a9tbTYjbnU3kDkoHG/JrLZSqdRhzzzmTkdGTCz949+eSo+0zZKxW5jAI6BBfDy5RS
        4NBL1d8UE9b5fuPPwihasbMTRKh5rLjsYXSYFOVCb/egjIshzVAFgZeeqCJoqXBDmklsfcvwrPp+C
        wrcjClNh0s6Sc+5Lh1Ov92uRBEfc2NFnQWpM70YjqycKmCg5eQk4VJyc7vkYu0ldXutOEksKQk/qN
        mOWJsk6Q==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mZpue-005KsX-Fb; Mon, 11 Oct 2021 07:40:42 +0000
Date:   Mon, 11 Oct 2021 08:39:56 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: contact/tree changes for the swiotlb tree
Message-ID: <YWPqTEURBGvyguWI@infradead.org>
References: <20211008082637.78598d36@canb.auug.org.au>
 <YWCZHIk+QpsDb7Y8@0xbeefdead.lan>
 <20211009160846.5b90d9ba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009160846.5b90d9ba@canb.auug.org.au>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Oct 09, 2021 at 04:08:46PM +1100, Stephen Rothwell wrote:
> Hi Konrad,
> 
> On Fri, 8 Oct 2021 15:16:44 -0400 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com> wrote:
> > 
> > Yes please go ahead and drop the swiotlb.git tree from your excellent
> > system.
> 
> Done.

Thanks.  swiotlb will now be covered by the existing dma-mapping tree.
