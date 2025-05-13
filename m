Return-Path: <linux-next+bounces-6745-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F8AB5A72
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 18:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD6F886795D
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A527A2BE7A8;
	Tue, 13 May 2025 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAob6u1L"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBF2BCF5A
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 16:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154541; cv=none; b=WFZWcxhTMue2quzsHiPFkqnRHKZcBFZX/Qu+UMC+B1e0EmbMp2Tt1QaIERPEl8cVJvSoRZ8eYuWfKhrtg0MctdZ+IcHC7uhhhBbmflJ+pGM4iswxJ9d9jAg3Zqfu3aO6N+/Q19nFE6se7M5vdNbhmqQKf8ifQLlglivCBXzRN1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154541; c=relaxed/simple;
	bh=KmQHOWcT3dBYWVz8zlwo+h6UiOThtMRax3bWxAUzKLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goFAeHnbnE7+Yqu22Pfs1TrQ5KEZaIHPvqu7/uHVxG8Exms0r6XkaVok8txO9VeEfIkgj1ChH/Phxm+RP6CWjHtab9eZGmn0H5BdxlCzzWItwsQw48QfMo1FOCKv+9rIYmfkWuQwfgH4BOVuPEV/fbV3dozkqgpwZHkueZ0LClw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAob6u1L; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747154539; x=1778690539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KmQHOWcT3dBYWVz8zlwo+h6UiOThtMRax3bWxAUzKLQ=;
  b=cAob6u1LVDMmFTEutFSAOF3t0NnZ/ykmgE+3YVm2mWwDe5xsBqBakk8H
   sJXQzjrpYlvPLf20xNnYB86aP+8UbF1i5hkZXVMVcl71r/Fe30LXrA9Xk
   jxNOpp08UfEjc7LX0PuphEIUd0Zn6GIdWinJTa+rm8gkfmuk5WF1uFqKN
   yuI20oLKzC74eTEQHaHDFobvpjUeksNFTnyaho1orih2/zRWFj/e3UDW6
   fjU4yhS60ieJFDnZ2EmtU2l2ZjICQ7syI0gMhSp58wRASkth+p1Gksr1Q
   P1uqXZ8D0MrOiW26HAegT2mAWg2D8hiiFSJOccifyXqOc6FLGUrgTD2I4
   A==;
X-CSE-ConnectionGUID: TFqNkx9vRvG7AYuwLEUBpQ==
X-CSE-MsgGUID: TrGbuZlkTemMzldx9yWwng==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49163400"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49163400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 09:42:19 -0700
X-CSE-ConnectionGUID: MANhrTruQku9BEonwwXMoA==
X-CSE-MsgGUID: tTgd4oNUT2+WXgW21kplHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="142867097"
Received: from felipegu-mobl.amr.corp.intel.com (HELO bxing-mobl1.clients.intel.com) ([10.246.112.245])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 09:42:17 -0700
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
Subject: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs constification by scoping non-const pointers to init phase
Date: Tue, 13 May 2025 11:41:54 -0500
Message-ID: <20250513164154.10109-1-cedric.xing@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") enforced
the ro-after-init principle by making elements of bin_attrs_new pointing to
const.

To align with this change, introduce a temporary variable `bap` within the
initialization loop. This improves code clarity by explicitly marking the
initialization scope and eliminates the need for type casts when assigning
to bin_attrs_new.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
---
 drivers/virt/coco/tsm-mr.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
index 1f0c43a516fb..feb30af90a20 100644
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
@@ -244,7 +244,7 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
 void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
 {
 	if (!IS_ERR_OR_NULL(attr_grp)) {
-		kfree(attr_grp->bin_attrs);
+		kfree(attr_grp->bin_attrs_new);
 		kfree(container_of(attr_grp, struct tm_context, agrp));
 	}
 }

base-commit: 7c3f259dfe03f5dcd898126602818a8fbe94d3c5
--
2.43.0


