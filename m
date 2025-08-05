Return-Path: <linux-next+bounces-7858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA412B1B4BE
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 15:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E2218A48BB
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 13:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58BB2749F1;
	Tue,  5 Aug 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJtsQ6fn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8872701B1;
	Tue,  5 Aug 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399953; cv=none; b=Rmm1l8P+0Jb1YQHTsvPQKpJLc8IUfOxjVVVJKM/o46xLCzlBFS96eVGro14ZnT3pHSh3yJ234XMdg7Vwpqqu6PgrD2bnSNTBFNrOlTtMh8lOr1NTGiWIZoHLy9OQpWYtUvNHbU2gMjJ3gqykob2DhdOI6IDZ73k3TCYAjbY8ZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399953; c=relaxed/simple;
	bh=NVx/5NSxqy7K0H3uvKUc7n+U2mmfuWH5ZVQs1n0DLhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNez7YpL0simyWpOTzVyw43X2ONtTC55VlGO/L70hX8lAk6/o6YX67FaJrV11s6I0qcbS1kudNsWeNHQVaTElnSBG8ZN0TaKi2CzP1NpMzZ4LaeujliD9JRmNWQjk2H1tFiHH/K3sGYTOzT9corlALyTgXplXfxZaKfpTgtiWAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJtsQ6fn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23316C4CEF0;
	Tue,  5 Aug 2025 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399953;
	bh=NVx/5NSxqy7K0H3uvKUc7n+U2mmfuWH5ZVQs1n0DLhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJtsQ6fnOFXHWK09oDUuy+4r4vicDof0NmWaZ1lT3PSQckgteoSY0mGPbLloT3kr+
	 BqoUFqFnprruHAuXpyE9IVUKbq11vKeF/Sowkf6I5lx2Ndx8wNLmrUJ/VisNhK3aBv
	 hKb712jiJ/V58QInFol5D4bLy6n8HfwkXYj5r8gtvooP1MGARuC9IfBsvM3tU8VXJr
	 /9X5miGAnu86qTurWDXAlUc37VmWzQiq5bU3mC/h3iAYO4d7pUOc4gcDbqieJinFMa
	 YeUobczK88F0lYnVMVZNr5VftuOaLaleY434hCuZdS9djdBd0XqqDbGd9G2JdcCUbZ
	 bhaPQor5CkF+w==
Date: Tue, 5 Aug 2025 14:19:09 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Message-ID: <20250805131909.GM1049189@google.com>
References: <20250724115409.030d0d08@canb.auug.org.au>
 <20250724100314.GW11056@google.com>
 <20250729113548.4ad9ba1c@canb.auug.org.au>
 <20250805133900.336fd3d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805133900.336fd3d9@canb.auug.org.au>

On Tue, 05 Aug 2025, Stephen Rothwell wrote:

> Hi all,
> 
> On Tue, 29 Jul 2025 11:35:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 24 Jul 2025 11:03:14 +0100 Lee Jones <lee@kernel.org> wrote:
> > >
> > > On Thu, 24 Jul 2025, Stephen Rothwell wrote:
> > >   
> > > > After merging the mfd tree, today's linux-next build (arm
> > > > multi_v7_defconfig) produced this warning:
> > > > 
> > > > WARNING: unmet direct dependencies detected for MFD_AT91_USART
> > > >   Depends on [n]: HAS_IOMEM [=y] && (ARCH_MICROCHIP || COMPILE_TEST [=n])
> > > >   Selected by [y]:
> > > >   - SERIAL_ATMEL [=y] && TTY [=y] && HAS_IOMEM [=y] && COMMON_CLK [=y] && (ARCH_AT91 [=y] || ARCH_LAN969X || COMPILE_TEST [=n])
> > > > 
> > > > Probably introduced by commit
> > > > 
> > > >   ef37a1e24857 ("mfd: at91-usart: Make it selectable for ARCH_MICROCHIP")    
> > > 
> > > Thanks Stephen.
> > > 
> > > I have reverted this now.  
> > 
> > I am still (again?) getting this warning ...
> 
> Ping?

Sorry, -ENOPUSH.  Hopefully it's fixed now.

-- 
Lee Jones [李琼斯]

