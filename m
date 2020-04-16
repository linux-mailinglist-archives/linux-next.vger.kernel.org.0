Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795381AC7C9
	for <lists+linux-next@lfdr.de>; Thu, 16 Apr 2020 16:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409523AbgDPO7T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 10:59:19 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3298 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2409532AbgDPO7N (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 10:59:13 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03GErAhT025009
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 10:59:12 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
        by mx0a-001b2d01.pphosted.com with ESMTP id 30eq6hdku1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 16 Apr 2020 10:59:12 -0400
Received: from localhost
        by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <imbrenda@linux.ibm.com>;
        Thu, 16 Apr 2020 15:58:31 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 16 Apr 2020 15:58:27 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 03GEx34v46596366
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Apr 2020 14:59:03 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 559385205A;
        Thu, 16 Apr 2020 14:59:03 +0000 (GMT)
Received: from p-imbrenda (unknown [9.145.0.99])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 88FAA5204E;
        Thu, 16 Apr 2020 14:59:02 +0000 (GMT)
Date:   Thu, 16 Apr 2020 16:59:00 +0200
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
In-Reply-To: <de56aa8e-9035-4b68-33cb-15682d073e26@intel.com>
References: <20200306132537.783769-1-imbrenda@linux.ibm.com>
        <20200306132537.783769-3-imbrenda@linux.ibm.com>
        <3ae46945-0c7b-03cd-700a-a6fe8003c6ab@intel.com>
        <20200415221754.GM2483@worktop.programming.kicks-ass.net>
        <a7c2eb84-94c2-a608-4b04-a740fa9a389d@intel.com>
        <20200416141547.29be5ea0@p-imbrenda>
        <de56aa8e-9035-4b68-33cb-15682d073e26@intel.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20041614-0016-0000-0000-00000305A88E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041614-0017-0000-0000-00003369AD2E
Message-Id: <20200416165900.68bd4dba@p-imbrenda>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-16_05:2020-04-14,2020-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 mlxlogscore=675
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004160101
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 16 Apr 2020 07:20:48 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/16/20 5:15 AM, Claudio Imbrenda wrote:
> >> I assumed that this was all anonymous-only so it's always dirty
> >> before writeback starts.  
> > it could also be mmapped  
> 
> Let's say you have a mmap()'d ramfs file.  Another process calls which
> doesn't have it mapped calls sys_write() and writes to the file.
> 
> This means that host host has to write to the physical page and must
> do arch_make_page_accessible() in the sys_write() path somewhere.
> 
> There is a get_user_pages() in that path, but it's on the _source_
> buffer, not the ramfs page because the ramfs page is not mapped.
> There's also no __test_set_page_writeback() because you can't write
> back ramfs.
> 
> Where is the arch_make_page_accessible() in this case on the ramfs
> page?

it's in the fault handler for the exception the CPU will get when
attempting to write the data to the protected page

