Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3563C254547
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 14:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729150AbgH0MsE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 08:48:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40874 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729066AbgH0MqU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Aug 2020 08:46:20 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07RCXh4m084422;
        Thu, 27 Aug 2020 08:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=1vcT4Ou7ENwKE+IUgL+fPCKondXok8kZTO10eeXJWEo=;
 b=TKISV5TVbD4o5QZUPQ7Q0u6HnLHuNUIX2DqrXztAC63M659xmnS467Obm2tlrmgG9knU
 sm1UZ4f8AYoqu5MPUb6d4JAz/LIhbmlH1yG3Z5IzishvTWXbDdvat2tM5NUryH5Swe0+
 OZPcVBF16tUR+FohrqrUCRRo5NgBaJxw0wfybDpgQxXMJCfsZqkpmkl+Ygr7updURA3N
 7hKn6L/ldamVrG4Z3+YPnVOpr8zbLBH9AznYKREQjzhZyGNHRFyg7v4rsWkFuZ+YPZo8
 PwddqNFDP4v+xxcjh94AyiEXkFC8MNs81faF7Hxr4C7+6AJNYwJFVn9YUxnKe3tRhbS4 tg== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
        by mx0a-001b2d01.pphosted.com with ESMTP id 336cddhf6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Aug 2020 08:45:56 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
        by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07RCcRJd017636;
        Thu, 27 Aug 2020 12:45:54 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma06fra.de.ibm.com with ESMTP id 335a2t953u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Aug 2020 12:45:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07RCjq6j27263354
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Aug 2020 12:45:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E7159A4068;
        Thu, 27 Aug 2020 12:45:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3D3E7A4054;
        Thu, 27 Aug 2020 12:45:51 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.92.75])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 27 Aug 2020 12:45:51 +0000 (GMT)
Date:   Thu, 27 Aug 2020 15:45:49 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200827124549.GD167163@linux.ibm.com>
References: <20200827182058.1c7d75ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200827182058.1c7d75ed@canb.auug.org.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-27_07:2020-08-27,2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=2
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=894 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270094
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 27, 2020 at 06:20:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (mips
> cavium_octeon_defconfig) failed like this:
> 
> arch/mips/cavium-octeon/dma-octeon.c:205:7: error: ‘mem’ undeclared (first use in this function); did you mean ‘sem’?
> 
> Caused by commit
> 
>   52e1a745395d ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
> 
> Reported by "kernelci.org bot" <bot@kernelci.org>.

Here's the fix:

From 9e46da6793528e35883ff81835d65a864bf98007 Mon Sep 17 00:00:00 2001
From: Mike Rapoport <rppt@linux.ibm.com>
Date: Thu, 27 Aug 2020 15:42:49 +0300
Subject: [PATCH] mips: fix cavium-octeon build caused by memblock refactoring
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MIPS cavium_octeon_defconfig build failed like this:

arch/mips/cavium-octeon/dma-octeon.c:205:7: error: ‘mem’ undeclared
(first use in this function); did you mean ‘sem’?

Caused by patch ("arch, drivers: replace for_each_membock() with
for_each_mem_range()")

Replacing stale 'mem->base' reference with 'start' fixes the issue.

Reported by "kernelci.org bot" <bot@kernelci.org>.
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/cavium-octeon/dma-octeon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/dma-octeon.c b/arch/mips/cavium-octeon/dma-octeon.c
index d938c1f7c1e1..ad1aecc4b401 100644
--- a/arch/mips/cavium-octeon/dma-octeon.c
+++ b/arch/mips/cavium-octeon/dma-octeon.c
@@ -202,7 +202,7 @@ void __init plat_swiotlb_setup(void)
 
 	for_each_mem_range(i, &start, &end) {
 		/* These addresses map low for PCI. */
-		if (mem->base > 0x410000000ull && !OCTEON_IS_OCTEON2())
+		if (start > 0x410000000ull && !OCTEON_IS_OCTEON2())
 			continue;
 
 		addr_size += (end - start);
-- 
2.26.2

