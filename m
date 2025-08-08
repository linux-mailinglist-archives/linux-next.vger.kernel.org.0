Return-Path: <linux-next+bounces-7880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A242AB1F127
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 00:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AAC97A79DE
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 22:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F390021C173;
	Fri,  8 Aug 2025 22:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="Qs87wH+A"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E323C21D5BB
	for <linux-next@vger.kernel.org>; Fri,  8 Aug 2025 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754693574; cv=none; b=OZSR8jgeBeUZnj5h7+DqvG39Wx0GbzhrX4wo4fkZE0iiN4u0jKwT+9UK8zzlRwy6cjNZprdPvBTNUM8VLDXEwhuxQRf0VLGOcMmQxntQS2moiaYNXpSIFRhlq6QhFaM0FEmvPFnq13a0mEpAfWZPUMqwy1ECLaTWmX4CYKv7Gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754693574; c=relaxed/simple;
	bh=MEypldGz/gRSYY6y2BaLTyFiGy3JQxFyz4zC4e2znTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sI6IrzGlxEmV767pSBbBarZVoeeY5cjVo7P5382y3J1JjDlTC8wCQYNC92V2phdjxeMOHW+fztAQOrPXxwxM+8xUAvLbb7eMZSYPEmxf6CUMT/N/NMz6ysQdGacArT4rnrjncbjXT3qJtkMtPsXlmqh6zSXRy6Ms9G9nd/FGWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=Qs87wH+A; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzK751CWfz9tDm;
	Sat,  9 Aug 2025 00:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754693569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qy2xkOx1pF+KCsu31r2SgnpiXqbIlszxJiNS9iCMRLU=;
	b=Qs87wH+ADdgKoypR078nUSzxeUC3WthsQ1R9XWnCJAIXXXIRrZb/dZIPG/AWAH6rVhsHmq
	cID652KCebhZ0lIadSx755TCdr/l/Ybbl/LTpiC+odMJbYSPMN03v71Izw7sW4G9ErisCE
	LBDoKzIIWk+kcU+JCL8Zv9dFUaCW6alCCTjF6qNqn8ukLsWb85PS2RFC0Pj8clrVvv0C8s
	xNLeL/WcQMvEclfPBpQ6T/l1PT+dbJ1dhd6zw6h0MBfZzugIrz2cnGM4BtpR+DaFG+H2Kp
	zdQSb9GBJKeemr2wylrIdlR6zaTxbkRQ3bEBrLfoQEaXJH4e2IGPuHGoDo76Dg==
From: Brahmajit Das <listout@listout.xyz>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-next@vger.kernel.org
Cc: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	simona@ffwll.ch
Subject: [RFC PATCH 1/2] drm/i915/debugfs: use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 04:22:25 +0530
Message-ID: <20250808225226.30465-2-listout@listout.xyz>
In-Reply-To: <20250808225226.30465-1-listout@listout.xyz>
References: <20250808225226.30465-1-listout@listout.xyz>
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
index 967c0501e91e..4c3065d3aca3 100644
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
@@ -737,9 +737,8 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 				    i915_debugfs_files[i].fops);
 	}
 
-	drm_debugfs_create_files(i915_debugfs_list,
-				 ARRAY_SIZE(i915_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, i915_debugfs_list,
+			      ARRAY_SIZE(i915_debugfs_list));
 
 	i915_gpu_error_debugfs_register(dev_priv);
 }
-- 
2.50.1


