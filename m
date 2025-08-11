Return-Path: <linux-next+bounces-7897-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FAB209ED
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F911623BD
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613E7E0E8;
	Mon, 11 Aug 2025 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="G6sT/Mgv"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198876FC3
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918253; cv=none; b=JhidyvxsqXMazcaKbWdKLNh6ubx4hGxwKwt/LcP3sb5Pf2KYvDgcHF6GPVpK+ZxcinIQZ3oWYsI8oX/+UJjDjWrWP9xSDPQXmjIWsTz+caKDjI5ZlDQzi/5Qsd3EX4/Q/p/xiKPtWF+uveX5mWpUAwh66EWrJyS+CWzysDPpPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918253; c=relaxed/simple;
	bh=3JAuCm+v4as0W2cfNyFw3ejmM663Qv8MIVpyGSkzAiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u3UnyCQYPhztYCe90HjNQ3uhzelMiPEh23+5iMCjYuyUKL2GSb3Qf/UEMYWsIZSnCk/zq3mfz84IOywnHZZ1UG8cpyCZvAPx3Pczz2kRTpau5WAoT230MekTq6v1q/JigjM9NkfdhwcTTDOHl6n7bas+cmRBEigljgRYZUyOkwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=G6sT/Mgv; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4c0wCr3bSwz9ss7;
	Mon, 11 Aug 2025 15:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754918248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UI/W08Ip0w1mJpRHFBOQx1iqeKP+LOT32N+lmudcjhU=;
	b=G6sT/MgvyhYdmd8XD9je7MRLzM4BEnd0NQCDOnVmdasygg24pwlUXyevh6fpCvGsyTJHjR
	U7oB/sUYYXra9B5Pd6Li5eHF/q9UBQYmuUpPoZzbSfwUX7irLcLcZmNzyyLiDmO3nMYAbh
	kSQ1ow4T0Zdm6oIZ0nJEeU2zgdIo8FcYrsNNFXQ76343Ps7SepnpnBFUnMBCOl+d8Xtz7X
	4S1tgM7nTolxZBXpglwBKQGm02HkgN2j2TJ+05foDc+WLGkDgwGmY+HC/FRWDkuebvTG7o
	udZOxb1Xh2zRvxOAggwx4NBZoYjLiyRregZgYR3P5eVD9wvOhjPLW2ghmz+XIw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=listout@listout.xyz
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
Subject: [RFC PATCH v2 2/2] drm/i915: use new debugfs device-centered functions
Date: Mon, 11 Aug 2025 18:47:08 +0530
Message-ID: <20250811131708.82865-3-listout@listout.xyz>
In-Reply-To: <20250811131708.82865-1-listout@listout.xyz>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
 <20250811131708.82865-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c0wCr3bSwz9ss7

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


