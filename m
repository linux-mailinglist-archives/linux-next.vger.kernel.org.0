Return-Path: <linux-next+bounces-5508-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF54A3CBD2
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 22:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E73D189C5A5
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2025 21:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160AA22A81A;
	Wed, 19 Feb 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ER8n1WOt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400F1A841F;
	Wed, 19 Feb 2025 21:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001933; cv=none; b=r6YFQLVxdofim6SiZGoywzqMRZz7oImTeBll1aR4E6DYNI08jsPin6tdml0wBeOMveXEzpa8aAmBhgSLPx5Z/i3Nh7IDlMZW5yoseLLxhWxx6WdC1V2dLCfnk9xQ/saBQcdWYZS+I5vaIaA446jXSwzVraQyh0jYSzp6PNvugd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001933; c=relaxed/simple;
	bh=6QNMJ61yNbCiOtKJc3nNULn0jRW6MpzxnBYfQl7dbfc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CmKeGSZ+UZEjm3D6/oSYh8wFEcWsln/eJo6veNRksXO28zrYKlQDLjCTpB8TWx1WKUir3p6uLflIbA9mPXNyrGMBEXiYAcwdIvAx1aRgHL1eEwUejeVou7tRDpp10ce9XWcIdUQqTiW7El66WppA1otbTOmLP2wc9jgH9KcOfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ER8n1WOt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740001929;
	bh=6QNMJ61yNbCiOtKJc3nNULn0jRW6MpzxnBYfQl7dbfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ER8n1WOtmDmyn70J1Qhd0kBtdb4wki4oDpbiDi41nbciZ6qDeRZbZM1Hh+Dtg6rxQ
	 +Rqsgj8Xx685GjsBRBRd3tPprjReHYgeGr1UFC/ylt8cowhETqyfe6QyYRvF1fGJkC
	 E46WcNk8lyxIit8QwSs0Mq6P1epL0fhGpNJqhJZXIbH9r7/nv+QRunbQQrO7fpB8Zr
	 /ejZVHdDOCM1QewUiSSQsWArY70yPCfM+mDHjzLfu8eOBLJDqwmggtf9E0ai2YkOkQ
	 KWQlXP0hjGo83/sXyN8O9qVyDhGl6UiFpsVZr/rPLRb6K023JLI+SK6+oO2cqrYoew
	 +FpebiEW4fR+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YyqqX4Qw8z4wbn;
	Thu, 20 Feb 2025 08:52:08 +1100 (AEDT)
Date: Thu, 20 Feb 2025 08:52:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>, Linus
 Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>
Subject: Re: linux-next: trees being removed
Message-ID: <20250220085207.7eba1bfd@canb.auug.org.au>
In-Reply-To: <06bc4404-ec60-4f38-a568-6600969f6f96@kernel.org>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
	<8e27ccd9-47c4-45f0-ad93-b88d603108b4@kernel.org>
	<20250216221113.03080b52@canb.auug.org.au>
	<06bc4404-ec60-4f38-a568-6600969f6f96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NF52mP3gHtcMvon783MIHVE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NF52mP3gHtcMvon783MIHVE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vineet,

On Wed, 19 Feb 2025 11:58:58 -0800 Vineet Gupta <vgupta@kernel.org> wrote:
>
> For quite some time I've been using just # for-curr for both fixes/featur=
es, as
> dev as slowed down.
> Things might change if and when work picks up on ARCv3/arc64 bit for now
> for-curr suffices.

OK, I have removed the arc tree from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/NF52mP3gHtcMvon783MIHVE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2UocACgkQAVBC80lX
0Gzpvwf9GORn8jQrNvFIPfgJWbfRwzMB2q4ddb/nm1WI1+8kPETIGrsEcwBg549I
tTDPeO88ykPqTr8LPWlbwa/ttUS7DdJwLYC8LYVPvADvC6GPG21KBrvpG4RsFDvf
ZiGp/SgWPM7+LjR61cRqqzLgiFjTTy5B6NJWatvTDEjXwSNo7ceBcJ0Z8VWkjAs/
E+dqUh2F8lp8kBz3kUISntuxFDrtzk124k4K2VDo5WB3FRc+Em/fb8FEVxhq0cFe
bdcXDZfBVNw/5s96Y6lEfSsF/ukLZuChOLqev6t1IgEybbo2NQQAb3+soh6jJloT
yq2ViLgR7vpz7h6irnkWGMjwaWGxmQ==
=ievT
-----END PGP SIGNATURE-----

--Sig_/NF52mP3gHtcMvon783MIHVE--

