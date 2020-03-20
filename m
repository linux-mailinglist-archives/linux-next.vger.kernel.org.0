Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7AD818CB03
	for <lists+linux-next@lfdr.de>; Fri, 20 Mar 2020 11:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgCTKA2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Mar 2020 06:00:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48554 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgCTKA1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Mar 2020 06:00:27 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02K9Xf1b022703;
        Fri, 20 Mar 2020 06:00:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yu96h7euv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Mar 2020 06:00:13 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02K9xHWQ140296;
        Fri, 20 Mar 2020 06:00:12 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yu96h7eu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Mar 2020 06:00:12 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02K9sl2j015649;
        Fri, 20 Mar 2020 10:00:11 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma02wdc.us.ibm.com with ESMTP id 2yrpw7faev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Mar 2020 10:00:11 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 02KA0BsT28705210
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Mar 2020 10:00:11 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 422C7B2071;
        Fri, 20 Mar 2020 10:00:11 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 66709B205F;
        Fri, 20 Mar 2020 09:59:48 +0000 (GMT)
Received: from [9.203.170.211] (unknown [9.203.170.211])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Fri, 20 Mar 2020 09:59:47 +0000 (GMT)
Message-ID: <1584698382.4128.2.camel@abdul>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when
 unloading mpt3sas driver
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-scsi <linux-scsi@vger.kernel.org>, jcmvbkbc@gmail.com,
        linux-next <linux-next@vger.kernel.org>,
        Oliver <oohall@gmail.com>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        iommu@lists.linux-foundation.org,
        Sathya Prakash <sathya.prakash@broadcom.com>,
        Chaitra P B <chaitra.basappa@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        PDL-MPT-FUSIONLINUX <MPT-FusionLinux.pdl@broadcom.com>
Date:   Fri, 20 Mar 2020 15:29:42 +0530
In-Reply-To: <CAK=zhgpWCz0+xpSGymbQEAbysH_rQf=s8iQ1gn4KwysP3c1Gcw@mail.gmail.com>
References: <1578489498.29952.11.camel@abdul>
         <1578560245.30409.0.camel@abdul.in.ibm.com>
         <20200109142218.GA16477@infradead.org>
         <1578980874.11996.3.camel@abdul.in.ibm.com>
         <20200116174443.GA30158@infradead.org> <1579265473.17382.5.camel@abdul>
         <1582611644.19645.6.camel@abdul.in.ibm.com>
         <CAK=zhgpWCz0+xpSGymbQEAbysH_rQf=s8iQ1gn4KwysP3c1Gcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-20_02:2020-03-19,2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200040
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2020-02-25 at 12:23 +0530, Sreekanth Reddy wrote:
> On Tue, Feb 25, 2020 at 11:51 AM Abdul Haleem
> <abdhalee@linux.vnet.ibm.com> wrote:
> >
> > On Fri, 2020-01-17 at 18:21 +0530, Abdul Haleem wrote:
> > > On Thu, 2020-01-16 at 09:44 -0800, Christoph Hellwig wrote:
> > > > Hi Abdul,
> > > >
> > > > I think the problem is that mpt3sas has some convoluted logic to do
> > > > some DMA allocations with a 32-bit coherent mask, and then switches
> > > > to a 63 or 64 bit mask, which is not supported by the DMA API.
> > > >
> > > > Can you try the patch below?
> > >
> > > Thank you Christoph, with the given patch applied the bug is not seen.
> > >
> > > rmmod of mpt3sas driver is successful, no kernel Oops
> > >
> > > Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
> >
> > Hi Christoph,
> >
> > I see the patch is under discussion, will this be merged upstream any
> > time soon ? as boot is broken on our machines with out your patch.
> >
> 
> Hi Abdul,
> 
> We have posted a new set of patches to fix this issue. This patch set
> won't change the DMA Mask on the fly and also won't hardcode the DMA
> mask to 32 bit.
> 
> [PATCH 0/5] mpt3sas: Fix changing coherent mask after allocation.
> 
> This patchset will have below patches, Please review and try with this
> patch set.
> 
> Suganath Prabu S (5):
>   mpt3sas: Don't change the dma coherent mask after      allocations
>   mpt3sas: Rename function name is_MSB_are_same
>   mpt3sas: Code Refactoring.
>   mpt3sas: Handle RDPQ DMA allocation in same 4g region
>   mpt3sas: Update version to 33.101.00.00

Hi Suganath, 

The above patch fixes the issue, driver is loading and unloading with no
kernel oops. 

Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



