Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51201C8831
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 13:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGL3O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 07:29:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:41454 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725809AbgEGL3O (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2020 07:29:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 047AWYIf193042;
        Thu, 7 May 2020 07:29:07 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 30vf3rcf5y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 May 2020 07:29:06 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 047BKRA7012583;
        Thu, 7 May 2020 11:29:05 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 30s0g5u8pe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 May 2020 11:29:05 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 047BT29a8126808
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 7 May 2020 11:29:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 516134203F;
        Thu,  7 May 2020 11:29:02 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EDCF24204B;
        Thu,  7 May 2020 11:29:01 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.183.161])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu,  7 May 2020 11:29:01 +0000 (GMT)
Subject: Re: linux-next: manual merge of the iommu tree with the s390 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joerg Roedel <joro@8bytes.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200507135835.05e300b5@canb.auug.org.au>
From:   Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <275a85c9-0552-9725-c2fa-129d244ca261@linux.ibm.com>
Date:   Thu, 7 May 2020 13:29:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200507135835.05e300b5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.676
 definitions=2020-05-07_06:2020-05-07,2020-05-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1011 suspectscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005070087
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2020-05-07 05:58, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the iommu tree got a conflict in:
> 
>    drivers/iommu/s390-iommu.c
> 
> between commit:
> 
>    d08d6f5d7524 ("s390/pci: adaptation of iommu to multifunction")
> 
> from the s390 tree and commit:
> 
>    522af649e57b ("iommu/s390: Convert to probe/release_device() call-backs")
> 
> from the iommu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 


Hi Stephen,

Your proposition is correct for me.
I of course assume that the other parts of the
("s390/pci: adaptation of iommu to multifunction")
patch, not concerned by this merge problem, will be merged too at the end.

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen
