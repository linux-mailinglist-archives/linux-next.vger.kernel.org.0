Return-Path: <linux-next+bounces-8885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A84C3CC60
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 18:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469851889B7F
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 17:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812583502BA;
	Thu,  6 Nov 2025 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="iABKYdS/"
X-Original-To: linux-next@vger.kernel.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D4B34FF5F;
	Thu,  6 Nov 2025 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449438; cv=none; b=H85l4VDAc/PfVrF51JsEqZ84kzKwLONbieJP1Mr8SRDwmbeeL/YRXIzNwdJETB1Gxbnv+bq/eKYiKxGbY/T2G92FVmpcmwuoEzqemw55NGX1pl4i4LNU8tbj8F6JauiztonyTChJakqiNhQ+KYhYKIGv6Ece3mSGjj9vIROqRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449438; c=relaxed/simple;
	bh=jSjn327uG1N3bqSM251zxgIJqzhXFlMy/8aP4L1z+Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GMAfNZI+ByqwUP6OAH4f+CgXmRwAOY8NqGI5/bk1JEEwU01q66OrlQAz0AoewgZ4yqYyomuhF2Kybv4pHWetNmQyPosHE8+d8hPFb5x2D3xGDbSh6yC2XZOAX4LQFN9ExltzNYqpyXYbVjdjcZmGA6nTPtpKRkM2GR59iC/NsKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=iABKYdS/; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66w7T0879402;
	Thu, 6 Nov 2025 17:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=oP4GVi6QsKoaqmjh9fqywF8
	oAllwQKlZtkdV5FoZ8X8=; b=iABKYdS/V2zi7MUvK1z0nFuyGyiZtJPu1n1mkpx
	0+cfeqDvIuh9KJxukkyWHjK2gB3nDa9AEjs6plqP+MwoEmMN8F6X+WY+reugmmG1
	spHJkn21IcOd2z131u3nz4aCjwbkz4u0kto+VYHbeTgyVFpuwsPZYkVX0rhab7WH
	sbIZtjVDO4Zz1u1nifAG164dx5MnYXg05R4hIgJTjxXHyjDhqx/0CmqzmcPVzMxu
	b96l1KRAt2x7C2FS7cok9Uge9DyDVrpDhHkVBgHy7So7KHjzl2S7xX6LsrqrBNK7
	hfKgyp3SG/ZOJcCjI6Wa9CpsAanOL+y7f5MoIFTNuf3Emqw==
