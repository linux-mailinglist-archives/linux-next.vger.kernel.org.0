Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E64F1C1FD0
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 23:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgEAVmo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 17:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgEAVmo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2020 17:42:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F169FC061A0C
        for <linux-next@vger.kernel.org>; Fri,  1 May 2020 14:42:42 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s10so4090089plr.1
        for <linux-next@vger.kernel.org>; Fri, 01 May 2020 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=M2Ic6ijDAIUJ++DLKvrkOIgT8v+NxBiKNWzd47csepc=;
        b=gP803iqaO4QrnYUjJNgpxvaevB//s2kHiZuiKJmN4lv18yp+untdOWKAkxLA0Aixiz
         hVDPkpjCbZdOa0NLOrmxPFqo5jCJBPvlYV+iaVIJrhtT77AMIsKMTUzunQ6Lu7/pnjUW
         oIJ5uQjESQD5VCc1Q+qE3IfOW4IUQUwOwvuzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=M2Ic6ijDAIUJ++DLKvrkOIgT8v+NxBiKNWzd47csepc=;
        b=NmffNuLBOTbR+sBWCmPflfmr23nJ1H/DGp6hdIGj2VAEQcR9Vu+IH4aN8GujvQVNLt
         XrvWtuAGnm5JKXflKGAxwkLJB6e5ftCwaXPKcKZ02hsIETYTmsinxErsfcjI9qNPaGwE
         kDIt7uuVGowCUc98mwbt1ti8tMAAMeHUZpgKg7px0Vmpy0tlOPowA4BoqBkDaM2rbgLX
         lNbcKjvdL5PneMGHxZqgvLDQyO+1oOUgUl4mrwbbvwd8FXSfnF2hHGlnTsW6E7WYevXK
         W4VjtlvYlaZw4UbSvqdVgitHnO1S7ujw630rVd2524b0OLOQ7H9qohrSOjlRJ5mz2PlK
         ab+w==
X-Gm-Message-State: AGi0PuZDPbRvC1zcRtiSx9sWf7KsXlYkWpk4JYTo+X04KcL5ig2PUBJ9
        F4zU0nDEvf3cKlNxrfD9B5jrBw==
X-Google-Smtp-Source: APiQypIbxpFjvJzgHZfRO+fTgiu6bpM1PAgt/j/n4oBoWFuIEh57iOk2wWUXn6q+4D4FeQChYzp3sg==
X-Received: by 2002:a17:902:9306:: with SMTP id bc6mr6348171plb.255.1588369362498;
        Fri, 01 May 2020 14:42:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w69sm3039952pff.168.2020.05.01.14.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:42:41 -0700 (PDT)
Date:   Fri, 1 May 2020 14:42:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ubsan: Disable UBSAN_ALIGNMENT under COMPILE_TEST
Message-ID: <202005011433.C42EA3E2D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

The documentation for UBSAN_ALIGNMENT already mentions that it should
not be used on all*config builds (and for efficient-unaligned-access
architectures), so just refactor the Kconfig to correctly implement this
so randconfigs will stop creating insane images that freak out
objtool under CONFIG_UBSAN_TRAP (due to the false positives producing
functions that never return, etc).

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/linux-next/202004231224.D6B3B650@keescook/
Fixes: 0887a7ebc977 ("ubsan: add trap instrumentation option")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan                                 | 15 ++++++---------
 .../testing/selftests/wireguard/qemu/debug.config |  1 -
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 48469c95d78e..929211039bac 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -60,18 +60,15 @@ config UBSAN_SANITIZE_ALL
 	  Enabling this option will get kernel image size increased
 	  significantly.
 
-config UBSAN_NO_ALIGNMENT
-	bool "Disable checking of pointers alignment"
-	default y if HAVE_EFFICIENT_UNALIGNED_ACCESS
+config UBSAN_ALIGNMENT
+	bool "Enable checks for pointers alignment"
+	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
+	depends on !X86 || !COMPILE_TEST
 	help
-	  This option disables the check of unaligned memory accesses.
-	  This option should be used when building allmodconfig.
-	  Disabling this option on architectures that support unaligned
+	  This option enables the check of unaligned memory accesses.
+	  Enabling this option on architectures that support unaligned
 	  accesses may produce a lot of false positives.
 
-config UBSAN_ALIGNMENT
-	def_bool !UBSAN_NO_ALIGNMENT
-
 config TEST_UBSAN
 	tristate "Module for testing for undefined behavior detection"
 	depends on m
diff --git a/tools/testing/selftests/wireguard/qemu/debug.config b/tools/testing/selftests/wireguard/qemu/debug.config
index 807fa7dc60b8..b50c2085c1ac 100644
--- a/tools/testing/selftests/wireguard/qemu/debug.config
+++ b/tools/testing/selftests/wireguard/qemu/debug.config
@@ -25,7 +25,6 @@ CONFIG_KASAN=y
 CONFIG_KASAN_INLINE=y
 CONFIG_UBSAN=y
 CONFIG_UBSAN_SANITIZE_ALL=y
-CONFIG_UBSAN_NO_ALIGNMENT=y
 CONFIG_UBSAN_NULL=y
 CONFIG_DEBUG_KMEMLEAK=y
 CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=8192
-- 
2.20.1


-- 
Kees Cook
