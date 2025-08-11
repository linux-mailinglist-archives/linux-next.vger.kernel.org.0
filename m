Return-Path: <linux-next+bounces-7887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC3B20332
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 11:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8973D7B0548
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A988D6F06B;
	Mon, 11 Aug 2025 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="ffW9ZljC"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D7202F83
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904116; cv=none; b=cPgKlwQpbtRFdqIxLd8J/R6uouE0Lux0jRonua+VD09yo9CNYGx1COJ825BGXicXXi0a5XjSlN0uERDd9v8HFBaS83sXRYOx6zPEGNTZhPCOhSDKEj3LPTLVndr2mBXYz9QFtsKz46U4fbyBf00IhX8HSZU3L5B69Y4i7egEDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904116; c=relaxed/simple;
	bh=u77K6U84+2sgQy398xmR8h9ig/RHo/LT0oisXXHnpjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9LeNY2gw//xbQ36UI5px6GL6OJZpBTKy7HKREFaqo89azjdKuG1hxAHIofvrIFHa2VSVYxs8At7yViKHIda88XXHNtfuDSN+wsw1/BRttxPrVZA7MUQTyB887lAciX5Erxn2sbcnouKxyWMI1pyTdlR4SAz/0tRn8gpAOtL6ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=ffW9ZljC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c0pzs0MQ0z9t8P;
	Mon, 11 Aug 2025 11:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1754904105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luo/J0Urs/z1wT6JrOIEkooUXWinPuE9Us+y1i3s1Jk=;
	b=ffW9ZljC03Foo6ISBEL4deFMo8YBoAZyM1Fn2iYi6ImafgsK3stn9J9K1gDR3anY9CuDAX
	7UFPQjRZUiX2Irt53/zk86Cgc7McvmsgQ23GT3kZbY5XdXUhhGqxgJc1yXT0GbEu4UbaH3
	IwRyV22iyKzQHwZy9rIJK609z5XGEZ4HUMQWfp+KtD2pIt3c2mkAyZMhOvC+8yTmFOjLVB
	htBA+7csXDnXIFuu3gKGb+Axy0pWjf178zJa1a0Ry+glaUrooE42cnaYgaBB6xUJZ+f4Q3
	y5r6oK+/7YP1seXqFvWxVrWKwVqRD5Rqhg+e4TwQMOv7MLIBnN5CgiqjgmZe4g==
From: Brahmajit Das <listout@listout.xyz>
To: christian.koenig@amd.com
Cc: airlied@redhat.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	linux-next@vger.kernel.org,
	listout@listout.xyz
Subject: [PATCH] drm/radeon/r600_cs: clean up of dead code in r600_cs
Date: Mon, 11 Aug 2025 14:51:25 +0530
Message-ID: <20250811092125.22630-1-listout@listout.xyz>
In-Reply-To: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
References: <9846b386-87c4-4f86-ae11-6361470cbce7@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 16 enables -Werror=unused-but-set-variable= which results in build
error with the following message.

drivers/gpu/drm/radeon/r600_cs.c: In function ‘r600_texture_size’:
drivers/gpu/drm/radeon/r600_cs.c:1411:29: error: variable ‘level’ set but not used [-Werror=unused-but-set-variable=]
 1411 |         unsigned offset, i, level;
      |                             ^~~~~
cc1: all warnings being treated as errors
make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/radeon/r600_cs.o] Error 1

level although is set, but in never used in the function
r600_texture_size. Thus resulting in dead code and this error getting
triggered.

Fixes: 60b212f8ddcdb ("drm/radeon: overhaul texture checking. (v3)")
Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 drivers/gpu/drm/radeon/r600_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index ac77d1246b94..811265648a58 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -1408,7 +1408,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
 			      unsigned block_align, unsigned height_align, unsigned base_align,
 			      unsigned *l0_size, unsigned *mipmap_size)
 {
-	unsigned offset, i, level;
+	unsigned offset, i;
 	unsigned width, height, depth, size;
 	unsigned blocksize;
 	unsigned nbx, nby;
@@ -1420,7 +1420,7 @@ static void r600_texture_size(unsigned nfaces, unsigned blevel, unsigned llevel,
 	w0 = r600_mip_minify(w0, 0);
 	h0 = r600_mip_minify(h0, 0);
 	d0 = r600_mip_minify(d0, 0);
-	for(i = 0, offset = 0, level = blevel; i < nlevels; i++, level++) {
+	for (i = 0, offset = 0; i < nlevels; i++) {
 		width = r600_mip_minify(w0, i);
 		nbx = r600_fmt_get_nblocksx(format, width);
 
-- 
2.50.1


