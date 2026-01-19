Return-Path: <linux-next+bounces-9707-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB796D3B42C
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A63830FD1AE
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED817205E26;
	Mon, 19 Jan 2026 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brK4jAqp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5655B1EB;
	Mon, 19 Jan 2026 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768841634; cv=none; b=WOT+kZe/E0/dczqdkjBlf1yODvHjNkmEC7RQzmULCnsJ4fj+u6+vW8MBJXaLhVHFEtA+QZgy02FTLya1fs5vtOsAUl8wXZJslqKKyFFMb4DhipIPggiDkPBdEIFKb3zljn9wFeP+Mg62R8chIgxcKWJROQeuwC2pyB/9dUU4H0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768841634; c=relaxed/simple;
	bh=AJquatnu3rVRP9y4tSNmcDyNY34vgNG0lveCEyGdIko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l2eHCFA7cT2PC22REeqAeW0MYzCZCVqHvEfxobsOkx68w3Fvu6g8Vx38trWKucKEvQ42B6bcFLA2nnAKhNIlx5z8C1XAg0XVbJB7craE1HKDeO+plOyNYW8lhAzS1A6owXQcyEcpJSrk07Eiu4NErf9WtTjMIRLSxXK0BK4uwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brK4jAqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565F0C19424;
	Mon, 19 Jan 2026 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841634;
	bh=AJquatnu3rVRP9y4tSNmcDyNY34vgNG0lveCEyGdIko=;
	h=Date:From:To:Cc:Subject:From;
	b=brK4jAqpyj3AJrN0R6ZNHcCOTRwupCs2lr+lMY7m1IFdWb/SUfVQ/Ukz9r0pgsNDa
	 d64wNp0npUjfVPh9Twzk3hgsNiDDlCK/R2Qo2XnK43E+WnzXzZf1eM3LdNWM0P1xLD
	 YuBVkSqIDYTuftZpWcTpasr4nen39bS/d37COB1y9Yvf5JX6/zSf+mwQGYKc/pUYx9
	 dpg1FLvGFnqKPEGMZRjmZeLdrPW+3Kc22CuBT+wP13lyZC5KdVw656uQxBzp0UzC/0
	 iILsRA5sxlH+i0O3/LpUvN+5XHHUasXUBDFupHu4PMSniZTUpRYFDLUEpc4Hf2UlpJ
	 9qcUvSsP6EYRg==
Date: Mon, 19 Jan 2026 16:53:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aW5hnvLrtQfjg0nG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_pagemap.c

between commit:

  754c232384386 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use")

from the origin tree and commits:

  75af93b3f5d0a ("drm/pagemap, drm/xe: Support destination migration over interconnect")
  ec265e1f1cfcc ("drm/pagemap: Support source migration over interconnect")
  3902846af36be ("drm/pagemap Fix error paths in drm_pagemap_migrate_to_devmem")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/drm_pagemap.c
index 06c1bd8fc4d17,03ee39a761a41..0000000000000
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c

