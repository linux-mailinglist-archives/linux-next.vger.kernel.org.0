Return-Path: <linux-next+bounces-7461-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E2BAFFF1B
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 12:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31B21C27660
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 10:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89BC2D5A18;
	Thu, 10 Jul 2025 10:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AAcNKBuW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5EC27FD5A;
	Thu, 10 Jul 2025 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142972; cv=none; b=JQv/KbwTWjy/NnTwIjaxhv6FlPmGFKJ8h2SZQcMsUeCqZ/tVZgLX/Q4VBrBQa0V0fG/d8ukFVyuGlRmbeCC4ZyheyQdv9YKvEfwmTL2IMFt8HPw2d0taOIFMZ+9bfusRzH5s8E5GGaxuDEYif1xGGk9Xqu63jg+yGDjr29XwZRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142972; c=relaxed/simple;
	bh=aIIZQ1CXQ1yODxoyueZTb2QQqz00XYiPBjdu2QjjfpU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kO6m+NBBiYzyb+Leo1j5ms5TA+w3V51QKes7V5qPHL2Jj/JJyoJoxl9tczjNW4KXw/2XdXZohRaVQkLQg1G7ZnyH03BcYkKzXAnFMcEdEV7RK9hl7V0Ayxla4oNpFWLD03m9m3+EqSO9xUIG+mTTkqJ0GnOtmamVmvIEYpwSksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AAcNKBuW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752142891;
	bh=aIIZQ1CXQ1yODxoyueZTb2QQqz00XYiPBjdu2QjjfpU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AAcNKBuW5cQWLR7QggFxaLjOYLfOaVs7uXdReVQ5S/qpEDsi9EPVFS41cJ/WJahJ/
	 QKTd0aYlbnIT/TbgNgQTuQ7j2QtjB8Nb0othu0t+r+e4GBmEnjhFJqEmckKEcY4+AV
	 lMojff8uOBqzDKRuOWmay6KppqGaBj5WtNza9s5GJzizls81F8OrSZLZxK0tkdiAgU
	 KJx5cPr9HTObaQToTUql+clG2DAMyJ34Apx04/pyI5MqDmtpxQ/KY/JcHjb5NnrS0R
	 zhRTS+61kOm/dvxlnS3qjtMbg6CODERmfkEmumPopZSZlB71fEqkjs6Lq38azXS4sB
	 fgQG6MRFZHjUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd9qb65zRz4wcd;
	Thu, 10 Jul 2025 20:21:31 +1000 (AEST)
Date: Thu, 10 Jul 2025 20:22:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: [next-20250709] Fails to boot on IBM Power Server
Message-ID: <20250710202234.7fd45cd1@canb.auug.org.au>
In-Reply-To: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
References: <fe13e9e2-8ac5-46c7-b925-b61d35104ed1@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l8d0fWJRapxz1o6JFJg5qXT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l8d0fWJRapxz1o6JFJg5qXT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Venkat,

On Thu, 10 Jul 2025 14:56:38 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm=
.com> wrote:
>
> Greetings!!!
>=20
>=20
> IBM CI has reported a boot issue on the latest linux-next(20250709) kerne=
l fails on IBM Power servers.
>=20
> System entering to emergency mode.
>=20
>=20
> Error:
>=20
>=20
> [=C2=A0=C2=A0=C2=A0 1.071678] ibmveth 30000002 net0: renamed from eth0
> [=C2=A0=C2=A0=C2=A0 1.074227] ibmvscsi 30000069: SRP_VERSION: 16.a
> [=C2=A0=C2=A0=C2=A0 1.074238] ibmvscsi 30000069: Error -4 opening adapter
> [=C2=A0=C2=A0=C2=A0 1.074255] ibmvscsi 30000069: couldn't initialize crq.=
 rc=3D-1
> [=C2=A0=C2=A0=C2=A0 1.181132] ibmvscsi 30000069: probe with driver ibmvsc=
si failed with error -1

This has been fixed in next-20250710, just released.

See: https://lore.kernel.org/linux-next/20250709233953.7afb7a8a@canb.auug.o=
rg.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/l8d0fWJRapxz1o6JFJg5qXT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvlGoACgkQAVBC80lX
0Gw2QAf/eDZwYL+6yOtKX23a7y+ngUbVR35WAHoP6wLSCXCEywvQbBkier9Fdewy
DguGV05OBY145Ea/tEz+j7iY2TfM+qaM2MRAmJWMh9uBRQ4TfMyuGFiHZwcms5RF
gJezTBZtdDXsZQdMH9xiEIPmjptwY2Ki1WV5YdmFKvz8h7fwvbV50kYSF0/RqdTW
f8RziQafqx0fhlHoHyRFyHcESAFxklZukyIsLHcE49xanAVXtLSCdqDB7Xr5cCSk
l7LmN4/b7N/KERk1IwdKT8nfdrOYgsavAQWFUES/wwT1uzSBBtx1BLEAf0j8O4rr
DLF4iZ/JxhPZ6laIhpQvlJ8SSxfWog==
=d49c
-----END PGP SIGNATURE-----

--Sig_/l8d0fWJRapxz1o6JFJg5qXT--

