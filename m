Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B411BD0A8
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 01:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgD1XkW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 28 Apr 2020 19:40:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21630 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726042AbgD1XkV (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 19:40:21 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03SNWmNr059304;
        Tue, 28 Apr 2020 19:40:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr7e0e7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Apr 2020 19:40:05 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SNZdDf067260;
        Tue, 28 Apr 2020 19:40:04 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30mhr7e0dm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Apr 2020 19:40:04 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SNPQVZ019738;
        Tue, 28 Apr 2020 23:40:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
        by ppma04ams.nl.ibm.com with ESMTP id 30mcu6y6c9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Apr 2020 23:40:02 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03SNdwjx64815162
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Apr 2020 23:39:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C884AA405F;
        Tue, 28 Apr 2020 23:39:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F123BA405C;
        Tue, 28 Apr 2020 23:39:57 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.4.15])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 28 Apr 2020 23:39:57 +0000 (GMT)
Date:   Wed, 29 Apr 2020 01:39:55 +0200
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>, linux-next@vger.kernel.org,
        akpm@linux-foundation.org, jack@suse.cz, kirill@shutemov.name,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Sean Christopherson <sean.j.christopherson@intel.com>,
        borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Will Deacon <will@kernel.org>,
        "Williams, Dan J" <dan.j.williams@intel.com>, pasic@linux.ibm.com
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
Message-ID: <20200429013955.2b59bd99@p-imbrenda>
In-Reply-To: <42fccd01-7e16-b18f-cd81-4040857d80d4@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
        <20200306132537.783769-3-imbrenda@linux.ibm.com>
        <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
        <20200415221754.GM2483@worktop.programming.kicks-ass.net>
        <a7c2eb84-94c2-a608-4b04-a740fa9a389d@intel.com>
        <20200416141547.29be5ea0@p-imbrenda>
        <de56aa8e-9035-4b68-33cb-15682d073e26@intel.com>
        <20200416165900.68bd4dba@p-imbrenda>
        <a6b8728d-7382-9316-412d-dd48b5e7c41a@intel.com>
        <20200416183431.7216e1d1@p-imbrenda>
        <396a4ece-ec66-d023-2c7e-f09f84b358bc@intel.com>
        <cbaddd28-c5d3-61a2-84d8-c883fb3d6290@intel.com>
        <42fccd01-7e16-b18f-cd81-4040857d80d4@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-28_15:2020-04-28,2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280177
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 28 Apr 2020 12:43:45 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/21/20 2:31 PM, Dave Hansen wrote:
> > On 4/16/20 12:02 PM, Dave Hansen wrote:  
> >> On 4/16/20 9:34 AM, Claudio Imbrenda wrote:  
> >>>> Ahh, so this is *just* intended to precede I/O done on the page,
> >>>> when a non-host entity is touching the memory?  
> >>> yep  
> >> OK, so we've got to do an action that precedes *all* I/O to a page.
> >> That's not too bad.
> >>
> >> I still don't understand how this could work generally, though
> >> There are lots of places where I/O is done to a page without
> >> either going through __test_set_page_writeback() or gup() with
> >> FOLL_PIN set.
> >>
> >> sendfile() is probably the best example of this:
> >>
> >> 	fd = open("/normal/ext4/file", O_RDONLY);
> >> 	sendfile(socket_fd, fd, &off, count);
> >>
> >> There's no gup in sight since the file doesn't have an address and
> >> it's not being written to so there's no writeback.
> >>
> >> How does sendfile work?  
> > 
> > Did you manage to see if sendfile works (or any other operation that
> > DMAs file-backed data without being preceded by a gup)?  
> 
> It's been a couple of weeks with no response on this.

sorry, I've been busy with things

> From where I'm standing, we have a hook in the core VM that can't
> possibly work with some existing kernel functionality and has
> virtually no chance of getting used on a second architecture.

it seems to work at least for us, so it does possibly work :)

regarding second architectures: when we started sending these patches
around, there has been interest from some other architectures, so
just because nobody else needs them now, it doesn't mean nobody will
use them ever. Moreover this is the only way for us to reasonably
implement this (see below).

> It sounds like there may need to be some additional work here, but
> should these hooks stay in for 5.7?  Or, should we revert this patch
> and try again for 5.8?

I don't see why we should revert a patch that works as intended and
poses no overhead for non-users, whereas reverting it would break
functionality.


Now let me elaborate a little on the DMA API. There are some issues
with some of the bus types used on s390 when it comes to the DMA API.
Most I/O instructions on s390 need to allocate some small control blocks
for each operation, and those need to be under 2GB. Those control blocks
will be accessed directly by the hardware. The rest of the actual I/O
buffers have no restriction and can be anywhere (64 bits). 
Setting the DMA mask to 2GB means that all other buffers will be
almost always bounced, which is unacceptable. Especially since there are
no bounce buffers set up for s390x hosts anyway (they are set up only in
protected guests (and not in normal guests), so this was also introduced
quite recently).

Also notice that, until now, there has been no actual need to use the
DMA API on most s390 device drivers, hence why it's not being used
there. I know that you are used to need the DMA API for DMA operations
otherwise Bad Things™ happen, but this is not the case on s390 (for
non-PCI devices at least).

So until the DMA API is fixed, there is no way to convert all the
drivers to the DMA API (which would be quite a lot of work in itself
already, but that's not the point here). A fix for the DMA API was
actually proposed by my colleague Halil several months ago now, but it
did not go through. His proposal was to allow architectures to override
the GFP flags for DMA allocations, to allow allocating some buffers
from some areas and some other buffers from other areas.


I hope this clarifies the matter a little :)

