Return-Path: <linux-next+bounces-4572-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09EC9B8B24
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 07:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2ECE1C20E90
	for <lists+linux-next@lfdr.de>; Fri,  1 Nov 2024 06:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD9B14D70B;
	Fri,  1 Nov 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NEJtvFLd"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B8614B075;
	Fri,  1 Nov 2024 06:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730441835; cv=none; b=pCoePpGI2x2LfZav5mCNQPkZLVGwDwLKUSGHeZ1qwGurYpSkPhwVDx8+WPvMTwZ2/q/envg7MeTdKAahkEfFTCxeteJ/bw2ua9sOtB58GwLQQ2XQHrAUuvgGxaf6aVy+jTE98coKtIv4Xl0QPERQW0sw5494paM3gunSLQd3I2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730441835; c=relaxed/simple;
	bh=yu1cG7CIC2MYC6M3OhZGHOfXf2MsQfyLDHAjoH+rVaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vk9uX7Rd54yE6WpV3PXuXrwnP5DQ/q9mpaKPcdAfMJenHzThjV5bt/PbdJKJRR+MgdxEWmSR71O40tjm1FnOOcrBkUmt0s/KOO/g17dvJcaxmFlnC5pvdq5jZn5MDLE6gadMHR/ets+P79YdV3M7z6XcNMkA0Swgqjb+FadKk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NEJtvFLd; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Wf6WgzYn/n1XTo8KMrM7SRj471QCpaNLgfU5SHhOBVQ=; t=1730441832; x=1730873832;
	 b=NEJtvFLdbC0IDqjyWjFZGwJbOG+DwMXm36CfWnhd4DTobVsv+jhNVp3IgUALSmG4IRDcyTTGpa
	scrXZjIAsWMjuDlMx6A4t9/Tg5u/q0wQ9e9iJQTiyyFeyGgrSWcw3L1niXioiqPUWgEFxt1T8B/2y
	gEV6Xu6iFZqAx35IjczCVkxgBDHlG2clnbDZYTaJYQLbynPG/Ta+nDxugsYQizGz09lOeiBIERAcB
	0Dhtp4g3BqapMfUkI3ag5jly+70FzVPLjsTKQbs04cVws0ydCkvfY3G+bZ/Hm6IbDzQezEVczxBkc
	U8H97M8d9x8GXM0FPbFg1PA+qUvnNkAH8n41Q==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1t6ky2-0007Pg-Vm; Fri, 01 Nov 2024 07:17:07 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] docs: bug-bisect: add a note about bisecting -next
Date: Fri,  1 Nov 2024 07:17:06 +0100
Message-ID: <0b8245f429a3cb162f8f6c0686081700a9c09cc4.1730441728.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1730441832;cf286b9e;
X-HE-SMSGID: 1t6ky2-0007Pg-Vm

Explicitly mention how to bisect -next, as nothing in the kernel tree
currently explains that bisects between -next versions won't work well
and it's better to bisect between mainline and -next.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
v2:
- slightly change patch descption
- make the text more how-toish to better match the rest of the document

v1: https://lore.kernel.org/all/20241022-doc-bisect-next-v1-1-196c0a60d554@kernel.org/
- initial release
---
 Documentation/admin-guide/bug-bisect.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/admin-guide/bug-bisect.rst
index 585630d14581c7..47264c199247e6 100644
--- a/Documentation/admin-guide/bug-bisect.rst
+++ b/Documentation/admin-guide/bug-bisect.rst
@@ -108,6 +108,27 @@ a fully reliable and straight-forward way to reproduce the regression, too.*
 With that the process is complete. Now report the regression as described by
 Documentation/admin-guide/reporting-issues.rst.
 
+Bisecting linux-next
+--------------------
+
+If you face a problem only happening in linux-next, bisect between the
+linux-next branches 'stable' and 'master'. The following commands will start
+the process for a linux-next tree you added as a remote called 'next'::
+
+  git bisect start
+  git bisect good next/stable
+  git bisect bad next/master
+
+The 'stable' branch refers to the state of linux-mainline the current
+linux-next release (found in the 'master' branch) is based on -- the former
+thus should be free of any problems that show up in -next, but not in Linus'
+tree.
+
+This will bisect across a wide range of changes, some of which you might have
+used in earlier linux-next releases without problems. Sadly there is no simple
+way to avoid checking them: bisecting from one linux-next release to a later
+one (say between 'next-20241020' and 'next-20241021') is impossible, as they
+share no common history.
 
 Additional reading material
 ---------------------------

base-commit: 062d98be0e3f6dcf08e40a1101e967b2eb4fb92f
-- 
2.45.0


