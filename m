Return-Path: <linux-next+bounces-9441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69549CC7D19
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 14:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A005A30A6B36
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 13:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061163A1E67;
	Wed, 17 Dec 2025 13:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NnKfhuFR"
X-Original-To: linux-next@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A883533AD9B;
	Wed, 17 Dec 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977858; cv=none; b=VPsq3WbBhypl4p3dMMJBNzEbNG/XcW4cE6WlwIbAoLg6mtaot8PUWGdX/59O1eXB8/H5fmowt6X7xqFfKl+toUx+1Ay5DmD6KN8JLqeuwavoScIoiwnHqoVc3dvHZQQq9oNqfUW9cxV7Q01GFIx7QtYoDmJlqnb4EYBCCd+tH6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977858; c=relaxed/simple;
	bh=8/nVhpbxaSmBbI4zfSz52qF1SD68HO4P2I+t+AFEmjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I86rGzd+qevu4cDP4uwMr5OVSg+VQrwPL4JF8oAs9WPmX1OhkoJAZb7qgByypZz3AfD0vZBAvGNq/WTJc9+Ol9yWIdrq2/eq0DOp4WEf3HWWYvaJkZiRZRZBbx0gTRz9Lim+JMgvfDOITy5gnLz+LLTPOTxz3CgGx4cQzT/272w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NnKfhuFR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765977854;
	bh=8/nVhpbxaSmBbI4zfSz52qF1SD68HO4P2I+t+AFEmjQ=;
	h=From:To:Cc:Subject:Date:From;
	b=NnKfhuFRa9obuRSenDN3g2W77Pg5ZkATdctasB9Zp1mliHW8jZNkgcyDVJ9qC6qZH
	 XJYT+fET9lnt5zdt8qCSuq3cfVzMosRn6kCUwSwOCj4+uIJCvMoj/kFRcOufBEHeDL
	 +ocK5DdueIGl0swHjikM4h61Py8nSS7omP6mVm8FXL9jlOX8IQTllNL8sKeWt5FRHW
	 9EfvL7vTzAJ3ZJhpDNwKGSGWT/gJq+AS+NPYB+T5ImDboe3TulgNq4BXICP4c5rhNk
	 YWH39xoXDxEHZhLnpGJP/BLtzNHeI7/wS44KeZ9OvV/QZ70pwdG8Lgd1cYX19Rrxab
	 foIGHIFsZ1FNA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 26B3617E0458;
	Wed, 17 Dec 2025 14:24:14 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Fix kerneldoc in uAPI header
Date: Wed, 17 Dec 2025 14:24:03 +0100
Message-ID: <20251217132403.3996014-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a kerneldoc header.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/dri-devel/20251216120049.3ed7e06e@canb.auug.org.au/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panthor_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e238c6264fa1..b401ac585d6a 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -350,7 +350,7 @@ struct drm_panthor_gpu_info {
 	__u32 as_present;
 
 	/**
-	 * @select_coherency: Coherency selected for this device.
+	 * @selected_coherency: Coherency selected for this device.
 	 *
 	 * One of drm_panthor_gpu_coherency.
 	 */
-- 
2.52.0


