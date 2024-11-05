Return-Path: <linux-next+bounces-4627-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A82929BCD1F
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 13:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A47D1F21E19
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 12:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11C41D5AAC;
	Tue,  5 Nov 2024 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ODV8cuM+"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C91E485;
	Tue,  5 Nov 2024 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811370; cv=none; b=ENFPux+Bvv7Y54lPfwV159W7LzO8dCFnHwFfD3PMQJSUFFOp6vf8PEKj2pGDXujtgKPnalSp4p3eIwinrfWn0jnQ32HnA3PKag+K66WrY3g9yq0OJpiA/ZlyYTcoGYQq5HTaLWqr3A7dv6HDhUBRXjEcK39f64c1HbqIHw1DET8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811370; c=relaxed/simple;
	bh=w3JMgfuFTvntwMiNKM/54/p0TbGf6IGQEHhRrd75ai0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5C6FPJmoB7SKI/rlNbtfIbAiX2ZfJYU4QNHKc2DPeDPIk8lom0VxIGq/i98x9trckKpi1hCnvkNYa4fxtoXvFnHx/i4Yhje5WKyVna+n4MFD9YtJtPCplGzrQ7wpVx0CbeK7qlfiJEhtFvwfQE2X3p+DdpaZKd/gPyzcMlm2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ODV8cuM+; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lYh6j74LAa+ERZg3LYzldvBM6FUrcS/3jU83qs+jMws=; t=1730811366; x=1731243366;
	 b=ODV8cuM+boYWKKsvAhtCqqHhss4QuR2BYHOzLYwgv1n+a9ANUEmqv+sxADFQRKdRWl2fpRLqoF
	gMNLhElfYxFY9ysbdptRZYCoZQ06YOoTYtY0UYO3g16SnFhz6p56HatLRvMqbMfv2l+p9DBMQRjx9
	NHD8+pZin7gDHoG8MBGNSacv0OFh/B0mPIGSu2YpznJhHFXHYpRLHi+q9dbTrmGQtMpjym6SMitQc
	f5cGgeXx/JPclQMj9rsAvCkEl1jv3gVzfxAeCqE13FZrUF9WO6ciEa6AG0gsV5+pn5OxR0wWsB2UA
	IRgqbrT6l3023S8kCd9W6a1GxUP/rJgAJAp+w==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1t8IOq-0001oY-KB; Tue, 05 Nov 2024 13:11:08 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v3] docs: bug-bisect: add a note about bisecting -next
Date: Tue,  5 Nov 2024 13:11:08 +0100
Message-ID: <ec19d5fc503ff7db3d4c4ff9e97fff24cc78f72a.1730808651.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1730811366;c1366f73;
X-HE-SMSGID: 1t8IOq-0001oY-KB

Explicitly mention how to bisect -next, as nothing in the kernel tree
currently explains that bisects between -next versions won't work well
and it's better to bisect between mainline and -next.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
v3
- add a optional 'that' for readability/understandability

v2:
- slightly change patch descption
- make the text more how-toish to better match the rest of the document

v1: https://lore.kernel.org/all/20241022-doc-bisect-next-v1-1-196c0a60d554@kernel.org/
- initial release
---
 Documentation/admin-guide/bug-bisect.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/admin-guide/bug-bisect.rst
index 585630d14581c7..f4f867cabb1778 100644
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
+The 'stable' branch refers to the state of linux-mainline that the current
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


