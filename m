Return-Path: <linux-next+bounces-7884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B71DB1F4AC
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 14:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7C7D7AC3A2
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 12:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B3A285C97;
	Sat,  9 Aug 2025 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="ALKSNHEQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7E239E60
	for <linux-next@vger.kernel.org>; Sat,  9 Aug 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754744116; cv=none; b=i3KOtWOloOqbGb+BGz3SZNHkqoZCJkw2HIKzcF7PEd8AEmiqT9aIgThi9UJSXTC0dO2f/M9BdtlFjwo0Oh7L6R0rfnie3l3NfmWm6RHJ1in5O7HEM0tiF2/uH15mENB/YGlP2tKGKiAnfah2e4hdICBnYhNx0Sy0h54vGYUzW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754744116; c=relaxed/simple;
	bh=XEJdTjZIEzwZf2XwkH8zZOQLW4+FHcomd4LjvqU3uYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9QHru5LZ9CF9AEgZYKoI0rKFdpXbdOZNcBDt4wpaKgQEBckIw2nz/b7ZJM6qPyHWDS/mV+RFhQv8UVxm5IfGwrR8GYr5uWI3nMzupWzV3vNYAZe6fdKZKt3qHB9ispBj/r7/AiEL1N105nl3r3l/C1+WltlZW/ww0fomigGVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=ALKSNHEQ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzgq22BtXz9syH;
	Sat,  9 Aug 2025 14:55:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754744110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q46Zx2RFVQHBDUuhL7yZ0QAx1YbsPYpQ8L8DATmnhcI=;
	b=ALKSNHEQlDZis9Wy/+VxKB/1CWmp9tp2k0i6OZFJo95Lc968aLZtVzZAoMvbYtyr+XkWLD
	70iBS1kTgE9LXirQxFxczD/btGCm/D3LiWlz929MbasBMrIb397Ich4XVYzEWNgHhaS00G
	WqlHJ8SkxD4DuYLn7Ylb84rMvm170YC6+wNkirdGcW8NudWDrUgROVLQljAWnTukFpwUR2
	0KnIEExrywbo5dgkUKAxk1Rp5LJHZJknE3VV31Q/n9ldLoH3O8wOK6YERtJY9mwiDYovce
	95YM6c0uLKwtEmft4E9XgXxmswNcRSItmugGXqOfarE5aFq8tWpRxmPkwDxFJg==
From: Brahmajit Das <listout@listout.xyz>
To: airlied@redhat.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	gurchetansingh@chromium.org,
	olvaffe@gmail.com,
	simona@ffwll.ch
Cc: linux-next@vger.kernel.org,
	virtualization@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 18:24:43 +0530
Message-ID: <20250809125443.4011734-1-listout@listout.xyz>
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
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..b7c895fe5ddc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -94,7 +94,7 @@ virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 	return 0;
 }
 
-static struct drm_info_list virtio_gpu_debugfs_list[] = {
+static struct drm_debugfs_info virtio_gpu_debugfs_list[] = {
 	{ "virtio-gpu-features", virtio_gpu_features },
 	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
 	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
@@ -105,7 +105,6 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
 void
 virtio_gpu_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(virtio_gpu_debugfs_list,
-				 VIRTIO_GPU_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, virtio_gpu_debugfs_list,
+			      VIRTIO_GPU_DEBUGFS_ENTRIES);
 }
-- 
2.50.1


