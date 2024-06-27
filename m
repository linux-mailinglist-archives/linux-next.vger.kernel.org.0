Return-Path: <linux-next+bounces-2690-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10F91AA61
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 17:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2570F1F22D9B
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FF6198A28;
	Thu, 27 Jun 2024 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mukJ6/DW"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622FE198850;
	Thu, 27 Jun 2024 15:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500669; cv=none; b=T4ik9FaNlt7/sT7PHbnzHx/XxcvOpbGNzIy9P0PYtFYpclj1p4YdgF2HlU7RvNdt15pQZP6cjb++oTQ0ON8UO0O7k1QFCxhn9n9AU4TBdvsKTOEisksL85gT2IW4eK0mtqi9pEpgsDhvvJmzYJ1akEpLJ3WFacHCE6fDqkfJFpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500669; c=relaxed/simple;
	bh=AicOfHJ0HpFOEDBTsCGhIDlILJLDclENc+/H5KoJOvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cztKt2cFZhgKvk70NMlcWv0Bf0ylAt9z8Txmp8FbAh13ZSr8tgDHtk5LR8N6M96xYiOqYbnGb0O/QuUs/RROcwYPwMLE3TzAp+GYQ70OERHC3VQj99cOyoiUaVqWAt4rQglMUvLEaElU2f4nZqDge01Cr3182JIa3kEym4f+SAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mukJ6/DW; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45REwvPQ013361;
	Thu, 27 Jun 2024 15:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=R1hQdI0W6iMzsBZImznEfEVSTJ
	dHV28+utS+Y0cv0Vw=; b=mukJ6/DW9tKOuHMHsSC/j+R2LOsYx5x2Z2huQRlB2d
	+QPJB/YGkvgqRzr+vqN6DRH6YDX4uBom4zLscIWsXBn/PSPLZazRY+VrdJrbMvp8
	napXYmXlOORHeCqYs0VPXMyRdB3kKwcN/34giukVGtRvH6GxU3ocgP6W4r1unaLa
	vx6cqAwwm9zDP46Nnj1slZEy/BeayGBivJdP7Y1/iOcgGpb0ZJwvxe8IxRmU3ExI
	egBz9KYFe7i1cwXFrI0BwcHFNemC35wriaVnXUTj7wLkdi2Va34iIh4HOGR0D/zx
	A/DvZj/YSSul8aSL02I2p6oHj4y1BCIQlxFSmz4UiwIQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 401aagr0jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 15:04:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45RCBZXK019984;
	Thu, 27 Jun 2024 15:04:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5mu1vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 15:04:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45RF47Jf52167062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 15:04:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4935C20043;
	Thu, 27 Jun 2024 15:04:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD4D820040;
	Thu, 27 Jun 2024 15:04:06 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.171.10.182])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jun 2024 15:04:06 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-next@vger.kernel.org, linux-s390@vger.kernel.org, linux-mm@kvack.org,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] s390/kmsan: Fix merge conflict with get_lowcore() introduction
Date: Thu, 27 Jun 2024 17:03:52 +0200
Message-ID: <20240627150405.27663-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lerAx88qlTHOQtHJWNdo4i73d-4HmdPD
X-Proofpoint-GUID: lerAx88qlTHOQtHJWNdo4i73d-4HmdPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_11,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=506 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270113

Resolve linux-next conflict between commit 10ff0f8ec5d2 ("s390/kmsan:
implement the architecture-specific functions") and commit 39976f1278a9
("s390: Remove S390_lowcore").

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 arch/s390/include/asm/kmsan.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/kmsan.h b/arch/s390/include/asm/kmsan.h
index 27db65fbf3f6..f73e181d09ae 100644
--- a/arch/s390/include/asm/kmsan.h
+++ b/arch/s390/include/asm/kmsan.h
@@ -12,8 +12,8 @@
 
 static inline bool is_lowcore_addr(void *addr)
 {
-	return addr >= (void *)&S390_lowcore &&
-	       addr < (void *)(&S390_lowcore + 1);
+	return addr >= (void *)get_lowcore() &&
+	       addr < (void *)(get_lowcore() + 1);
 }
 
 static inline void *arch_kmsan_get_meta_or_null(void *addr, bool is_origin)
@@ -25,7 +25,7 @@ static inline void *arch_kmsan_get_meta_or_null(void *addr, bool is_origin)
 		 * order to get a distinct struct page.
 		 */
 		addr += (void *)lowcore_ptr[raw_smp_processor_id()] -
-			(void *)&S390_lowcore;
+			(void *)get_lowcore();
 		if (KMSAN_WARN_ON(is_lowcore_addr(addr)))
 			return NULL;
 		return kmsan_get_metadata(addr, is_origin);
-- 
2.45.2


