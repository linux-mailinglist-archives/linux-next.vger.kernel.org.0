Return-Path: <linux-next+bounces-8354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025DB7C87D
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 642C4587447
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 11:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8D29B8C7;
	Wed, 17 Sep 2025 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="V+W7oIuk"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D78A284886;
	Wed, 17 Sep 2025 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109587; cv=none; b=HYoukTL6Xw/ZI+UYfE/BByWee5w/pwrmRViM+rBsNUwe0vCRfBflVVvlfJe84JGicGyTLIvfmD2iVCHuiSAc7M5Y0yOYMK9gEGOoeBIab96puQsGoFweJsqXlSRidtOts7ZV0e6p8DWG6qWT9tsYsGmQMA/g5/UnFNHYpObu9SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109587; c=relaxed/simple;
	bh=xY+ktKwP2e5B1nt8sSMoCbVqyTPDTakmVEPIOxSsyyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=shckHHRPfjs71LLOpLFRxY0YadG+GgdPZXIHD53GAYXZeCDhKllJWIYbmYzFoktlwR7NyKDm9PMUNttrn12G6KFGgiXnWTWtJw1tY2I/g2Q4UQj+P1yIuB6mrM2K73xYCg7Iq1H0VViCCDanI1BPUnfCiBE96OmKE9GuTHduRWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=V+W7oIuk; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758109567; x=1758714367; i=spasswolf@web.de;
	bh=OpZy24o/dt268K8SG7wBZOXXk/GwsqFpN5OQgYw7ark=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V+W7oIukrMGfnREK7tgEFXTauR6YJivl0q+Liz+fEet1BDmTyYXP79ZxYv1pyR/y
	 7SzMQLgSStX+EkcG8vcvSXflRFT8E0MURD9xHc/UOlgcKleUIZwb0sCLKKKVyoK0P
	 pw5d+GT5ghVSMqdlermXk/nEZJFgiXLuez0L0MC2zLLImmLpMSDsj7SOFlQbP62Ta
	 QUOcLFacv9RikCpzcXO1Mt5RnQTlOI45xzhiGYG/vsNpO615c07qk2aeQ2YT/ZmiI
	 NkQyLByvepETCkIY87LsQXkXKVtUKt4ZrUxc6cYa2hyD4ZCrvnJRN9EK2zsXQnYIO
	 gAciL0t0/y2O7EUzwA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1N4NDG-1uHMML0qs2-016vSL; Wed, 17 Sep 2025 13:46:07 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Mark Brown <broonie@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH] rust: block: fix merge error
Date: Wed, 17 Sep 2025 13:46:04 +0200
Message-ID: <20250917114605.93028-1-spasswolf@web.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/KoFmqWDSnQZMtDqRR1UbseeNuYuEEaNs5DzPFBQEGDkWAmY7NI
 Jhpv183FSa1aGA6KZ3oQeFsA/lxeaP8j59t8PYT0biYD99VPpiFWgwoGzrnPE2MwAFvZ91/
 QKj2aLQ0fKfgINvpSjaST2LoRojOyUWY4w9Mlhi1KVsPnzZNP3mZitwIwb618iphQkuNgZe
 +7rbAzCJvLhqqfNP1NRpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uV7mZdSZKI8=;+P9JtX/jkf7J52ZB3czlxgPgkMm
 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
 bAi81gFy5xENQJW4pjd

Fix the this compile error:

error: expected one of `,` or `}`, found `;`
  --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`

error: aborting due to 1 previous error

Signed-off-by: Bert Karwatzki <spasswolf@web.de>
=2D--
 rust/kernel/block/mq/gen_disk.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_d=
isk.rs
index 51a239118ead..1ce815c8cdab 100644
=2D-- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -9,7 +9,7 @@
     bindings,
     block::mq::{Operations, TagSet},
     error::{self, from_err_ptr, Result},
-    fmt::{self, Write};
+    fmt::{self, Write},
     prelude::*,
     static_lock_class,
     str::NullTerminatedFormatter,
=2D-=20
2.47.3

linux-next-20250916 failt to compile with CONFIG_RUST=3Dy and
the following error:

error: expected one of `,` or `}`, found `;`
  --> rust/kernel/block/mq/gen_disk.rs:12:23
   |
12 |     fmt::{self, Write};
   |                       ^
   |                       |
   |                       expected one of `,` or `}`
   |                       help: missing `,`

error: aborting due to 1 previous error

make[5]: *** [rust/Makefile:553: rust/kernel.o] Fehler 1

git blame shows commit
6e86e08cdc198 ("Merge branch 'rust-next' of https://github.com/Rust-for-Li=
nux/linux.git")
as introducing the error:

$ git blame rust/kernel/block/mq/gen_disk.rs -L 12,12
6e86e08cdc198 (Mark Brown       2025-09-16 14:30:20 +0100 12)     fmt::{se=
lf, Write};

This patch fixes that.

Bert Karwatzki


