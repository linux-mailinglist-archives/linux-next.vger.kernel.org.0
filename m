Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A031ACDE0
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 18:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgDPQjo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 12:39:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55970 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727843AbgDPQjn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 12:39:43 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03GGXfH3029346
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 12:39:43 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30ettd0ehs-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 12:39:43 -0400
Received: from localhost
        by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Thu, 16 Apr 2020 17:34:03 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 16 Apr 2020 17:33:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03GGYYwl55312546
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 16:34:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1048752054;
        Thu, 16 Apr 2020 16:34:34 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.99])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 300F452050;
        Thu, 16 Apr 2020 16:34:33 +0000 (GMT)
Date:   Thu, 16 Apr 2020 18:34:31 +0200
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
        "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: [PATCH v4 2/2] mm/gup/writeback: add callbacks for inaccessible
 pages
In-Reply-To: <a6b8728d-7382-9316-412d-dd48b5e7c41a@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
        <20200306132537.783769-3-imbrenda@linux.ibm.com>
        <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
        <20200415221754.GM2483@worktop.programming.kicks-ass.net>
        <a7c2eb84-94c2-a608-4b04-a740fa9a389d@intel.com>
        <20200416141547.29be5ea0@p-imbrenda>
        <de56aa8e-9035-4b68-33cb-15682d073e26@intel.com>
        <20200416165900.68bd4dba@p-imbrenda>
        <a6b8728d-7382-9316-412d-dd48b5e7c41a@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20041616-4275-0000-0000-000003C10776
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041616-4276-0000-0000-000038D6824A
Message-Id: <20200416183431.7216e1d1@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-16_06:2020-04-14,2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=669 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160113
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 16 Apr 2020 08:36:50 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/16/20 7:59 AM, Claudio Imbrenda wrote:
> > On Thu, 16 Apr 2020 07:20:48 -0700
> > Dave Hansen <dave.hansen@intel.com> wrote:  
> >> On 4/16/20 5:15 AM, Claudio Imbrenda wrote:  
> >>>> I assumed that this was all anonymous-only so it's always dirty
> >>>> before writeback starts.    
> >>> it could also be mmapped    
> >>
> >> Let's say you have a mmap()'d ramfs file.  Another process calls
> >> which doesn't have it mapped calls sys_write() and writes to the
> >> file.  
> ...
> >> Where is the arch_make_page_accessible() in this case on the ramfs
> >> page?  
> > 
> > it's in the fault handler for the exception the CPU will get when
> > attempting to write the data to the protected page  
> 
> Ahh, so this is *just* intended to precede I/O done on the page, when
> a non-host entity is touching the memory?

yep

> That seems inconsistent with the process_vm_readv/writev() paths which
> set FOLL_PIN on their pin_remote_user_pages() requests, but don't do
> I/O to the memory.

FOLL_PIN simply indicates potential access to the content of the page,
not just for I/O.

so yes, we are overdoing arch_make_page_accessible() in some cases,
because we can't tell when a page will be used for I/O and when not.

In most cases this will boil down to checking a flag and doing nothing,
for example in case the page was already accessible.

Also note that making the page accessible because of a FOLL_PIN in
absence of I/O will probably later on spare us from triggering and
handling the exception that would have caused us to make the page
accessible anyway.

