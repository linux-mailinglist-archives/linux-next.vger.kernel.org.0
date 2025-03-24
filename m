Return-Path: <linux-next+bounces-5978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51443A6E157
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB8677A782C
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2190F264A8B;
	Mon, 24 Mar 2025 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ub1bqiEE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC58264606;
	Mon, 24 Mar 2025 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837649; cv=none; b=ATCovYIkRfF5lUP34vuK6X7/nqNMJz+9mYbDClWyAlX3wxpmKnI7kInRqv1Hye2A6O7dy8aIErtlHZHcw2NZJbBvOv9EQmaiOxpiUIo/vxcXkOcUDHDcvH32sZUNGkAm6VKZToBPHLQmmzqcK7bKDbqGjpXfWWEpFVfECHFvLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837649; c=relaxed/simple;
	bh=P+YyLdz/Q4o7XHw/EVthVYAiVp695B0DaQNdJuq/L6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+ZATaBaRzJpcrgffrCHiMSZQc/PlUN02jY3Z2v689ZXcprRnR9T2T6Pk+xxmo7C1UUV12vp7YwPRGLWawDZhbb36dKxulkfQvDDNH3pKzbMNTAyI95659TfJzWwX2M+jIeocqDgwiQkH0bR19SimM3toIVt9Ph9fGDAioL3xaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ub1bqiEE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02908C4CEE4;
	Mon, 24 Mar 2025 17:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837648;
	bh=P+YyLdz/Q4o7XHw/EVthVYAiVp695B0DaQNdJuq/L6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ub1bqiEEGqms0sapfE7KOL399pEjcevd5Z2JnNlKNgmSBsZS9QovXFtFqHmQ79ZUn
	 FoApyLw3ITA1UZbdjxFo7893adzHGJRHjsHAl/ns3sNdvnsj6LuFpbL3HVwiM3JJxl
	 wAaBB0YZ3pK4oyYMe1qpheNNJvi+9GQ00X1keG2PXFTvKb6FbDUTsq5RJSYYWlEI3y
	 Qyw3dKRH2Tp2Binc+BadYYG4HzvV8fbvNecgbueBFJqXSK0Z7NOJymG3y7P+XipCk4
	 HUPOn3P58LuuStXlZt5QNm/iTomib63qkrywqCOHWMw7NI7YTH0usPUpNZRVyH2/8M
	 H36ffCIyYBekQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Rae Moar <rmoar@google.com>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	Feng Tang <feng.79.tang@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] kunit: slub: add module description
Date: Mon, 24 Mar 2025 18:32:35 +0100
Message-Id: <20250324173242.1501003-10-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250324173242.1501003-1-arnd@kernel.org>
References: <20250324173242.1501003-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Modules without a description now cause a warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/tests/slub_kunit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/tests/slub_kunit.c b/lib/tests/slub_kunit.c
index d47c472b0520..848b682a2d70 100644
--- a/lib/tests/slub_kunit.c
+++ b/lib/tests/slub_kunit.c
@@ -325,4 +325,5 @@ static struct kunit_suite test_suite = {
 };
 kunit_test_suite(test_suite);
 
+MODULE_DESCRIPTION("Kunit tests for slub allocator");
 MODULE_LICENSE("GPL");
-- 
2.39.5


