Return-Path: <linux-next+bounces-6440-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5EAA1CBA
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 23:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300A61B603BD
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 21:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6A5263C77;
	Tue, 29 Apr 2025 21:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Yf4vC5e4"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E8262FDF
	for <linux-next@vger.kernel.org>; Tue, 29 Apr 2025 21:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961281; cv=none; b=Z+7PliWtzTxp6WyVqd0PJQB1xe3qft2IEi1YcSOiLQTl2IlHBHw8/rJ122oCv4/B4uBn4e43GHUB31zk2viMjGOUW6cs7ZqFTZTKiwCsQxiwZQL9rw8I8pGu+9SLwOpWjhrML+Coz4HfArXUryYmH4g1jFDNZ6WVrTTbNyaitdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961281; c=relaxed/simple;
	bh=gPdC8uaxTQrg+dzz/88wuXLcITPI5bGeszUAYPsurio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uf6nwtWaupjnIUFpGvl6lXVVg62XOqaYySqgSVXjOnNxS575MpDui0nvcMpXzSMfzqcHrVX9KPvOLCHERnaVBS9xZPSbSkk+PH7jNtWeMcIUa2kVynwCLmPWWajOSQH+I7CHrcziXAr5aQ2/9iIleXanliRIYwXd0u+uoSRHDGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Yf4vC5e4; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TJCDAd009393;
	Tue, 29 Apr 2025 21:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=o4kfW0CZtaxODQ2nyZUMar4KmvI/zq8Gtr2YS+w8z
	D4=; b=Yf4vC5e4OU7syeBf9phF57SSPmh09CHy3e1LdKPwOo7ZVx3MSYTMs0zsj
	IEk2Xu1NE0sphp4cN+Br9MUo/docHWhUy3TDF6t8ryBEj5OZQmhC4DikGCiaQkxT
	AoYenEX+52mVPgTlO7hhT5OiLC8pU3Nve+qPvbgpiyyovOI+zg+5GcqYFr/LoUCs
	r+SDgGj79tAU3s9RMvUE6gB8n9cmhKAiQEprTRVw8Y6F1/w6k10iD2vZlUaeKKRB
	CwX6tlRtUy0SwGfwErAIYaMQLQHgHaO3vO+otsVmH6AJN87JrLmpMkn7bJfDHz0h
	3tkGxHfw3H2Z75KGOIbbBEVQ4U51g==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46aw7t2ucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 21:14:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53THLUi8000666;
	Tue, 29 Apr 2025 21:14:26 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469atpd53e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 21:14:26 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53TLENKW30016036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 21:14:24 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D723758062;
	Tue, 29 Apr 2025 21:14:23 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E086158054;
	Tue, 29 Apr 2025 21:14:22 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.186.27])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 21:14:22 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH] powerpc/pseries: Include linux/types.h in papr-platform-dump.h
Date: Tue, 29 Apr 2025 14:14:18 -0700
Message-ID: <20250429211419.1081354-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE1NiBTYWx0ZWRfXxrnvX5Q2NAUr 8c/nu6b5t0J3e9CkVxeArCgh1I0IJmIRdtBBWfitR3bt8m/80ygw0NrW+34t0HLX8CqeSue71M9 1yMkr8rsD9s2RUj5FKhzNKbhCIEJrPRSLEEVttU5jemYHtEkd0QHTNbZ+bnNI1ep0XPT2F4xXIB
 hX+yhSdMbfSpORp3fBMgP5jrx7ztFkaAH8cgG7Loov1yY2rfjsLuzTvnsjYkpYkY9w+L65CXMrk ErXc3ENJut9xiVe+Ld4/+N0uUALUhfwg8gcJarTHtfVEdId9dWUV0qSUuvED0twubcIfkRFba9B DW2LYoGkYFM1Zq/FQxYVIwH03QhYTZbQu9vDd6idqCfXYfFvv6l9jKpTXi8HRWWk3vsR3j6TuUP
 UZyarLESHH5m7B4MGA36czCxYieB4TsSMqPLiXHjjl51tOoAvT9IWy8nM0VXGgaYoOCZXUJ8
X-Proofpoint-GUID: SruYYSz7Yl3R9JfTCELRAW1fr3l2bz8P
X-Authority-Analysis: v=2.4 cv=MJRgmNZl c=1 sm=1 tr=0 ts=68114133 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=IJ5uNYSzlZeX1pgoDwQA:9 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: SruYYSz7Yl3R9JfTCELRAW1fr3l2bz8P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=950
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290156

Fix the following build warning:
usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>

Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr-platform-dump.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/uapi/asm/papr-platform-dump.h b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
index a1d89c290dab..8a1c060e89a9 100644
--- a/arch/powerpc/include/uapi/asm/papr-platform-dump.h
+++ b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
@@ -2,6 +2,7 @@
 #ifndef _UAPI_PAPR_PLATFORM_DUMP_H_
 #define _UAPI_PAPR_PLATFORM_DUMP_H_
 
+#include <linux/types.h>
 #include <asm/ioctl.h>
 #include <asm/papr-miscdev.h>
 
-- 
2.43.5


