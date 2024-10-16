Return-Path: <linux-next+bounces-4306-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E89A0B0A
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 15:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F7151C22399
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 13:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41CD2207A1C;
	Wed, 16 Oct 2024 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKzOjaZ3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C51BA89B;
	Wed, 16 Oct 2024 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084169; cv=none; b=XSEKKrZkS829cGJVVTnIYsHGpMGOQI/c5P0UzI4y5VykYhWIPdyRGNBriuQUPYx6P3Ar/VTMpjpvyjXA1Rm+fxVlsWudSn4/DAzU/hOWBDbYts5KZ8cytokWOQkGzq11n2LllM5gETaJ/NNouBSLU0eFbs48Y1zRLx0WguQW+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084169; c=relaxed/simple;
	bh=Al9nE0+OsSxdHUxJ+OlXoh1Jam9W1LSiOISSvKsvHNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gUOZQv0CX38RvLHz+T5js89Yc2yLPxwmqJ49BPhYXwFVde5+IbwCe3kexEG3tfBOJMeSuKvTWpsuM00Kt4Z0kWX2232bOIqmOPcdj3FE8JUllAyaTxEtijvWBjXTwQLR0zFYOHZ/pCRpFLSdL2YquTsLaW4/O4PoHRe6ay8mCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKzOjaZ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9B6C4CEC5;
	Wed, 16 Oct 2024 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729084168;
	bh=Al9nE0+OsSxdHUxJ+OlXoh1Jam9W1LSiOISSvKsvHNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKzOjaZ36FljZ4TGuWkap1w0tdaHDq5LfsbkhTb58nmtsNrl8WpF9EGArtl04ANXq
	 B0fYcqd7DtZb98JmcQDxXDvuwusdlTcTPOKj3ib6rK7nPkbl5f+nRemvIZatwFzkbi
	 wZi5bQN8gVeOhyoadPfXlJ7pPxQRDcSm2hPvCQM+E/Ingg2TxedXR5KYylHHr1Ybjn
	 7017BDwTGqrkq9eJsm0BSeG7a5/+c6D32czWMGc7hECpNtkga47ewWKmLDfslkCkzi
	 JlSYY/4FV4dH/Q8rJoidJm1ferYhi+LZmQGfaR0kuQUvAV/2EeY7zaPQrwJf+yDdBC
	 kYfo3u1T4VCYQ==
Date: Wed, 16 Oct 2024 14:09:24 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the regulator tree
Message-ID: <20241016130924.GB1152434@google.com>
References: <20241016135943.24e1fab0@canb.auug.org.au>
 <20241016075510.GL8348@google.com>
 <4bb56093-5358-4d3b-aba8-f8815d2347a6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bb56093-5358-4d3b-aba8-f8815d2347a6@sirena.org.uk>

On Wed, 16 Oct 2024, Mark Brown wrote:

> On Wed, Oct 16, 2024 at 08:55:10AM +0100, Lee Jones wrote:
> > On Wed, 16 Oct 2024, Stephen Rothwell wrote:
> 
> > > The following commits are also in the mfd tree as different commits
> > > (but the same patches):
> 
> > >   d7a5f27342a8 ("mfd: sec-core: add s2dos05 support")
> > >   ef9690c04f3b ("dt-bindings: mfd: add samsung,s2dos05")
> 
> > And these ones do not follow the style expected by the subsystem.
> 
> > Mark can you please remove these without reverting and further dirtying
> > MFD's history please?  One little rebase isn't going to hurt in the long
> > run. :)
> 
> There's additional stuff on top of them now and I'm not clear that the
> regulator patch would build without the MFD.  I don't understand why you
> said to apply the patches after I'd reviewed the regulator patch,
> usually you insist on waiting until all other subsystems have reviewed
> before applying the MFD cores :(

I said to apply the regulator patch because it looked like it didn't
have any dependencies.  The latter part was my mistake as now I see that
it did have deps.

-- 
Lee Jones [李琼斯]

