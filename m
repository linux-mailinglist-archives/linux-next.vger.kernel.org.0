Return-Path: <linux-next+bounces-6130-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC5A7790C
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 12:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A3C16A979
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 10:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0FE1EE008;
	Tue,  1 Apr 2025 10:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cHj5CGqy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3763B9;
	Tue,  1 Apr 2025 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743504323; cv=none; b=fd6wGLVgJr3zaLPkJqlx/G4tY0cQ91a93wG5JrnWpM2CKaSnJTYeEEvBFfOA2a+jXy61dU7G8A39j7rWyguhmeOkYtW3+HWhw3IO2s3dPpS79Oy4Ak1WZsUaPQHN1Yr31/yEZWhD+v/8QhZA+2kh1WQ06mmQ7goqM81ldIy6pQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743504323; c=relaxed/simple;
	bh=adZ9mRpavm1pB0ubmDN+IN+zH2OYxifh+epKKPut1LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QM8v7Bs26lDUHuGuUg2BzhvLB8m409W24hQZ6Y0+RDPgKabwQlYWTlN5RWJxD92tu8wVAECP/AILmB19FVJohu5+ASd46l7w8bOGJ7xPXdLUxYQ9zMw5olhVG04S2y0QUjmiT5DgRr6pHALEyVg3nI4msbnj65QA5PLUcrOfOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cHj5CGqy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0BC0040E0215;
	Tue,  1 Apr 2025 10:45:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fLg6liKhuFDQ; Tue,  1 Apr 2025 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743504311; bh=RRAgkPYoGHRjKzNdm1bx2i45J/dfbIchU3cMFNdnerM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHj5CGqyUdl4tknOqR9W9Hcd2b4SvEaBoapEmRteuSq4blZlptbT8R94WFyyVPe2K
	 rLDewSl+wkVSquxErOe/xT2VU2v34FubSBeQVVXcm+p47/2yIOgP69kUrkHoMJJgnR
	 /vpSILPxx7aLAPZ6NhfYw1/R1hJ7JxLG/diH7A7MSHvPftvEReq0M4EOxaDiwnBGyT
	 dTNApj9fQRPokK6pNlXFqcYOqJuQSbo6kkPyl1wsnbpwsZ/W9186eVbGJO79cFrSnD
	 xFxOlJoA5WaRjI0k4PbFrvrdnNh8x/u4wlS43JDfx5m2ipu2T+aDbrbOZJ40tumDKT
	 veXujTmkLjWwX/fsXLxPuqtdQoaZLYLMxEq1rFrDHVGeEnOf2GmS4qX20LBasa+spI
	 wY600hV1RBRNWx72ybsdN8hns+HuIfgQ54v/hoLQy7tONl81K4YRUFUgsWGpU21WYx
	 /ugvor7jnz+ecAS+kisAR2d6UOXgAci3CmTJqfwBPAV3WA5vYozMoMz5BSFcNt9Go+
	 ByKPxBZoMWA4kWZBM0TVNm1DMqTrl6Du89HhCSMjJ4LmGHDbp4F8BstkEcVZN7gegC
	 3AqHp+Lk5NLYendv/6Zn57x6I9N02VMZyW8Bf3oIR9pM7nw4NKKOEw1xcT9EUCtGDc
	 xKnfu7wo3H16qwss2i5N7MQo=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B6EC040E021E;
	Tue,  1 Apr 2025 10:45:04 +0000 (UTC)
Date: Tue, 1 Apr 2025 12:44:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the edac tree
Message-ID: <20250401104457.GBZ-vDqbrZVOlEzhgf@fat_crate.local>
References: <20250228185102.15842f8b@canb.auug.org.au>
 <20250401153941.517aac17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401153941.517aac17@canb.auug.org.au>

On Tue, Apr 01, 2025 at 03:39:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 28 Feb 2025 18:51:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the edac tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > Documentation/edac/index.rst: WARNING: document isn't included in any toctree
> > 
> > Introduced by commit
> > 
> >   db99ea5f2c03 ("EDAC: Add support for EDAC device features control")
> 
> I am still getting this warning, but that commit is now in Linus' tree :-(

Shiju,

please send this:

https://lore.kernel.org/r/af3e1e183b034ea89ed6582a5382e5c3@huawei.com

as a proper patch.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

