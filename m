Return-Path: <linux-next+bounces-5974-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02881A6E149
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECA63BA0A5
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742A269CF5;
	Mon, 24 Mar 2025 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWJGo6jQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D54A269CEB;
	Mon, 24 Mar 2025 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837615; cv=none; b=AwSxu0qnLtUJnARXJtbolah9kRo4blz4/R6nq2YgggtTZdCjpDHXYRHKT3HGuPcnSxU+xYsIgPXzqjwZS6FxQ2nEgK220vhzGDLHwVVUyqaCtgGjTimrvBuJ3x0/lYoa/B5Llmd7kX+rF3HavJCofQ1x1vsRLuORROWHR2+Dxfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837615; c=relaxed/simple;
	bh=E5bjWT6M9c54YtETeD7qZdedLlkma+kPEtlSiJO6f1A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+ej6HM93H1tEUm+KihXQnLd0inC504ZgvAVubIWo6N8QDvvOJ5OLBu+KR0QVe7/3E6wVjdpqGeQyE24Jo7I/cPAHXawZdZzUMAeTfdAwivJb4i8iGaLQMWrAaXjfznquCIVOK58kwgRxOfuKuZ6avOABcEsSrnUQy78SGHGzJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWJGo6jQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BB2C4CEEF;
	Mon, 24 Mar 2025 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837615;
	bh=E5bjWT6M9c54YtETeD7qZdedLlkma+kPEtlSiJO6f1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tWJGo6jQ1q5L6k+nCSAbJy36Pa1iGUgizbJ9VeI1SkrKq+/2quzjKUObtYxgnPHS3
	 NF5mYFz/Wtb4S3aTVsQsEbLEKoH1MXNBpsAe803bJYdkOcNuDqBNiDehkJQ7cMD+tc
	 8cjE1VNZ8KS+gdqXcUkwhBOOL6asCqO/upb+10eeb5A76HI/F24SajIa87tilRv4/R
	 AGQbrDJmDy+9kM5l6z5H3Jk/IJfRYXOBZmcCAZc8NWWvX5JVwO3f5IOEzOYUQryEvi
	 gTG/ZC4oG0fSwFC5Vt0bwrI/Un4CkD3fxuEyWU1ZYiM/pTMm7OM9Gp+lND0HqtRXI0
	 I4Vt6nE9tkYtw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] zlib: add module description
Date: Mon, 24 Mar 2025 18:32:31 +0100
Message-Id: <20250324173242.1501003-6-arnd@kernel.org>
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

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/zlib_inflate/inflate_syms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/zlib_inflate/inflate_syms.c b/lib/zlib_inflate/inflate_syms.c
index 9720114c0672..b8996d90e8bc 100644
--- a/lib/zlib_inflate/inflate_syms.c
+++ b/lib/zlib_inflate/inflate_syms.c
@@ -18,4 +18,5 @@ EXPORT_SYMBOL(zlib_inflateEnd);
 EXPORT_SYMBOL(zlib_inflateReset);
 EXPORT_SYMBOL(zlib_inflateIncomp); 
 EXPORT_SYMBOL(zlib_inflate_blob);
+MODULE_DESCRIPTION("Data decompression using the deflation algorithm");
 MODULE_LICENSE("GPL");
-- 
2.39.5


