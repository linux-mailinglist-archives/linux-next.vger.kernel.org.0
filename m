Return-Path: <linux-next+bounces-7290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EB1AEF1D7
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 10:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08FF93B773F
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3403F269CF1;
	Tue,  1 Jul 2025 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsshkGBu"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E2246784
	for <linux-next@vger.kernel.org>; Tue,  1 Jul 2025 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359875; cv=none; b=dbo67vyHR/tiglTp7nQdeBPSgosfjjzPlWXK42kMCV+wAXAbbIgugU+ED/RpbamWm+VgDYUB8Eg5w5wmXQEnFnQLY0vzL3CWXnz3Lw71b5mwtVYvSuPGj9IuYfg9UbMOroo1H97EjulghcnliFeJNJ6nxQMcp/POC/OMQtFwohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359875; c=relaxed/simple;
	bh=H430Oql6pWEHqTS456iNuTxON2paNdsugBZuI+YI3qE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DKiulRfClHXsgrCbkFOLLmuCFSsoRh6ZnlZKvb+rvcx7Era/0RDYsXjBxHix4+LUs7OozMeLDk+TRH7zH4PWx90sfIXqNeL4nOZjZQII8EWCLfH/j0XcXzaQ0Jn/xjCivfetKucPIszbhfWaFSvUHUp0eGw7G5zApks1I1/ReiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsshkGBu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751359872; x=1782895872;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H430Oql6pWEHqTS456iNuTxON2paNdsugBZuI+YI3qE=;
  b=NsshkGBu74i7f58lPWiJbTAl/CEfcQ6KcbGXyZArOQcyzoG075xTu8Po
   3P3xArlgWjL4ZyZKsekkc8s1/dqhYK3gy/YSYBHmK8w3SS2nBl35x8ana
   eprAqix2amen+IABP26vm5deAjqAtfOIuBAPzi4I0WiAcpISAkzMIPMtK
   bZqLsRopbzX5q/Btf6tfB/YwYfqh6bDrcdOClxNQDTsPyG3BiPzPDVeFI
   FKQpYhm8WQ4zKgC+b/x5UW4+/+VTlxwHZ7BmkuABCC8IO6TDquYroAyAg
   F9BTfDsk0nfVdpZoMd9I4TYytWEoJ3NMThqzu0df/O4FBUA3yk3j79XBg
   w==;
X-CSE-ConnectionGUID: zEiNJo0eS4Crq9PC7NkzJQ==
X-CSE-MsgGUID: +YYsc+OQQgGn9JOvweXbwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64665470"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64665470"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 01:51:07 -0700
X-CSE-ConnectionGUID: VJvOBPx9S9a97mpWo3muCQ==
X-CSE-MsgGUID: OO4CgFU6S8Cfa0zGpqUS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="177368271"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
  by fmviesa002.fm.intel.com with ESMTP; 01 Jul 2025 01:51:05 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	linux-next@vger.kernel.org,
	sfr@canb.auug.org.au,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH] drm/dp: Add documentation for luminance_set
Date: Tue,  1 Jul 2025 14:20:54 +0530
Message-Id: <20250701085054.746408-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation for luminance_set for struct drm_edp_backlight_info
was missed which causes warnings.

Fixes: 2af612ad4290 ("drm/dp: Introduce new member in drm_backlight_info")
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 include/drm/display/drm_dp_helper.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 774c6d3e2001..87caa4f1fdb8 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -843,6 +843,7 @@ drm_dp_has_quirk(const struct drm_dp_desc *desc, enum drm_dp_quirk quirk)
  * @lsb_reg_used: Do we also write values to the DP_EDP_BACKLIGHT_BRIGHTNESS_LSB register?
  * @aux_enable: Does the panel support the AUX enable cap?
  * @aux_set: Does the panel support setting the brightness through AUX?
+ * @luminance_set: Does the panel support setting the brightness through AUX using luminance values?
  *
  * This structure contains various data about an eDP backlight, which can be populated by using
  * drm_edp_backlight_init().
-- 
2.34.1


