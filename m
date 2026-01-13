Return-Path: <linux-next+bounces-9633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E9D171F0
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 08:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E012E303F0CD
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 07:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A52030F55A;
	Tue, 13 Jan 2026 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b="kL1Wt94g"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EEB30C343;
	Tue, 13 Jan 2026 07:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768290833; cv=pass; b=c0qylyHwepSUPfq7mAjl/Jb1LxWFfzhEaiU5EKvFwrO6fEm2VgaYc+xQ99l3TgXDnVHnjfrss/dwwsSHue5dyfgixfPP1ojLld9JZ73l1DGjHLTPbz/Gn0IXqtvbnIBodn5W+oVWNIJN1Tg0YA3967i8Vd8t9G2mG//q+R5xgLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768290833; c=relaxed/simple;
	bh=3Zpaxu2HZv4d8fwDnd86LpPg04oT/kYAP5QzYC9ImEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=th5mtgiCrlBepTRs+MRgz8aL7p9dJ+kqPXKv+CxfUG2QbrVrsgvAHkMKMdv0jrSVVFyjJZNMzHffb6P8+k6YhrOJB5hIJOUrsfPc1xlLKNH6cHRybGWC3Z1UMGqgTe8sRgq7u4EPuBIeTFbHPqomLdiM62z2LOxJiqnrqJgNns4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com; spf=pass smtp.mailfrom=laveeshbansal.com; dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b=kL1Wt94g; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
ARC-Seal: i=1; a=rsa-sha256; t=1768290806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GRMLN/nhokWlVZjhns0HUC0Zfp58QRRp3RtGCeA0nFMLC3zC/xQPBdHmpMhCUk9K11rG/IAZ4pa8ccrXXRmOSmdYGwGF6aVMiOHYbrJl0PNMXXLFtzPy/cqz1FHwL9pvkbzXNkFVk4pskc2w7DSjZKHEiZUdoiDXSmbP7PQUkEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768290806; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tAixoUQLm/YxDerC//ZHNaRCT6sQVXOg6iwzWAjhbIs=; 
	b=VzV5qWYwHYlHunfmKAxsCMYKzfyN9+E2JMEGKZ+tfwwecdpqHDf3O/X5MI03sz3KIeYwK53lDqsUFAHdVFzeLk9nm8DIzHVo730zcBeZyxBt4/f/DWF0tdH8mHfWPhhhNMYovC3DZ5IKe4JCPIwoGuC/MPJrpC5x7aDS0RZ+Yes=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768290806;
	s=zoho; d=laveeshbansal.com; i=laveeshb@laveeshbansal.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tAixoUQLm/YxDerC//ZHNaRCT6sQVXOg6iwzWAjhbIs=;
	b=kL1Wt94gG4rhKhka3YUkHu1Wal4CEoggIY1HLJ7OM89Gl6M0CVeCkLw19TrD1J78
	6TlR1PaFp+ISSzAS/4KoUO28o5jfbR1hGhVP1HeHRH88jHblgFGHkQPk2MaTpjHUa2s
	15nL1hyq9L4ZAdR5+9OEvo0DxXsMCUdqIt4eDQHA=
Received: by mx.zohomail.com with SMTPS id 1768290804441983.3426350377831;
	Mon, 12 Jan 2026 23:53:24 -0800 (PST)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	rdunlap@infradead.org,
	sfr@canb.auug.org.au,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Laveesh Bansal <laveeshb@laveeshbansal.com>
Subject: [PATCH v2] Documentation: hwmon: coretemp: Fix malformed RST table
Date: Tue, 13 Jan 2026 07:53:22 +0000
Message-ID: <20260113075322.978737-1-laveeshb@laveeshbansal.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Shorten the Celeron/Pentium processor entries in the TjMax table to fit
within the 47-character column width, fixing the RST table parsing error.

The following entries exceeded the column width:
  - "Celeron/Pentium Processors (Goldmont/Apollo Lake)" (49 chars)
  - "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)" (54 chars)
  - "Celeron/Pentium Processors (Tremont/Jasper Lake)" (48 chars)

Drop "Processors" from these entries as this preserves all searchable
technical keywords (Celeron, Pentium, Goldmont, Gemini Lake, etc.) while
"Processors" is implied by the chip names and adds no search value.

Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
---
v2:
  - Shorten text instead of widening columns (widening would require
    adjusting 101 data rows to realign TjMax values)

Tested with:
  - python3 -m docutils Documentation/hwmon/coretemp.rst /dev/null
  - make htmldocs

Open to alternative approaches if anyone has a better solution.
---
 Documentation/hwmon/coretemp.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 3afb179e0ced..3ba44b57d028 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -120,12 +120,12 @@ Process		Processor					TjMax(C)
 		x5-E3940/E3930					105
 		x7-E3950					105
 
-14nm		Celeron/Pentium Processors (Goldmont/Apollo Lake)
+14nm		Celeron/Pentium (Goldmont/Apollo Lake)
 		J3455/J3355					105
 		N3450/N3350					105
 		N4200						105
 
-14nm		Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)
+14nm		Celeron/Pentium (Goldmont Plus/Gemini Lake)
 		J4105/J4005					105
 		N4100/N4000					105
 		N5000						105
@@ -133,7 +133,7 @@ Process		Processor					TjMax(C)
 10nm		Atom Processors (Tremont/Elkhart Lake)
 		x6000E						105
 
-10nm		Celeron/Pentium Processors (Tremont/Jasper Lake)
+10nm		Celeron/Pentium (Tremont/Jasper Lake)
 		N4500/N5100/N6000 series			105
 
 45nm		Xeon Processors 5400 Quad-Core
-- 
2.43.0

