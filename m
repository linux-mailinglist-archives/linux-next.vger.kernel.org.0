Return-Path: <linux-next+bounces-9622-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B771D16C08
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 06:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39C343011194
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 05:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D971364050;
	Tue, 13 Jan 2026 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b="YWcG22de"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E03433B3;
	Tue, 13 Jan 2026 05:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768283686; cv=pass; b=Azc+LBq+RAyJxMnYl/Yr1O0ikwyNmy+a+/hHaffG1h5QN09K9BBW/E2awzqEKEyD7EcWwYbr9Gfn2SfQ+Z1E8nUxjKw3JyVzfhCk2jjdZF1Qkfb+IsnYSdZc0xbVWc/dQtlKPUN5+pLtnv5EeZFJVsx+oouoHbqBviqCYJ2ABG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768283686; c=relaxed/simple;
	bh=GriPIkMwEiolukwo/HQUI5brOgWZQuRAMohwDuCqGUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tB03PYgN3C7a6Yf6eBU75QL88OeFaex+8rgq4XFM9Rzee2qJook3qsO95tMZ8oz0MChQngjE7vqA9d3BWhlTieHIm3CH7zHKVmiku/P5iljp6B+kULLZUnzma1ySxrPze69fbth5MaU3QNrGcLxTTUEbg1lZnqDL0XRxDXbnLxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com; spf=pass smtp.mailfrom=laveeshbansal.com; dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b=YWcG22de; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
ARC-Seal: i=1; a=rsa-sha256; t=1768283669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KRlLKJ9bOb1AtmMUb/u6dRcXD8RepGyHzMt5gGqa4pvu6KnKGmf0UJ4TcOd6DOlKDdBH0QT1j+8pNdpJw9Is7f+wRUla2FfkiDKuH9fz3Gk3oN+2CTRXeW5qqrC9fmcnmn8I9E3yChNHu6OrZXZyia6fu+dX233oQV1Jkd8bGpY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768283669; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3BuypCs03Zm3wmsqKYvX7X1od+dzGNjMSqit1lK68qk=; 
	b=UqEjs/19Jl8wCahK/5QbDX5gW3WwKPtNLtXureGPdoJV54yeb75oJ/zH4k1EEZchvA6ZQLx2qsJ+2qfZ+LY4t/WVUClBZILrBikYT3g2IRASvRPuMbM8pNAjF72A4QTUhHfDdirsIMz1mTsopxEPFB/nv7h5zUzYWwMriemhihU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768283669;
	s=zoho; d=laveeshbansal.com; i=laveeshb@laveeshbansal.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3BuypCs03Zm3wmsqKYvX7X1od+dzGNjMSqit1lK68qk=;
	b=YWcG22deZK42lWVqnWh/iuigxKuVT+vKiKkvwU7WF++iSVownjUGdvYlzUPwTpxQ
	Vt7o0Y1ofReEeDbMsVgi1W7D8+m4Lh8QHfFFFPpI5lfB0GdTv/+1Q+d7Nj/zvsFoOTm
	fj76aD1NxWfyq3JNtIFlTSE+VXPEMUpdonNALhoM=
Received: by mx.zohomail.com with SMTPS id 1768283666368192.6753733795232;
	Mon, 12 Jan 2026 21:54:26 -0800 (PST)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Laveesh Bansal <laveeshb@laveeshbansal.com>
Subject: [PATCH] Documentation: hwmon: coretemp: Fix malformed RST table
Date: Tue, 13 Jan 2026 05:54:25 +0000
Message-ID: <20260113055425.966495-1-laveeshb@laveeshbansal.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113155444.57c7775b@canb.auug.org.au>
References: <20260113155444.57c7775b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Widen the processor column in the TjMax table to accommodate longer
entries like "Celeron/Pentium Processors (Goldmont Plus/Gemini Lake)"
which exceed the previous 47-character column width.

Fixes: 099cc1051df7 ("Documentation: hwmon: coretemp: Update supported CPUs and TjMax values")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20260113155444.57c7775b@canb.auug.org.au/
Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>
---
 Documentation/hwmon/coretemp.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 3afb179e0ced..a3943656fab6 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -69,8 +69,8 @@ for your CPU, you can pass the correct TjMax value as a module parameter
 Appendix A. Known TjMax lists (TBD):
 Some information comes from ark.intel.com
 
-=============== =============================================== ================
-Process		Processor					TjMax(C)
+=============== ======================================================= ================
+Process		Processor						TjMax(C)
 
 22nm		Core i5/i7 Processors
 		i7 3920XM, 3820QM, 3720QM, 3667U, 3520M		105
@@ -228,4 +228,4 @@ Process		Processor					TjMax(C)
 65nm		Celeron Processors
 		T1700/1600					100
 		560/550/540/530					100
-=============== =============================================== ================
+=============== ======================================================= ================
-- 
2.43.0


