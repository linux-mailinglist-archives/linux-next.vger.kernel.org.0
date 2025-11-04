Return-Path: <linux-next+bounces-8821-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57555C3301C
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 22:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CA8189BCA4
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941D92E7F0A;
	Tue,  4 Nov 2025 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VF8R+ik/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225623A9AE;
	Tue,  4 Nov 2025 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762291060; cv=none; b=OuhXBopvFUsTRZ3ALs56MbmM9n6GeMX7TH/yAySzzb9/CSigJGJFoBGXGej9bOax5TwQ9iKmYBady5Pa2/nx8V3HjKKn3/cwzGjtgpzIzGl8cx7++6BSkgP9b0hyIi4r0yXugg56QEyt8mH/rahmhTN817J+0L7vojnuQDkqtag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762291060; c=relaxed/simple;
	bh=b/IbD+YQ3MmNxvAa/DdJ5oLmEGvOE1Hazw0XPl1PZxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+0NwnkCUc0zO2FE8BU1pJal8IHGs9COtkM7ky6NTLkht+yv4POZ3c7VWFmPQPoKUJmbkGKDIWlfZUS6yJEUi2bqXr1jp0nI6evgGPyKIyw6ppFX+u1RF5cmaXjD7J1QGdTjBMOWV2rfsIaP6pnan18pF9jO4X4f6fIWxiR+ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VF8R+ik/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762291053;
	bh=tdQMJGfQ3u+h7oqkDgXpTiv5orhyCbppfiLjTJVras8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VF8R+ik/1Ab8CzEUcAEe8ul7Bg9WVip4UQDjJkcBNv/M4LzZQIbASl6xms28fJLb9
	 I5tOnnqt5jEVXJdPs/P/B0sXyp4v6T086FpsyhmKGtv8hjW1Uy0UUh76d3RJFvZ189
	 33efturUidkQCMK5sBL8vn34/FsgDYWymaoiemsWXDSX2lOwaOfruBfwRSUOCjnurn
	 owWdbgp2ADm/rlYFSX6dKUg5pC09+AlJ6RUYV0CltM6YOlqEeS4ORVcYItHd3ckOSv
	 UQfHgQvTyelID8X3cJElYOAnW2c2sNrto6rfEOEAx0iBgbGf56Z5mXsI9V2g2uEZOq
	 HXFVYp1vQRxkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1LrX6xdzz4w93;
	Wed, 05 Nov 2025 08:17:32 +1100 (AEDT)
Date: Wed, 5 Nov 2025 08:17:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, Sami
 Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
Message-ID: <20251105081731.3c3a979e@canb.auug.org.au>
In-Reply-To: <ec0cb997-099a-475a-9a7e-d3a1cb82b973@kernel.org>
References: <20251104104827.1de36ea0@canb.auug.org.au>
	<20251104105415.68bfb090@canb.auug.org.au>
	<ec0cb997-099a-475a-9a7e-d3a1cb82b973@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VO8wUZ8K=groe44TRzi3Dhw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VO8wUZ8K=groe44TRzi3Dhw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 4 Nov 2025 09:48:35 +0100 Daniel Gomez <da.gomez@kernel.org> wrote:
>

> >>       }
> >>  -    if let Some(imports) =3D info.imports_ns {
> >> ++    if let Some(imports) =3D &info.imports_ns {
> >> +         for ns in imports {
> >> +             modinfo.emit("import_ns", &ns); =20
>=20
> Please, drop the '&'
>=20
> +            modinfo.emit("import_ns", ns);

I will do that from today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VO8wUZ8K=groe44TRzi3Dhw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKbWsACgkQAVBC80lX
0Gwd9AgAn0C3LUZeMcgNka2XBxxY7sneNHoxwssUdCtMQdcn7v71TAlxhSs6qLB0
SSh19yXc/XkuyIcEbrKPkJCaewPd79ldGjY/JNftPZ4e1HbxoLC5GoxF5o0PWaTS
UO/EIY6xBkgDqrke/seQ0vesf9bs7vWNFbFZeAtAB0osJs0xzUOUkQxGN9ye9PaK
MbQOeY59zTfOlC8jcW7GLKtTWGXXks83mnqcpz5prc7YIH2BgbI5rgQoboBkFZuD
0sI1c7eQqBXknYp5lKUj91Go9i+Hy9phKhquDpCy9d2h1V6z57pbwRgVJzdARtXB
J5b/a2rnAqZl2mLCpjrGCOhBanR1yQ==
=imsg
-----END PGP SIGNATURE-----

--Sig_/VO8wUZ8K=groe44TRzi3Dhw--

