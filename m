Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB81A8426
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 18:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391312AbgDNQF3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 12:05:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12618 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391232AbgDNQDp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 12:03:45 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03EG3FBO006645
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 12:03:44 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30cwm0gtr9-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 14 Apr 2020 12:03:43 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Tue, 14 Apr 2020 17:02:33 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 14 Apr 2020 17:02:30 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03EG33Nu43647070
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Apr 2020 16:03:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 791F7A4059;
        Tue, 14 Apr 2020 16:03:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C0AB9A404D;
        Tue, 14 Apr 2020 16:03:02 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.12.13])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 14 Apr 2020 16:03:02 +0000 (GMT)
Date:   Tue, 14 Apr 2020 18:03:00 +0200
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     linux-next@vger.kernel.org, akpm@linux-foundation.org,
        jack@suse.cz, kirill@shutemov.name, borntraeger@de.ibm.com,
        david@redhat.com, aarcange@redhat.com, linux-mm@kvack.org,
        frankja@linux.ibm.com, sfr@canb.auug.org.au, jhubbard@nvidia.com,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <11dc928d-60b4-f04f-1ebf-f4cffb337a6c@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
        <20200306132537.783769-3-imbrenda@linux.ibm.com>
        <11dc928d-60b4-f04f-1ebf-f4cffb337a6c@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20041416-0016-0000-0000-0000030474C9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041416-0017-0000-0000-000033686D4D
Message-Id: <20200414180300.52640444@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-14_07:2020-04-14,2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=360 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140127
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 13 Apr 2020 13:22:24 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 3/6/20 5:25 AM, Claudio Imbrenda wrote:
> > On s390x the function is not supposed to fail, so it is ok to use a
> > WARN_ON on failure. If we ever need some more finegrained handling
> > we can tackle this when we know the details.  
> 
> Could you explain a bit why the function can't fail?

the concept of "making accessible" is only to make sure that accessing
the page will not trigger faults or I/O or DMA errors. in general it
does not mean freely accessing the content of the page in cleartext. 

on s390x, protected guest pages can be shared. the guest has to
actively share its pages, and in that case those pages are both part of
the protected VM and freely accessible by the host.

pages that are not shared cannot be accessed by the host.

in our case "making the page accessible" means:
 - if the page was shared, make sure it stays shared
 - if the page was not shared, first encrypt it and then make it
   accessible to the host (both operations performed securely and
   atomically by the hardware)

then the page can be swapped out, or used for direct I/O (obviously if
you do I/O on a page that was not shared, you cannot expect good
things to happen, since you basically corrupt the memory of the guest).

on s390x performing I/O directly on protected pages results in (in
practice) unrecoverable I/O errors, so we want to avoid it at all costs.

accessing protected pages from the CPU triggers an exception that can
be handled (and we do handle it, in fact)

now imagine a buggy or malicious qemu process crashing the whole machine
just because it did I/O to/from a protected page. we clearly don't want
that.

> If the guest has secret data in the page, then it *can* and does fail.

no, that's the whole point of this mechanism. in fact, most of the
guest pages will be "secret data", only the few pages used for guest I/O
bounce buffers will be shared with the host

> It won't fail, though, if the host and guest agree on whether the page
> is protected.
> 
> Right?
> 
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
> This seems like a really odd place to do this.  Writeback is specific
> to block I/O.  I would have thought there were other kinds of devices
> that matter, not just block devices.

well, yes and no. for writeback (block I/O and swap) this is the right
place. at this point we know that the page is present and nobody else
has started doing I/O yet, and I/O will happen soon-ish. so we make the
page accessible. there is no turning back here, unlike pinning. we
are not allowed to fail, we can't 

regarding the other kinds of devices: yes, they will use pinning, which
is covered by the rest of the patch. the semantics of get page and pin
page (if the documentation has not changed meanwhile) is that the
traditional get_page is used for when the page is needed but not its
content, and pin_page is used when the content of the page is accessed.
since the only issue here is accessing the content of the page, we
don't need to make it accessible for get_page, but only for pin_page.

get_page and pin_page are allowed to fail, so in this case we return an
error code, so other architectures can potentially abort the pinning if
needed. on s390x we will never fail, for the same reasons written
above.

> Also, this patch seems odd that it only does the
> arch_make_page_accessible() half.  Where's the other half where the
> page is made inaccessible?

that is very arch-specific. for s390x, you can look at this patch and
the ones immediately before/after: 214d9bbcd3a67230b932f6ce

> I assume it's OK to "leak" things like this, it's just not clear to me
> _why_ it's OK.

nothing is being leaked :)



I hope I clarified a little how this works on s390x :)
feel free to poke me again if some things are still unclear


best regards,


Claudio Imbrenda

