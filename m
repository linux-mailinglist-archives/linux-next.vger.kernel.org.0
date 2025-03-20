Return-Path: <linux-next+bounces-5911-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4174A6A770
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 14:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FED11B60D6E
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 13:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14A21CC55;
	Thu, 20 Mar 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B2CDebSS"
X-Original-To: linux-next@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED08623C9
	for <linux-next@vger.kernel.org>; Thu, 20 Mar 2025 13:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742477746; cv=none; b=oITgeK8nqJ+4GJm2qfh33jsQ3xA/Iv1DfPZb2B0GLlWbo3P8TIwAPHyp12jo8e8U94cSjjginD+bqYHLGSt5UWTwvMz/GL2q3ELqTAgIbPFwvfJY7IEp5zjOyjn1v9jHzi6Ddt0Fgz+8E5+s/aE57W7TwAc2vb1f/Yk63T4IZqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742477746; c=relaxed/simple;
	bh=Vc7ZkIzv8oxEJ6+goncNLTFMvXYEeeE5ytAwHO+0mLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+GgyRtzE9Sb+bCub/qrjtZ1Xrxb6Tug2RvjEKhLOjEpMBFunOA0OtmZfMHUZxm5tv7sB0WnpJwzLerK7JiERgyJh5YKDEizhWntXTqUS9EpCnSajllJBpTotFi54kvmGNKez8aeljD522JJ/UverNmwKo+1NfMvXkArL6n1PjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B2CDebSS; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 20 Mar 2025 06:35:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742477733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZwUz6QZstkoXHa6zv2WBNC3kFaN1c29ScZyOwFuwuQ=;
	b=B2CDebSSLH2AF34xHfzkuc/XnnMSxIQwb3jQFJyXO4XUzeGS83OBG24MKkE/3yb/Y97Pr+
	sKnl0AoQmIGtVx2g3chtdV8PXnP4p2IPfe9yt8SngOx0WS5I4vFjqfaTU2R72wn2VNz5L1
	uEXPH6ZozCXMbaA9/K60DGEragrZKjA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <Z9wZm388iYM0Cnrd@linux.dev>
References: <20250320203203.1de92b98@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320203203.1de92b98@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

Hi,

On Thu, Mar 20, 2025 at 08:32:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-arm tree, today's linux-next build (arm64 defconfig)
> failed like this:
> 
> arch/arm64/kernel/cpu_errata.c: In function 'has_impdef_pmuv3':
> arch/arm64/kernel/cpu_errata.c:279:38: error: passing argument 1 of 'is_midr_in_range_list' makes pointer from integer without a cast [-Wint-conversion]
>   279 |         return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_cpus);
>       |                                      ^~~~~~~~~~~~~~~
>       |                                      |
>       |                                      u32 {aka unsigned int}
> arch/arm64/kernel/cpu_errata.c:47:53: note: expected 'const struct midr_range *' but argument is of type 'u32' {aka 'unsigned int'}
>    47 | bool is_midr_in_range_list(struct midr_range const *ranges)
>       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
> arch/arm64/kernel/cpu_errata.c:279:16: error: too many arguments to function 'is_midr_in_range_list'
>   279 |         return is_midr_in_range_list(read_cpuid_id(), impdef_pmuv3_cpus);
>       |                ^~~~~~~~~~~~~~~~~~~~~
> arch/arm64/kernel/cpu_errata.c:47:6: note: declared here
>    47 | bool is_midr_in_range_list(struct midr_range const *ranges)
>       |      ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   1f561ad4b8f5 ("Merge branch 'kvm-arm64/pv-cpuid' into new-next")
> 
> The merge missed fixing up this instance from commit
> 
>   e1231aacb065 ("arm64: Enable IMP DEF PMUv3 traps on Apple M*")
> 
> I have applied the following patch for today (but this should go into
> the kvm-arm tree (perhaps squashed into the above merge).

Thanks Stephen for the fix. Looks like I forgot to push /next when I
pushed out the tag, addressing now.

Thanks,
Oliver

