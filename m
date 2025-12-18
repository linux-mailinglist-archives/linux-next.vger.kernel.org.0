Return-Path: <linux-next+bounces-9457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E88CCA485
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 06:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E0F301E90F
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 05:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F15F224B01;
	Thu, 18 Dec 2025 05:09:40 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638281624E9;
	Thu, 18 Dec 2025 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034580; cv=none; b=pYl2wDnVcsubfqR2iP8tbnlp62PgeDzGukr1+3EYRnOVHmvQ3RazMWO+QSpU7t0dxxaf3eJWHfFPC561u77bDrTQceMOifuKKT44Q1BF/nWiWpb+z5VXhsjas/KYAjSh0hd3JG5FEtPYspxh9ZXvlM67XyJG74C79nwUz0gRuj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034580; c=relaxed/simple;
	bh=L7cRCh9XfiweJ1Paw9yyzJ6Nb1yyIuKHaR3qh2dwQB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0CM08UyY3wXp5dfvMGiBuIle3ocHaqaZtsN8jkIEIPSrGw1MgeiWDKf+HJKIc3sOFwxqvrWc7UugnkCCGIxTv1Wo56Us1L7bUPU7Ua7le5vsvVoGaQXUBKVbPt8U+JBRIEesKVcvSDzK8J3+LK5Q+RpDU7j7r2JE9SQrGtjoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1C77667373; Thu, 18 Dec 2025 06:09:27 +0100 (CET)
Date: Thu, 18 Dec 2025 06:09:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
	Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20251218050926.GA1764@lst.de>
References: <20251218080618.2e214d02@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218080618.2e214d02@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Dec 18, 2025 at 08:06:18AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   8dc15b7a6e59 ("xfs: fix XFS_ERRTAG_FORCE_ZERO_RANGE for zoned file system")
> 
> Fixes tag
> 
>   Fixes: ea9989668081 ("xfs: error tag to force zeroing on debug kernels")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 66d78a11479c ("xfs: error tag to force zeroing on debug kernels")

Yes, that's correct.


