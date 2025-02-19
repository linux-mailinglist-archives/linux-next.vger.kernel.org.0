Return-Path: <linux-next+bounces-5496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598EA3B1D0
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 07:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB3113ADAFA
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 06:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C280F1BD517;
	Wed, 19 Feb 2025 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fBnW6z16"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEA1B87F8;
	Wed, 19 Feb 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739947771; cv=none; b=TCj+vkBojpgSLqpGOIPGAllloFIJUkoq0Ftw5ukjygDz0XsPls1kft9XGJpyzZ1xx432uL7BFDMm/oJYrGg01Uag/1mG/OAHatrfEXYc3JklqWTg/8hIktI2yyRAmupQn4oo8Bxs0VG19SA8vbWGKS9SR6Din46z05+5+T2YNwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739947771; c=relaxed/simple;
	bh=+0eLFlIBfQ8y8y7pcWXdF3wI0SvdIlmcIUNSt62uA98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAWUHM+rhitWYmizsOd32H881EQpYJ2Q6YusWyGPESda7v/CEKx4fYdVrvlLk/zrh0Q7SYMvGDH9Rus/J01T3uEXRiut/2VTHtSEVqK7Rkc/RxkAraoXgzVzBNokLbkAepBpM2bJl8LxvWG1/C4/v4neoaooGu0I4MQI7h28hUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fBnW6z16; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6gvDZ024457;
	Wed, 19 Feb 2025 06:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5Td/1EBVEkgD1oa1Ju/ZgrZ3KbHXNrdWKjxKieYz8
	30=; b=fBnW6z16fRCvNb5vI9ApM/mHHLjarfGEpr17e+jABWyHkSbVgEGZjrQlv
	lA6t0nAWsF1EhVIoxtbWmAg3oa2F9NIuh2zTQECE61QAvg8oshH8PRi6M/uPLyKp
	ecFXyXf9UApBYP7ETVWIUpiKYTfP6W6A+UiB4kyYu3g8+ITFI9OoZhsnUG28jd3C
	FBZBemwLBzSHFMg/Vp7cP6kcf6UBDkJgJ6aCCjZLyt9wyEfw6DAwUdFYsJL5RKwQ
	MkYXhAsr7du6/5yjl1/q0HJkesjnrMTHRaJaux049l2iQj2XjFocG+3ftat1Okfz
	z+5ehb51masl896R3kh5bqq5GoWnQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508wb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51J6jJRc031675;
	Wed, 19 Feb 2025 06:49:09 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w6508wb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:09 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J2qdRc027077;
	Wed, 19 Feb 2025 06:49:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w0252mk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 06:49:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J6n76Y46268910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 06:49:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7319E20043;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BAC920040;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 06:49:07 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5A6F26033C;
	Wed, 19 Feb 2025 17:49:03 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        mchehab+huawei@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] cxl: Fix cross-reference in documentation and add deprecation warning
Date: Wed, 19 Feb 2025 17:48:07 +1100
Message-ID: <20250219064807.175107-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tKFk8PXlKl9yYgUusz0jIcGvdHrDIO3i
X-Proofpoint-GUID: NBVEZ2Lae_W2v6McCmKondep1aMQe1KH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=558 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190049

commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
deprecated and moved the ABI documentation to the obsolete/ subdirectory,
but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
media: Allow creating cross-references for RC ABI") was merged.

Fix the cross-reference, and also add a deprecation warning.

Fixes: 5731d41af924 ("cxl: Deprecate driver")
Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

---

Maddy: can we take this by powerpc-fixes?
---
 Documentation/arch/powerpc/cxl.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/powerpc/cxl.rst b/Documentation/arch/powerpc/cxl.rst
index d2d77057610e..778adda740d2 100644
--- a/Documentation/arch/powerpc/cxl.rst
+++ b/Documentation/arch/powerpc/cxl.rst
@@ -18,6 +18,7 @@ Introduction
     both access system memory directly and with the same effective
     addresses.
 
+    **This driver is deprecated and will be removed in a future release.**
 
 Hardware overview
 =================
@@ -453,7 +454,7 @@ Sysfs Class
 
     A cxl sysfs class is added under /sys/class/cxl to facilitate
     enumeration and tuning of the accelerators. Its layout is
-    described in Documentation/ABI/testing/sysfs-class-cxl
+    described in Documentation/ABI/obsolete/sysfs-class-cxl
 
 
 Udev rules
-- 
2.48.1


