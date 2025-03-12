Return-Path: <linux-next+bounces-5780-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B5EA5E501
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 21:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB283A75A9
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 20:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527F11EB1A1;
	Wed, 12 Mar 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbzIfjSt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6C1ADC6C;
	Wed, 12 Mar 2025 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741810055; cv=none; b=fCkJ28muIg8r3UgJnfa3PyD6c3wB3LDfmDTZ2ehL0x/opuAUugfvEDTeji3IYALtzILQUKuf4HDkxDP8/uSE00TpXFlk6tUBU8+CFXgnuWOBK8AMoBlYkJqvVVLMt2rEf1m/uSczkpP4CFV6scN111+0zjqBMuBnTVcOozIJMSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741810055; c=relaxed/simple;
	bh=AAj1WohNGpVntpbLCYIMfXYBSA1bw1W1ywTKwXFLj1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLDwYFG0MWouCxGmaJIkEk0gzIzTchM/GEnIikKxUVUPfcZ2qn5a1/lGndv3UwJFAuk+xIMC4BPOKxLQRWdhEzNKeXxFvhlTi2ap3fU8YOxcKsU/APxC1VqWtxLswUwDS1CaUnUf8TXRU5ilUFS0wfNwOE3zt8EzJytaCjw8EuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbzIfjSt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A86C4CEEA;
	Wed, 12 Mar 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741810054;
	bh=AAj1WohNGpVntpbLCYIMfXYBSA1bw1W1ywTKwXFLj1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbzIfjStT03wY2zFOxCagp4rgvx9+Auxn4LoiqSIaeuBOwQ1eNRT+xMk7/4GkP38b
	 KPnpcxlJ8uLNU/lWqtXn8Q6cb0KA6Lgl37ySgRg9l088XzOORDhQTrYTcAEr4WG2UP
	 xKgrFGKLC79EHjDFAcJw5Kepw3SG8evjW7ZSnv9tbRBt/Zgfkxkmg/ydyBS27KtSep
	 CpZGgBxw7j1FXAyAD9nshox8Mgmzw3uaIJIKu7zxgFELSqiPE2XiqqGhcpux1+bEhj
	 D4bniiHaJRjj07LmCVSlpaM028R1YH9Gbfyfyl5Y27R4EfeqUrskTGbvd6reOprZmz
	 6eWJFGSYjmEfg==
Date: Wed, 12 Mar 2025 21:07:30 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Fiona Behrens <me@kloenk.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <Z9Hpggn_HE3uMGCo@cassiopeiae>
References: <20250312220950.28ed9ad7@canb.auug.org.au>
 <2025031235-trailside-unexpired-88c6@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031235-trailside-unexpired-88c6@gregkh>

On Wed, Mar 12, 2025 at 06:20:45PM +0100, Greg KH wrote:
> On Wed, Mar 12, 2025 at 10:09:50PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the driver-core tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > error[E0599]: no method named `readl` found for reference `&Bar<8>` in the current scope
> >   --> drivers/gpu/nova-core/regs.rs:38:18
> >    |
> > 38 |         Self(bar.readl(BOOT0_OFFSET))
> >    |                  ^^^^^
> >    |
> > help: there is a method `read8` with a similar name
> >    |
> > 38 |         Self(bar.read8(BOOT0_OFFSET))
> >    |                  ~~~~~
> > 
> > error: aborting due to 1 previous error
> > 
> > For more information about this error, try `rustc --explain E0599`.
> > 
> > Caused by commit
> > 
> >   354fd6e86fac ("rust: io: rename `io::Io` accessors")
> > 
> > interacting with commit
> > 
> >   54e6baf123fd ("gpu: nova-core: add initial driver stub")
> > 
> > from the drm-nova tree.
> > 
> > I applied the following merge fix patch for today.
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 12 Mar 2025 21:36:48 +1100
> > Subject: [PATCH] fix up for "rust: io: rename `io::Io` accessors"
> > 
> > interacting with "gpu: nova-core: add initial driver stub"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/gpu/nova-core/regs.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> > index 50aefb150b0b..b1a25b86ef17 100644
> > --- a/drivers/gpu/nova-core/regs.rs
> > +++ b/drivers/gpu/nova-core/regs.rs
> > @@ -35,7 +35,7 @@
> >  impl Boot0 {
> >      #[inline]
> >      pub(crate) fn read(bar: &Bar0) -> Self {
> > -        Self(bar.readl(BOOT0_OFFSET))
> > +        Self(bar.read32(BOOT0_OFFSET))
> >      }
> >  
> >      #[inline]
> > -- 
> > 2.45.2
> > 
> 
> Fix looks good to me, thanks!

+1, thanks for fixing it up!

