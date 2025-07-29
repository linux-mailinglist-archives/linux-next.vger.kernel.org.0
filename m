Return-Path: <linux-next+bounces-7753-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B20B15275
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 20:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0FE162AE4
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 18:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3B92989A2;
	Tue, 29 Jul 2025 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zaa2WEx6"
X-Original-To: linux-next@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63318BC3D
	for <linux-next@vger.kernel.org>; Tue, 29 Jul 2025 18:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753812329; cv=none; b=cBKKwLsz+QMW+kQvt44szcUYLPOseuXFQrPymUn4IdY3uwI6/DxhdlRYIpYkgI6boCqa8ioVLiAiZOl1bQ/dTe6lQn+IpksgmDb/zd2LcpJlTJ5UCfvOBNqwLRFJDIw4/pAL01tcOOrrQZpMSQlp1BpaDTmued8mWbKafxj/6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753812329; c=relaxed/simple;
	bh=o2uOx/9DDXOjZds4QpTIR1dsdEDrzOwxn7GuDkknRh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBsxUFn3JqH+/UxJu9sgImY4bhrvjoqkZEBMP4b66GRRQ+1u9w2j4oDyTt9gvm8vx2hfr8EJ1IvmH4qkm0fzMVH/Rk7tbTe/awEvL5sxZ8tgC8NKbx1efRTZXQPjcPVYu8rsyU4nrPqbPUOoQDTwJfcgVWgI3UO0e3nPRqVqMug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zaa2WEx6; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 29 Jul 2025 11:05:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753812324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nM4nlhGBKk9TJFfMI5coGlV3H5DaYYv57dOteLwW4qw=;
	b=Zaa2WEx68vTu/qUljq/ttOoZqe7frdFhE0b6g+oUeyo49z5Y+DvcaWqfi50bjpOgIYAttH
	jZBe/ah4scRE0jpZaEYlfEpkGYCioABp1EK7Ak+6coA+MLGq6lp72lk2Xl+HsWU9CMsfjo
	6FCgdv/JwzXMM8OcoYiJjF2loAnFxxA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <aIkNYWAwkA0vf2EQ@linux.dev>
References: <20250729142217.0d4e64cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729142217.0d4e64cd@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 29, 2025 at 02:22:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm-arm tree, today's linux-next build (htmldocs)
> failed like this:
> 
> Using /home/sfr/kernels/next/next/scripts/kernel-doc.pl
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: Documentation/virt/kvm/devices/arm-vgic-v3.rst:128: (SEVERE/4) Unexpected section title or transition.
> 
> =====================
> 
> Caused by commit
> 
>   eed9b1420907 ("Documentation: KVM: arm64: Describe VGICv3 registers writable pre-init")
> 
> I have reverted that commit for today.

Thanks for taking care of this. Paolo has queued the fix after pulling
from kvmarm, should go away tomorrow.

https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?h=next&id=6836e1f30fe90e4c19f6a3749e97ba1e44a840ef

Best,
Oliver

