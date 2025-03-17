Return-Path: <linux-next+bounces-5831-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5123A65335
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 15:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF40917748B
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17A4241690;
	Mon, 17 Mar 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lyjx1Bti"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F9824168E;
	Mon, 17 Mar 2025 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221338; cv=none; b=J2XJi0GqnhPh7arV67DqT0YxvgMOEB3JL+j1nhK3AS+dSuuJ2FS5K4nY8p7orIL8LYhAwh9QuX8lacUX7qq2JxL4hjEizla68pLiVM9v0DErDna5keDXZQ3ElOAwd0Heshau62u8nuGRniKDYjzxQ+CEJUfh3HTMB7bjpgX9ZNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221338; c=relaxed/simple;
	bh=OEM5Fxc7NSraJ8ml5LH6qN0QPIHHUpYetShfE0Kt6Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dv9Cq2VjFBX7yocRlENQAIwnShPYA/Zq7nBPweEiLjZdQf3zQRyqUrRjr6KXgDDOgtYtWbcnOwS6pgQCJ7ipwiZsGFAvPPZEyzg71P/J5HNDaEM8qv10tn/AfXxcguB2RaeeiX3cMWrolqwopD+CJnLH/GHwm59vHRFH1N6SuUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lyjx1Bti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E52C4CEE3;
	Mon, 17 Mar 2025 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221338;
	bh=OEM5Fxc7NSraJ8ml5LH6qN0QPIHHUpYetShfE0Kt6Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lyjx1BtiEqap28/rQX2S8xv+6dovGeWywMyB9yPDDFjaDeo1dGTSfMEnptyaV0/9z
	 zP4S4eBsIRTGjGkcf0PHon8T9tQrDPWDt7Cq0Q/IdpjzUEZIPp468Vphq5TqatrG15
	 cqc63au98oHe80niQeLDPDHLEc7v102c7BZdpIc22fGGMW3fKG7j5JkKr6VeuQbnSm
	 g7C8bkG2Uih15MrslB64f5mdYJIRKInuMkC5U+7pm3KdSVKHatIcosxWmmbsC+Nguo
	 2gZdpkfFLhVnNlF4EKjYLRAkRg5qufdxakQHSh8JMbWifDdiit9w5xc5N4mc0v3gww
	 ICKVdr5ObkQAA==
Date: Mon, 17 Mar 2025 14:22:13 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Oliver Upton <oliver.upton@linux.dev>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <20250317142212.GA11776@willie-the-truck>
References: <20250317172102.55f7c4d9@canb.auug.org.au>
 <86zfhjnccx.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfhjnccx.wl-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Mar 17, 2025 at 11:08:30AM +0000, Marc Zyngier wrote:
> Hi Stephen,
> 
> On Mon, 17 Mar 2025 06:21:02 +0000,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Hi all,
> > 
> > Today's linux-next merge of the kvm-arm tree got a conflict in:
> > 
> >   arch/arm64/kvm/hypercalls.c
> > 
> > between commit:
> > 
> >   d2c173acbf93 ("KVM: arm64: expose SMCCC_ARCH_WORKAROUND_4 to guests")
> > 
> > from the arm64 tree and commit:
> > 
> >   c0000e58c74e ("KVM: arm64: Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2")
> > 
> > from the kvm-arm tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> 
> Thanks for resolving all 3 conflicts, which look good to me.
> 
> Oliver, would you consider picking the following arm64 branches:
> 
> - arm64/for-next/leaky-prefetcher

Can you hold fire on this one, please? ^^^

Catalin asked for comments on Friday and I'm not sure I'm happy with it.

https://lore.kernel.org/all/174197730164.734861.6726211221092480832.b4-ty@arm.com/

Will reply there shortly...

Will

