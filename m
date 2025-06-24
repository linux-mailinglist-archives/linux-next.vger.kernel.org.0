Return-Path: <linux-next+bounces-7225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CCFAE6362
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 13:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 019C81925F33
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 11:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E8288C23;
	Tue, 24 Jun 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkbIsOIb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE635953;
	Tue, 24 Jun 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763564; cv=none; b=hQG2/0Tlcek0UArf8WPEsdaVlRqWYO4fHiccNl1CEBJS04N9oJwTpIgKtQ7o6hxxRpR2s0TAmNr+mRWwEcM4Toz9X/RbVQ8U0lAheCkEaSnGiHymR5luK4UEl6r+zKsDsHosHmbsa0XhiOVKj9QDKCh+CTHwKu1ny9oegOPt1Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763564; c=relaxed/simple;
	bh=g3CbCB8jLF1TckbG87qfDePxT9szvDcnyqi4HxVYcrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgWIT2Szyaa04THW6XrBYAp/UgGxO6Dc4kMq1ZTrYDomDcmGXyABe/KV/9EaLMMm7ZStTrcy90BkDUTnmFQmFHaKr8D+33eUUcgoYnmsTNAMsJGEk0QXIFmabIbuprI6U7cZoamSQUsoQ+Ea5w8sK7uj7oMkq9Fl7IBGu/U4pFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkbIsOIb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0D8C4CEE3;
	Tue, 24 Jun 2025 11:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750763564;
	bh=g3CbCB8jLF1TckbG87qfDePxT9szvDcnyqi4HxVYcrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fkbIsOIbuazx6+T+H0SVxbZbAD6rOiZrFC4uNhu1CxmMtDIUcCiGAioxHwOIHtb1H
	 i9+pVy9gSKFU6mehmWB2MpesfZCy/wb5xYivls9CZ3ilx0n9WBnQTAEY3A34+e+Exs
	 jMIvwBzSBwgrV4Md31NMAqAJnfLk58cItwq3luZiFGaVZ+4VDmwukhBqjhVFvFggfz
	 Enjq1PvmpGCUiLeOlkN/f7xC1HmAiw8eUUy9nnJNl+S2o7zuwVfggAEy0LTyF0+55G
	 3KNbtHT8dLo8aPFTN7R0LA7fj3SQdNS2x3pwN0sybOGDRa+PUqnGYoO+5v7KDDPClW
	 Fm5RXO43qpCLg==
Date: Tue, 24 Jun 2025 13:12:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <aFqIJ6aN_iqEPGAR@pollux>
References: <20250624173114.3be38990@canb.auug.org.au>
 <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>

On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
> By the way, I also noticed a Clippy warning in `nova-next` (on its
> own, i.e. without merging anything) -- please see below [1].

How do I get this warning to trigger? I did run my usual tests with rustc 1.78
and 1.87.

> [1]
> 
>     error: mutable borrow from immutable input(s)
>        --> rust/kernel/dma.rs:297:78
>         |
>     297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count:
> usize) -> Result<&mut [T]> {

I think the method isn't wrong, it is unsafe and the safety requirement
explicitly covers this part.

However, we should consider changing it anyways.

>         |
>                 ^^^^^^^^
>         |
>     note: immutable borrow here
>        --> rust/kernel/dma.rs:297:32
>         |
>     297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count:
> usize) -> Result<&mut [T]> {
>         |                                ^^^^^
>         = help: for further information visit
> https://rust-lang.github.io/rust-clippy/master/index.html#mut_from_ref
>         = note: `-D clippy::mut-from-ref` implied by `-D warnings`
>         = help: to override `-D warnings` add `#[allow(clippy::mut_from_ref)]`

