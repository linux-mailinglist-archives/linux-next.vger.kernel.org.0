Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8B7016C40C
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 15:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgBYOgq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 09:36:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728981AbgBYOgq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 25 Feb 2020 09:36:46 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3E2E2064A;
        Tue, 25 Feb 2020 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582641406;
        bh=4Z/rPRDF1OAUC8yRceV/KqQY81/AC6Or4/e79DSK8pk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fV9QFyBOfm2hRADqJJrH5U3C0hQ/XIYiX3iaBEkuD2U+JlQEtyqwZNUtIaDu7NacU
         FQ6ubrlBeimWAgr0iwBemQUTL1Kz+kU4plj9HWKV2deAJPrhGSLXwnCpgUStwe0gG6
         vbowaXfgurl6KokgmGUe7Dx14AviXCr+dyursZTA=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency issue
Date:   Tue, 25 Feb 2020 23:36:41 +0900
Message-Id: <158264140162.23842.11237423518607465535.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Since commit d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by
default") also changed the CONFIG_BOOTTIME_TRACING to select
CONFIG_BOOT_CONFIG to show the boot-time tracing on the menu,
it introduced wrong dependencies with BLK_DEV_INITRD as below.

WARNING: unmet direct dependencies detected for BOOT_CONFIG
  Depends on [n]: BLK_DEV_INITRD [=n]
  Selected by [y]:
  - BOOTTIME_TRACING [=y] && TRACING_SUPPORT [=y] && FTRACE [=y] && TRACING [=y]

This makes the CONFIG_BOOT_CONFIG selects CONFIG_BLK_DEV_INITRD to
fix this error and make CONFIG_BOOTTIME_TRACING=n by default, so
that both boot-time tracing and boot configuration off but those
appear on the menu list.

Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 init/Kconfig         |    2 +-
 kernel/trace/Kconfig |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a84e7aa89a29..8b4c3e8c05ea 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1217,7 +1217,7 @@ endif
 
 config BOOT_CONFIG
 	bool "Boot config support"
-	depends on BLK_DEV_INITRD
+	select BLK_DEV_INITRD
 	help
 	  Extra boot config allows system admin to pass a config file as
 	  complemental extension of kernel cmdline when booting.
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 795c3e02d3f1..402eef84c859 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -145,7 +145,6 @@ config BOOTTIME_TRACING
 	bool "Boot-time Tracing support"
 	depends on TRACING
 	select BOOT_CONFIG
-	default y
 	help
 	  Enable developer to setup ftrace subsystem via supplemental
 	  kernel cmdline at boot time for debugging (tracing) driver

