Return-Path: <linux-next+bounces-5157-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB8A0A90E
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 13:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 793361644DE
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2025 12:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BB01B2191;
	Sun, 12 Jan 2025 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="DFdIXGKt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947311B0F36
	for <linux-next@vger.kernel.org>; Sun, 12 Jan 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736684536; cv=none; b=L8ikdfrVxlqcatJt3l9xfmPsXU8WXPfgNrQEe69RrYwhkVfJ996J3l/ACoJnUumdPg8JPgWSTjhQ1RDwnLjc/DwXgI6aRgDS+wQzakD7ouUjcSDKOkW/mES43NCyT7+SbN+v85J8n1sb4MOVjBbnOBF1jEeeo14KzJEgKEFVyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736684536; c=relaxed/simple;
	bh=NXnqDO/Rr+jfMTT0FDFKZH+0CK3UGDiyNkIWOgBT8cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oiALU6VAav7M7uiE8690TNC+SmCiMyryuyLN2ybH28TzXFR7W+e0NfzolDEv+ACrx5Th47fo4am1oJcWazNthUkaATv/kUI30L/YF9Dnp0rrjOp7yZXXnkySPQ41SpvKOT33N0t7n/W5rBv2FOLuR3mKJUYI0yX4bvVQmID779c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=DFdIXGKt; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DA4B3F689
	for <linux-next@vger.kernel.org>; Sun, 12 Jan 2025 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1736684524;
	bh=F3Sys9DRjY305Dx0vc0wiSDOG8/qiAbi9q3+BQMs3t4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=DFdIXGKto9Xbi7Hp5rjHR5qcgMgh8xyEmcaLmsJw3J8WEMEO96fo4Hcnu3j0VF+7K
	 /QssbNWKhBrH8N57jJWDUrdodlLNW/VcBueCuFvhtWQniPb31dUMfDmGRulhiY6b+v
	 1fXuwy2sD8nhFrX7BXO/1wGGa5fxP6UIvVGX/nkIe9om+ay8pNoolVXGCwyiJT0FQf
	 45GglLy2mwsSsQq8w9d7hL3TKcHoiu+m3q4NQjESSm4ZMmIOEbpiobwcr/IZ0ZwQ4A
	 8gf207SL7InvqzYeJH5R8yb7KLeX6TrU9tN4T7ZhEbMs6CvDe3VuMGQsus5Gdppe89
	 4U0afA1cgBkbg==
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163c2f32fdso93954675ad.2
        for <linux-next@vger.kernel.org>; Sun, 12 Jan 2025 04:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736684521; x=1737289321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3Sys9DRjY305Dx0vc0wiSDOG8/qiAbi9q3+BQMs3t4=;
        b=DLfyKD4slTnONIRuqQjokQR1Wm8ISMJ1Td4W9iuaS/1d3hEe25gahDSZnBpv9iJgwC
         9iiWNDLbfWNiPvfDgeSY0XU5SY5nqkX9xFXTrgV+rgmXqtxH15QuPg7ChyqPwXT3mE/8
         7qjSrgr6b/JVOYhZN3wohVlLfpuk/au2zympn7P83xRjL1xfyKQnEajQqPvBfM9/RJat
         qd8xdzPrUx4zzHjwyVZvPF4s4syQblnXApvK5fnJ4UYt2dvur8PyzgrfTIkQXi/abQX2
         hhfvyC2brS7tgdEDpd5KrfIbV7w4BoGMOGSoPLAC5r8hEdXU/nSR4L8lnsqY88XM4Nze
         CXDg==
X-Gm-Message-State: AOJu0YwTdDZa/hkkOdSOXgHbFSAUd2fbQEFR5qmjyLJWsDVaroq2rDDD
	x/yFpNqfMALR9m8lS/GW0IzCizodZ8bpNV4yG+942C9nEv+GGbWchKTB/I90poAlnAGX3X1ChEy
	ondZyOcByouxdJXqc0hhXGvYZHjmCmD85Od8CCWivjHUQlEeBfAs6U4wLmK0prR6+hzZ8luwHYg
	F9Gd3NsxE=
X-Gm-Gg: ASbGnctsOb8V4P2Bkn5/J2K+4RZ71kDn/R/Rhaqo3QmtsGp+Pj1k14nB58sFRFcACyd
	EQ6DJME9fPvWnoYXoy3ygMPnCHEjXU+ibM+9kGg9OhiQ9Kf+/DckZuUQQAIUykyqo2V5vK08EEn
	z6oobXkAwzuQzpisvCBuZx/rCcGkudlTH+AeGWgI6X+IA57NgdiP6slrao8fxFZ+ZJAaxwVh6oH
	fxOzO6EsiQhrGghKgjLjh5tSoEohhQKiSwtM5Os+uKEU8EOS8NWb47GfQ==
X-Received: by 2002:a17:903:2311:b0:216:4724:2757 with SMTP id d9443c01a7336-21a83f46a3fmr276931395ad.4.1736684521286;
        Sun, 12 Jan 2025 04:22:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVjvCoo99rsTGjbomuyevxYsYbs2BFrDRvkpSrci9LIKhu9hmutUyOof9Pd/O2OvE+y68GJg==
X-Received: by 2002:a17:903:2311:b0:216:4724:2757 with SMTP id d9443c01a7336-21a83f46a3fmr276931205ad.4.1736684520999;
        Sun, 12 Jan 2025 04:22:00 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:2846:8ec3:3898:1a7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f13ae60sm38034325ad.89.2025.01.12.04.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 04:22:00 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-next@vger.kernel.org
Cc: jan.kiszka@siemens.com,
	kbingham@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/gdb/symbols: follow up on refactoring for const struct bin_attribute
Date: Sun, 12 Jan 2025 21:21:49 +0900
Message-ID: <20250112122149.9939-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The work for 'const struct bin_attribute' [1] was merged into linux-next
but did not include updates to the lx-symbols code. So it now fails with
the following error:
Python Exception <class 'gdb.error'>: There is no member named nsections.
Error occurred in Python: There is no member named nsections.

Restore its functionality by aligning it with those changes on
kernel/module/sysfs.c.

[1] https://lore.kernel.org/all/20241227-sysfs-const-bin_attr-module-v2-0-e267275f0f37@weissschuh.net/

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 scripts/gdb/linux/symbols.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/gdb/linux/symbols.py b/scripts/gdb/linux/symbols.py
index f6c1b063775a..8efefd30df49 100644
--- a/scripts/gdb/linux/symbols.py
+++ b/scripts/gdb/linux/symbols.py
@@ -89,16 +89,26 @@ lx-symbols command."""
                 return name
         return None
 
+    def _iter_bin_attrs(self, bin_attrs):
+        while True:
+            try:
+                bin_attr = bin_attrs.dereference()
+            except gdb.MemoryError:
+                break
+            if bin_attr == 0:
+                break
+            yield bin_attr
+            bin_attrs += 1
+
     def _section_arguments(self, module, module_addr):
         try:
             sect_attrs = module['sect_attrs'].dereference()
         except gdb.error:
             return str(module_addr)
 
-        attrs = sect_attrs['attrs']
         section_name_to_address = {
-            attrs[n]['battr']['attr']['name'].string(): attrs[n]['address']
-            for n in range(int(sect_attrs['nsections']))}
+            bin_attr['attr']['name'].string(): bin_attr['private']
+            for bin_attr in self._iter_bin_attrs(sect_attrs['grp']['bin_attrs'])}
 
         textaddr = section_name_to_address.get(".text", module_addr)
         args = []
-- 
2.45.2


