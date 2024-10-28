Return-Path: <linux-next+bounces-4496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4D9B3797
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 18:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45DE028236E
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 17:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4DB1DEFDC;
	Mon, 28 Oct 2024 17:25:39 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514071DD533;
	Mon, 28 Oct 2024 17:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730136339; cv=none; b=i9GlIku9lEVFsfEGT0EFwtvSNOdF1lem4K4RsxkKJ/ADPateWyb1aAhB1QXeiRLir5i79FL3UVNKrQ9FdHOwvpRlTNq01nLojUfsK+VE9ZHrQDkHkPhy/lqixVhHo3F5TX3R8OPXO0gMyGZXPMKp2XzP7unKJMu9qVT8h7vunrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730136339; c=relaxed/simple;
	bh=iaTWtMHLiTwucLoUe168uEVtDWBELL2YYHxagSN8uDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/rc+orfN4uGVCjaFgsTCvoBNe1m5cdiEUD2VNvIQ5I92P8Enzc6O11KTo7zHsmOwXgtTlLqJKlWwE0hAEtXOl7vDwhFXyB/pEDtl1HPRoPUJLCCL/tFqLV1ggKmILxlOb4fnA+7qpR6+Jy45edHflhCjHeUVV/Qo6okl/rCigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74405C4CEC3;
	Mon, 28 Oct 2024 17:25:36 +0000 (UTC)
Date: Mon, 28 Oct 2024 17:25:34 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <Zx_JDg9e61KKan3H@arm.com>
References: <20241028111058.4419a9ed@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028111058.4419a9ed@canb.auug.org.au>

On Mon, Oct 28, 2024 at 11:10:58AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   include/linux/mm.h
> 
> between commit:
> 
>   e87ec503cf2e ("mm/codetag: uninline and move pgalloc_tag_copy and pgalloc_tag_split")
> 
> from the mm-unstable branch of the mm tree and commit:
> 
>   91e102e79740 ("prctl: arch-agnostic prctl for shadow stack")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This looks fine. Thanks.

-- 
Catalin

