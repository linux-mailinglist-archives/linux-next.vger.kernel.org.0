Return-Path: <linux-next+bounces-4145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C7994B07
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 14:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91293B279C9
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 12:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948A8192594;
	Tue,  8 Oct 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibRCVN33"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAA61779B1;
	Tue,  8 Oct 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728391157; cv=none; b=NiZTQkO2lrxbMnevLRK51Ken6rNIZm6eAXrSouu1t+Figw+xBgeiRv7T7fa35DkKQeA+nroLAOjbW4AuixilREUojl3STm+6nq4DnLQ70K8eVx+5lGzERZjKF2e54dEJovNzGV56+cjs86IuhLe3ij8fie1C2kousE7PonMsTbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728391157; c=relaxed/simple;
	bh=IOlk5Z9HmFrq0wpW/h5o9yix3zrmj2xEIwvjv9GRHNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gT0SR3D2xOLvFOA06gLxf9fxtgv9SAn8wVmSJJ4Ywl6CehImpq3B3bOGn9TsLkkpcxgFNwAAiWOfy8+GI1FaOrymBgHxMtEosj4f5IHHV2drcKbjMfJGfY+1rE7gE8zede5Xm4C+XiUDo9cFlzvqrr8IVeVpShEpldDL4fWaUkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibRCVN33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E396BC4CEC7;
	Tue,  8 Oct 2024 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728391157;
	bh=IOlk5Z9HmFrq0wpW/h5o9yix3zrmj2xEIwvjv9GRHNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibRCVN33qFEmPDk3nabJW5md/ygPRjKZbzcof514DeNBetsI5wAy/d/FuB6dP6LwZ
	 6lPTgbXLQipToIM6GGC8+aYnTs0k82adhj8IHrUxWvVfD4Ighl0Q5/V4xcKWPazrXE
	 jwqpqmxBpX3UrrpZLQu3992dWWVJOKQ8mfJvuINaCCgtcA66dwWrc2vghxmuiZv1sh
	 TvYnmRCC7x1aByMI30h+uYWO68uT8mVltUncT01TpNOmAqLR20daTiyOApwsvH+lVA
	 fYfpxKw9TAtqfc6sYjsUJKvLQ5Q+3wFIDRFpkKID2sRTMaH82NJAhgriFo3gEmmr0i
	 GuRLpWzh9KNeg==
Date: Tue, 8 Oct 2024 14:39:13 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the
 rust-fixes tree
Message-ID: <20241008-gastarbeiter-empfehlen-8226a842fbc7@brauner>
References: <20241001102839.77211fb8@canb.auug.org.au>
 <20241008095652.2247c731@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008095652.2247c731@canb.auug.org.au>

On Tue, Oct 08, 2024 at 09:56:52AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 1 Oct 2024 10:28:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the fs-next tree got a conflict in:
> > 
> >   rust/kernel/lib.rs
> > 
> > between commit:
> > 
> >   ece207a83e46 ("rust: kernel: sort Rust modules")
> > 
> > from the rust-fixes tree and commit:
> > 
> >   94d356c0335f ("rust: security: add abstraction for secctx")
> > 
> > from the vfs-brauner tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc rust/kernel/lib.rs
> > index b5f4b3ce6b48,ff7d88022c57..000000000000
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@@ -44,8 -46,9 +46,9 @@@ pub mod net
> >   pub mod page;
> >   pub mod prelude;
> >   pub mod print;
> >  -pub mod sizes;
> >   pub mod rbtree;
> > + pub mod security;
> >  +pub mod sizes;
> >   mod static_assert;
> >   #[doc(hidden)]
> >   pub mod std_vendor;
> 
> This is now a conflict between the vfs-brauner tree and Linus' tree.

I rebased the rust bindings onto v6.12-rc2. So this conflict will go away.

