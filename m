Return-Path: <linux-next+bounces-6982-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C8AC855E
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 01:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099BD3AFA47
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 23:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0B4247DEA;
	Thu, 29 May 2025 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BzTK5rQa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45AE24C09E;
	Thu, 29 May 2025 23:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562249; cv=none; b=KwEFqgxnEH5DDUiaUh0oseGwrttlCbVN7m0MLs8tspDWtON3IXdKqHrf4v12LY7pTBXnCcS+gS3awzzFlvwMA0W8MBcNcySFwl83AOw5WiyTEitYXgPqeVY4EI+OuAVZsQNgYJyeJ3xlmuozp86y6EHOzzURJ7GRlN+2IuK4h9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562249; c=relaxed/simple;
	bh=doSPlKjLKropnFpXRnvUKx9Clv988obaodHZ4TL6MTM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CxJllSy2Q5azZGniEsyUW6eHOTKyEBcm+OIzd0jW/dlamf38G3ddD1vHF/VhWKt1tR92sxbPVGd5sdLN/LjeF36rZNXTf2NPxXFb94Pjsdf0zckiD67owKG/TK9xOFjSVV+ofs8NVkdtUF9bjTjwTp0XVgGLydbxb0M7A4tJ5yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BzTK5rQa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748562241;
	bh=PUnVcrIPj4ms41h74epCZdcVJG1fuUK2dUYpjazCxXQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BzTK5rQa0kYH/1zVjasJXQ14eo/k9IoRWXO4iGXY2GTQ4dDy/S8eZXIaSjZfEH2ln
	 uB3/sXAaOIYlz+sbGbphYDXwuHU98d9KVRkCS1xrZ2mJFPpwtEvXkhSs/nDwt7Ra0M
	 BpCGdyV8a52jJ4ivCGudjh2dYrb+YBZZYHqTnZaG49LxfI8bYDA8tHocDkG6MIoxSB
	 p7gZ1NA/iKm7B/pXwBnOTubQYvqSfP89b3KDcqOkQ4dZnJrhso3iqZ0zFljC+/tVLb
	 7TXIYpW35vkL5TiiV/+ZuCkdFiK7+P30CG68rPlfscP4vdjJ4Q7OeZvZY9FYbhVQsy
	 5alpqFsjDUSnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7jcx55Z4z4xVc;
	Fri, 30 May 2025 09:44:01 +1000 (AEST)
Date: Fri, 30 May 2025 09:44:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20250530094400.2743f5b3@canb.auug.org.au>
In-Reply-To: <20250513202809.7e23ed2d@canb.auug.org.au>
References: <20250513202809.7e23ed2d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uD.MQ89IeNe9w0HRY+hb2mS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 May 2025 20:28:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the powerpc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in a=
ny toctree
>=20
> Introduced by commit
>=20
>   ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM deb=
ugfs interface")

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg48UAACgkQAVBC80lX
0Gx7Ngf/Ub294OckaW0B6laae5Wm7n6SHfRXYf/0GQ7+y2lfLV8Ykmv0xAbhWvi6
omu3dbKXjmBTiCXy64rkP6WbiDg6bE+xx9R9cZBuiC0x31jc23qUHyyptjLJVEV3
Ta6Y99Doxxv9/8xSJBub5Sij0/bapvNxNgj5/Vjr2bcLQorEDDFU69XAZPVO0sBL
ht7vBFKGtW9IcTx6UjmRdAXjSQ43yzJ3fZLDYZCdT6OVpk2t5ea/h4btQhDtR26d
WiQl2Dd58qJ/KPhIhnoVjtnkg8d/3nEexCKnRA5+rZElag/NvI96p4HtbcrcPZR8
y6hrVG2D0wMJoEoKU++xQQ/x0vrg7A==
=DlEO
-----END PGP SIGNATURE-----

--Sig_/uD.MQ89IeNe9w0HRY+hb2mS--

