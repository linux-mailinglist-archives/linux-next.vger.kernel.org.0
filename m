Return-Path: <linux-next+bounces-7115-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C89AD2C7F
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 06:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B90188E793
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCB025D528;
	Tue, 10 Jun 2025 04:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TGsyKTsL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBA4C79;
	Tue, 10 Jun 2025 04:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749528861; cv=none; b=BzdbUM2QeoSrSmqVXeZVucsRGWvhBYBrZHBwhoPOQxgyPgM36QJXTujgN7ZMnfW4YusV2OCxLh5GjiI9FQXMKW3ZCpeghQHOWpRLyhoRDDNGS9XRfHn6nxG6dM5Sv6Ly/j7K/V6aSzTi0ymw0YVrtKsiNqend2IJ+c2U3lEU9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749528861; c=relaxed/simple;
	bh=XPnIUUwf+YISFKk0QBXFvr6/br4qNvWcpkxq9tbEhvo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lVnuVIJu+mp81qlXUepGc0TjmdKDGqpdwdTIiMdWMTjuLmnXdYo1epcAfSgjUON+GV8LLX5bfY3nmTRNWy8eJPTRk5B+bAeDbYlat7R0bQyA/OD9154dvU0BVRQDGkK3PLFClT2rmlL0d3wSvzW6XlgRna7rDt1D5TQ1fjKA+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TGsyKTsL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749528855;
	bh=jRP/1zAkPYKnfWAh3lK12hFvExlsXW4dQE8v0hQAj84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TGsyKTsLbqFdW2+x1MqZRkQLXn0AH+eHQBvYmeuLwUwpIgGDXJuQjVyavExz8Fw9k
	 MpFz8yTjDgpqUZe86GPgrCOaHSshgNQawz0jMswklRcVPqbRJ9qQ8ppV+kzB1RvAR0
	 JtTiPc9cWPFbj8lNS06vkxlN62+Z46PVARvxZUlq3+3JG9aIOSowUQXxPeIG2J86lv
	 5ITLKFP/orvwdelOk0mCRDyugZm43HxxdbNsYyUIl9PNhMEx4QwoOMV6KOOAB3zxEt
	 iCCZwJMfYJGlD+29CtEfH1wv5zGpo9UM2E9g2Re2hz06ShxhG+iyyFeKdzSEJeBOvz
	 gvS2460+4JMoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGb5g0KYqz4wnw;
	Tue, 10 Jun 2025 14:14:15 +1000 (AEST)
Date: Tue, 10 Jun 2025 14:14:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Len Brown <lenb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the turbostat tree
Message-ID: <20250610141414.205a3b82@canb.auug.org.au>
In-Reply-To: <20250407065923.47f0049c@canb.auug.org.au>
References: <20250407065923.47f0049c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UheCMQWLBDK=rrgpq2uCFlc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UheCMQWLBDK=rrgpq2uCFlc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 7 Apr 2025 06:59:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>=20
>   447c98c1ca4a ("tools/power turbostat: Add idle governor statistics repo=
rting")
>=20
> This is commit
>=20
>   ed625c61b85c ("tools/power turbostat: Add idle governor statistics repo=
rting")
>=20
> in Linus' tree.

Due to more changes in Linus' tree, this is now causing a conflict.
Since this former commit si the only commit in the turbostat tree
(git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git#next),
maybe it could be dropped.

--=20
Cheers,
Stephen Rothwell

--Sig_/UheCMQWLBDK=rrgpq2uCFlc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHsRYACgkQAVBC80lX
0Gws6ggAgoS0IjrT0agCeGAIQiEweGYsCpfI+F+sU+F6dnqlzwzoFL1CTIOG9Acb
WQxOnuvxGIih+mou/pOrhszUWZs4bLz5TIfpxQ0/yIPpuEpaPf6mvabL7M7CJBdG
lEN1WPEA7cSsNhh/OFIGrGdThiJ6XrttRSpvQS3tkkuuYUh2m9TK9FqBP4QejLpg
C5wJlFCCMlYAQwNxlxa8A8SRi0fDpSKNI/CzNk6oBmZ4TlAB9+R6/uPtdpZqtxG9
7duLpLMMXfIq2jONOuBGCHk/fQjcAbpNq2J6MyWeG7vM7/OQ4BQP8T1GIOyUXLUo
B9JK9WAdlZsUTlf0fMi0jLaPgdJ2mA==
=sPqQ
-----END PGP SIGNATURE-----

--Sig_/UheCMQWLBDK=rrgpq2uCFlc--

