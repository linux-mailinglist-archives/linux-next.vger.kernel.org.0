Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E651A1836AB
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 17:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgCLQ4l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 12:56:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4354 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726127AbgCLQ4k (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 12:56:40 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02CGo0wm025740
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 12:56:39 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2yqrxpra24-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 12:56:29 -0400
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Thu, 12 Mar 2020 16:51:24 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 12 Mar 2020 16:51:20 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 02CGpJOj42467480
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Mar 2020 16:51:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A18F14204D;
        Thu, 12 Mar 2020 16:51:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C0F3142041;
        Thu, 12 Mar 2020 16:51:10 +0000 (GMT)
Received: from [9.199.62.145] (unknown [9.199.62.145])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 12 Mar 2020 16:51:10 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9 
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <87a74lix5p.fsf@mpe.ellerman.id.au>
Date:   Thu, 12 Mar 2020 22:21:09 +0530
Cc:     Michal Hocko <mhocko@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Pekka Enberg <penberg@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Christopher Lameter <cl@linux.com>,
        linuxppc-dev@lists.ozlabs.org,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Content-Transfer-Encoding: 7bit
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz>
 <87a74lix5p.fsf@mpe.ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20031216-0012-0000-0000-0000039006DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031216-0013-0000-0000-000021CCD960
Message-Id: <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-12_10:2020-03-11,2020-03-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=769 priorityscore=1501
 mlxscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003120084
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> The patch below might work. Sachin can you test this? I tried faking up
> a system with a memoryless node zero but couldn't get it to even start
> booting.
> 
The patch did not help. The kernel crashed during
the boot with the same call trace.

BUG_ON() introduced with the patch was not triggered.

Thanks
-Sachin

> cheers
> 
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 9b4f5fb719e0..d1f11437f6c4 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -282,6 +282,9 @@ void __init mem_init(void)
> 	 */
> 	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
> 
> +	BUG_ON(smp_processor_id() != boot_cpuid);
> +	set_numa_mem(local_memory_node(numa_cpu_lookup_table[boot_cpuid]));
> +
> #ifdef CONFIG_SWIOTLB
> 	/*
> 	 * Some platforms (e.g. 85xx) limit DMA-able memory way below

