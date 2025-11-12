Return-Path: <linux-next+bounces-8931-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2B7C51863
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 10:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F00F44F1FEF
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 09:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958802D1F69;
	Wed, 12 Nov 2025 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LQxHEAHy"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F172F90EA;
	Wed, 12 Nov 2025 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940373; cv=none; b=qtMP/Ae7+jiHPxByr6crtvsqtzPsepJ+L7TlHNb5cKHfRJPvSOSHWEBSoQyyw5zBv6s9wtzZ2glg6zwLJLtnonb9dD40Zn+c0hYi9/oBlFphsC5QguxzEgVPFZFhuEdxT3/oZD+lpBMpOF9+VYyTML4gYtT1MoNid3P4OELwrJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940373; c=relaxed/simple;
	bh=NdcMCULEDF8uGxW8z0TbUHQtWvQVgixMLZzYKBOyljM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXdbLTIQWkLPCEIVyMh7QGYiMaCm4rqfPy+7UqzqKMQWhVNWrufLb9A9EOc/tWH9BPyk5/aioXyCTLGa7CC2RBK9PCHbeejFaXTgVaqCayyBGnIiQqfN7opiIpeTcTh08DyUEjfJGGypxrBr8MQNXulREeOtiIIezAFJgZNEVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LQxHEAHy; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tIy77tEeE+yepg4r1YRiEsdwvn605fDjrw5AV/xh1Do=; b=LQxHEAHy8WImPHGL1OqFUpWzdX
	TrHSnY5r5tsJ4SJEMCGOyfGF9FVnUsqWBLumY/WVAksRFqwFs3Ac1jGMqe2h8tLjqep+o4hkcmy2P
	UmNwH1Wy0Y0z3ntsVVYe50Amw+OGPxICCoOg2srm7nmeOY4zzTVJtH/JqIzGLil02jbPhdAyXRkVf
	MdRDQ9dWZwGgbw8zQWj7mZpxTUQcxV1S40/VEcYOVcV1LTkXCZxuC9YskZ8eUZwXqnn28eOvqnAxC
	aQoYsDEMc/NFZwXcOc267Ey1MXUHLCvRodeBGTvBLeHJKO6EvZjw32C5ja9SaNMNGdAPi5pFnKA+z
	nWn5f7ZA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6SP-0000000F4zH-1CIK;
	Wed, 12 Nov 2025 08:44:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 24A4E30023C; Wed, 12 Nov 2025 10:39:28 +0100 (CET)
Date: Wed, 12 Nov 2025 10:39:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251112093928.GD4067720@noisy.programming.kicks-ass.net>
References: <20251112154200.4d3671f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251112154200.4d3671f9@canb.auug.org.au>

On Wed, Nov 12, 2025 at 03:42:00PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (i386 defconfig)
> failed like this:
>=20
> arch/x86/events/intel/ds.c: In function 'intel_pmu_drain_arch_pebs':
> arch/x86/events/intel/ds.c:2983:24: error: cast from pointer to integer o=
f different size [-Werror=3Dpointer-to-int-cast]
>  2983 |         top =3D (void *)((u64)cpuc->pebs_vaddr +
>       |                        ^
> arch/x86/events/intel/ds.c:2983:15: error: cast to pointer from integer o=
f different size [-Werror=3Dint-to-pointer-cast]
>  2983 |         top =3D (void *)((u64)cpuc->pebs_vaddr +
>       |               ^
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   d21954c8a0ff ("perf/x86/intel: Process arch-PEBS records or record frag=
ments")
>=20

It appears you're way faster than the build robots :/

I'll go fix. Thanks!

