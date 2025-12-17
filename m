Return-Path: <linux-next+bounces-9445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59FCC90E8
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 18:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D9D4300A6C0
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 17:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731CE335572;
	Wed, 17 Dec 2025 17:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ExGZ+get"
X-Original-To: linux-next@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7072D7DCF;
	Wed, 17 Dec 2025 17:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765992252; cv=none; b=an2zvWEA8qmMOLeFBvLfGM6t3PuIymwqYkCZf0YSTjRVUb5NDwSfyRGHtb2W2KLMuzBkCccHNFaFs0TxlfsZdH+aA5WG6QWEo4kSIu96tqVb0hHBDMzy6b94Db30tS4Q9WbfBKIFa8lUedWFok6m/bd+d6VRVYJNwRY1oxTf/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765992252; c=relaxed/simple;
	bh=+PpC+4mgo85FzfqJLBbiUr6rR7AC9pRiqaqgBeRBpAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TL9DroZBZ9fHU45DXyM1E6WrX2xIHrnvXudSpSQOssGvUeAlD/ZPccZfmlZ61UPfvwCqo3kMJhwIyxvZrASLDDUxfG/gSOIKVp4H6kezHt7tZSLOFbNgheibdpGxiOn9YGTTSph9zF5S0326keyNzPyb0fy1uUL7IxIIhJLYXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ExGZ+get; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765992247;
	bh=+PpC+4mgo85FzfqJLBbiUr6rR7AC9pRiqaqgBeRBpAU=;
	h=From:To:Cc:Subject:Date:From;
	b=ExGZ+getoiIFwkhtGNHVOrtgI9i8MiFxWP42OhDKr6HJPCA5wmaKYBqJBrzzYeFV1
	 5FXwwJDPrpW6E8m+ByvTXWMnF/k55FCCFYxAE9UIyiHQA0TUrTXLLLA0AgG5MCjdo+
	 5/MgpBfd16BvwS8sfFrQiqpVn0b1PZN/SSJ9t65hGM8NgoCBF1uSQqAArbe+TSlm3v
	 pZI9Ljdlk+okzT6e8a1146jm+NVk/ln8FX54VB5JNAQlJgctiuY/XppXyhSRTPcBbI
	 XYns2QsGiY+KjtLUQKtY6LNwbsS5JWyPhnlyWOmcbloxS9XPItEXZsQjE26LEYGISp
	 6tQVMP3JurXsQ==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [IPv6:2a01:e0a:5e3:6100:2e0:4cff:fe03:d8c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: loicmolinari)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2231917E127F;
	Wed, 17 Dec 2025 18:24:07 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	=?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	DRI Devel Mailing List <dri-devel@lists.freedesktop.org>,
	Intel Graphics Mailing List <intel-gfx@lists.freedesktop.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Collabora Kernel Mailing List <kernel@collabora.com>
Subject: [PATCH] drm/gem: Fix kerneldoc warnings
Date: Wed, 17 Dec 2025 18:24:04 +0100
Message-ID: <20251217172404.31216-1-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix incorrect parameters in drm_gem_shmem_init() and missing " *" on
empty lines in drm_gem_get_huge_mnt().

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 7 +++++--
 include/drm/drm_gem.h                  | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 29174ab58ff3..fbd1164174b0 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -94,9 +94,12 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
 }
 
 /**
- * drm_gem_shmem_init - Initialize an allocated object.
+ * drm_gem_shmem_init - Initialize an allocated object of the given size
  * @dev: DRM device
- * @obj: The allocated shmem GEM object.
+ * @shmem: shmem GEM object to initialize
+ * @size: Size of the object to initialize
+ *
+ * This function initializes an allocated shmem GEM object.
  *
  * Returns:
  * 0 on success, or a negative error code on failure.
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index f4da8ed0d630..86f5846154f7 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -508,11 +508,11 @@ static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
 /**
  * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM device
  * @dev: DRM device
-
+ *
  * This function gets the huge tmpfs mountpoint used by DRM device @dev. A huge
  * tmpfs mountpoint is used instead of `shm_mnt` after a successful call to
  * drm_gem_huge_mnt_create() when CONFIG_TRANSPARENT_HUGEPAGE is enabled.
-
+ *
  * Returns:
  * The huge tmpfs mountpoint in use, NULL otherwise.
  */
-- 
2.47.3


