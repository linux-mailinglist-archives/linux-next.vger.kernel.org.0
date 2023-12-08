Return-Path: <linux-next+bounces-288-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A39D4809D18
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 08:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD951B20E1A
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 07:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114F0101EB;
	Fri,  8 Dec 2023 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e1p9J7Og"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69171172D
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 23:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702020659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AFTgp6lfPOaLMwFRk/b9GnoxoPZWuc7zSIjL2Vb3cuA=;
	b=e1p9J7OgDE5F6cY0FgxBTI+jYGhHSeBIHVGfXUBIPlANXOahFjtF3AHkwbFyUelHfez1N8
	U2aQzPAfD/0vP4ry/a5vjfhBoZFasDAQh00it1u55nnPw5pzRZG1rjTNe4lftUOCdfzYB2
	NP6V1rjiUUx0DC6g3YZB5qk/l+hVFEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-btMzKor2McqU7VqUp2Z8dg-1; Fri, 08 Dec 2023 02:30:55 -0500
X-MC-Unique: btMzKor2McqU7VqUp2Z8dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CCB4868902;
	Fri,  8 Dec 2023 07:30:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33E808CD0;
	Fri,  8 Dec 2023 07:30:49 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	akpm@linux-foundation.org,
	eric_devolder@yahoo.com,
	sfr@canb.auug.org.au,
	ignat@cloudflare.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 2/5] m68k, kexec: fix the incorrect ifdeffery and build dependency of CONFIG_KEXEC
Date: Fri,  8 Dec 2023 15:30:33 +0800
Message-ID: <20231208073036.7884-3-bhe@redhat.com>
In-Reply-To: <20231208073036.7884-1-bhe@redhat.com>
References: <20231208073036.7884-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

The select of KEXEC for CRASH_DUMP in kernel/Kconfig.kexec will be
dropped, then compiling errors will be triggered if below config
items are set:

===
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_CRASH_DUMP=y
===

Here, change the dependency of buinding machine_kexec.o relocate_kernel.o
and the ifdeffery in asm/kexe.h to CONFIG_KEXEC_CORE.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/m68k/include/asm/kexec.h | 4 ++--
 arch/m68k/kernel/Makefile     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/kexec.h b/arch/m68k/include/asm/kexec.h
index f5a8b2defa4b..3b0b64f0a353 100644
--- a/arch/m68k/include/asm/kexec.h
+++ b/arch/m68k/include/asm/kexec.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_M68K_KEXEC_H
 #define _ASM_M68K_KEXEC_H
 
-#ifdef CONFIG_KEXEC
+#ifdef CONFIG_KEXEC_CORE
 
 /* Maximum physical address we can use pages from */
 #define KEXEC_SOURCE_MEMORY_LIMIT (-1UL)
@@ -25,6 +25,6 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* CONFIG_KEXEC */
+#endif /* CONFIG_KEXEC_CORE */
 
 #endif /* _ASM_M68K_KEXEC_H */
diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
index 01fb69a5095f..f335bf3268a1 100644
--- a/arch/m68k/kernel/Makefile
+++ b/arch/m68k/kernel/Makefile
@@ -25,7 +25,7 @@ obj-$(CONFIG_PCI) += pcibios.o
 
 obj-$(CONFIG_M68K_NONCOHERENT_DMA) += dma.o
 
-obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
+obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o relocate_kernel.o
 obj-$(CONFIG_BOOTINFO_PROC)	+= bootinfo_proc.o
 obj-$(CONFIG_UBOOT)		+= uboot.o
 
-- 
2.41.0


