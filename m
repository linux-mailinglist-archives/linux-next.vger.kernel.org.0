Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69FC917464C
	for <lists+linux-next@lfdr.de>; Sat, 29 Feb 2020 11:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgB2Ktc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 29 Feb 2020 05:49:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42060 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725747AbgB2Ktc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 29 Feb 2020 05:49:32 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01TAnNAS023682
        for <linux-next@vger.kernel.org>; Sat, 29 Feb 2020 05:49:30 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yfjf1vwxq-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Sat, 29 Feb 2020 05:49:30 -0500
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Sat, 29 Feb 2020 10:49:28 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 29 Feb 2020 10:49:23 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01TAmOsG38470056
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 29 Feb 2020 10:48:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 18C2CA4054;
        Sat, 29 Feb 2020 10:49:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 83C4EA405B;
        Sat, 29 Feb 2020 10:49:21 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.2.1])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Sat, 29 Feb 2020 10:49:21 +0000 (GMT)
Date:   Sat, 29 Feb 2020 11:49:19 +0100
From:   Claudio Imbrenda <imbrenda@linux.ibm.com>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        <linux-next@vger.kernel.org>, <akpm@linux-foundation.org>,
        <david@redhat.com>, <aarcange@redhat.com>, <linux-mm@kvack.org>,
        <frankja@linux.ibm.com>, <sfr@canb.auug.org.au>,
        <linux-kernel@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [RFC v1 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <ff35804f-81ef-a245-01d9-1f9b525e3410@nvidia.com>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
        <20200228154322.329228-4-imbrenda@linux.ibm.com>
        <2e3bf1a2-b672-68e0-97b6-42f08133e077@de.ibm.com>
        <ff35804f-81ef-a245-01d9-1f9b525e3410@nvidia.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20022910-0012-0000-0000-0000038B67DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022910-0013-0000-0000-000021C8169C
Message-Id: <20200229114919.1abcacc4@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-29_03:2020-02-28,2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=480 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290084
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 28 Feb 2020 16:08:23 -0800
John Hubbard <jhubbard@nvidia.com> wrote:

> On 2/28/20 8:08 AM, Christian Borntraeger wrote:
> > Andrew,
> > 
> > while patch 1 is a fixup for the FOLL_PIN work in your patch queue,
> > I would really love to see this patch in 5.7. The exploitation code
> > of kvm/s390 is in Linux next also scheduled for 5.7.
> > 
> > Christian
> > 
> > On 28.02.20 16:43, Claudio Imbrenda wrote:  
> >> With the introduction of protected KVM guests on s390 there is now
> >> a concept of inaccessible pages. These pages need to be made
> >> accessible before the host can access them.
> >>
> >> While cpu accesses will trigger a fault that can be resolved, I/O
> >> accesses will just fail.  We need to add a callback into
> >> architecture code for places that will do I/O, namely when
> >> writeback is started or when a page reference is taken.
> >>
> >> This is not only to enable paging, file backing etc, it is also
> >> necessary to protect the host against a malicious user space. For
> >> example a bad QEMU could simply start direct I/O on such protected
> >> memory.  We do not want userspace to be able to trigger I/O errors
> >> and thus we the logic is "whenever somebody accesses that page
> >> (gup) or  
> 
> 
> I actually kind of like the sound of that: "We the logic of the
> kernel, in order to form a more perfect computer..." :)
> 
> Probably this wording is what you want, though:
> 
> "thus the logic is "whenever somebody (gup) accesses that page or"
> 
> 
> ...
> >> @@ -458,7 +457,6 @@ static struct page *follow_page_pte(struct
> >> vm_area_struct *vma, }
> >>  
> >>  	if (flags & FOLL_SPLIT && PageTransCompound(page)) {
> >> -		int ret;
> >>  		get_page(page);
> >>  		pte_unmap_unlock(ptep, ptl);
> >>  		lock_page(page);
> >> @@ -475,6 +473,14 @@ static struct page *follow_page_pte(struct
> >> vm_area_struct *vma, page = ERR_PTR(-ENOMEM);
> >>  		goto out;
> >>  	}
> >> +	if (flags & FOLL_PIN) {  
> 
> 
> What about FOLL_GET? Unless your calling code has some sort of
> BUG_ON(flags & FOLL_GET), I'm not sure it's a good idea to leave that
> case unhandled.

if I understood the semantics of FOLL_PIN correctly, then we don't need
to make the page accessible for FOLL_GET. FOLL_PIN indicates intent to
access the content of the page, whereas FOLL_GET is only for the struct
page. 

if we are not touching the content of the page, there is no need to
make it accessible 

> >> +		ret = arch_make_page_accessible(page);
> >> +		if (ret) {
> >> +			unpin_user_page(page);
> >> +			page = ERR_PTR(ret);
> >> +			goto out;
> >> +		}
> >> +	}
> >>  	if (flags & FOLL_TOUCH) {
> >>  		if ((flags & FOLL_WRITE) &&
> >>  		    !pte_dirty(pte) && !PageDirty(page))
> >> @@ -2143,6 +2149,13 @@ static int gup_pte_range(pmd_t pmd,
> >> unsigned long addr, unsigned long end, 
> >>  		VM_BUG_ON_PAGE(compound_head(page) != head, page);
> >>  
> >> +		if (flags & FOLL_PIN) {
> >> +			ret = arch_make_page_accessible(page);
> >> +			if (ret) {
> >> +				unpin_user_page(page);  
> 
> 
> Same concern as above, about leaving FOLL_GET unhandled.

and same answer as above :)