Received: from hhmail02.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a7w9csfyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 17:16:48 +0000 (GMT)
Received: from HHMAIL03.hh.imgtec.org (10.44.0.121) by HHMAIL02.hh.imgtec.org
 (10.100.10.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 6 Nov
 2025 17:16:47 +0000
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.4.140) by HHMAIL03.hh.imgtec.org (10.44.0.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 6 Nov 2025 17:16:46 +0000
From: Matt Coster <matt.coster@imgtec.com>
Date: Thu, 6 Nov 2025 17:16:30 +0000
Subject: [PATCH] drm/imagination: Document pvr_device.power member
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251106-device-power-doc-fix-v1-1-76d9841c8084@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAO3XDGkC/x2MSwqAMAwFryJZG2grVfAq4qKfqNm0pQUVxLsbX
 M5j3jzQqDI1mLsHKp3cOCcB3XcQDpd2Qo7CYJSxWqsRo0iBsOSLKsYccOMbvdPOxskOftxArqW
 SzH92Wd/3A98NeV1mAAAA
X-Change-ID: 20251106-device-power-doc-fix-ba1a5d753b6f
To: Frank Binns <frank.binns@imgtec.com>,
        Alessio Belle
	<alessio.belle@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Stephen Rothwell <sfr@canb.auug.org.au>,
        Matt Coster
	<matt.coster@imgtec.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-next@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1787;
 i=matt.coster@imgtec.com; h=from:subject:message-id;
 bh=jSjn327uG1N3bqSM251zxgIJqzhXFlMy/8aP4L1z+Ws=;
 b=owGbwMvMwCFWuUfy8817WRsYT6slMWTyXP/3t2n9O7fPa6VcmTQlGlnV/bM/6TNrpFb8nXUqY
 qejWXlwRykLgxgHg6yYIsuOFZYr1P6oaUnc+FUMM4eVCWQIAxenAExEp5Lhn4nvmtn/P5w5fjxv
 424tmboNt7kK/+/QWTMloWLrxr1u5coM/12s5ddeafPqjz0Y/Frg6aTGLpZTgs+0l2yR/7R0Zc4
 0I34A
X-Developer-Key: i=matt.coster@imgtec.com; a=openpgp;
 fpr=05A40CFCE7269D61D97100A1747F0A9036F90DFA
X-Authority-Analysis: v=2.4 cv=bbZmkePB c=1 sm=1 tr=0 ts=690cd800 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=A05BHC2L4TQA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=r_1tXGB3AAAA:8
 a=_lh_yHDS7RhGSOQShCAA:9 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEzOSBTYWx0ZWRfX+maSkfu0EsUL
 sDzzEHTscRShIuNpwHETPrVlihxth1ABwlwfvm89wTszTtn1CIBAbBMMSqMiJrUD3Oc/IsAXTNJ
 /LJKY7V2znYqEZnKpnxcPlOcT8sNo35BDZkCBvygTEaiErnc6W5nQ41AOTHPJePFmVcx90e5LzJ
 kCDIxB3T0+Mkp2gEUmUzJqXgOX2voqBCLg1C0MrBlkevz/o4uNRkAdOb5hho2Qlf6hygFNxlLQo
 tn1SY+S2f/l3IiMXEoRp32cK/e9QWayVidUfhImgKxSIYzbHFcmCwLqGrfQngnwWoIPTDXNl+9d
 MRQIsJy/VVbUR4oPCSCM6M1XdynOI5+oznexYm7lCh7Jb0g4w0CghTD9z7oMMAw90WsFd5ZI0xM
 cBJWAS7SOtcCtxgWAnYn3VczWMDAZw==
X-Proofpoint-ORIG-GUID: JCiZAdH2Kf9yVkcoSei-aoPdrso-TLxB
X-Proofpoint-GUID: JCiZAdH2Kf9yVkcoSei-aoPdrso-TLxB

Fixes: 330e76d31697 ("drm/imagination: Add power domain control")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20251106152448.453b53ad@canb.auug.org.au/
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
---
Based on the build target indicated in the report, I tried (and failed)
to reproduce the reported warning using:

   make W=1 htmldocs

I was, however, able to get the reported warning (and verify that this
patch clears it) using:

   scripts/kernel-doc -none drivers/gpu/drm/imagination/pvr_device.h

Does anyone have any ideas why my invocation of htmldocs didn't seem to
have the same effect? Is it just simply that the relevant doc comment
isn't pulled into any of the rst docs; in which case how did the
linux-next build catch this warning?
---
 drivers/gpu/drm/imagination/pvr_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index ab8f56ae15df..ec53ff275541 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -146,6 +146,14 @@ struct pvr_device {
 	 */
 	struct clk *mem_clk;
 
+	/**
+	 * @power: Optional power domain devices.
+	 *
+	 * On platforms with more than one power domain for the GPU, they are
+	 * stored here in @domain_devs, along with links between them in
+	 * @domain_links. The size of @domain_devs is given by @domain_count,
+	 * while the size of @domain_links is (2 * @domain_count) - 1.
+	 */
 	struct pvr_device_power {
 		struct device **domain_devs;
 		struct device_link **domain_links;

---
base-commit: b750f5a9d64df6cfe9103c7feb7314694318818d
change-id: 20251106-device-power-doc-fix-ba1a5d753b6f


