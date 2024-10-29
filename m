Return-Path: <linux-next+bounces-4521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5AD9B45C1
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 10:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BB51F2303E
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808AD1DE3C5;
	Tue, 29 Oct 2024 09:30:54 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECCF1DFE03
	for <linux-next@vger.kernel.org>; Tue, 29 Oct 2024 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730194254; cv=none; b=JXu35xczD51d17RVFRDmc/u1foW8SsmPUzooMK5HW5MNDo1F6n4hsGGWH0tCUrSTBnL0rtBV6P4EsvcG2Z8n0E3NTxqaXCPfrqRkiW6DsX7gMhGyojxxuVpCYYoR7DlBTdYfbyxvGO/FqThuCNqOKE6BRYDu4SsIUzKq3sMqO0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730194254; c=relaxed/simple;
	bh=ielk4eocKmhCzJqivE8mNRRvfTZZ9VTMHUilvcNssTI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MQmPXClK6JW3O11cHPAGE+5hV5iCsNuXkHe6rQf/xnlTiv1vYTMJf36B9LUpKubYdBEJ/N+YKrus3eeJ7fABsWN2LWTtE7gp4ZVTY+vQAKKXEBCtHsp1zqfpp4kwZy7N0aaZ7GLHW46JHiVm5uk3MPLRWcE2D/KIkobApAfEEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:f139:988f:a76d:7a3f])
	by xavier.telenet-ops.be with cmsmtp
	id W9Wd2D0085E9xN5019Wdvx; Tue, 29 Oct 2024 10:30:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t5iYN-005noj-La;
	Tue, 29 Oct 2024 10:30:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t5iYe-002W9M-Qx;
	Tue, 29 Oct 2024 10:30:36 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dave Airlie <airlied@redhat.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	David Airlie <airlied@gmail.com>
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH drm-next] drm/xe/xe2: Remove duplicate XE2LPM_* register definitions
Date: Tue, 29 Oct 2024 10:30:33 +0100
Message-Id: <20241029093033.600098-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Merging commits e1f813947ccf2326 ("drm/xe/xe2: Extend performance tuning
to media GT") and 876253165f3eaaac ("drm/xe/xe2: Add performance tuning
for L3 cache flushing") with their upstream counterparts
6ef5a04221aaeb85 and 3bf90935aafc750c accidentally left multiple
identical copies of the XE2LPM_L3SQCREG2, XE2LPM_L3SQCREG3, and
XE2LPM_SCRATCH3_LBCF register definitions.

Fixes: 26bb2dc102783fef ("Merge tag 'drm-xe-next-2024-10-10' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index d428d04164d9d3df..42dc55cb23f4a334 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -410,12 +410,6 @@
 
 #define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
 
-#define XE2LPM_L3SQCREG2			XE_REG_MCR(0xb604)
-
-#define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
-
-#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
-
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
 #define XE2_TDF_CTRL				XE_REG(0xb418)
-- 
2.34.1


