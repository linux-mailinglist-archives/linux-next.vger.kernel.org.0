Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8F816B995
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 07:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbgBYGVV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 01:21:21 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9584 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725783AbgBYGVU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 01:21:20 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01P6L0ji120016;
        Tue, 25 Feb 2020 01:21:04 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yb1as8a5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Feb 2020 01:21:04 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01P6L3rZ120513;
        Tue, 25 Feb 2020 01:21:03 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yb1as8a26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Feb 2020 01:21:03 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01P6JqV9018607;
        Tue, 25 Feb 2020 06:20:48 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma04dal.us.ibm.com with ESMTP id 2yaux6r3jx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Feb 2020 06:20:48 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01P6Kmev49414562
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 25 Feb 2020 06:20:48 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 21836B205F;
        Tue, 25 Feb 2020 06:20:48 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 85627B2065;
        Tue, 25 Feb 2020 06:20:44 +0000 (GMT)
Received: from [9.109.247.196] (unknown [9.109.247.196])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 25 Feb 2020 06:20:44 +0000 (GMT)
Message-ID: <1582611644.19645.6.camel@abdul.in.ibm.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when
 unloading mpt3sas driver
From:   Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
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
        MPT-FusionLinux.pdl@broadcom.com
Date:   Tue, 25 Feb 2020 11:50:44 +0530
In-Reply-To: <1579265473.17382.5.camel@abdul>
References: <1578489498.29952.11.camel@abdul>
         <1578560245.30409.0.camel@abdul.in.ibm.com>
         <20200109142218.GA16477@infradead.org>
         <1578980874.11996.3.camel@abdul.in.ibm.com>
         <20200116174443.GA30158@infradead.org> <1579265473.17382.5.camel@abdul>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-25_01:2020-02-21,2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=918 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250050
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2020-01-17 at 18:21 +0530, Abdul Haleem wrote:
> On Thu, 2020-01-16 at 09:44 -0800, Christoph Hellwig wrote:
> > Hi Abdul,
> > 
> > I think the problem is that mpt3sas has some convoluted logic to do
> > some DMA allocations with a 32-bit coherent mask, and then switches
> > to a 63 or 64 bit mask, which is not supported by the DMA API.
> > 
> > Can you try the patch below?
> 
> Thank you Christoph, with the given patch applied the bug is not seen.
> 
> rmmod of mpt3sas driver is successful, no kernel Oops
> 
> Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>

Hi Christoph,

I see the patch is under discussion, will this be merged upstream any
time soon ? as boot is broken on our machines with out your patch.

-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



