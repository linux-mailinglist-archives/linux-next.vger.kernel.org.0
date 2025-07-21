Return-Path: <linux-next+bounces-7662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C00B0C6B6
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 16:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBF1217D7AA
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 14:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB5F2980B7;
	Mon, 21 Jul 2025 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c4IuoeH1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBF7283FC3;
	Mon, 21 Jul 2025 14:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109050; cv=none; b=brvadNakMWiOrwdSQXpyvRLRCPvJ5l79LDyMWl8lUGL1pqi/0rtwWRgCwQQHt790Zn0YFkuFpcpP4n6yf7oH8VG0xTC3ai93o7QDS0OlOqotbEAjofi1ARsZU0QOFkEfwRDo/E+sesL04G4YODxjiEf3JJl3+Atnjr6GBNN5++4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109050; c=relaxed/simple;
	bh=Jyt4F1VtYa+4ypVbjITcf2eTZjNkA9xO32+tYgnvyXY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h81+4q2IDLrYAl/OOJ1GoTHfkXG83o6df7uDqPG4HWMlRJW1GPlpruqriTS0ht8O1yckGZByiEPTmAEnYYhvXQBa8txSEHzgUaATZDw+OcIbbVN2RK5ZxXy3gzuw3Xyhm/YE1tDYIRIRf/ItMDib+moSo9ur4GaVjvL+GmpFwIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c4IuoeH1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753108888;
	bh=nppH31J2VfgugOYDtJTHIKotUypAC9L6zLq6aZBhYNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c4IuoeH1PMtqSUkSLT02dq/YIRL6ddAZYbB46t28GKX/MSJ8yRS5jKTKkLjHMEav3
	 ReAFkWSSlhdJ+Jpa3Oxsydz/8wF3mTNbLJeMdqMDeDTDyeFgpSFitAexDruPt4vtDL
	 eNm9EIIZI9VVWQuN/flgaHe3k04VWcW8undCfVW9ehzBfjYBn9IQW4hEVTioCKIjdU
	 pwbsweYsiyyZ4TnaHCBtPJ2c02a09u57CqCgjSAi+T6Es3IW67qiyXC01lolygcxLF
	 ZYBO0rn86UR52mN0bGiesy6Vkq8l4tOZ0svhDBIP3v7RRH+A2AQkFdZJyAJSlk7VPc
	 HXtwKgFuVMq/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bm34S0w4lz4wbY;
	Tue, 22 Jul 2025 00:41:28 +1000 (AEST)
Date: Tue, 22 Jul 2025 00:43:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH] usb: core: add urb->sgt parameter description
Message-ID: <20250722004359.598284ba@canb.auug.org.au>
In-Reply-To: <2025072159-banjo-resisting-db29@gregkh>
References: <20250721104417.3442530-1-xu.yang_2@nxp.com>
	<2025072159-banjo-resisting-db29@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vkjr2YnqWLWK1Vi_hilUwBL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vkjr2YnqWLWK1Vi_hilUwBL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Mon, 21 Jul 2025 13:04:09 +0200 Greg KH <gregkh@linuxfoundation.org> wro=
te:
>
> On Mon, Jul 21, 2025 at 06:44:17PM +0800, Xu Yang wrote:
> > The parameter description of urb->sgt is lost, this will add it for
> > completeness.
> >=20
> > Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20250711182803.1d548467@canb.auug.o=
rg.au/
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  include/linux/usb.h | 4 ++++
> >  1 file changed, 4 insertions(+) =20
>=20
> What commit id does this fix?

Fixes: 488e6eaab88c ("usb: core: add dma-noncoherent buffer alloc and free =
API")

from the usb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vkjr2YnqWLWK1Vi_hilUwBL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+Ui8ACgkQAVBC80lX
0Gyt6wf/ZjOqYfOMLMsplfozjEP6D5R2itpN1CrM2YB6XCiglx2vk0GDP+ugcJAX
mBLFa2TwK24wzLOmCDWhd2G5HpkwrjQKQvSabu29+/JB8dviFSsTBM9bvDMXl/qy
HHZ/4Mljph4u6tJqazlgKQWG7wahzOtVtV4UbMCPMjWXxkn2xAPBgIsD3jSCIRCy
jH75ELPzwUUy3JL6fX1clZ7VHMWvetORUmOQBbUny33JSa4CLeTNibV5YCbtgDMz
xtVgXYP6RsS4r2roiGjCqgDIy1yR4lJKa3PuiyMXb7XBYh7wMlu1ZN4AXf4Di0gw
Fi3F7kc+Or4sbPqauIWieoLiCSheoQ==
=bOvl
-----END PGP SIGNATURE-----

--Sig_/vkjr2YnqWLWK1Vi_hilUwBL--

