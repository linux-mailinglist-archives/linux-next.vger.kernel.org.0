Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CB32B3320
	for <lists+linux-next@lfdr.de>; Sun, 15 Nov 2020 10:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgKOJBL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 04:01:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:37580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgKOJBL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Nov 2020 04:01:11 -0500
Received: from kernel.org (unknown [77.125.7.142])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA8702242E;
        Sun, 15 Nov 2020 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605430870;
        bh=lClu43aq77zb7RcYXePPH7+GNjpHQB6AUPoBtNZQ5A8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qq2GEptS7OQ4MB/8fLjMsz7q0eOA2SBwx4uzZs3aGt+/ZVq9CwI1ZxIB0xvO/Z0G6
         IQeCpN16Y2YQEySv3Uy2n2xLUPwPwPuhl8XRdDkYZtCFCSjVwCBMzv3HzmIahS0Iru
         ByGSlvc0KRQyjDqyCqM87ktV0blqeIpMuy44YmS4=
Date:   Sun, 15 Nov 2020 11:01:05 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20201115090105.GX4758@kernel.org>
References: <20201113180239.0ee06fd2@canb.auug.org.au>
 <20201113171452.087c489c1ef58e472667577e@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113171452.087c489c1ef58e472667577e@linux-foundation.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 13, 2020 at 05:14:52PM -0800, Andrew Morton wrote:
> On Fri, 13 Nov 2020 18:02:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the akpm tree, today's linux-next build (i386 defconfig)
> > failed like this:
> > 
> > mm/secretmem.c: In function 'secretmem_memcg_charge':
> > mm/secretmem.c:72:4: error: 'struct page' has no member named 'memcg_data'
> >    72 |   p->memcg_data = page->memcg_data;
> >       |    ^~
> > mm/secretmem.c:72:23: error: 'struct page' has no member named 'memcg_data'
> >    72 |   p->memcg_data = page->memcg_data;
> >       |                       ^~
> > mm/secretmem.c: In function 'secretmem_memcg_uncharge':
> > mm/secretmem.c:86:4: error: 'struct page' has no member named 'memcg_data'
> >    86 |   p->memcg_data = 0;
> >       |    ^~
> > 
> > ...
> >
> > --- a/mm/secretmem.c
> > +++ b/mm/secretmem.c
> > @@ -69,7 +69,9 @@ static int secretmem_memcg_charge(struct page *page, gfp_t gfp, int order)
> >  	for (i = 1; i < nr_pages; i++) {
> >  		struct page *p = page + i;
> >  
> > +#ifdef CONFIG_MEMCG
> >  		p->memcg_data = page->memcg_data;
> > +#endif
> >  	}
> >  
> >  	return 0;
> 
> Thanks, that'll work for now.
> 
> I guess we're looking at adding a set_page_memcg() (I'd prefer
> page_memcg_set()).
> 
> But probably these functions shouldn't be compiled at all if
> CONFIG_MEMCG=n.

My preference would be to put the entire function body in '#ifdef
CONFIG_MEMCG' here.

-- 
Sincerely yours,
Mike.
