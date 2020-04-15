Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B300C1AB43D
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 01:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728889AbgDOXeU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 19:34:20 -0400
Received: from mga14.intel.com ([192.55.52.115]:47466 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbgDOXeT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 19:34:19 -0400
IronPort-SDR: sou9XkBJEyE8GYE/x1tq9Bb1/Uy0IH1U+ttxPubpfxZsbtdEC8L4u+Hbh18Mgc9z4PqZWGL8oR
 gjxdmPzYjUNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 16:34:15 -0700
IronPort-SDR: uwc89V4QTSEjFWiG62rgo9ZyZEBHX0UXyRL9tokTOB3L0nURwwFym6G4LzNIryh7LPqpBpQ7xT
 yPcPZgKniJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; 
   d="scan'208";a="257020603"
Received: from jsfenner-mobl1.amr.corp.intel.com (HELO [10.252.129.141]) ([10.252.129.141])
  by orsmga006.jf.intel.com with ESMTP; 15 Apr 2020 16:34:14 -0700
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>
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
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
 <20200306132537.783769-3-imbrenda@linux.ibm.com>
 <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
 <20200415221754.GM2483@worktop.programming.kicks-ass.net>
From:   Dave Hansen <dave.hansen@intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
Message-ID: <a7c2eb84-94c2-a608-4b04-a740fa9a389d@intel.com>
Date:   Wed, 15 Apr 2020 16:34:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200415221754.GM2483@worktop.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/15/20 3:17 PM, Peter Zijlstra wrote:
> On Wed, Apr 15, 2020 at 02:52:31PM -0700, Dave Hansen wrote:
>> Yes, the docs do say that FOLL_PIN is for accessing the pages.  But,
>> there's a crucial thing that it leaves out: *WHO* will be accessing the
>> pages.  For Direct IO, for instance, the CPU isn't touching the page at
>> all.  It's always a device.  Also, crucially, the page contents are
>> *not* accessible from the CPU's perspective after a gup.  They're not
>> accessible until a kmap().  They're also not even accessible for
>> *devices* after a gup.  There's a _separate_ mapping process that's
>> requires to make them accessible to the CPU.
> 
> I think the crucial detail is that we can fail gup(), while we cannot
> ever fail kmap() or whatever else a device needs to do.

Yep, good point.

The patch in question puts says that you now need to do something to the
page before it can be accessed by the kernel.  Because this is
presumably anonymous-only, and the only main way to get to anonymous
pages is the page tables, and the gup code is our de facto user page
table walker, this works OK-ish.

But, the gup code isn't out only walker.  Grepping for pte_page() finds
a bunch of sites that this approach misses.  They'll theoretically each
have to be patched if we want to extend this gup-time approach for
anything other than anonymous, small pages.

(Most of the additional pte_page() sites are for huge pages, which can't
be protected on s390.)

>>> +	access_ret = arch_make_page_accessible(page);
>>> +	/*
>>> +	 * If writeback has been triggered on a page that cannot be made
>>> +	 * accessible, it is too late to recover here.
>>> +	 */
>>> +	VM_BUG_ON_PAGE(access_ret != 0, page);
>>> +
>>>  	return ret;
>>>  
>>>  }
>>
>> I think this one really shows the cracks in the approach.  Pages being
>> swapped *don't* have get_user_pages() done on them since we've already
>> got the physical page at the time writeback and aren't looking at PTEs.
> 
> I suspect this happens because FOLL_TOUCH or something later does
> set_page_dirty() on the page, which then eventually gets it in
> writeback.

I assumed that this was all anonymous-only so it's always dirty before
writeback starts.

>> Why do I care?
>>
>> I was looking at AMD's SEV (Secure Encrypted Virtualization) code which
>> is in the kernel which shares some implementation details with the
>> not-in-the-tree Intel MKTME.  SEV currently has a concept of guest pages
>> being encrypted and being gibberish to the host, plus a handshake to
>> share guest-selected pages.  Some of the side-effects of exposing the
>> gibberish to the host aren't great (I think it can break cache coherency
>> if a stray write occurs) and it would be nice to get better behavior.
>>
>> But, to get better behavior, the host kernel might need to remove pages
>> from its direct map, making them inaccessible. 
> 
> But for SEV we would actually need to fail this
> arch_make_page_acesssible() thing, right? 

Yeah, we would ideally fail it, but not at the current
arch_make_page_acesssible() site.  If the PTE isn't usable, we shouldn't
be creating it in the first place, or shouldn't leave it Present=1 and
GUP'able in the page tables once the underlying memory is no longer
accessible.

I _think_ vm_normal_page() is the right place to do it, when we're
dealing with a PTE but don't yet have a 'struct page'.

> The encrypted guest pages cannot be sanely accessed by the host IIRC,
> ever. Isn't their encryption key linked to the phys addr of the
> page?
Yes, and the keys can't even be used unless you are inside the VM.

But this begs the question: why did we create PTEs which can't be used?
 Just to have something to gup?

>> I was hoping to reuse
>> arch_make_page_accessible() for obvious reasons.  But, get_user_pages()
>> is not the right spot to map pages because they might not *ever* be
>> accessed by the CPU, only devices.
> 
> I'm confused, why does it matter who accesses it? The point is that they
> want to access it through this vaddr/mapping.

To me, that's the entire *point* of get_user_pages().  It's someone
saying: "I want to find out what this mapping does, but I actually can't
use *that* mapping."  I'm either:

1. A device that does I/O to the paddr space or through an IOMMU, or
2. The kernel but I want access to that page via *another* mapping (if
   we could use the gup'd mapping, we would, but we know we can't)

and I need the physical address space to stay consistent for a bit so I
can do those things via other address spaces.
