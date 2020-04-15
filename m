Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB241AB389
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 23:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgDOVxJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 17:53:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:6892 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731290AbgDOVwe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 17:52:34 -0400
IronPort-SDR: In9E5fXNBkqglo8TxAmOrOnqYtljVAReTOl3eqoQNTeQ7o0WMihZOgf4M3RCrrPtIn3SPSQl72
 6OJZqCoVmpoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 14:52:33 -0700
IronPort-SDR: UPlWAnNWjmdiTb9DDxhqHXmstlOrh1L3Erh+angx0aJl64LhAn9MON4WHlutCCWIyruoZTCjVS
 FW3Hy6EPKnLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; 
   d="scan'208";a="256993381"
Received: from jsfenner-mobl1.amr.corp.intel.com (HELO [10.252.129.141]) ([10.252.129.141])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2020 14:52:31 -0700
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
        "Williams, Dan J" <dan.j.williams@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
 <20200306132537.783769-3-imbrenda@linux.ibm.com>
From:   Dave Hansen <dave.hansen@intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
Message-ID: <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
Date:   Wed, 15 Apr 2020 14:52:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200306132537.783769-3-imbrenda@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/6/20 5:25 AM, Claudio Imbrenda wrote:
> +	/*
> +	 * We need to make the page accessible if and only if we are going
> +	 * to access its content (the FOLL_PIN case).  Please see
> +	 * Documentation/core-api/pin_user_pages.rst for details.
> +	 */
> +	if (flags & FOLL_PIN) {
> +		ret = arch_make_page_accessible(page);
> +		if (ret) {
> +			unpin_user_page(page);
> +			page = ERR_PTR(ret);
> +			goto out;
> +		}
> +	}

Thanks, Claudio, for a really thorough refresher on this in private mail.

But, I think this mechanism probably hooks into the wrong place.  I
don't doubt that it *functions* on s390, but I think these calls are
misplaced.  I think the end result is that no other architecture will
have a chance to use the same hooks.  They're far too s390-specific even
for a concept that's not limited to s390.

get_user_pages(FOLL_PIN) does *not* mean "the kernel will access this
page's contents".  The kmap() family is really what we use for that.
kmap()s are often *preceded* by get_user_pages(), which is probably why
this works for you, though.

Yes, the docs do say that FOLL_PIN is for accessing the pages.  But,
there's a crucial thing that it leaves out: *WHO* will be accessing the
pages.  For Direct IO, for instance, the CPU isn't touching the page at
all.  It's always a device.  Also, crucially, the page contents are
*not* accessible from the CPU's perspective after a gup.  They're not
accessible until a kmap().  They're also not even accessible for
*devices* after a gup.  There's a _separate_ mapping process that's
requires to make them accessible to the CPU.

> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page *page)
>  int __test_set_page_writeback(struct page *page, bool keep_write)
>  {
>  	struct address_space *mapping = page_mapping(page);
> -	int ret;
> +	int ret, access_ret;
>  
>  	lock_page_memcg(page);
>  	if (mapping && mapping_use_writeback_tags(mapping)) {
> @@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
>  		inc_zone_page_state(page, NR_ZONE_WRITE_PENDING);
>  	}
>  	unlock_page_memcg(page);
> +	access_ret = arch_make_page_accessible(page);
> +	/*
> +	 * If writeback has been triggered on a page that cannot be made
> +	 * accessible, it is too late to recover here.
> +	 */
> +	VM_BUG_ON_PAGE(access_ret != 0, page);
> +
>  	return ret;
>  
>  }

I think this one really shows the cracks in the approach.  Pages being
swapped *don't* have get_user_pages() done on them since we've already
got the physical page at the time writeback and aren't looking at PTEs.

They're read by I/O devices sending them out to storage, but also by the
CPU if you're doing something like zswap.  But, again, critically,
accessing page contents won't be done until kmap().

I suspect you saw crashes underneath __swap_writepage()->submit_bio()
and looked a few lines up to the set_page_writeback() and decided to
hook in there.  I think a better spot, again, is to hook into kmap()
which is called in the block layer.

Why do I care?

I was looking at AMD's SEV (Secure Encrypted Virtualization) code which
is in the kernel which shares some implementation details with the
not-in-the-tree Intel MKTME.  SEV currently has a concept of guest pages
being encrypted and being gibberish to the host, plus a handshake to
share guest-selected pages.  Some of the side-effects of exposing the
gibberish to the host aren't great (I think it can break cache coherency
if a stray write occurs) and it would be nice to get better behavior.

But, to get better behavior, the host kernel might need to remove pages
from its direct map, making them inaccessible.  I was hoping to reuse
arch_make_page_accessible() for obvious reasons.  But, get_user_pages()
is not the right spot to map pages because they might not *ever* be
accessed by the CPU, only devices.

Anyway, I know it's late feedback, but I'd hate to have core code like
this that has no hope of ever getting reused.
