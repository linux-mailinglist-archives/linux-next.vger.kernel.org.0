Return-Path: <linux-next+bounces-207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51334802A3D
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 03:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B731280C74
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 02:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAE01FD8;
	Mon,  4 Dec 2023 02:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNfwkHR0"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1EAC1
	for <linux-next@vger.kernel.org>; Sun,  3 Dec 2023 18:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701656612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N3oj/lBQzpBpheCv8g6m9tnnqQ9YL5qzNhLYbMSq4hU=;
	b=cNfwkHR0+XBDU/IUmRs+jwHE9RfSRZhKraGI5TysHmugdtusTpPbzWVKh0mjq2YdUTVKNN
	4AnJ/cIM9AC+M4IULB+PNOs3A3JD+xGohrb0eJot0Vgc3/FPJ/G1P/Q+CZLuheMDuCKPNH
	ZZAE8v6V/NhOparR/ax9fCqwmjjEkuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-itdX0an8McWg5ZpBNZWuxQ-1; Sun, 03 Dec 2023 21:23:27 -0500
X-MC-Unique: itdX0an8McWg5ZpBNZWuxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D4C180F82F;
	Mon,  4 Dec 2023 02:23:27 +0000 (UTC)
Received: from localhost (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80B4A2026D6E;
	Mon,  4 Dec 2023 02:23:26 +0000 (UTC)
Date: Mon, 4 Dec 2023 10:23:23 +0800
From: Baoquan He <bhe@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
	ignat@cloudflare.com, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org, eric_devolder@yahoo.com
Subject: [PATCH 2/2] riscv, kexec: fix dependency of two items
Message-ID: <ZW04G/SKnhbE5mnX@MiWiFi-R3L-srv>
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Drop the dependency on MMU from ARCH_SUPPORTS_KEXEC and
ARCH_SUPPORTS_KEXEC_FILE because CONFIG_MMU could be disabled while
people may still want to have KEXEC/KEXEC_FILE functionality.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..24c1799e2ec4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -685,7 +685,7 @@ config RISCV_BOOT_SPINWAIT
 	  If unsure what to do here, say N.
 
 config ARCH_SUPPORTS_KEXEC
-	def_bool MMU
+	def_bool y
 
 config ARCH_SELECTS_KEXEC
 	def_bool y
@@ -693,7 +693,7 @@ config ARCH_SELECTS_KEXEC
 	select HOTPLUG_CPU if SMP
 
 config ARCH_SUPPORTS_KEXEC_FILE
-	def_bool 64BIT && MMU
+	def_bool 64BIT
 
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool y
-- 
2.41.0


