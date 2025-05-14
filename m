Return-Path: <linux-next+bounces-6769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61220AB65B3
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 10:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229283B85D3
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B60221546;
	Wed, 14 May 2025 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ1h4bDb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE32215056;
	Wed, 14 May 2025 08:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210663; cv=none; b=ooSAf37kbKRLCuTRZVpzDUTaOGY1ax8ZHcamWuZldyVrwGto3711LYWkafYIRAYtZoiAhj5ljXF+BEn+jEZPbC5TYSLYUdgB77uu2bWtUHJEXgsVFNZLS+63ORmId4tgoz2VdR1He6KNzWnEbu8kXR55MrAF8CpLmaamxzaDs5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210663; c=relaxed/simple;
	bh=72OM0jFnfvOiTNtoij/yR761qoWbDdVO5QtkLQdgXFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Db38Ku3ZLH+T57+p/pI+f5vVXBXdaV1YbeOwxYGSdpjka5DgWVAfxBzIGQlZCu+zU24V0whOevDuMUsMk+vMYpMDXVQkMTYRhN1HS9imrmHett4ARHctx7ZtAMRYvjZE8WxIvC0tlSw56LOZR2GtTq6qQoviA7PtmaII0VQ0Uuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ1h4bDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21234C4CEE9;
	Wed, 14 May 2025 08:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210662;
	bh=72OM0jFnfvOiTNtoij/yR761qoWbDdVO5QtkLQdgXFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJ1h4bDbtsgm7lPMX1BGiGMLnYLbDkgv0NhBUeCyRO6sp+hsuezK8+w1OIYjckX/h
	 vGRIfnhaejq4v7VYqiy2HQ17rgMtLY7QnscfEqLfnuXSVbOMeTC9EQXNExgh20lYBC
	 5A4HKlrR6uyTJ72ryVpqCa0O0+Yx66V14G1+S/ieS/N+s4+c6ucmdSAglHWukxFKHB
	 gj4Qu70aju3BPeBjj/asTck1bR8a0hcsjVt8X0zpEGT1qtfmkhBAcG7syH3OSKq512
	 4NyztKtZSYeyURiW229fjS7lmc0DfcBryVm0ZyWjngiqG3Ebr4V0MqpUsbfDRLwWbB
	 Ajpc8hJlm43SQ==
Date: Wed, 14 May 2025 11:17:38 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Shay Drory <shayd@nvidia.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250514081738.GN22843@unreal>
References: <20250514122455.3593b083@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514122455.3593b083@canb.auug.org.au>

On Wed, May 14, 2025 at 12:24:55PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rdma tree got a conflict in:
> 
>   drivers/infiniband/core/umem_odp.c
> 
> between commit:
> 
>   9a0e6f15029e ("RDMA/core: Silence oversized kvmalloc() warning")
> 
> from Linus' tree and commit:
> 
>   1efe8c0670d6 ("RDMA/core: Convert UMEM ODP DMA mapping to caching IOVA and page linkage")
> 
> from the rdma tree.
> 
> I fixed it up (the latter removed the code updated by the former) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks, this is the right resolution.

> 
> -- 
> Cheers,
> Stephen Rothwell



