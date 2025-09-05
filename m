Return-Path: <linux-next+bounces-8199-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F11B44B89
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 04:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD1511895AA0
	for <lists+linux-next@lfdr.de>; Fri,  5 Sep 2025 02:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F801FA178;
	Fri,  5 Sep 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="Aiy9I0PN"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC47B1F4CA9
	for <linux-next@vger.kernel.org>; Fri,  5 Sep 2025 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757038572; cv=none; b=nwkUmWjAYh3nr1JHYhgYLf3JIaAfmMLEBByTRPdBF55AD2sHEGpwFQuErg3xCGaVkEkC0tMwQV7SqXzmRWde0LOi6fvf15yvcUiJzwEplAe4m5icnX9H/MQvfIA4x4N85/pR3Cb9uhWeaciBPvRF9FE7I/DS7sOGGM5RUw7SAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757038572; c=relaxed/simple;
	bh=5LPWQJS65wQQOfPyUMsSCDaTTl/Tihz2JdQnSY9Is40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsBm/XcN3bumRZGmg6fjAXR2ZwXo7aCnnsPEtQCBkDBdASzOYqM6EnNYeCuulkHfAoZYsPCCKRt53lV1DFxnsy0eyJyaa+4MdLtPQ+tE2/vWsLS+WYi7NljoLqAxWKvarT7N+xOL4asb+qK3w0lIiL0kSjLlV1CLUugkKOzHDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=Aiy9I0PN; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJ0M95dSYz9tZg;
	Fri,  5 Sep 2025 04:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1757038565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ocm0FbiUYOoHqiFBpqSwEbKs77Xt05F79aFj0gzRZBQ=;
	b=Aiy9I0PN/1XS59GuZkAItvXefIDBCZuAjOWqqwSQCifbGDR8ImisvoEi12WFFWBMOh2rgS
	PrIb0CgU0N5DEi9jhG/Hxr/CM1Ptzm0q5Hv8xS1Sj+Q9G0I3oJcQtZ7y5EIx0I45G8fKm8
	pIWyDYdP3fxKuFHDW2lpeF73XGtRjz5/ddXlyMvgAvbWi+tUK1aEKmRthDez5/XuJcvZe6
	dlGsIYdqBiinwRYGipAE6ozwlo9c7Eogpk0DriVsvmR6eFanJTVpDknRFj8bHD1IsIdtV+
	//uZHy0ramkxYuwH2sCMjJ4GzG4mvf283ooKy6XNz7gl5jiPgenSjXNUzet7RQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=listout@listout.xyz
From: Brahmajit Das <listout@listout.xyz>
To: amd-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org
Cc: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	boyuan.zhang@amd.com,
	leo.liu@amd.com,
	davidwu2@amd.com,
	listout@listout.xyz
Subject: [RFC PATCH] drm/amdgpu: Fix variable internal_reg_offset set but not used
Date: Fri,  5 Sep 2025 07:45:50 +0530
Message-ID: <20250905021550.47459-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4cJ0M95dSYz9tZg

This patch fixes build error with GCC 16, setting internal_reg_offset in
the marco fixes the build errors. Related to Statement-Exprs in GCC[0].

[0]: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html

Refer: https://lore.kernel.org/amd-gfx/x4ga2sfkszmylljox3p46ryog2owghv6hffo3rjj4o6xfjy7pd@jllj3us4heso/
Suggested-by: Wu, David <davidwu2@amd.com>
Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 6d9acd36041d..6630e5f95b7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -129,6 +129,7 @@
 			internal_reg_offset = (0xFFFFF & addr);					\
 												\
 		internal_reg_offset >>= 2;							\
+		internal_reg_offset;								\
 	})
 
 #define RREG32_SOC15_DPG_MODE(inst_idx, offset, mask_en) 					\
@@ -190,6 +191,7 @@
 			internal_reg_offset = (0xFFFFF & addr);					\
 												\
 		internal_reg_offset >>= 2;							\
+		internal_reg_offset;								\
 	})
 
 #define WREG32_SOC24_DPG_MODE(inst_idx, offset, value, mask_en, indirect)		\
-- 
2.51.0


