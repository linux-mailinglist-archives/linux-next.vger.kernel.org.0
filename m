Return-Path: <linux-next+bounces-8847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD92C364CC
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 16:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A3CC834EE4E
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9315622D4C3;
	Wed,  5 Nov 2025 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UresLXaL"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2101E9B22;
	Wed,  5 Nov 2025 15:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762355763; cv=none; b=VlRH7e713qb4H2YukRinCandeDeCqTSR0MSWHEil6n0pfP4drjNZt79CGd1KAFPm0sBpSECfYhB3wuaDFdijEISprGlK7V1veUR5jQkfFQ5DKa5CiN61TTP12e9u/qCjGvbDvC6uAfCKarMcNrhoNWNV0FBce+xcepAq1yltL7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762355763; c=relaxed/simple;
	bh=lGKfhSh5+02JS4dVuQ/J2wVv7e845lJQQ2wyuyi9zKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBsL0mQ/Yzwz+qa7TJDVD9LOjgtXRfqdIIpWymfl5T04rp35S2WZLvPAAyK6i4Sfn1A9x/fI2CveopwAJZYckSZsfW7XQr3lIRPJCoRXJwEcHNLYLbZ8tLT5YBp9Dd08j9fFVKNEF7jDDuFQYB/up6eDHyR21R0LL/qXUPQzXe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UresLXaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC6DC4CEFB;
	Wed,  5 Nov 2025 15:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762355763;
	bh=lGKfhSh5+02JS4dVuQ/J2wVv7e845lJQQ2wyuyi9zKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UresLXaLPonMlspRSUqfF87zGQJVx9n52WNjAe5OnQm+fiBG72BJNFe/lbc+9/y+0
	 VKz6D+RsX6MZibrcXdI5CSkMMCfRXpCV8OilwKohEvJovyxVod0K66tiLPdtq0tVb2
	 Eqa2L/geb+esmUY/cDBQ5DZh5JRRuE6KK7aOsB/P7AD386rc+O9W6c0AtSYYOip9Mr
	 dnV72KsXCfHPubm0+VRAyoz3zAttH5k2prVInPZBVvViFYv4GWvnfgQ+3C5zt7kKqK
	 ywyg6Ta0CbfBLfbVrFBXzhCreEJpnKByBiCCmujCHKXIgipNI6PKYOo8L9dwvM6hfZ
	 kTm7pJ5Bu4SNw==
Date: Wed, 5 Nov 2025 15:15:59 +0000
From: Lee Jones <lee@kernel.org>
To: Corey Minyard <corey@minyard.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the mfd-fixes tree
Message-ID: <20251105151559.GI8064@google.com>
References: <20251027080835.04e0a4c2@canb.auug.org.au>
 <20251105094750.GF8064@google.com>
 <aQtEkg6fin70cPVW@mail.minyard.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQtEkg6fin70cPVW@mail.minyard.net>

On Wed, 05 Nov 2025, Corey Minyard wrote:

> On Wed, Nov 05, 2025 at 09:47:50AM +0000, Lee Jones wrote:
> > On Mon, 27 Oct 2025, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > The following commits are also in Linus Torvalds' tree as different
> > > commits (but the same patches):
> > > 
> > >   91a3e1f5453a ("mfd: ls2kbmc: Check for devm_mfd_add_devices() failure")
> > >   fdff3cadeea9 ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> > > 
> > > These are commits
> > > 
> > >   4af66c2bcab0 ("mfd: ls2kbmc: check for devm_mfd_add_devices() failure")
> > >   0892507f4a0b ("mfd: ls2kbmc: Fix an IS_ERR() vs NULL check in probe()")
> > > 
> > > in Linus' tree.
> > 
> > This is because Corey applied patches that they shouldn't have done,
> > despite being expressively requested not to!
> > 
> > https://lore.kernel.org/all/20251009095611.GC8757@google.com/
> 
> I missed this completely, I'm sorry.
> 
> If there's anything I can do to fix this, I will, but I'm not sure what
> is best now.

Just the fact that you have now acknowledged this is enough for me.

However frustrating it may be, no real harm was done.

Thanks for reaching out.

-- 
Lee Jones [李琼斯]

