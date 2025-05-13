Return-Path: <linux-next+bounces-6742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD973AB590F
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 17:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3365119E21C8
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 15:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10111245008;
	Tue, 13 May 2025 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ULdG+cO2"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C090E552
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151317; cv=none; b=YXvan/cgv3itfFqW+QXN81E3cmV3ePAf6yjLvykERsu12vkG6LNVGOdssCyHONgVVwRQ4/ERkIU3eZlRoYIeuIq2nSmUOcReOfvPq8mMfTkllMDjWh9NR65I176YEvMR86yla21jjIcdyl53Jd0SwC/Qu5OMMxlUELKQzcFSM1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151317; c=relaxed/simple;
	bh=33++b0jbst+3l80YCOcRIBxhUp7lHAVVsqY/wdQ1AEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ejaVfLb92kATjQu7E/tM5LUsfJIzDHukjR8Cb5pWgFqTmPqMnbPFl7fiigYcs4ueGBByDtQoDAA1LNhjcNUM4uTJUlNOnhsFVhMvuk6wwTr0C+E9rgYZjZvb5nhYwGgF1B4bSuILUVOEm8ieMIJbqE77c6NwtY4OvUpQJoKnPdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ULdG+cO2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747151314; x=1778687314;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=33++b0jbst+3l80YCOcRIBxhUp7lHAVVsqY/wdQ1AEQ=;
  b=ULdG+cO2dUIJ/oTA+REK+nIiK/yBbagkrX15hTnHcKewE1+yShHjipZK
   m0e2SMC/q3vxV33UWzsJa83/hA/Z48O50YYbLvH9HzFF/mN3lKNlN6dbg
   ODTJvoDChrCJIq4pbpb3wXWCJRbhr5RSzVjVASBIQNRJF+DEzTJXze7dB
   +cXKGnU2wu0XEpUe4fHAIQ1mKRwcXW17N0smeqU3wP1AQz3tBvGzvHADe
   2sTePtZoOGeduGbUGM5vF+JQ2skpeZCzjJksc3tIbw0k8ZXhzsPY2QcDt
   /vtHelAWqiSNDAOXGk3eWbsEGXtFIe/NdxDJqeZi+xzi34B66K/mr8r6g
   g==;
X-CSE-ConnectionGUID: 1Ua3kINgTVShY2HBvX0MbA==
X-CSE-MsgGUID: Bz8p4pnlQ2i5WfiRe0NVJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48882713"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48882713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 08:48:33 -0700
X-CSE-ConnectionGUID: g3tbtjsiT2KVYVDpm9AUeg==
X-CSE-MsgGUID: Wt1JKZBJQuiAaEGQ1S5rBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137665369"
Received: from felipegu-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.112.245])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 08:48:32 -0700
From: Cedric Xing <cedric.xing@intel.com>
To: linux@weissschuh.net,
	dan.j.williams@intel.com
Cc: sfr@canb.auug.org.au,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	yilun.xu@intel.com,
	sameo@rivosinc.com,
	aik@amd.com,
	suzuki.poulose@arm.com,
	steven.price@arm.com,
	lukas@wunner.de,
	greg@kroah.com,
	linux-next@vger.kernel.org,
	Cedric Xing <cedric.xing@intel.com>
Subject: [PATCH] tsm-mr: Fix init breakage after bin_attrs constification by scoping non-const pointers to init phase
Date: Tue, 13 May 2025 10:47:42 -0500
Message-ID: <20250513154742.9548-1-cedric.xing@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
the ro-after-init principle by making elements of bin_attrs pointing to
const.

To align with this change, introduce a temporary variable `bap` within the
initialization loop. This improves code clarity by explicitly marking the
initialization scope and eliminates the need for type casts after bin_attrs
was constified.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 drivers/virt/coco/tsm-mr.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
index 1f0c43a516fb..a6362b144e8b 100644
--- a/drivers/virt/coco/tsm-mr.c
+++ b/drivers/virt/coco/tsm-mr.c
@@ -173,7 +173,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 	 * so that we don't have to free MR names one-by-one in
 	 * tsm_mr_free_attribute_group()
 	 */
-	const struct bin_attribute * const *attrs __free(kfree) =
+	const struct bin_attribute **attrs __free(kfree) =
 		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
 	struct tm_context *ctx __free(kfree) =
 		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
@@ -187,16 +187,14 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 	end = name + nlen;
 
 	for (size_t i = 0; i < tm->nr_mrs; ++i) {
-		/* break const for init */
-		struct bin_attribute **bas = (struct bin_attribute **)attrs;
+		struct bin_attribute *bap = &ctx->mrs[i];
 
-		bas[i] = &ctx->mrs[i];
-		sysfs_bin_attr_init(bas[i]);
+		sysfs_bin_attr_init(bap);
 
 		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
-			bas[i]->attr.name = tm->mrs[i].mr_name;
+			bap->attr.name = tm->mrs[i].mr_name;
 		else if (name < end) {
-			bas[i]->attr.name = name;
+			bap->attr.name = name;
 			name += snprintf(name, end - name, "%s:%s",
 					 tm->mrs[i].mr_name,
 					 hash_algo_name[tm->mrs[i].mr_hash]);
@@ -206,21 +204,23 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
 
 		/* check for duplicated MR definitions */
 		for (size_t j = 0; j < i; ++j)
-			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
+			if (!strcmp(bap->attr.name, attrs[j]->attr.name))
 				return ERR_PTR(-EINVAL);
 
 		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
-			bas[i]->attr.mode |= 0444;
-			bas[i]->read_new = tm_digest_read;
+			bap->attr.mode |= 0444;
+			bap->read_new = tm_digest_read;
 		}
 
 		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
-			bas[i]->attr.mode |= 0200;
-			bas[i]->write_new = tm_digest_write;
+			bap->attr.mode |= 0200;
+			bap->write_new = tm_digest_write;
 		}
 
-		bas[i]->size = tm->mrs[i].mr_size;
-		bas[i]->private = ctx;
+		bap->size = tm->mrs[i].mr_size;
+		bap->private = ctx;
+
+		attrs[i] = bap;
 	}
 
 	if (name != end)

base-commit: 7c3f259dfe03f5dcd898126602818a8fbe94d3c5
-- 
2.43.0


