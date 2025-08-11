Return-Path: <linux-next+bounces-7893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 823EBB209C4
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C653ACBD9
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19002D8396;
	Mon, 11 Aug 2025 13:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="XiDB561x"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0772A2D46A9
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917914; cv=none; b=d2NzIjNcYnbrXgEcJFfOnURTF/ssuThQUh5CtIrrDsh+vHB4XBTO4+Nc1Ka0q4OdNUH9CsArykLzQx5CEaRtWKD+Mo9B7P/N6yGtctqkZ9A7k0gbhzRu15oLllPNSlFZiuPi62Gyjn6nHSR4HbrqActUzlceMWz7GXEtAatwVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917914; c=relaxed/simple;
	bh=xKscAHT6AE8Mvyi7fTFzjmSKeQ5wcIc622ssPtwzyxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bb7tTTqgmJ3T8OuH++v3TPcm9gzv/ja1KpUZhO+d40zs1+Ex1y4vKO0MhD1Y1OenQKp8YcZprYPERy7aAgX8uMy8Nuy0BYCN1YCYANB3SgCwJZsSyOHcg7Dv6jhr1+kyj3qam08lIq2W7svZlHrYrWxyzpEWSHi1+ff/B0aFWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=XiDB561x; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c0w5K2YKqz9snW;
	Mon, 11 Aug 2025 15:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754917909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+H2ZqlQ2Jh2MhyNBjLJU7iks+MBvU2kShwz8Ja2mpHA=;
	b=XiDB561xAW0IlYlKP6duqbY5ECPR9xxcsgehRM+K4TRrCjoD4pNkS598Bqh/BjaCDNoBMn
	pvxB8DP07kZycr71gl05Khcq50WNXLZCYh2mY17qIb+aXH8ti/FwEVHfdncczIuplYNSkE
	6dOvfoe4cngSICuSNcjHeRUTE8NN12qGFeSwjWMJdDinoqb3FJnhsMnS++K9twaVRLPYzG
	slwiQZGr7yWPeCRwThadTCiXyJyc1OPOsP4o0ma5Cm5WKS86neNTyfujPLKW7YMD1eT3os
	I3C+Xe2lVQoT/xVZh2zjNp2sfIDkWq0ynZC/hyHsLmn8vXHy9TZdt1uASftr1g==
From: Brahmajit Das <listout@listout.xyz>
To: jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	joonas.lahtinen@linux.intel.com,
	linux-next@vger.kernel.org,
	listout@listout.xyz,
	rodrigo.vivi@intel.com,
	simona@ffwll.ch,
	tursulin@ursulin.net
Subject: [RFC PATCH 1/2] drm/i915/debugfs: use new debugfs device-centered functions
Date: Mon, 11 Aug 2025 18:41:25 +0530
Message-ID: <20250811131126.71883-2-listout@listout.xyz>
In-Reply-To: <20250811131126.71883-1-listout@listout.xyz>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
 <20250811131126.71883-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 23fa098c4479..e411ff3ac1fd 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -699,7 +699,7 @@ static const struct file_operations i915_forcewake_fops = {
 	.release = i915_forcewake_release,
 };
 
-static const struct drm_info_list i915_debugfs_list[] = {
+static const struct drm_debugfs_info i915_debugfs_list[] = {
 	{"i915_capabilities", i915_capabilities, 0},
 	{"i915_gem_objects", i915_gem_object_info, 0},
 	{"i915_frequency_info", i915_frequency_info, 0},
@@ -735,9 +735,8 @@ void i915_debugfs_register(struct drm_i915_private *i915)
 				    i915_debugfs_files[i].fops);
 	}
 
-	drm_debugfs_create_files(i915_debugfs_list,
-				 ARRAY_SIZE(i915_debugfs_list),
-				 debugfs_root, i915->drm.primary);
+	drm_debugfs_add_files(&i915->drm, i915_debugfs_list,
+			      ARRAY_SIZE(i915_debugfs_list));
 
 	i915_gpu_error_debugfs_register(i915);
 }
-- 
2.50.1


