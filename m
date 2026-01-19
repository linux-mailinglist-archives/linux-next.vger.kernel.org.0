Return-Path: <linux-next+bounces-9721-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8089CD3B6B2
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 20:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D881930123D8
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFA139282A;
	Mon, 19 Jan 2026 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtDmI7H0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2443921F4;
	Mon, 19 Jan 2026 19:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768849527; cv=none; b=Vw7XUmcm0APV2ikzdhFeuJHC+vlrPRd7MVHNS2DNrW7eeqmnffhOfr1UK2k/kngOWkmabiOaPPpBf1uCWl8l8T6vL9A8yLKg+93dfSWHkr8amFa4Y9rkn6QjBsNquTBGxuLFSa8Ydqsj+Jm9nOh7rvf7CGvBGj/s1DAhypUa9ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768849527; c=relaxed/simple;
	bh=1UXo/ckQadGKjEIh+2fot6KVpHFbw83nV/ffKOfR9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwZPUZLtIhx2sTvhk5IWi3IxsK+YwGHrbFKp1flSfuQPFTjoGOlKSM70o5JIq5S0dHIvLSF3hHcJSVANkjCO53gYzNMKyFDu3JKdHUfrIZ6suJFxcB85qVAwALfqv864+/yuVx0htUsUyUMn0ieshEK1HI3hi7swdzc7pc13rOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtDmI7H0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA065C19422;
	Mon, 19 Jan 2026 19:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768849527;
	bh=1UXo/ckQadGKjEIh+2fot6KVpHFbw83nV/ffKOfR9EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtDmI7H06UsfeT0zdXsWI47xKGGa/QTohS+pB6qIxwJsWxJTWDKPoDZjHjmT0x/Mw
	 qSG6xF0huXLHx953PLNshlJAYSqApbQuvSMYW7EBFNVWlhZJI/o6HWxcx4BUeS/VM4
	 nPrCM766RG+MG5DQQWp9QX9x/SOOCbEOn1BLqkASgxpDyu2uuVgKaWjLbXouvAEC8L
	 puybj1ARhQLQ6PFz84U01EyKX3QBR2ZKVioeqYxn4wu8mBtKMJyMQ4Nb51ToRGPk5x
	 DOIE2HqxGg2SWHpNO/S3EWcXCtrkDe6SUQi+jhiOR1wPWxMaL/Zfm8vFakov9BaKqX
	 7O9leTiJl+Mew==
Date: Mon, 19 Jan 2026 19:05:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <aa4bc767-8128-440c-a2a2-81fbb6992a8d@sirena.org.uk>
References: <aW5xqLq7gatOy1DV@sirena.org.uk>
 <fc855e76-5f3a-458e-82f9-f43c7d23932e@sirena.org.uk>
 <CAJ-ks9=V_JmzEaXUrHPm6K-DyTgkxEhrPCW=2ZgDJpc+4Z83_A@mail.gmail.com>
 <27b562ca-d79b-4f80-be71-ebf5e26ed9ab@sirena.org.uk>
 <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qzk/1lXegHHyNoH/"
Content-Disposition: inline
In-Reply-To: <CANiq72nS94wv50XyOJq5CeiVQvb0+3mNdWxJpFy_+2FH1x4RYQ@mail.gmail.com>
X-Cookie: Does not include installation.


--qzk/1lXegHHyNoH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 07:59:26PM +0100, Miguel Ojeda wrote:

> By the way, I will send you the details we briefly talked about in LPC
> for the Rust bits.

:) What I have figured out ready for deployment (I'm introducing one
thing per day, today is kselftest) is:

  ./scripts/config --file foo/.config --enable RUST
  make LLVM=1 rustdoc rusftmt

though it looks like allmodconfig has actually picked up CONFIG_RUST so
I might just be able to add the rustdoc/fmt to that.  I might split the
two makes for ease of reporting.

--qzk/1lXegHHyNoH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlugHIACgkQJNaLcl1U
h9Cm+Qf9HuZckYpxdaygyhySX2iH8y5XOjqaK1JpfhnWACTGUzaSL1V95002eeai
YNLNjUp6+S8ZuBStW0MMs1/0OnBCNc/bs3pY5Y5nBGJ/6NsGO9VPz5Ov8XA+BP+r
2msak1L3h2Rf/F0qT4Xh719KoUqN4B6rlPhDmzUnsApZ4BNEhBvRJhftOlD4koSs
AixN/ob4XcmHqS5ygEMGMUPTvcjZne8xHYqGcpaMXj/TLGnnhbU7O1dAvCWCPspV
SM6cwR4CjafjlbUW4We0QC5slvEYD64PdGefOmc3BcWofto/36pswaDGFaAf8U1t
tQyvPd8belVb7E4pfa9ivPXkgh/kiQ==
=/fpM
-----END PGP SIGNATURE-----

--qzk/1lXegHHyNoH/--

