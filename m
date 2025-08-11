Return-Path: <linux-next+bounces-7894-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF1B209CB
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB91E7B3C9A
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036B22DAFBB;
	Mon, 11 Aug 2025 13:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="OaFLUrVw"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62C02DBF40
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917919; cv=none; b=FIL4R9oT97BxpYIDaHw2EFH5NpxFzD86TuP9UMBih36glpW6XhIwATBcBoGXPJ29nZGqSN/V1UPtu42sKDawbBiSq2fiPw/cjnXeuUpeZYuKrR+IeUM5bFx7KsRffIuYZWXtsfEGkTNQ2jUWAKuXXGJZtmdCSO6WUXCcBju5K7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917919; c=relaxed/simple;
	bh=3JAuCm+v4as0W2cfNyFw3ejmM663Qv8MIVpyGSkzAiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0liBdRQZTgYONJgYz7Yf5tnWSNNyEsNlFlmFchAwpCm9OJbFOaRWjFE14z1k7XSBKxjCqyHvFqUKEqrJLVtngK7oXvMUq8yY12br9GuMu7lpW/G2374MyJXGTxQ9iR7rUwQBIM096H/R6Y40o11vyVTysBMdOw7qpwvJZ/K5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=OaFLUrVw; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c0w5Q1vCYz9shs;
	Mon, 11 Aug 2025 15:11:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754917914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UI/W08Ip0w1mJpRHFBOQx1iqeKP+LOT32N+lmudcjhU=;
	b=OaFLUrVwRnoUozzxl9bgMC2K0iVqIsfJ0ylFmlKfoDJRDFWaCIt8O9irM032xt0wxJEDPJ
	iPs5eGjZydF859LVgFE7RXtUUm52xtco7T79Gt48xG4aX0X+09tx16Rvrkx5RxN1S2X1jf
	5j53/8dKMadsLfdRCLjIBfy5hNqiTph0EC8yIgICfmWjbPLMb4lVU8aUNpSf2IxqGZ+xNZ
	/cBnLzAHwfJka4DzzYHTr17OxxljSW3NSaAeIbwm1IP00CgLIT0nA8pwcXwRHgM2kbMHYM
	54STJnfpqfc1WNlKGQFhRtfQNSiYHespdOZBbvOeeXek+G3D/VfKdnPCuslmTg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=listout@listout.xyz
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
Subject: [RFC PATCH 2/2] drm/i915: use new debugfs device-centered functions
Date: Mon, 11 Aug 2025 18:41:26 +0530
Message-ID: <20250811131126.71883-3-listout@listout.xyz>
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
X-Rspamd-Queue-Id: 4c0w5Q1vCYz9shs

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 10dddec3796f..e191665f7832 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -805,7 +805,7 @@ static const struct file_operations i915_fifo_underrun_reset_ops = {
 	.llseek = default_llseek,
 };
 
-static const struct drm_info_list intel_display_debugfs_list[] = {
+static const struct drm_debugfs_info intel_display_debugfs_list[] = {
 	{"intel_display_caps", intel_display_caps, 0},
 	{"i915_frontbuffer_tracking", i915_frontbuffer_tracking, 0},
 	{"i915_sr_status", i915_sr_status, 0},
@@ -825,9 +825,8 @@ void intel_display_debugfs_register(struct intel_display *display)
 	debugfs_create_file("i915_fifo_underrun_reset", 0644, debugfs_root,
 			    display, &i915_fifo_underrun_reset_ops);
 
-	drm_debugfs_create_files(intel_display_debugfs_list,
-				 ARRAY_SIZE(intel_display_debugfs_list),
-				 debugfs_root, display->drm->primary);
+	drm_debugfs_add_files(display->drm, intel_display_debugfs_list,
+			      ARRAY_SIZE(intel_display_debugfs_list));
 
 	intel_bios_debugfs_register(display);
 	intel_cdclk_debugfs_register(display);
-- 
2.50.1


