Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730611AB3BD
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 00:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731731AbgDOWSm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 18:18:42 -0400
Received: from merlin.infradead.org ([205.233.59.134]:41140 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731686AbgDOWSl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Apr 2020 18:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=c/5NlqOAmhcH6sCzbSCqfq7cT6kkrdzXJ8S6MG10Tjg=; b=CY+JSN4HHHUjTkvc5niF/1YwSz
        /W9lmivJ6Qn4s1CJqJnblTdO6VaZa5+v7MDDxJZa8EUHIw3UiwUrY6yLjvy1Zwm4qhGFAFTYKmW7Z
        nZivfRTjCZgtsx4vTp+5xMciLbpUYSM3jBFFac+MqEjLUy08Tko3hBfjCAqXfbhttEsuuG2WF0P2b
        Ovnm6lJy3DY7NI39C/f6Dd/9vFCIhgkIzZZulgdTngVKT/T8txzQD96gTd3HHneo4PXVpPY7fQa5y
        zDVTotxjbBuF/uK9bmwTQkTMHOIBoUTlZ8Os3znNSKppN3F7VTY9EUa+FHErK/ETETCG1RLuXxtpH
        3KxmJ/bQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOqM1-0001IP-Fl; Wed, 15 Apr 2020 22:17:57 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4338D981086; Thu, 16 Apr 2020 00:17:54 +0200 (CEST)
Date:   Thu, 16 Apr 2020 00:17:54 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
        "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
Message-ID: <20200415221754.GM2483@worktop.programming.kicks-ass.net>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
 <20200306132537.783769-3-imbrenda@linux.ibm.com>
 <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 15, 2020 at 02:52:31PM -0700, Dave Hansen wrote:
> On 3/6/20 5:25 AM, Claudio Imbrenda wrote:
> > +	/*
> > +	 * We need to make the page accessible if and only if we are going
> > +	 * to access its content (the FOLL_PIN case).  Please see
> > +	 * Documentation/core-api/pin_user_pages.rst for details.
> > +	 */
> > +	if (flags & FOLL_PIN) {
> > +		ret = arch_make_page_accessible(page);
> > +		if (ret) {
> > +			unpin_user_page(page);
> > +			page = ERR_PTR(ret);
> > +			goto out;
> > +		}
> > +	}
> 
> Thanks, Claudio, for a really thorough refresher on this in private mail.
> 
> But, I think this mechanism probably hooks into the wrong place.  I
> don't doubt that it *functions* on s390, but I think these calls are
> misplaced.  I think the end result is that no other architecture will
> have a chance to use the same hooks.  They're far too s390-specific even
> for a concept that's not limited to s390.
> 
> get_user_pages(FOLL_PIN) does *not* mean "the kernel will access this
> page's contents".  The kmap() family is really what we use for that.
> kmap()s are often *preceded* by get_user_pages(), which is probably why
> this works for you, though.
> 
> Yes, the docs do say that FOLL_PIN is for accessing the pages.  But,
> there's a crucial thing that it leaves out: *WHO* will be accessing the
> pages.  For Direct IO, for instance, the CPU isn't touching the page at
> all.  It's always a device.  Also, crucially, the page contents are
> *not* accessible from the CPU's perspective after a gup.  They're not
> accessible until a kmap().  They're also not even accessible for
> *devices* after a gup.  There's a _separate_ mapping process that's
> requires to make them accessible to the CPU.

I think the crucial detail is that we can fail gup(), while we cannot
ever fail kmap() or whatever else a device needs to do.

> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page *page)
> >  int __test_set_page_writeback(struct page *page, bool keep_write)
> >  {
> >  	struct address_space *mapping = page_mapping(page);
> > -	int ret;
> > +	int ret, access_ret;
> >  
> >  	lock_page_memcg(page);
> >  	if (mapping && mapping_use_writeback_tags(mapping)) {
> > @@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
> >  		inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
> >  	}
> >  	unlock_page_memcg(page);
> > +	access_ret = arch_make_page_accessible(page);
> > +	/*
> > +	 * If writeback has been triggered on a page that cannot be made
> > +	 * accessible, it is too late to recover here.
> > +	 */
> > +	VM_BUG_ON_PAGE(access_ret != 0, page);
> > +
> >  	return ret;
> >  
> >  }
> 
> I think this one really shows the cracks in the approach.  Pages being
> swapped *don't* have get_user_pages() done on them since we've already
> got the physical page at the time writeback and aren't looking at PTEs.

I suspect this happens because FOLL_TOUCH or something later does
set_page_dirty() on the page, which then eventually gets it in
writeback.

Failing gup() ealier, should ensure the above VM_BUG never happens,
unless someone is doing dodgy things.

> Why do I care?
> 
> I was looking at AMD's SEV (Secure Encrypted Virtualization) code which
> is in the kernel which shares some implementation details with the
> not-in-the-tree Intel MKTME.  SEV currently has a concept of guest pages
> being encrypted and being gibberish to the host, plus a handshake to
> share guest-selected pages.  Some of the side-effects of exposing the
> gibberish to the host aren't great (I think it can break cache coherency
> if a stray write occurs) and it would be nice to get better behavior.
> 
> But, to get better behavior, the host kernel might need to remove pages
> from its direct map, making them inaccessible. 

But for SEV we would actually need to fail this
arch_make_page_acesssible() thing, right? The encrypted guest pages
cannot be sanely accessed by the host IIRC, ever. Isn't their encryption
key linked to the phys addr of the page?

> I was hoping to reuse
> arch_make_page_accessible() for obvious reasons.  But, get_user_pages()
> is not the right spot to map pages because they might not *ever* be
> accessed by the CPU, only devices.

I'm confused, why does it matter who accesses it? The point is that they
want to access it through this vaddr/mapping.
