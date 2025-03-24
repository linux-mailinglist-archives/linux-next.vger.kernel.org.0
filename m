Return-Path: <linux-next+bounces-5977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAC8A6E170
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D96F2188E546
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D843C26FA53;
	Mon, 24 Mar 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6GzLTNI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D8C264A78;
	Mon, 24 Mar 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837639; cv=none; b=aNGMKz6RNEMl/ECehfaCOlvTTrbQc+ax347ZcMdprRX8BQyFVHNs8XyXU3jfn0IQxnQ2XQOhCGwLcHRBMhkzNYardx/qq9MvSwXvGVpzciRcWilagZOXHai8tqglcKPBuSdSOqh8GmustcpJyKS46QOVCY3mjLl3CXRPSfGIN0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837639; c=relaxed/simple;
	bh=qZnEdwCZKZ8AQzn6+rSgVPFlpL8BLv/YIV+RLqg3vvM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lqg4KUNu5g7QLPuZMtH/qWJfeRZK2XY1XMbcm3xJpAhRe9qVnKgM/BVq9hSeSy328RBKEs/Jd5MFstZmoto35eoTh2opk/ol8agkN9N0diinODDCcy8WVa62Ipt/Sy+bPo/N7s+kPXkcU/VCn5279Sosri2InnyRyTL8Bacvibo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6GzLTNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BEBC4CEDD;
	Mon, 24 Mar 2025 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837639;
	bh=qZnEdwCZKZ8AQzn6+rSgVPFlpL8BLv/YIV+RLqg3vvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6GzLTNIaxPMbH5E6GDTyBAnC08uOyD5NjExiYudiAZHsdI+ELPGDJA174ZVfDsCc
	 tKdng7VcPdgDFJgPWt9R2vrlgntL0aA37sv6dsuxqL9lyuOntH0DZX0efEVl0OOWUE
	 AwyoQBs2dTIheV+7ZqgcYPKC23mEkIaLT/bj3fRrVZTRcrQL+J+/t1TGELv8y/f3VJ
	 veIiR7tleb/2X8UJTJrFFFus8mp9uZKYOlhmpmhMMzugveT8WiRX3RB0UteJEB6E2+
	 Hge1LA9RrqAJ407iuwcMpUTvt3h1auC/nfZNm3eTk+Mvg+6axClif6m7D5Io5bMhGU
	 PGiSuVkock0aQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Marco Elver <elver@google.com>,
	Nihar Chaithanya <niharchaithanya@gmail.com>,
	Jann Horn <jannh@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] mm/kasan: add module decription
Date: Mon, 24 Mar 2025 18:32:34 +0100
Message-Id: <20250324173242.1501003-9-arnd@kernel.org>
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

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/kasan/kasan_test_c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 59d673400085..710684ffe302 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -2130,4 +2130,5 @@ static struct kunit_suite kasan_kunit_test_suite = {
 
 kunit_test_suite(kasan_kunit_test_suite);
 
+MODULE_DESCRIPTION("kunit test case for kasan");
 MODULE_LICENSE("GPL");
-- 
2.39.5


