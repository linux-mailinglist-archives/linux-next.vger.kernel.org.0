Return-Path: <linux-next+bounces-7895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC226B209EC
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098A6188A468
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4AB6FC3;
	Mon, 11 Aug 2025 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="nuxsY5Op"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FAC148
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754918245; cv=none; b=HR3CbNd6CGaRAdpREaTNr9EEQ5lxClnvEjA1KOdslpibMkVGD8RnKzYbB7vn+7fqMN80pMe6fgE4pb44iWWwgL9oQXILV2ol601Xt+xx+glIuWNekKcrw9i6ReJVXx5gAaWZFXcz1Hpu5z46NnCmRZGogmhEViiFHC4ynEPyAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754918245; c=relaxed/simple;
	bh=XV3RR5XMlYRW89Y6zznhZyWorO0HYcekJNMY7HsMbFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFs/PpIeWTZbLnWkzvmdq9yKuDC/3ZcMcZBhN5k8IsiN3S2C0QkyplAR9luPiEqDdU7tQ60Wmt7lI3DZYhIiu3zrR2rN4GpZeYqIKtrFGPSPE4gE0yc3uV84xqSHLyzAiJX4klJVAIHKXwks/O3mYmd7VpBnJGdWBYrSJUedQCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=nuxsY5Op; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c0wCg6KGhz9sTZ;
	Mon, 11 Aug 2025 15:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754918239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/60RwIO/b0dOS1Vd6kdShsnw/FwFxOCsLj3X7+hP30=;
	b=nuxsY5Op4iWaKO+yRzT+kGXjHj0yqMjwne3ySyzP+imQ7KxlAVsxElvXV+Rj8VYXN4xhjM
	MxqRpz0EHO0wy7yUEn/iHAjQLxSUV0th70FxyH0KWg64+7gxJ40n450RFR6c7Ml/3+8qt9
	+WgLj55TKU2ECyKStpISYCA88PB26fT6ZC/9JU+QDxOROI19/mG7G9eJvqhLDHlDUbRmKb
	ZMuQWJDnE3OqvXqtVD08VYlKDan0Ik5i9jxEIZ8m6k5AFTC3OkQgiUHHtk7ePMJmBo44pH
	DqlrtaXgD6wdy7VTUEJA5JSkbjzhG+G1KOCEGBsbYi0a7AIOwFpkllwV2NqfAw==
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
Subject: [RFC PATCH 0/2] use new debugfs device-centered functions
Date: Mon, 11 Aug 2025 18:47:06 +0530
Message-ID: <20250811131708.82865-1-listout@listout.xyz>
In-Reply-To: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c0wCg6KGhz9sTZ

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device.

V2 changes: based on drm-tip.

Refer:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Brahmajit Das (2):
  drm/i915/debugfs: use new debugfs device-centered functions
  drm/i915: use new debugfs device-centered functions

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 7 +++----
 drivers/gpu/drm/i915/i915_debugfs.c                  | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

-- 
2.50.1


