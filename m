Return-Path: <linux-next+bounces-9704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E01D3B12E
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 17:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C1DB307F619
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 16:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507EF32A3E7;
	Mon, 19 Jan 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFyXbtEe"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE71329C6A;
	Mon, 19 Jan 2026 16:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839963; cv=none; b=ceImaPkjuYiBFGau3S2IHRc91hvHdyEqEPWluosSEqaH7a0vizFJOwkomUNqEJiUFkxh0IgXY8scrnH2CQjD4TI2GFpFzaLfA/35n3R4DvW8gC/6xqCVvEcEoAkf/ojpUpWAUmvj7ewiksGc4aHk4Gdrq1lq/YnUr50A71RZWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839963; c=relaxed/simple;
	bh=oF0vpAGpCDKrfPW3ptJj8fQpppxK7jBNqeAmEPlgunE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/xuJIxvaQOImdhrdqoVFXAg50D10Utv8fXv2LalvGXs8+ZQp2fWHseqjpM4hVsmfag4Ux2Ho18Ud3caYHlG/WX9SBW49gT22bSiIds4AtBKOu31u/q9JFMh6+ZRXwTXO4mTWKsWeUKWw1opUT9Unugr61I0Ats1VIYZnhTQHCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFyXbtEe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A35AC116C6;
	Mon, 19 Jan 2026 16:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839962;
	bh=oF0vpAGpCDKrfPW3ptJj8fQpppxK7jBNqeAmEPlgunE=;
	h=Date:From:To:Cc:Subject:From;
	b=mFyXbtEelM1njzp1DpQcsMh2vIt/+Pup3rYIH81WbGyfijq0WHvbnexgUt4a7KKFr
	 VXeohgZaetihbTMGd0LLpmyMK9lg78tYb+WFUAvmRFlxyfRjZ5LobZsuOUEb/b+ppT
	 OEKVDLTwM7XSo1Y+f46e35/6wK3aJfu0NTo1T/+heC8Dr0YOsZ561Z7cPxHyah/5yM
	 g65kpagjaavCmqkQeMaRasCCyW9z6YsNM+JnT6tsECp7TIZz4IDu0cKQ53cwveBjR+
	 Refj3rP0EDUtjKcF8gPpFdt8+KuzSRd+Ipw3EJQ5oNXz64VJ8zm5ZdZRGo7AXV0Qcy
	 8o0Jzww+6OFWg==
Date: Mon, 19 Jan 2026 16:25:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Konstantin Taranov <kotaranov@microsoft.com>,
	Leon Romanovsky <leon@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with the origin tree
Message-ID: <aW5bFiqwjxpet-Tj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/hw/mana/cq.c

between commit:

  887bfe5986396 ("RDMA/mana_ib: check cqe length for kernel CQs")

from the origin tree and commit:

  f972bde7326e9 ("RDMA/mana_ib: Take CQ type from the device type")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/infiniband/hw/mana/cq.c
index 7600412b0739f,2dce1b6771150..0000000000000
--- a/drivers/infiniband/hw/mana/cq.c
+++ b/drivers/infiniband/hw/mana/cq.c
@@@ -55,11 -54,6 +54,10 @@@ int mana_ib_create_cq(struct ib_cq *ibc
  							  ibucontext);
  		doorbell = mana_ucontext->doorbell;
  	} else {
- 		is_rnic_cq = true;
 +		if (attr->cqe > U32_MAX / COMP_ENTRY_SIZE / 2 + 1) {
 +			ibdev_dbg(ibdev, "CQE %d exceeding limit\n", attr->cqe);
 +			return -EINVAL;
 +		}
  		buf_size = MANA_PAGE_ALIGN(roundup_pow_of_two(attr->cqe * COMP_ENTRY_SIZE));
  		cq->cqe = buf_size / COMP_ENTRY_SIZE;
  		err = mana_ib_create_kernel_queue(mdev, buf_size, GDMA_CQ, &cq->queue);

