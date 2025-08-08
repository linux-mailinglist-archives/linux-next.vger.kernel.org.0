Return-Path: <linux-next+bounces-7879-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D89B1F125
	for <lists+linux-next@lfdr.de>; Sat,  9 Aug 2025 00:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2E6217833C
	for <lists+linux-next@lfdr.de>; Fri,  8 Aug 2025 22:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498751DA3D;
	Fri,  8 Aug 2025 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="rKce//7J"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99821C173
	for <linux-next@vger.kernel.org>; Fri,  8 Aug 2025 22:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754693573; cv=none; b=i03lUvdrRyZNivQYbKwilLWnrsHeEOEa9AhmQN1IMjEQwlARY2CIlf6F2dYZajEAlVB3qaPslzBOtSI1bvQGpgjWEQXCG1+Sqxo7I3JLfXX0mWJDsIkdRHzUip1TKmfLA1oXwPXEoBnXig0WXXI3tkIJTaJqeBkhqNUVzOC4Wdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754693573; c=relaxed/simple;
	bh=3AKF+yigg1DlTIadwdhcl3h8TXBuJgCq2eGo/lP8XPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AFXnZgMETtxIUi42edSYzktSxeBmKB/BVtl8gFPRHXJk/JbV7WV5EJ1JnZ/p37ZgTbyQL4Ii0+QbGnwXJaLymZcJO6mlmg2rPqZJ+BOgXusJG0TsYplWvBXPFmwz8FCPmcRtfbt9Auwx4e3DChDN+/rnAjHL66m7S7B+ffw9ndk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=rKce//7J; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzK7154cSz9sVv;
	Sat,  9 Aug 2025 00:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754693565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pfnki0oaDIoV3aLT0Kq4K2/8BC7/9JT3kxz8y1+UALE=;
	b=rKce//7J/OORdAR9bQcJXUfqZySO1sBjZ/9mJtNUKCHsR9PBa8SiOZ5SJzqM5lV23jR5to
	MSDd+IZgLJXXktfBk31tYrubvhhOoGWENmUzLQY822n8uzWSGb7eKuTMqvCaUv8uVxszsW
	14KO78/HRieuuGkyODg2XUWSswt+7pndPqeHsZCPAMnOiOxwRhwbGaylJQrLC7IHpuJCud
	e3FBw5MxiaFakRDmr+mebcB0WP6tpl3iSIQk2mXX8Qdb5re4g3Wj8HjJ54kh1xq/CU3aED
	Bl6Ru9gQo2x5/O0XINBwyDCohH7TlFeyebbqbCzkVO6nYUjxTEJmaG8rNBR6zQ==
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
Subject: [RFC PATCH 0/2] use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 04:22:24 +0530
Message-ID: <20250808225226.30465-1-listout@listout.xyz>
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

Refer:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Brahmajit Das (2):
  drm/i915/debugfs: use new debugfs device-centered functions
  drm/i915: use new debugfs device-centered functions

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 ++---
 drivers/gpu/drm/i915/i915_debugfs.c                  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.50.1


