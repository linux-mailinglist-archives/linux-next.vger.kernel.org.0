Return-Path: <linux-next+bounces-8433-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43484B91626
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 15:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9044A17FC4F
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 13:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DB1309EED;
	Mon, 22 Sep 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxY4ytLG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF033081BA;
	Mon, 22 Sep 2025 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547422; cv=none; b=pYXqshsfbftcSAP4TrSlxseTtRojvz/bXov2Ea3zrEKbiE/Y91hvLip0yGfPHegZwTvM6+trU7bg7xxd771hvk4j/e8FvExzEuMarGRi3gWdNYgi//H+N5RXSFHI/DFx3JK1uodDVICjCjIRmWBXB4VqyDBv1vQpobcx7uCqpd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547422; c=relaxed/simple;
	bh=xnteNqo3lrxdb6g8E5uaaJdpgUOlkyijnqIjy5xQpho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clUTNA1j6HBKtqplyyEM4l+FFm0xXMVumdS5SbAlSiptmCylwuBuydTV/P3AumohoFLWoQK7Ev9qvjHezYcB9TQkGNUbd6L6Z6Xo08vgpa1aSbaatnFUl8Sh2HWYnruAJMOhtPj6wZXovmdjWDsPUoVAT8uf9/68+scCXR2tXpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxY4ytLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C96C4CEF0;
	Mon, 22 Sep 2025 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758547421;
	bh=xnteNqo3lrxdb6g8E5uaaJdpgUOlkyijnqIjy5xQpho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fxY4ytLGLKAC1EnQEWHr41TtpeExVDVxdKSXl2A8wIfbfUy5HyhVo9IJRLw048LIJ
	 deUHCQTnMk8zLmPej87jMRujFGVE5sEcNGtqYbq5vg0Dnk5FJpv1/Gk0JgfI80ABNn
	 FEGoSWDDeD+mwLQwEdMWH9FZ1qEOytUfOF1QDOucnINH/NANSXD4etl4doBJhuL1zT
	 YaklWqF0ZWfI8VwYGqLKX7YDOugP3CBHMxS7jL85SxfX4JADv6buz9RA5mqXWo6hiy
	 MnSuYHw/arzWQYxEul17m0rn7vUgXrzdRZczpICA2atBq2MIGdQA23JKQ7+wmtym1o
	 o2m6vS07I+VoA==
Date: Mon, 22 Sep 2025 15:23:34 +0200
From: Mark Brown <broonie@kernel.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the tip tree
Message-ID: <aNFN1hwAr7RMhtIN@finisterre.sirena.org.uk>
References: <aNEb7o3xrTDQ6JP4@finisterre.sirena.org.uk>
 <409d5703-ca0b-4b4b-a221-4e38ea92ae9a@amd.com>
 <aNE1s02dSgcJ4Uxq@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isRIdK/l9rIpRvHl"
Content-Disposition: inline
In-Reply-To: <aNE1s02dSgcJ4Uxq@finisterre.sirena.org.uk>
X-Cookie: Filmed before a live audience.


--isRIdK/l9rIpRvHl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2025 at 01:40:39PM +0200, Mark Brown wrote:
> On Mon, Sep 22, 2025 at 04:57:39PM +0530, Aithal, Srikanth wrote:

> > arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function =
=E2=80=98F=E2=80=99
> > [-Werror=3Dimplicit-function-declaration]
> >  4091 |         F(DstMem | SrcNone | Lock,              em_inc),
> >       |         ^

> That'll be me doing a mismerge I expect and should've taken the other
> side of the merge for these, I'm quite surprised that the x86
> allmodconfig builds didn't trip this up :(=20

There was an infra issue, a bunch of x86 builds silently failed - it'll
be fixed tomorrow.

--isRIdK/l9rIpRvHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRTcwACgkQJNaLcl1U
h9AGKgf9G4jEMBq47vsrjid150Xz/QQZwiouEDwO1iE0H/kVJeF886GMfIn2yUX5
utThtWhnytcI9AN3hy25Br4LCED+M8MHF+iCZHkQp3QTh+sC5nVkoO8vQpmGt5eS
0IbCn3FJydxR+KQFjlcf1i+0Ur6HPtfOM5NBiFmlmmzijlmnUB9lrf9YhqGcekWD
FS/+saSTYT9mwp4LdZhiAFIvWutp0z2t3SqZhlCauQPGRb5C7LNpXfz4QxDvmmLC
4kEH3Z92pBFdk4dtNMHoL111JLPNQl+O4Sg3JTMqxzRBQ7e+fWZD4sh2PCQ46b/Y
GfEErIyE930EvsuSyLg05ffa6YkcCw==
=vdY9
-----END PGP SIGNATURE-----

--isRIdK/l9rIpRvHl--

