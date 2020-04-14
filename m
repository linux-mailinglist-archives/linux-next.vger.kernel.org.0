Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A01B1A8A36
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 20:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504455AbgDNSuX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 14:50:23 -0400
Received: from mga11.intel.com ([192.55.52.93]:42105 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504444AbgDNSuS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 14:50:18 -0400
IronPort-SDR: 2LeQPx0Bn2/i+aG1bcwR0YCd1gKDDv5kUxUrzuSWakOWFiZNQaC/nzZ3OMI60oXaZhoLTW6SBZ
 8YZ8GtYlR56Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 11:50:16 -0700
IronPort-SDR: PYQVkEfUchPkWpqwZZkb8t+LOcsZAU10TZeysUlOS43ZhWgPDhIyuDrzchhwDThEWAdpdMQHIS
 NqLZPEZps9jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; 
   d="scan'208";a="256606792"
Received: from nkadakia-mobl1.amr.corp.intel.com (HELO [10.251.28.160]) ([10.251.28.160])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 11:50:16 -0700
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
To:     Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name, borntraeger@de.ibm.com,
        david@redhat.com, aarcange@redhat.com, linux-mm@kvack.org,
        frankja@linux.ibm.com, sfr@canb.auug.org.au, jhubbard@nvidia.com,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
 <20200306132537.783769-3-imbrenda@linux.ibm.com>
 <11dc928d-60b4-f04f-1ebf-f4cffb337a6c@intel.com>
 <20200414180300.52640444@p-imbrenda>
From:   Dave Hansen <dave.hansen@intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
Message-ID: <93dc9885-adb4-8b9d-a62a-e40301053551@intel.com>
Date:   Tue, 14 Apr 2020 11:50:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200414180300.52640444@p-imbrenda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/14/20 9:03 AM, Claudio Imbrenda wrote:
> On Mon, 13 Apr 2020 13:22:24 -0700
> Dave Hansen <dave.hansen@intel.com> wrote:
> 
>> On 3/6/20 5:25 AM, Claudio Imbrenda wrote:
>>> On s390x the function is not supposed to fail, so it is ok to use a
>>> WARN_ON on failure. If we ever need some more finegrained handling
>>> we can tackle this when we know the details.  
>>
>> Could you explain a bit why the function can't fail?
> 
> the concept of "making accessible" is only to make sure that accessing
> the page will not trigger faults or I/O or DMA errors. in general it
> does not mean freely accessing the content of the page in cleartext. 
> 
> on s390x, protected guest pages can be shared. the guest has to
> actively share its pages, and in that case those pages are both part of
> the protected VM and freely accessible by the host.

Oh, that's interesting.

It sounds like there are three separate concepts:
1. Protection
2. Sharing
3. Accessibility

Protected pages may be shared and the request of the guest.
Shared pages' plaintext can be accessed by the host.  For unshared
pages, the host can only see ciphertext.

I wonder if Documentation/virt/kvm/s390-pv.rst can be beefed up with
some of this information.  It seems a bit sparse on this topic.

As it stands, if I were modifying generic code, I don't think I'd have
even a chance of getting an arch_make_page_accessible() in the right spot.

> in our case "making the page accessible" means:
...
>  - if the page was not shared, first encrypt it and then make it
>    accessible to the host (both operations performed securely and
>    atomically by the hardware)

What happens to the guest's view of the page when this happens?  Does it
keep seeing plaintext?

> then the page can be swapped out, or used for direct I/O (obviously if
> you do I/O on a page that was not shared, you cannot expect good
> things to happen, since you basically corrupt the memory of the guest).

So why even allow access to the encrypted contents if the host can't do
anything useful with it?  Is there some reason for going to the trouble
of encrypting it and exposing it to the host?

> on s390x performing I/O directly on protected pages results in (in
> practice) unrecoverable I/O errors, so we want to avoid it at all costs.

This is understandable, but we usually steer I/O operations in places
like the DMA API, not in the core VM.

We *have* the concept of pages to which I/O can't be done.  There are
plenty of crippled devices where we have to bounce data into a low
buffer before it can go where we really want it to.  I think the AMD SEV
patches do this, for instance.

> accessing protected pages from the CPU triggers an exception that can
> be handled (and we do handle it, in fact)
> 
> now imagine a buggy or malicious qemu process crashing the whole machine
> just because it did I/O to/from a protected page. we clearly don't want
> that.

Is DMA disallowed to *all* protected pages?  Even pages which the guest
has explicitly shared with the host?


>>> @@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page
>>> *page, bool keep_write) inc_zone_page_state(page,
>>> NR_ZONE_WRITE_PENDING); }
>>>  	unlock_page_memcg(page);
>>> +	access_ret = arch_make_page_accessible(page);
>>> +	/*
>>> +	 * If writeback has been triggered on a page that cannot
>>> be made
>>> +	 * accessible, it is too late to recover here.
>>> +	 */
>>> +	VM_BUG_ON_PAGE(access_ret != 0, page);
>>> +
>>>  	return ret;
>>>  
>>>  }  
>>
>> This seems like a really odd place to do this.  Writeback is specific
>> to block I/O.  I would have thought there were other kinds of devices
>> that matter, not just block devices.
> 
> well, yes and no. for writeback (block I/O and swap) this is the right
> place. at this point we know that the page is present and nobody else
> has started doing I/O yet, and I/O will happen soon-ish. so we make the
> page accessible. there is no turning back here, unlike pinning. we
> are not allowed to fail, we can't 

This description sounds really incomplete to me.

Not all swap involved device I/O.  For instance, zswap doesn't involve
any devices.  Would zswap need this hook?
