Return-Path: <linux-next+bounces-7892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB2B209CD
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 15:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68D7A7B22EA
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 13:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD832DAFA0;
	Mon, 11 Aug 2025 13:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="Pj/pccSS"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EC2D46A9
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754917911; cv=none; b=TCdllsBpPDgOvEgwMUVO74TlI0fpnBXIKHe2ctdmMcykiXMXpqD7xJfoaakMetMWWPmOca3lhzaYdP9l17Y8aeleGJUziH2eyu1t9gADakPr5IVedAfbFBjkL7pewR98CceIv8Odkk8KNtBv/tDn3tP+TOZa3DXifnCvxN+LGyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754917911; c=relaxed/simple;
	bh=xFcnoIqm59Uk87SZrXppp3QoPUoQvmRDRqvB12S34lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjO+N53Mutuc22+aOf6zueweCrWHj9b1h3QGC8jpVBx9ejiK2RdWXUnFgVhwvec+rdy9TaSqBFkQDUy2Kkw3npWdE2qPBLL5Y7pkRD4mFmKpHGwqhaXF7NsBmC9K5qs1ws703Se80OiiRYXVOIvDGaaXmdapan97gFPUpgRb6Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=Pj/pccSS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c0w5D5vn9z9slH;
	Mon, 11 Aug 2025 15:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754917904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nn7J5B2Aq1IDeL4KLSwsL1A7sTtX38IT2nssYyCR2Hg=;
	b=Pj/pccSSXFpsAeFaoXQdP4xi95b2D8/Lrnk3ADAfSu9xaqbTEEFaTjiyu7hz9Kszb5je5e
	bzXcvxB6yt+DAP1A1hcWrymIBx9a7kDVD42WinC40b+MmghsnlQcG0RkTthtN15SweynMo
	Fo9ZNScmCnTRlc+DA84/C6xOZX+jDHRV8fF2x4qnB8SUeoV1PtSwGDyOx3zWgrhE7eTrIu
	8XDJDDZcOmNFhyztRNrI4vCH20TvwpmLebkARK3Xh1hwC0aTDzrqbI1zKDUrTZ7yj86yfO
	xIoNpD0CN1QGK1XD+WsyNZp6jza4a7oKXtTKaeu7jMYdJ/3JNQyXs2xLOKVPYA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of listout@listout.xyz designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=listout@listout.xyz
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
Date: Mon, 11 Aug 2025 18:41:24 +0530
Message-ID: <20250811131126.71883-1-listout@listout.xyz>
In-Reply-To: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
References: <32c55ab0b1452a1fd8ef49e8a1ca640ad5bd9d76@intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4c0w5D5vn9z9slH

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device.

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


