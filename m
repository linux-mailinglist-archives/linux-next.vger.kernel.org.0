Return-Path: <linux-next+bounces-9245-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F817C8D64A
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 09:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 714B74E18D4
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 08:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B7D322DCB;
	Thu, 27 Nov 2025 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pe2o4tnD"
X-Original-To: linux-next@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC13280A3B;
	Thu, 27 Nov 2025 08:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764233061; cv=none; b=ljudk6HsQO3IrtCaTksTVtcYIrEwOtxZbjB2ulOf2kmZbQmEGeo2UiSRkEvnCT+yA7/MnY4PlQxdVMYpttdsXNHySLIyENv6/zAWtsiX7OlEqQsrErXr4sopUOeHD2jpN7P83R0OE4wtCV2WYbu6zVst/p574eLRfHcM8ojRiRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764233061; c=relaxed/simple;
	bh=5tgCOYVfK42xuWBTnjk86qb13R2r0eT6LpcWjj8qBeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pooot3WugrSdvby6A4slCGqmHBilC3ScO+1muKoUW7gdZc9ZwIoPwgtmLTGPgRemiU7mFeg/UnscEaIIcCMVsXEExY6E6ypFR+Zt0U8EChFud1n1OZ82csCSM3+Ih6ENu+b2SH4NJUz2hEOexI49UBxyBOPm/dlr/NMj7qZwmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pe2o4tnD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FCB16AC;
	Thu, 27 Nov 2025 09:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764232926;
	bh=5tgCOYVfK42xuWBTnjk86qb13R2r0eT6LpcWjj8qBeo=;
	h=From:To:Cc:Subject:Date:From;
	b=pe2o4tnDeRkv1Fm0Q76tf2mu6SLDJAztRhB2IxPu6/s4BDzEkrlvk+335WYY4/RYd
	 woqimqPwWgXUUgELc+fRweERG/31IEn8b2ct+oXAV4ZuoWunikmT1tNs/QvjceFGA6
	 D3ZtakXYG+XjkyfynnxPTVoQ/DchTkyHB5pXJQ5Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: uapi: c3-isp: Fix documentation warning
Date: Thu, 27 Nov 2025 09:43:59 +0100
Message-ID: <20251127084401.17894-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building htmldocs generates a warning:

WARNING: include/uapi/linux/media/amlogic/c3-isp-config.h:199
error: Cannot parse struct or union!

Which correctly highlights that the c3_isp_params_block_header symbol
is wrongly documented as a struct while it's a plain #define instead.

Fix this by removing the 'struct' identifier from the documentation of
the c3_isp_params_block_header symbol.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Stephen reported this error on linux-next. Please collect this patch for v6.19.

I'm not sure this qualifies for stable, as it will ideally land in the same
release as the patch that introduces the warning. If that's not the case, please
strip:

Fixes: 45662082855c ("media: uapi: Convert Amlogic C3 to V4L2 extensible params")
Cc: stable@vger.kernel.org

from the commit message when applying, thanks!

---
 include/uapi/linux/media/amlogic/c3-isp-config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
index 0a3c1cc55ccb..92db5dcdda18 100644
--- a/include/uapi/linux/media/amlogic/c3-isp-config.h
+++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
@@ -186,7 +186,7 @@ enum c3_isp_params_block_type {
 #define C3_ISP_PARAMS_BLOCK_FL_ENABLE	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE

 /**
- * struct c3_isp_params_block_header - C3 ISP parameter block header
+ * c3_isp_params_block_header - C3 ISP parameter block header
  *
  * This structure represents the common part of all the ISP configuration
  * blocks and is identical to :c:type:`v4l2_isp_params_block_header`.
--
2.51.1


