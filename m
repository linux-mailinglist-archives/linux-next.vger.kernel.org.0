Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D81A6D74
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 18:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfICQDo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 12:03:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17506 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728571AbfICQDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 12:03:44 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x83Fw3BH016754;
        Tue, 3 Sep 2019 12:03:29 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2usryr6h97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Sep 2019 12:03:29 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x83G1OjL032076;
        Tue, 3 Sep 2019 16:03:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma03wdc.us.ibm.com with ESMTP id 2uqgh6kfyv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Sep 2019 16:03:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x83G3Rwq46792968
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 3 Sep 2019 16:03:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 85F20BE062;
        Tue,  3 Sep 2019 16:03:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F0A3ABE053;
        Tue,  3 Sep 2019 16:03:25 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.133.34])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
        Tue,  3 Sep 2019 16:03:25 +0000 (GMT)
References: <20190902163951.6280e030@canb.auug.org.au> <20190902140347.GA23482@8bytes.org> <d2493e6b-08fa-9ea8-a0a4-076def54e91b@amd.com> <20190903152849.770ae819@canb.auug.org.au> <20190903132038.GE11530@8bytes.org>
User-agent: mu4e 1.2.0; emacs 26.2
From:   Thiago Jung Bauermann <bauerman@linux.ibm.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Lendacky\, Thomas" <Thomas.Lendacky@amd.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iommu: Don't use sme_active() in generic code
In-reply-to: <20190903132038.GE11530@8bytes.org>
Date:   Tue, 03 Sep 2019 13:03:21 -0300
Message-ID: <87mufll646.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-09-03_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=957 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030164
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Joerg Roedel <joro@8bytes.org> writes:

> On Tue, Sep 03, 2019 at 03:28:49PM +1000, Stephen Rothwell wrote:
>> Hi all,
>> 
>> On Mon, 2 Sep 2019 14:26:40 +0000 "Lendacky, Thomas" <Thomas.Lendacky@amd.com> wrote:
>> > Maybe we should make this mem_encrypt_active(), since this will probably
>> > be needed if/when an IOMMU device is eventually added to a guest, and the
>> > referenced commit below doesn't remove that call.
>> 
>> I have done that for today:
>
> Thanks Stephen and Tom. I queued the attached patch into the iommu tree
> to fix the problem.
>
> From 2896ba40d0becdb72b45f096cad70633abc014f6 Mon Sep 17 00:00:00 2001
> From: Joerg Roedel <jroedel@suse.de>
> Date: Tue, 3 Sep 2019 15:15:44 +0200
> Subject: [PATCH] iommu: Don't use sme_active() in generic code
>
> Switch to the generic function mem_encrypt_active() because
> sme_active() is x86 specific and can't be called from
> generic code on other platforms than x86.
>
> Fixes: 2cc13bb4f59f ("iommu: Disable passthrough mode when SME is active")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Thank you!

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
