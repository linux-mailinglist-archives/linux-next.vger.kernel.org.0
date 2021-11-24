Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 605CD45C76B
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 15:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355720AbhKXOfc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 09:35:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355709AbhKXOf3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 09:35:29 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF90C1A1D66;
        Wed, 24 Nov 2021 05:21:27 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tonyk)
        with ESMTPSA id 1182B1F45A78
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637760086; bh=LoUzXVbB3wCwxf1FW0gK/muFdQnGfNnGszLYYog+/lU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AD0LfFCbtCb0lPtiWFikSc0XLR5Z6wW44k1wjposhAtht5drHk8ffJYsQmH2Q5W6A
         OlROj7cj/qCKWi5Dy1MbzY5H86DsVfJFk7ojLi7Q+lRqMMZTIpXqBvmpSyD8rLL7Wp
         9kPDvyGRVZ0BUAwlZP0CdciKecpFD9161Ofc4WS13JQheyb+2y0tmzSTQuDIUs1XZR
         xhtRWTu111op8oukvWLrydVcD3jHXnt1tVJE86ihwADP8qEbxXmPksbiVuBj1c5F00
         8kQpWRI1dzZ24tdIJDn/KLdriVfjMzI/zPYHgirq4+XjZzqYI8aUe6ZhQqcmUlCDAI
         7rJSFBekuqRXA==
From:   =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To:     linux-kernel@vger.kernel.org, arnd@arndb.de, geert@linux-m68k.org,
        monstr@monstr.eu, mpe@ellerman.id.au, ysato@users.sourceforge.jp,
        dalias@libc.org, davem@davemloft.net, chris@zankel.net,
        jcmvbkbc@gmail.com, linux-alpha@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Cc:     akpm@linux-foundation.org, andrealmeid@collabora.com,
        bigeasy@linutronix.de, boqun.feng@gmail.com,
        linux-next@vger.kernel.org, lkft-triage@lists.linaro.org,
        longman@redhat.com, minchan@kernel.org, mingo@redhat.com,
        naresh.kamboju@linaro.org, peterz@infradead.org, rob@landley.net,
        senozhatsky@chromium.org, sfr@canb.auug.org.au,
        umgwanakikbuti@gmail.com, will@kernel.org
Subject: [PATCH 1/1] futex: Wireup futex_waitv syscall
Date:   Wed, 24 Nov 2021 10:21:12 -0300
Message-Id: <20211124132112.11641-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
References: <CAK8P3a3pQW59NVF=5P+ZiBjNJmnWh+iTZUHvqHBrXkHA6pMd4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Wireup futex_waitv syscall for all remaining archs.

Signed-off-by: André Almeida <andrealmeid@collabora.com>
---
 arch/alpha/kernel/syscalls/syscall.tbl      | 1 +
 arch/ia64/kernel/syscalls/syscall.tbl       | 1 +
 arch/m68k/kernel/syscalls/syscall.tbl       | 1 +
 arch/microblaze/kernel/syscalls/syscall.tbl | 1 +
 arch/powerpc/kernel/syscalls/syscall.tbl    | 1 +
 arch/sh/kernel/syscalls/syscall.tbl         | 1 +
 arch/sparc/kernel/syscalls/syscall.tbl      | 1 +
 arch/xtensa/kernel/syscalls/syscall.tbl     | 1 +
 8 files changed, 8 insertions(+)

diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/syscalls/syscall.tbl
index e4a041cd5715..ca5a32228cd6 100644
--- a/arch/alpha/kernel/syscalls/syscall.tbl
+++ b/arch/alpha/kernel/syscalls/syscall.tbl
@@ -488,3 +488,4 @@
 556	common	landlock_restrict_self		sys_landlock_restrict_self
 # 557 reserved for memfd_secret
 558	common	process_mrelease		sys_process_mrelease
+559	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/ia64/kernel/syscalls/syscall.tbl b/arch/ia64/kernel/syscalls/syscall.tbl
index 6fea1844fb95..707ae121f6d3 100644
--- a/arch/ia64/kernel/syscalls/syscall.tbl
+++ b/arch/ia64/kernel/syscalls/syscall.tbl
@@ -369,3 +369,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/m68k/kernel/syscalls/syscall.tbl b/arch/m68k/kernel/syscalls/syscall.tbl
index 7976dff8f879..45bc32a41b90 100644
--- a/arch/m68k/kernel/syscalls/syscall.tbl
+++ b/arch/m68k/kernel/syscalls/syscall.tbl
@@ -448,3 +448,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/microblaze/kernel/syscalls/syscall.tbl b/arch/microblaze/kernel/syscalls/syscall.tbl
index 6b0e11362bd2..2204bde3ce4a 100644
--- a/arch/microblaze/kernel/syscalls/syscall.tbl
+++ b/arch/microblaze/kernel/syscalls/syscall.tbl
@@ -454,3 +454,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 7bef917cc84e..15109af9d075 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -528,3 +528,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/sh/kernel/syscalls/syscall.tbl b/arch/sh/kernel/syscalls/syscall.tbl
index 208f131659c5..d9539d28bdaa 100644
--- a/arch/sh/kernel/syscalls/syscall.tbl
+++ b/arch/sh/kernel/syscalls/syscall.tbl
@@ -451,3 +451,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/sparc/kernel/syscalls/syscall.tbl b/arch/sparc/kernel/syscalls/syscall.tbl
index c37764dc764d..46adabcb1720 100644
--- a/arch/sparc/kernel/syscalls/syscall.tbl
+++ b/arch/sparc/kernel/syscalls/syscall.tbl
@@ -494,3 +494,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
diff --git a/arch/xtensa/kernel/syscalls/syscall.tbl b/arch/xtensa/kernel/syscalls/syscall.tbl
index 104b327f8ac9..3e3e1a506bed 100644
--- a/arch/xtensa/kernel/syscalls/syscall.tbl
+++ b/arch/xtensa/kernel/syscalls/syscall.tbl
@@ -419,3 +419,4 @@
 446	common	landlock_restrict_self		sys_landlock_restrict_self
 # 447 reserved for memfd_secret
 448	common	process_mrelease		sys_process_mrelease
+449	common  futex_waitv                     sys_futex_waitv
-- 
2.33.1

