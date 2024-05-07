Return-Path: <linux-next+bounces-2207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E028BE88C
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 18:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30D651C21AA9
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 16:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C3F16ABC8;
	Tue,  7 May 2024 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzyCpRuS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443F1635AD;
	Tue,  7 May 2024 16:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715098674; cv=none; b=bi0qLqA4dE7XxUkV8Q/Wel6fQZEvz5M545SGi6VsSRrNYYiELW9h1OXYX3Bj7MEF9L/KtvqT8CR6DCbJTrRlXuDjTmrPGxVg+YySyd7/1HjSeCZmh3EV+s30+0fkrg7jWIrx3OfXtoWjqhy9lkoWGfhLykdb7QTUhXnmcsCxb1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715098674; c=relaxed/simple;
	bh=+EdSyGJvH/21wvtCtdWqpIduQUpmlkNHvWInRhO/rfM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HrsxHnhH3WXOx1vIgr5aHBSu5BVzj/iHIMce25SVUdO170pKQh/J1jvmQsGSv0i165t67JRRqqPqztUyAcVB4kadyUpL8h0PG3yPG3Zqe0i7cqj2H7ezCt9IZ9uhWTwxg0pcFXbrjUYWTr8mO9CWbLF7Lwb9GfYhK3zPMcd3yzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzyCpRuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E230FC2BBFC;
	Tue,  7 May 2024 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715098673;
	bh=+EdSyGJvH/21wvtCtdWqpIduQUpmlkNHvWInRhO/rfM=;
	h=From:To:Cc:Subject:Date:From;
	b=DzyCpRuSW/aH3TOPxd84HNZGAObZKBcn5x5F//oO1euvpIRhnP0WaO52llBFnJNuz
	 OPjNCF5G2gn/nSm7wIj9fNBD9PW+rpNwirCVy0FVfkARGLWZ2vbq8lMAIlRazgjwfB
	 ckLJDeJEsrnjhjM4aFOaAHQ4MdmNgwGB8YuBZ+MZUZLO0lBIqDNkimAJm1HjI0iTTv
	 Ay8d+b8Gpri7hKmkK3QYzsSG8P19Fwirec8qN8GXM+ZYfNBdhwEKPt+vO3MnzJLx8v
	 bk1GFZuDDo8L64XcudNko1z4hZs0/m9UvUX8Rv2LWxTOuTGQ5cTAXAHpqfjLgSFnVW
	 Dd10P6V/FK/yQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jonathan Corbet <corbet@lwn.net>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-next@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH mm-unstable] Docs/mm/damon/design: fix build warning
Date: Tue,  7 May 2024 09:17:47 -0700
Message-Id: <20240507161747.52430-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit b7138c7d40b0 ("Docs/mm/damon/design: use a list for supported
filters") of mm-unstable tree is causing below warning and error with
'make htmldocs'.

    Documentation/mm/damon/design.rst:482: ERROR: Unexpected indentation.
    Documentation/mm/damon/design.rst:483: WARNING: Block quote ends without a blank line; unexpected unindent.

The problem caused by wrong indentation for nested list items.  Fix the
wrong indentation.

Fixes: b7138c7d40b0 ("Docs/mm/damon/design: use a list for supported filters")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/20240507162623.4d94d455@canb.auug.org.au
Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 1873755358af..3df387249937 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -472,21 +472,21 @@ counted as the scheme has tried.  This difference affects the statistics.
 Below types of filters are currently supported.
 
 - anonymous page
-  - Applied to pages that containing data that not stored in files.
-  - Handled by operations set layer.  Supported by only ``paddr`` set.
+    - Applied to pages that containing data that not stored in files.
+    - Handled by operations set layer.  Supported by only ``paddr`` set.
 - memory cgroup
-  - Applied to pages that belonging to a given cgroup.
-  - Handled by operations set layer.  Supported by only ``paddr`` set.
+    - Applied to pages that belonging to a given cgroup.
+    - Handled by operations set layer.  Supported by only ``paddr`` set.
 - young page
-  - Applied to pages that are accessed after the last access check from the
-    scheme.
-  - Handled by operations set layer.  Supported by only ``paddr`` set.
+    - Applied to pages that are accessed after the last access check from the
+      scheme.
+    - Handled by operations set layer.  Supported by only ``paddr`` set.
 - address range
-  - Applied to pages that belonging to a given address range.
-  - Handled by the core logic.
+    - Applied to pages that belonging to a given address range.
+    - Handled by the core logic.
 - DAMON monitoring target
-  - Applied to pages that belonging to a given DAMON monitoring target.
-  - Handled by the core logic.
+    - Applied to pages that belonging to a given DAMON monitoring target.
+    - Handled by the core logic.
 
 
 Application Programming Interface
-- 
2.39.2


