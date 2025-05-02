Return-Path: <linux-next+bounces-6505-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68366AA7077
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 13:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDC7546745A
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 11:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788E8241671;
	Fri,  2 May 2025 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kLnba+JA"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917F4C8E;
	Fri,  2 May 2025 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184362; cv=none; b=iFa6suUZm7S/py7+EWKseKueUFX+Oz5nvOiFIaqrIMxi3VukUpwif+243V0n4A+qHRWlhPtyOQTKuBj8H3a/Xt/MWOqL1XX5kTUbrbROV2dE8JgceGFozD+De0Xn9In8CH7UyUfJPYCwlOQqA7GXYitwdUulfgIqZKvFW6rbqpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184362; c=relaxed/simple;
	bh=HMqeC1OMZArVwOzbxY5VF+9CW94Lcz9kqjJE1K8hK/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkBC4IWmQxyVM7nk6n2lKa0HJaRRRILJq4Gze0hKQuX+V/4XDtboWws84rsQEjrly6VGRrDnJ5e2kWmWTq0/z/PdkmkAtfABzysJfrJ5WNB0lPbWSuPiDY6Qsbv2ZRyLDuVULtSsVtDC5wSo4+HoJMGcX/6i+uZbJ8qZPc+yJq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kLnba+JA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542AesVt026297;
	Fri, 2 May 2025 11:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=XLx6kh8gqc/W7oj/R
	K1RaFTmdMauBPRTQG17yYFaDQY=; b=kLnba+JAB7eUsjPPxa+SwzBM4Tz72YnFF
	ATJHMb0cjHfKYo4L0bO9c6PiMBVumGTcqLHHaGaXHXEARQ42fdRGM/LPZ7t69W/u
	ocvVI919TKtWxYxy08JgleR651FKh8EBqYA9oyKHkLFtLcLasvo5OtyYG3r1FpT2
	0hzi5SwldnKPlulbG9a0GFuWFME9JDu0uq5aJDERK0WuBXw22/SLwvsmA+qdUWzl
	g9IMvBQ81Tz3nIXo3MRcbp/2JaGWn4G7r0NkCMTtjcBwv3VpYo8rc/FxzGDcw3GQ
	xQ2PWCK+F8aHD9Dr/SNRq9VDosaDa2Y8xVOeQSe1m4PmTijpr4EhA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46cvgs835v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:12:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 542BCEvu016112;
	Fri, 2 May 2025 11:12:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70sp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 11:12:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 542BCBlL60293444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 11:12:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 189D220040;
	Fri,  2 May 2025 11:12:11 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1176F20049;
	Fri,  2 May 2025 11:12:07 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.221.183])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 11:12:06 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: luogengkun@huaweicloud.com, dianders@chromium.org,
        joel.granados@kernel.org, song@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Subject: [PATCH] watchdog: Fix the SOFTLOCKUP_DETECTOR=n case
Date: Fri,  2 May 2025 16:41:20 +0530
Message-ID: <20250502111120.282690-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430205503.4a316f48@canb.auug.org.au>
References: <20250430205503.4a316f48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDA4NyBTYWx0ZWRfX/adalclWWXp+ ks9pJMxtIel3CmGGrp3GcWIVCtESxeDMNnyzfKl8wefmgznMSZ8/jszoqaTMiXEGEpQvobA/DrA EtwDozbWLOf2Nx0O61fQ6bQPvUBsIIo7NgsSPjI86oP8Pz7NGwpjXsnGbAEFaozWYxWxWK/Olt1
 q4ntQoqKWhg29VoCgluuvzXg6o4qqhmn2UbB5m+FFW7eQFPmMkaJ3jCgS2NPPBLwD1W+mOhDt9C M1UqG6hxpntME+ka7Kjc/vyxQujglQoFLEZilbuYw3Jr0qJZJEjYRNq+UEMgmsFD8Wsb7ED4aar T6e40QrrGrkqcFgcI8vhDqpGcrgr66YBzhfG+YVnEDyOhDKx42Tvg/TwkeB+RxdpwzWCxjqxbZw
 JxtHHxoRjOPJobtx0Qyv7ubjIUI1aV7LZnkuLHyBE77NXRyoOZ3bOt8aBCFBVAgrjD11VMhD
X-Authority-Analysis: v=2.4 cv=Asru3P9P c=1 sm=1 tr=0 ts=6814a88f cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=sOSd7Ic9yzPgF-7c_ocA:9
X-Proofpoint-GUID: EAvv4iEC7eFg2QV0Ow-ErRfgoKkl4Chq
X-Proofpoint-ORIG-GUID: EAvv4iEC7eFg2QV0Ow-ErRfgoKkl4Chq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020087

Update watchdog_thresh when SOFTLOCKUP_DETECTOR=n.
Additionally fix a build failure in this case as well.

Fixes: 0bff3dababb07 ("watchdog: fix watchdog may detect false positive of softlockup")
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com
Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
The "Fixes:" SHA1 points to the commit in mm-nonmm-unstable and will need updating

 kernel/watchdog.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 80d1a1dae27..2d283e92be5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -923,10 +923,12 @@ static __init void lockup_detector_setup(void)
 }
 
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
-static void __lockup_detector_reconfigure(void)
+static void __lockup_detector_reconfigure(bool thresh_changed)
 {
 	cpus_read_lock();
 	watchdog_hardlockup_stop();
+	if (thresh_changed)
+		watchdog_thresh = READ_ONCE(watchdog_thresh_next);
 	lockup_detector_update_enable();
 	watchdog_hardlockup_start();
 	cpus_read_unlock();
-- 
2.47.0


