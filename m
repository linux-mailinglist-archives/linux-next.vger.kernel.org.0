Return-Path: <linux-next+bounces-7881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E649DB1F126
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 00:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10443B8F71
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 22:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADC5246771;
	Fri,  8 Aug 2025 22:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="uPEC8Jde"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698921D5BB
	for <linux-next@vger.kernel.org>; Fri,  8 Aug 2025 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754693577; cv=none; b=LosYyuQ8CIb1lZ0b3Ut79LA9mnZ+uP0ObaBrPom6nYgCLR3UTPtiZr8wTTpmEXlls9QbpQBxQjj8mV10oVT+2u9zJ4bGaVAobe2xJT66uKdG3HwTywaG8IVkoxV5KBxp6HraCvDQ+VIawPE5Te+bavIfDwg0+QC44d797bcnqmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754693577; c=relaxed/simple;
	bh=W0aHi5CgiI/35oW0CEFqvMzcz8kn9R1PdjRkFz+HHHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnS0QEdsjhzi6QcbLFEdyBfPdTwS6f2CR63QFJbqvP+FJYmZRr5/4M6hzCXG04JGoTXbVuKU2Ed5Nep8nzOxAe1ihCQ3DlvtuvPKsqWKLy/Il7Cp/KjUZfFhJ+q62I9SVGgUGwpddvHpRYuv7nilJgro7CRPn272Bro888CxWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=uPEC8Jde; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bzK7844GJz9t1G;
	Sat,  9 Aug 2025 00:52:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754693572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AoCzKBpu2Jxv88ZyAsLhizqpgOm2OwFBGMZsZf5hDwE=;
	b=uPEC8JdeN0SNqQ3gpVTiIErKBXBs2SmifNB8pZGIWWaf3ergxltAGu6QKwJeVgNwgl/3LE
	X+RMZ7IQdJ50YPHqkOUefJvFYjx4nK7Kv7VLr3mq/zU2h8WPXmSTb6xhPqHDilajC6Fjrk
	LUOgJdP/KC+0eXW9zMwHC0S1eyAK8L8khaPSGTKSpYWJ6xVYm31bvv3XeweHhJAWCa3/bU
	64JXOLFUlpbiaQ1UJ9XG2lpo9RqPg8WvqJ7xbgD5xcwuDmIf27iY8T8/AuFpcy/3LUuMby
	RZo553NmIGIGJ3MJZHQT47b6y20CsxCyjPPle645Ab1IyU/SZjkacyy9J71Kjw==
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
Subject: [RFC PATCH 2/2] drm/i915: use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 04:22:26 +0530
Message-ID: <20250808225226.30465-3-listout@listout.xyz>
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
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index ce3f9810c42d..92db369f1b94 100644
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
 	debugfs_create_file("i915_fifo_underrun_reset", 0644, minor->debugfs_root,
 			    display, &i915_fifo_underrun_reset_ops);
 
-	drm_debugfs_create_files(intel_display_debugfs_list,
-				 ARRAY_SIZE(intel_display_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, intel_display_debugfs_list,
+			      ARRAY_SIZE(intel_display_debugfs_list));
 
 	intel_bios_debugfs_register(display);
 	intel_cdclk_debugfs_register(display);
-- 
2.50.1


