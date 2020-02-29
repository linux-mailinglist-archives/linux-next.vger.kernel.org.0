Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E09174652
	for <lists+linux-next@lfdr.de>; Sat, 29 Feb 2020 11:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgB2Kvg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 29 Feb 2020 05:51:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37826 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726752AbgB2Kvc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 29 Feb 2020 05:51:32 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01TAo7Yo111983
        for <linux-next@vger.kernel.org>; Sat, 29 Feb 2020 05:51:31 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2yfn04hu05-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sat, 29 Feb 2020 05:51:31 -0500
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Sat, 29 Feb 2020 10:51:28 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 29 Feb 2020 10:51:24 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01TApMq732833554
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 29 Feb 2020 10:51:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8A57D5204E;
        Sat, 29 Feb 2020 10:51:22 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.2.1])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E264D52051;
        Sat, 29 Feb 2020 10:51:21 +0000 (GMT)
Date:   Sat, 29 Feb 2020 11:51:19 +0100
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <borntraeger@de.ibm.com>, <david@redhat.com>,
        <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Jan Kara <jack@suse.cz>,
        "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [RFC v1 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
In-Reply-To: <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
        <20200228154322.329228-3-imbrenda@linux.ibm.com>
        <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022910-4275-0000-0000-000003A69892
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022910-4276-0000-0000-000038BB352E
Message-Id: <20200229115119.3562c73e@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-29_03:2020-02-28,2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002290084
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Feb 2020 15:08:35 -0800
John Hubbard <jhubbard@nvidia.com> wrote:

> On 2/28/20 7:43 AM, Claudio Imbrenda wrote:
> > In case pin fails, we need to unpin, a simple put_page will not be
> > enough
> > 
> > Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> > ---
> >  mm/gup.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index f589299b0d4a..0b9a806898f3 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -2134,7 +2134,10 @@ static int gup_pte_range(pmd_t pmd, unsigned
> > long addr, unsigned long end, goto pte_unmap;
> >  
> >  		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> > -			put_page(head);
> > +			if (flags & FOLL_GET)
> > +				put_page(head);
> > +			else if (flags & FOLL_PIN)
> > +				unpin_user_page(head);  
> 
> Hi Claudio,
> 
> Instead, I think that should actually be:
> 
> 		put_compound_head(page, 1, flags);

that makes sense, yes :)

I'll fix it in the next iteration

> 
> which does a bit more (bug checks and /proc/vmstat instrumentation)
> than your diff, but has the same basic idea: call the right "put"
> function.  
> 
> ...oh, actually, I see you have the commit hash in the subject line.
> Instead, it should be in the commit description. Let's maybe change
> the subject line to approx:
> 
>     mm/gup: Fix a missing put_compound_head() call in gup_pte_range()
> 
> And the write up...how about something like this, if you like it:
> 
> 
> try_grab_compound_head() must be undone via put_compound_head(), not
> put_page(). This was missed in the original implementation of the
> gup/dma tracking patch, so fix it now.
> 
> Fixes: 0ea2781c3de4 ("mm/gup: track FOLL_PIN pages")
> 
> 
>     
> (Aside: I'm using the linux-next commit hash. How does one get the
> correct hash before it goes to mainline? I guess maintainer scripts
> fix all those up?)

my idea was that my patch should be used as fix-up, so the actual
content of the commit message is not relevant

> It's also good to Cc some reviewers in case I'm overlooking
> something, so I'm adding Jan and Kirill.
> 
> thanks,

