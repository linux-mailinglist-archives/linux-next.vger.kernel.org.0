Return-Path: <linux-next+bounces-8463-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F030B9897E
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 09:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CDB319C3F6C
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 07:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764C31FDE01;
	Wed, 24 Sep 2025 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcUQfC42"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E0A95E;
	Wed, 24 Sep 2025 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699959; cv=none; b=TMTwOm4Ff4GYJaNtz6j6kPyviVSnF2lBpMPz4AzhXBUWei9RI2f/PIvQPhsC59wwpUOxNhOdb0gxXJrI50aNqFFbjvDHERa8B5+9mn8AfKf9tOjuNBCfLBDL87wc0M0RHbLX5+To5kwudXABZ0qrwvCWb0BSP7ZF8rEtHJIvyZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699959; c=relaxed/simple;
	bh=MBoFvQHgya9enHMqKa+N360Rs/w13Fa4CHQuLloTMJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aw8ha1YtLd0w4YOPhLMA72/np369FkjWqvMELfOy9XRMfTQNmpmZ3eMvq+0RPm2XFK/RuqTmsI3tBlQvwp1j210WwZbNs2mXajlrzovlnHYuMNd+YFJPTH/Vk1dUSq8HU3XTx/C4gsHvdGPvmFZkLaDZXLeHWVS0qO/V7BqIhpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcUQfC42; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4612DC4CEE7;
	Wed, 24 Sep 2025 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758699958;
	bh=MBoFvQHgya9enHMqKa+N360Rs/w13Fa4CHQuLloTMJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcUQfC42MOIEhbPtP8ehL7xdTuRoTR9BsGmgZgiZuLqD+xtybN4djrzOZtpn5FdvN
	 JcQIm5BFqhVQwXS76i3UkKA7/Q1r3pKx4umTVFV3cR03P3NtmKTFVXKaCG4dsiIPuA
	 zKvhUBjNM3M0YO0JF0yCrThSYOV2UDi4CXNfxVIDmIGbGqj1qbIw5Pb76lfRdxGavE
	 Dyn2qWe+xZtpkkL0lK7ZVMwtBkJigbml7KwnHYhfxxtVXfQXThtt4pMJphqiw10e9t
	 e7wOov581jFYENCXIuHdNGxnXnWN3hsve6YQDraFrPZtNt2q2foOMLMqu2rH8Z6rGS
	 GUhP3FX6dwjRg==
Date: Wed, 24 Sep 2025 08:45:54 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Mark Brown <broonie@kernel.org>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <aNOhsvMwLJ4n4_c9@willie-the-truck>
References: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>
 <aNLEem8ryBiqKfDr@willie-the-truck>
 <aNLOiRB_HeUAnFKI@willie-the-truck>
 <d36c9908-f314-414f-99d8-31440696c06b@arm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d36c9908-f314-414f-99d8-31440696c06b@arm.com>

On Wed, Sep 24, 2025 at 08:07:16AM +0530, Anshuman Khandual wrote:
> 
> 
> On 23/09/25 10:14 PM, Will Deacon wrote:
> > On Tue, Sep 23, 2025 at 05:02:02PM +0100, Will Deacon wrote:
> >> On Tue, Sep 23, 2025 at 05:28:05PM +0200, Mark Brown wrote:
> >>> After merging the kvm-arm tree, today's linux-next build (arm64
> >>> defconfig) failed like this:
> >>>
> >>> In file included from <command-line>:
> >>> /tmp/next/build/arch/arm64/kvm/at.c: In function 'setup_s1_walk':
> >>> /tmp/next/build/arch/arm64/kvm/at.c:229:30: error: 'TCR_SH1_MASK' undeclared (first use in this function); did you mean 'TCR_SH0_MASK'?
> >>>   229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
> >>>       |                              ^~~~~~~~~~~~
> >>
> >> [...]
> >>
> >>> Caused by commit
> >>>
> >>>    4f91624778b27 ("arm64/sysreg: Replace TCR_EL1 field macros")
> >>>
> >>> from the arm64 tree.  I have reverted that commit.
> >>
> >> Thanks, I'll drop it from arm64 as well.
> > 
> > (now dropped)
> 
> Hello Will/Mark,
> 
> The conflict happened as the commit c0cc438046ee (“KVM: arm64: Compute shareability for LPA2”)
> which came in via the KVM tree, added a new TCR_SH1_MASK instance. Shall I respin the patches
> accommodating the new changes from KVM or just wait for the next merge window ?

Probably best to wait at this stage. I don't think anybody is depending
on the cleanup for anything but please correct me if I'm wrong.

Will

