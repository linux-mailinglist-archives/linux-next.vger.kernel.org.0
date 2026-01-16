Return-Path: <linux-next+bounces-9686-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D80D31410
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82C643069FC9
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CC121D590;
	Fri, 16 Jan 2026 12:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A5ZuAZw6"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA221FF55;
	Fri, 16 Jan 2026 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768567240; cv=none; b=PiqbqrrhFffNNJlCnBiFaX15v9YPfblFxxvTbvPZA7i0asHXlzLA2ptdZ5cwi9mXIKDjb0dBC7Ozk7s5kJIS287I0QW7jw/2/k8ABQ6gxpVxpEqflgoYJJFBPyeH822TggPU0UE9YPlTjKfori7yRr9TUAFwcAthqGZL6UzNQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768567240; c=relaxed/simple;
	bh=aRJ9FrYs/0B10/CkIPYAUjmbhMTQDkGNtVZ2nyRGvIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgq416ZWej29jslFmpk/O6L4o41+hGvUXd7nzEroXGYw7Ot5XquB9OMWNhEdZnTsH1pAu71UeBU11kCM8y1jyJr3MrAEW53oqFcoidcjX/CwSbS/U0iozx6qOQwBcJZDYQmlog6z7VGF022JnOKS5G8lQ/iA8eXPv+OeRU/E0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=A5ZuAZw6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D+hzHLB9VzXQa8KlEl4JYrH7swDPTs4JJyTvBsIAYMc=; b=A5ZuAZw65hH0EhRUVpP+kQ5Dls
	xZzAFafsSxB0u3FX3GfsnUBI5M/mLmBvEHnhx7t95pGg/fTo90TQ9dBxm4+LfN+D/EGdaxgaKB/TB
	HHD++u4DSXAEu9FgXu96X3QC6hP/Pe6FO0K+lQpKluMEyX7FqRpRYmt/JrekoqZD3OWHsNIsMTcXD
	m6KcCTqiinnJP2CpSLJN+MWJkagXphXv+T91a1JCv6MDeggiqMcLP2RdisY5BOUlX5xU97uGJ4BOq
	6JHKcHFCxVQmU5Ed8lr7obKCWI5WaD0q+t2CXqarWKHXJS/uplEgqGyJ5f1At7WMhktOQ0UYj8kcf
	GForkViA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgj7y-00000008i1B-28Cx;
	Fri, 16 Jan 2026 12:40:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 333F53030D6; Fri, 16 Jan 2026 13:40:33 +0100 (CET)
Date: Fri, 16 Jan 2026 13:40:33 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Fixes tag needs work in the tip tree
Message-ID: <20260116124033.GB1890602@noisy.programming.kicks-ass.net>
References: <0fe6b4c2-373f-4b26-a878-6bd686c55d67@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0fe6b4c2-373f-4b26-a878-6bd686c55d67@sirena.org.uk>

On Fri, Jan 16, 2026 at 12:28:34PM +0000, Mark Brown wrote:
> Hi,
>=20
> In commit
>=20
>   69044a0cbfdcc ("x86/uprobes: Fix XOL allocation failure for 32-bit task=
s")
>=20
> Fixes tag
>=20
>   Fixes: 1b028f784e8c ("86/mm: Introduce mmap_compat_base() for 32-bit mm=
ap()")
>=20

Moo.. let me force push that commit again. That's a single character
gone walk-about.

