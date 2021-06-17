Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9E53ABCD0
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 21:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhFQTet (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 15:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhFQTes (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 15:34:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 605AB613CB;
        Thu, 17 Jun 2021 19:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623958360;
        bh=mQ0tEd2NLMzySPixpRoh410J9oBbFv98aXRNtPF/8Jo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DNxazl7qJ/VidnCd7Fb4OfZYyjQwEXv1CniMEGm98OpycuCuEEMRc35sEQ/6x3y86
         IxZ+JKPEf1GMtGq+dmCrLUWUOfP7u8xaq+U8XOgFuezAGqCFl4xnDhz1vEOG+XPNG0
         ab1lqYvcSmwrui/1uOV6ls26GbBztpV32mPCd3XqtQXu2ckL+Gt0/X9XgKPw9Zym/K
         dAQLYSrtE67rb43kciFgThhQKxFbgaPI77kmUs9PntXbaG+fIbX1yr5rwRs2X6Y/O5
         h1WBmQ4SLiEv8dTjUBTQVyKFWLYALSHPHceKn7OuOw94EktuZfyUy2k48lkwravk74
         JBcJ/xwCmyrgg==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] scripts/min-tool-version.sh: Raise minimum clang version to 13.0.0 for s390
Date:   Thu, 17 Jun 2021 12:31:40 -0700
Message-Id: <20210617193139.856957-1-nathan@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890
In-Reply-To: <YMtib5hKVyNknZt3@osiris>
References: <YMtib5hKVyNknZt3@osiris>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

clang versions prior to the current development version of 13.0.0 cannot
compile s390 after commit 3abbdfde5a65 ("s390/bitops: use register pair
instead of register asm") and the s390 maintainers do not intend to work
around this in the kernel. Codify this in scripts/min-tool-version.sh
similar to arm64 with GCC 5.1.0 so that there are no reports of broken
builds.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

This should probably go through the s390 tree with Masahiro's ack.

 scripts/min-tool-version.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index d22cf91212b0..319f92104f56 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -30,7 +30,12 @@ icc)
 	echo 16.0.3
 	;;
 llvm)
-	echo 10.0.1
+	# https://lore.kernel.org/r/YMtib5hKVyNknZt3@osiris/
+	if [ "$SRCARCH" = s390 ]; then
+		echo 13.0.0
+	else
+		echo 10.0.1
+	fi
 	;;
 *)
 	echo "$1: unknown tool" >&2

base-commit: 7d9c6b8147bdd76d7eb2cf6f74f84c6918ae0939
-- 
2.32.0.93.g670b81a890

