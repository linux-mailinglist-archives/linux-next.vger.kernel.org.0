Return-Path: <linux-next+bounces-291-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9211C809D23
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 08:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AB351F20F73
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 07:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8E0101DB;
	Fri,  8 Dec 2023 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fYhFeLOV"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 679B219A8
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702020675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ikUZzEB5I5Nehs7sVU1WeIaxCZi2Fx3EHlR7/8OM9/M=;
	b=fYhFeLOVpP08CbHiMdVvcAnu2D8SQdkJw8TnBBvR8Hzovr/w1wAaZyw7I5iQ/vZQ93hPpa
	Nk19jFVPWZqw91usNC5womlbhITPGBYujhInflXeINMflWpd2RglEyS+gl3CfTDkOCKXlj
	oRCWYFJdmh4O2wQy9UJOThQ3wqe5vw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-Kgqun5sNNqKgQtHaeJfxqA-1; Fri, 08 Dec 2023 02:31:10 -0500
X-MC-Unique: Kgqun5sNNqKgQtHaeJfxqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AE9B185A782;
	Fri,  8 Dec 2023 07:31:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3517E8CD0;
	Fri,  8 Dec 2023 07:31:04 +0000 (UTC)
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
Subject: [PATCH 5/5] x86, kexec: fix the wrong ifdeffery CONFIG_KEXEC
Date: Fri,  8 Dec 2023 15:30:36 +0800
Message-ID: <20231208073036.7884-6-bhe@redhat.com>
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

With the current ifdeffery CONFIG_KEXEC, get_cmdline_acpi_rsdp() is only
available when kexec_load interface is taken, while kexec_file_load
interface can't make use of it.

Now change it to CONFIG_KEXEC_CORE.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/x86/boot/compressed/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/acpi.c b/arch/x86/boot/compressed/acpi.c
index 55c98fdd67d2..18d15d1ce87d 100644
--- a/arch/x86/boot/compressed/acpi.c
+++ b/arch/x86/boot/compressed/acpi.c
@@ -178,7 +178,7 @@ static unsigned long get_cmdline_acpi_rsdp(void)
 {
 	unsigned long addr = 0;
 
-#ifdef CONFIG_KEXEC
+#ifdef CONFIG_KEXEC_CORE
 	char val[MAX_ADDR_LEN] = { };
 	int ret;
 
-- 
2.41.0


