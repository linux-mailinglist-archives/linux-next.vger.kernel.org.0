Return-Path: <linux-next+bounces-4414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E63999ADED1
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 10:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8E01F2388F
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 08:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5641B3945;
	Thu, 24 Oct 2024 08:14:59 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C81AB52D;
	Thu, 24 Oct 2024 08:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757699; cv=none; b=UDpij/bTdssmEWzxc4UEKltDHJ3Yg+l7kcGHQiIeQf5qXXM9vwCKn68rKizNEF07LdfP+3Mea35F3ocqxhVFgivUTD0SzXM3ccqyJsSitn2GhhuLtpZED91tkgusvynq1yvEAMYUiMDp8EhhUUmSf9f3eawvCudtkX44kM2vcM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757699; c=relaxed/simple;
	bh=J+572+hNotN9pD5TEI1Zm1GKa05ndya82Ufh3wkdgUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCxnDW8Fr5tTVgAOkTkQI0OAwGC4LoxuMxXFYoemGcTAH0GZJvh1zxTqig9L7btb8uPq5YmBxkaNRas1cGAhKbQiGONrD8XSxGlOIoJ/lq78D22WzYqKYoVgKDf5LCaALUmg2wEgZjSZxF3vhBHcN2U6uTuGdGcSxffSXKCnkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C3AC4CEE4;
	Thu, 24 Oct 2024 08:14:56 +0000 (UTC)
Date: Thu, 24 Oct 2024 09:14:53 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with the mm tree
Message-ID: <ZxoB_Zu_KNTuO7sE@arm.com>
References: <20241024103709.082a6950@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024103709.082a6950@canb.auug.org.au>

On Thu, Oct 24, 2024 at 10:37:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the arm64 tree got a conflict in:
> 
>   arch/arm64/mm/pageattr.c
> 
> between commit:
> 
>   040ee4186d6c ("arch: introduce set_direct_map_valid_noflush()")
> 
> from the mm-unstable branch of the mm tree and commit:
> 
>   42be24a4178f ("arm64: Enable memory encrypt for Realms")
> 
> from the arm64 tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks fine. Thanks Stephen.

-- 
Catalin

