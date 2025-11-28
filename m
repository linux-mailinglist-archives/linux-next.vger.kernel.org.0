Return-Path: <linux-next+bounces-9260-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266EC91860
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 10:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A530B349183
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 09:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D7A305E2D;
	Fri, 28 Nov 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZxgzRva"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E72221FB4;
	Fri, 28 Nov 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323609; cv=none; b=nSFGzQ8QVcz9OkvsgcqlgRbJ7a+7rVZAEWfmopuWT2RaecX1gBtawr0nfAbxxR9UcC1YZFgEJo2flz2hfxH7QLhz9HAtOsohZ+agY/GP7hCtvBkaUS7KvKPpeyRRFlW1OQWF0XhmCJRr3joRUU7c+X95n5oEntv4++ci/N/DNHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323609; c=relaxed/simple;
	bh=7Bo8c9Kxi/yBdWYaM0hbjP6TCJ4S/RZCbXjwgZmgfLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtpmWWL5r3pWkElYE5Xohhtkh2FccuYSr6owL7zGuNJj03zWTXb3X193ZbL006RjXUpSqYor+P2v89GOyNmdAasoyeDAxalNf0wNur4VfMX70mUqX0Hnxn0lfQo6Pc/xdd75ZzKtc+SB08iVSDRYShnGonzsEJzj1TRdi7bppwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZxgzRva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E88C4CEF1;
	Fri, 28 Nov 2025 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764323608;
	bh=7Bo8c9Kxi/yBdWYaM0hbjP6TCJ4S/RZCbXjwgZmgfLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZxgzRvawtIQKsKv6qXD1TWOwsn3paA7Z/GWrNpdDDpaW5Wv/6mxlsZMZ09vlIfaT
	 7Flh6XjHJyzANxuzMys+kS3YFKJAPhDu554IGegWmTiaqccBC6Pr1C+wdH9pH10Cd6
	 FmidfpYHcApbv8BgQCgNHXVlVRJE7Y0AQWEL5ObX8g4eD48yZRBGe6Q8nigVPMdBvm
	 80FY6rAYnfVs5nQeiebBUsmaALBfmNnQOhsxM//eAw+acKjz/5r6bt7doMKD7+PdF8
	 vOFm8ZAzqeiEEPfAhl9apAG17C5VHOZX/9QupmKa4vNw6WV0EAin3W1IcjqAcf8u1C
	 ++WFbv7An18SA==
Date: Fri, 28 Nov 2025 10:53:24 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Layton <jlayton@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251128-schalldicht-hergibt-00ebff060878@brauner>
References: <20251117084326.42c935b0@canb.auug.org.au>
 <612b7e64af3872fde837740404888a03a2c7b6a0.camel@kernel.org>
 <20251117131640.16a7a939@canb.auug.org.au>
 <20251128110410.0d89ae08@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251128110410.0d89ae08@canb.auug.org.au>

On Fri, Nov 28, 2025 at 11:04:10AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 17 Nov 2025 13:16:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Sun, 16 Nov 2025 17:23:15 -0500 Jeff Layton <jlayton@kernel.org> wrote:
> > >
> > > Thanks Stephen. This patch should fix it.
> > > 
> > > Christian, you can either fold this into 1602bad16d7d, or I can send it
> > > separately. Let me know which you prefer.
> > > 
> > > Thanks,
> > > 
> > > ----------------8<----------------------
> > > 
> > > vfs: add needed headers for new struct delegation definition
> > > 
> > > The definition of struct delegation uses stdint.h integer types. Add the
> > > necessary headers to ensure that always works.
> > > 
> > > Fixes: 1602bad16d7d ("vfs: expose delegation support to userland")
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  include/uapi/linux/fcntl.h | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > > index 008fac15e573..5e277fd955aa 100644
> > > --- a/include/uapi/linux/fcntl.h
> > > +++ b/include/uapi/linux/fcntl.h
> > > @@ -4,6 +4,11 @@
> > >  
> > >  #include <asm/fcntl.h>
> > >  #include <linux/openat2.h>
> > > +#ifdef __KERNEL__
> > > +#include <linux/types.h>
> > > +#else
> > > +#include <stdint.h>
> > > +#endif
> > >  
> > >  #define F_SETLEASE	(F_LINUX_SPECIFIC_BASE + 0)
> > >  #define F_GETLEASE	(F_LINUX_SPECIFIC_BASE + 1)  
> > 
> > I had to restart linux-next today, so I used the patch instead of
> > the old version of the vfs-brauner tree.
> 
> I am still applying this merge fix patch ... please apply it.

Sorry about this. That mail got completely lost somehow.

