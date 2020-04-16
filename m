Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9BB1AC031
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 13:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506682AbgDPLvT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 07:51:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:1674 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2506678AbgDPLvR (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 07:51:17 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03GBZ00q123331
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 07:51:14 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 30emsbkv7f-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 07:51:14 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Thu, 16 Apr 2020 12:50:29 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 16 Apr 2020 12:50:23 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03GBp4on61276366
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 11:51:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D3D8A5204E;
        Thu, 16 Apr 2020 11:51:04 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.99])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 121C25204F;
        Thu, 16 Apr 2020 11:51:04 +0000 (GMT)
Date:   Thu, 16 Apr 2020 13:51:01 +0200
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        Peter Zijlstra <peterz@infradead.org>, borntraeger@de.ibm.com,
        david@redhat.com, aarcange@redhat.com, linux-mm@kvack.org,
        frankja@linux.ibm.com, sfr@canb.auug.org.au, jhubbard@nvidia.com,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
        <20200306132537.783769-3-imbrenda@linux.ibm.com>
        <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20041611-0020-0000-0000-000003C8DB3B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041611-0021-0000-0000-00002221C1C7
Message-Id: <20200416135101.0a15dd2e@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-16_03:2020-04-14,2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160082
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 15 Apr 2020 14:52:31 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 3/6/20 5:25 AM, Claudio Imbrenda wrote:
> > +	/*
> > +	 * We need to make the page accessible if and only if we
> > are going
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
> Thanks, Claudio, for a really thorough refresher on this in private
> mail.
> 
> But, I think this mechanism probably hooks into the wrong place.  I
> don't doubt that it *functions* on s390, but I think these calls are
> misplaced.  I think the end result is that no other architecture will
> have a chance to use the same hooks.  They're far too s390-specific
> even for a concept that's not limited to s390.
> 
> get_user_pages(FOLL_PIN) does *not* mean "the kernel will access this
> page's contents".  The kmap() family is really what we use for that.

it means that _something_ _might_ access the content of the
physical page. be it kernel or device, and the device can access the
page through DMA or through other means (and yes on s390 many devices
read and write directly from/to memory without using DMA... it's
complicated)

also, not all architectures use kmap (e.g. s390 doesn't)

> kmap()s are often *preceded* by get_user_pages(), which is probably
> why this works for you, though.
> 
> Yes, the docs do say that FOLL_PIN is for accessing the pages.  But,
> there's a crucial thing that it leaves out: *WHO* will be accessing

exactly

> the pages.  For Direct IO, for instance, the CPU isn't touching the
> page at all.  It's always a device.  Also, crucially, the page

exactly. and that is the one case we need to protect ourselves from.

letting a device touch directly a protected page causes an
unrecoverable error state in the device, potentially bringing down the
whole system. and this would be triggerable by userspace.

> contents are *not* accessible from the CPU's perspective after a gup.

depends on the architecture, I think

>  They're not accessible until a kmap().  They're also not even
> accessible for *devices* after a gup.  There's a _separate_ mapping

also depends on the architecture

> process that's requires to make them accessible to the CPU.
> 
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -2764,7 +2764,7 @@ int test_clear_page_writeback(struct page
> > *page) int __test_set_page_writeback(struct page *page, bool
> > keep_write) {
> >  	struct address_space *mapping = page_mapping(page);
> > -	int ret;
> > +	int ret, access_ret;
> >  
> >  	lock_page_memcg(page);
> >  	if (mapping && mapping_use_writeback_tags(mapping)) {
> > @@ -2807,6 +2807,13 @@ int __test_set_page_writeback(struct page
> > *page, bool keep_write) inc_zone_page_state(page,
> > NR_ZONE_WRITE_PENDING); }
> >  	unlock_page_memcg(page);
> > +	access_ret = arch_make_page_accessible(page);
> > +	/*
> > +	 * If writeback has been triggered on a page that cannot
> > be made
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
> got the physical page at the time writeback and aren't looking at
> PTEs.

correct. that's why we are doing it when setting the writeback bit. 
 
> They're read by I/O devices sending them out to storage, but also by
> the CPU if you're doing something like zswap.  But, again, critically,
> accessing page contents won't be done until kmap().

is kmap called for direct I/O too? 
 
> I suspect you saw crashes underneath __swap_writepage()->submit_bio()
> and looked a few lines up to the set_page_writeback() and decided to
> hook in there.  I think a better spot, again, is to hook into kmap()
> which is called in the block layer.

making a page accessible is a potentially long operation (e.g. on s390
requires the hardware to encrypt the page and do some other expensive
operations), while kmap is a nop.

> Why do I care?
> 
> I was looking at AMD's SEV (Secure Encrypted Virtualization) code
> which is in the kernel which shares some implementation details with
> the not-in-the-tree Intel MKTME.  SEV currently has a concept of
> guest pages being encrypted and being gibberish to the host, plus a
> handshake to share guest-selected pages.  Some of the side-effects of
> exposing the gibberish to the host aren't great (I think it can break
> cache coherency if a stray write occurs) and it would be nice to get
> better behavior.
> 
> But, to get better behavior, the host kernel might need to remove
> pages from its direct map, making them inaccessible.  I was hoping to
> reuse arch_make_page_accessible() for obvious reasons.  But,

we are talking about physical pages being inaccessible, not mappings.
you can have the page correctly mapped and still inaccessible.

> get_user_pages() is not the right spot to map pages because they
> might not *ever* be accessed by the CPU, only devices.
> 
> Anyway, I know it's late feedback, but I'd hate to have core code like
> this that has no hope of ever getting reused.

