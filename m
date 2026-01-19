Return-Path: <linux-next+bounces-9710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ABAD3B33B
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD34930255AA
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BA12ED87C;
	Mon, 19 Jan 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIHhj2Dr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B862EC558;
	Mon, 19 Jan 2026 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842187; cv=none; b=n/q78jfN3Nb8lifkHqNVcg4/iJrDDSe2z9Kmbee5KiTspNdt9g6FyPaWBKqsGNPyRdzcn1m973PrArMA3paANK2ieZTbTkunOTRTITKeeDJ5OzoVGhjZ5z4R0SA1YmnFFsTB5gI2FOW2Bloa9f6Ws9xY5BC2Zrsb4+7TGFjZJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842187; c=relaxed/simple;
	bh=RX2WundYZWWGCWZSZ+xEthZOafxPMB2DvNlRgS5/ZpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=de6zdFigy030o3Z0b6jC7dh9VBaveqArO9ZUQAQfGvd5qgJP2CiTW9dfHrL6IM9+9N1SjMHI1bn4WWrj2x9tbgdNb5uW9isPxHcQjBtsdng/mboBZrq5zT5Krru3iJ7PsMYPx5uHIhtEVVqmFpg3UJ68qjHHVg6+vXmKgBkL/o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIHhj2Dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0910DC116C6;
	Mon, 19 Jan 2026 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768842187;
	bh=RX2WundYZWWGCWZSZ+xEthZOafxPMB2DvNlRgS5/ZpY=;
	h=Date:From:To:Cc:Subject:From;
	b=kIHhj2DrCAaXI2UGAzOvPFGXtY95I6UQbjAQifqGhMkkEDJaFLT5WVu5/jz67VEo+
	 D82Nn3ZTXWvNB4tc2z3hxJXK3PDwPqoS8lawYlv1Qh9o6RPdj+hJIuObGnetMCXaHb
	 Jn/0XTzSWyZ3Qlr7phs6UvQQOaXr8gqQnrs6xxozq5WStSKO0ry8NSgz92OmGUy1pR
	 2lLWt5s2JztjxdstY+1I8cY6jKPr5Xin4FC9i89/56R9cIXXxPO0LaEL9wdmMezyW+
	 RIJevSlSHfinnqMhBc4Ml0OGgQe+CFI/bdW53w9yVMVCcH81r8rSOGxYcjVcW+q3DE
	 NP+AN8dqt9GUw==
Date: Mon, 19 Jan 2026 17:03:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Philip Yang <Philip.Yang@amd.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aW5jx4EHPBMZVFRV@sirena.org.uk>
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

  drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c

between commit:

  80614c509810f ("drm/amdkfd: fix a memory leak in device_queue_manager_init()")

from the origin tree and commit:

  0cba5b27f1924 ("drm/amdkfd: Add domain parameter to alloc kernel BO")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 625ea8ab7a749,b542de9d50d11..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c

