Return-Path: <linux-next+bounces-5975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD568A6E160
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 18:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72FF93AD76B
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 17:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6651526AA89;
	Mon, 24 Mar 2025 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOzT9yuW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42C264F82;
	Mon, 24 Mar 2025 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837622; cv=none; b=oDHIJFJn2hh6NBAQW2u72KQAlWeZf3mBUrefHc4scO5LpxOVL+/J1cJkxef50YoD/xgiwk4QU8PQQ7qNtBK8vcVgBEk0b0VkPzJI/XG+SmO7LoR3dQVcf719l7TUO39ThB9YVcytmvdOzGCPHNAUxqv0GYQRoNg2eOnKgoU3QFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837622; c=relaxed/simple;
	bh=7MeuJdMytpkkKD1hPw10bmp+wVpliy/BqC9EreWzUao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ELzp/nu7GqLyExTkARGluLGgEAcYErmZPOXwIyApZhOhV45oaSRZnc7gIX4Dlvn+gGrtb2Y+iwkKMgzPzcbe4y9Ko04f7xzqaJejJ+BwmT5MiZzvXrYPaqisjuNTWiq1/if5RygIVP6M8plfw6Ccu2ukpd4lFAyO8tnBRpnYvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOzT9yuW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03C34C4CEDD;
	Mon, 24 Mar 2025 17:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742837620;
	bh=7MeuJdMytpkkKD1hPw10bmp+wVpliy/BqC9EreWzUao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOzT9yuWix1+5hPa5gfIdnFAUqVoKywzzi3psMj4esjrgrvA2u6wrFF5oM6R0YxNb
	 leVUM7UsU4/V4hhj92i+tdRpmhJuPbkBgcBCzrLCswkzogf4rLqm7BJiVWtjYgZgsV
	 7DdMtc9H2SUloWE5Z5w11vok7ObJFP2Sw6Z6r684QKdsXU/oWnkS4qvvRYp1n8ISEx
	 CSV7KYjWz8GaOYy+KSEtAa63v8NdPkPrfcOk51arfdO6TVyU/CzcP4oCWg8/tjMH2y
	 dkRjDeIyeb0YAgcgVrgagRXe8ObLliMvLS8fOg2vtlLEGhWvzntapg3gEawYRhj2fI
	 xFI71H/neTjlg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] ucs2_string: add module description
Date: Mon, 24 Mar 2025 18:32:32 +0100
Message-Id: <20250324173242.1501003-7-arnd@kernel.org>
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

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/ucs2_string.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/ucs2_string.c b/lib/ucs2_string.c
index 9308bcfb2ad5..dfb4f2358cab 100644
--- a/lib/ucs2_string.c
+++ b/lib/ucs2_string.c
@@ -165,4 +165,5 @@ ucs2_as_utf8(u8 *dest, const ucs2_char_t *src, unsigned long maxlength)
 }
 EXPORT_SYMBOL(ucs2_as_utf8);
 
+MODULE_DESCRIPTION("UCS2 string handling");
 MODULE_LICENSE("GPL v2");
-- 
2.39.5


