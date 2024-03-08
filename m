Return-Path: <linux-next+bounces-1556-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF8875DF2
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 07:25:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD2731F22A68
	for <lists+linux-next@lfdr.de>; Fri,  8 Mar 2024 06:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C18364A1;
	Fri,  8 Mar 2024 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q1bVL8fK"
X-Original-To: linux-next@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110B328B6
	for <linux-next@vger.kernel.org>; Fri,  8 Mar 2024 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709879138; cv=none; b=FCoWSdcKSOQDQWdgwgMCp04MPwm2UqNc+4qNitriCGKDZnGZeKX3CT3/k10qLGjYeUhkbrlgFL3O/LqQhk0r+6/Q+FDvW6kNaMY4NIgzyVFTojmyxe+7XHDCPbVdgGj+CYUG817TPVZmdQVXK62RRQrEyElMs3h/rIWqZ5eRt0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709879138; c=relaxed/simple;
	bh=HdmJvMNipVtYmqeHFV8SOPcO1UFYrEYdggZq6jEDSSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cilz/duVXBFbv8h4QTftCJmjIBzjTjfHS0r86e/gcHjmX538palB+wJ/U+bsFDSFt5Sg+9B37pZyi7EzQgimt/ErEobk+xPkUQWH97ZMlgrpAFjgNFQyusl/CNYd++aMDOuX9q0zmNOYzNEVn0ysXFu7UZ1u41z7NApa5S1WZ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q1bVL8fK; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 8 Mar 2024 06:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709879131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6LcPWhV0VRE4SqZP3qLifpoxs/6/2oiG1JC/g6I/8Tk=;
	b=Q1bVL8fKKMQE7M/8Q29/GHWu9+df9LDbyCkPz6OgqUdLJ2rgcqrwROD/l4tXrE0vLOFBfy
	iPnEd4Uf7P8ZXBGMTW64Ix3KlIMXYqid6qkkkkUtthRTPx4b6CGY/j8tuGQj1kBWJuh6IX
	4c+QW8Jw1in6s+wXz/8JEkbnydEUPRA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Message-ID: <ZeqvVtdca_I6ooYe@linux.dev>
References: <20240308125433.134c0dbe@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308125433.134c0dbe@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Fri, Mar 08, 2024 at 12:54:33PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm-arm tree got a conflict in:
> 
>   arch/arm64/kernel/cpufeature.c
> 
> between commits:
> 
>   203f2b95a882 ("arm64/fpsimd: Support FEAT_FPMR")
>   9cce9c6c2c3b ("arm64: mm: Handle LVA support as a CPU feature")
>   352b0395b505 ("arm64: Enable 52-bit virtual addressing for 4k and 16k granule configs")
>   2aea7b77aabc ("arm64: Use Signed/Unsigned enums for TGRAN{4,16,64} and VARange")
> 
> from the arm64 tree and commit:
> 
>   da9af5071b25 ("arm64: cpufeature: Detect HCR_EL2.NV1 being RES0")
> 
> from the kvm-arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thanks for reporting these Stephen. Fix looks good to me.

Catalin -- I think the conflicts are pretty simple here, but if we
wanted to do something it'd probably be easiest if you pulled my
kvm-arm64/feat_e2h0 branch. Looks like changes are coming from multiple
topic branches in your tree.

No strong opinions either way, but I plan on sending the kvmarm PR
tomorrow.

[*] https://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git/log/?h=kvm-arm64/feat_e2h0

-- 
Thanks,
Oliver

