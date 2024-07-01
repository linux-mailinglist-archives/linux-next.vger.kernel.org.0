Return-Path: <linux-next+bounces-2745-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC391D89B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B88F280CB7
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1216EB4A;
	Mon,  1 Jul 2024 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EKZSo+uf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A6679E5;
	Mon,  1 Jul 2024 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719817717; cv=none; b=ocygNR+/VNKQgmDHfaoRdtnELOgKTk1LzvTm2c+a274/Xd4jpK4rpJabHf/OIXp00NSr6kT5zyAayf/V+GFz5//wSUOIWoEJ3E+eJ7EvONwjoMLQWy4EDpgXsvvS7hCwGMIoV20QCp3D0Kmje0MGTPKhPRTtt2lHAirFd377KcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719817717; c=relaxed/simple;
	bh=sGfqKARExD4qG9YamTca/kG+4jOu6xK+Q9ajSl11gL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LorhauZXpeRN2gGi3c+Tppu73GDTqYhuC1/3Mm6n48H4YCuJQAVtH/zlYjG0wijAPg6aCSsaNgeV2v+lpmKLnMpM3QttBpLU+LI256Z9FeVYd1PVwdUYn1v2sVhoCovfYs2A+bDHWonCCQn2ElZwkPVX9mAwUb2I4Q28h9zYi5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EKZSo+uf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D331BC32781;
	Mon,  1 Jul 2024 07:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719817717;
	bh=sGfqKARExD4qG9YamTca/kG+4jOu6xK+Q9ajSl11gL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EKZSo+ufCYJ8YwxdpuXQGw2SKjMI0fXRS0y6XHBc2sCvdRCCtnFeA4wB8hYSekeXI
	 hMnS+eIT+tJ6dwRvJOnpPCOn8ylNp6Y8F7/xyAHRhHr1PlYuZ9kni/xtu8wDtNUlSf
	 yPDgHVWlFmzK7Y6Sefo7TwnWDlBVNtXBk4M92VEnPuGt1w5GJDBq2sMVyD+9ON0g4n
	 70eTnvyVhwMG30nPXtQ6MT6aqhEFBAURGQFgUUM1l2U8jxsI/0oSMRlD0ZZrk3T3ac
	 uzPqZaipt73sk/AbfKjPgxx9OIJiKV6X+2locDimeV0Pv7CViCnKTU4gp6dhC/edM8
	 X57ZhZAdEswPg==
Date: Mon, 1 Jul 2024 10:08:32 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mlx5-next tree
Message-ID: <20240701070832.GA13195@unreal>
References: <20240701153601.50d3f442@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701153601.50d3f442@canb.auug.org.au>

On Mon, Jul 01, 2024 at 03:36:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the rdma tree as a different commit
> (but the same patch):
> 
>   78a6cbd5145c ("RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is disabled")
> 
> This is commit
> 
>   0c5275bf75ec ("RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is disabled")
> 
> in the rdma tree.

It is safe to drop the commit from mlx5-next, I dropped it now.

Thanks

> 
> -- 
> Cheers,
> Stephen Rothwell



