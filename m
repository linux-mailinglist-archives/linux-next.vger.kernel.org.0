Return-Path: <linux-next+bounces-2882-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5892B4CA
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 12:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876911F2299F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C447515666F;
	Tue,  9 Jul 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRUmGiml"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92A156646;
	Tue,  9 Jul 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519742; cv=none; b=u4Ae6arYR772JU4PZFliwFNEyVIBs7llaF2NZevRZ60VuNCWKbz0qpKrNVSGyM/mMwkXLEgnrSDZV7BPmKQ3yfYdMvfgCCpujDFKowIWvYN+dDgW9EGHU4O6MEEufWnMFswAg4x9IiHS7V9T+fV1HpJrQ/P+SE84AlTJdu+Hb+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519742; c=relaxed/simple;
	bh=XDpoKFhqXQoJW95vCl6uPDkQVNyuFZXS9WQ/ntKdQp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjKdKKWKmaz3rIOxmf5IgzF+yKk5x4OU44zL1/id3Q7XX6IPIACO8EBE05nlz2Rj72Mk+YP9YRzd8X6wD+8d6NJsZQZsftLLOTURqq+ZrDjBa73/mc4KjIx+OlyAKiux4ObEi6Jy5KGQPX/vpkjyNyGXDUiSEfmhM0R+TnUNRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRUmGiml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BFEC4AF0D;
	Tue,  9 Jul 2024 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720519742;
	bh=XDpoKFhqXQoJW95vCl6uPDkQVNyuFZXS9WQ/ntKdQp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRUmGimlv3j2FEidMyMAeQy2B/f3gGKWb9YWh/d/Z5RGrWW9WgbTI/oYktts5hgYD
	 ttn+Eu0O/13l2yCubd67wv/f6hAW0FsfRsHvC779VjsAXzayVG4VLE9LSvzupz0/md
	 GjkpxqZkT6ewmpPUpBkt1WL8fuoY3RW4JUtzqQjGnsSQ1EJ5n4sv32EaYbfF1egHpw
	 RDz0dlEKpRfXQgIn/CsfFXt9o42W0BJKVHsp0mgoe7LKYTAwEsHgi7GZm/nryIRdoN
	 DDCdYCnewoJuAsTqf8jy8t/T59wnEaLGA5lN/tF8a9EfUu61CoeKLF/X3JebrlhGx7
	 Is9zWAK+46pjA==
Date: Tue, 9 Jul 2024 11:08:57 +0100
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joerg Roedel <joro@8bytes.org>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iommu tree
Message-ID: <20240709100857.GC12978@willie-the-truck>
References: <20240709190613.3fd8b7ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709190613.3fd8b7ea@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jul 09, 2024 at 07:06:13PM +1000, Stephen Rothwell wrote:
> Hi all,

Welcome back!

> After merging the iommu tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/userspace-api/index.rst:42: WARNING: toctree contains reference to nonexisting document 'userspace-api/iommu'
> 
> Introduced by commit
> 
>   d926e7c04843 ("docs: iommu: Remove outdated Documentation/userspace-api/iommu.rst")

Cheers, I'll fold the fix into that change.

Will

