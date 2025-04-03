Return-Path: <linux-next+bounces-6150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4CBA79BB2
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 08:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A414A18930AE
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 06:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F9919922F;
	Thu,  3 Apr 2025 06:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L3kSaRan"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5AECA6B;
	Thu,  3 Apr 2025 06:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743660103; cv=none; b=tO6m0DTU0caPEvWtb2Z44iaExD5a3RZ70FGs+km02h9H7i5Qe2BQs+G5LRBV6ruxnBfw+mRMzNuO8GylE4o/fxanxWWUv+Ys+GUVnNVqaf3CCNkKS+GM6MQdz8U6kFAEOVqeUjhWk83gmenKbCngklRFOfK/nw5+ggDWXjZezLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743660103; c=relaxed/simple;
	bh=9ppDOHTHCYYmi07M6kZ2vQUJDN2lf2V+QnXMNXpcfjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eO8wevfMdJ506t9aglEkK1+JscbmhZalGXuXnPzAwwCqXWXKzZgH3AvMfRNiqZcM9HX8+bS5roeJ2HVwLoDbQixpzinqGLWp38FSdMxJNRya6Przb170J8xQQejTQdx8m5LOke1B5eCne0qZIdbe+JGLdRQESUCS4AxDrKiojyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L3kSaRan; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743660095;
	bh=rEE8qU6KIQ5XE+CnOZ9OsuoSiSCIErnkgNviCeOT2IE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L3kSaRannoqaJmNg4MogZFtuz37MUIbS9mugMaiVJQy/0LBOkr3Ll2NTue8u8D9jJ
	 8Jc/1zlRBXmKOWWMC01L9LdPMhIxaC6kiDKcqnHKjMRZkt+4N4W3xw0ayvSL2zxnht
	 EdxKvzZ7DmdeMmf78B40BgdNBTq9bfWCe/u7VWPbBcy0PFkgQWqr1HB6s+EtP5NsoL
	 FVCE6Gc+pRuLj54Xbk6+96GLQd5zRpiicPtIRJHcXg2PamV5MgDKWBWTATjIk39D0d
	 iLtlkDfoPr2yyhXCDwGXLTs/5nsjwYYHS0uoCExmva05Me/7qa84pkt7YBjeKv/f4I
	 /aXuIq+OtFZog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSrhv2gxxz4wyh;
	Thu,  3 Apr 2025 17:01:35 +1100 (AEDT)
Date: Thu, 3 Apr 2025 17:01:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Kaszewski, Dominik" <Dominik.Kaszewski@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250403170134.504f5801@canb.auug.org.au>
In-Reply-To: <LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
References: <20250319203449.386f9e00@canb.auug.org.au>
	<LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/70l9yCFt5q6cURZ2okGbR7W";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/70l9yCFt5q6cURZ2okGbR7W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

On Wed, 19 Mar 2025 09:38:50 +0000 "Kaszewski, Dominik" <Dominik.Kaszewski@=
amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
> Hi,
>=20
> I don't understand this warning, the enum it cannot find has been introdu=
ced in the same commit immediately below:
>=20
> +       /**
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * path failure, retry using legacy SW path.
> +        */
> +       DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
>=20
> Could it perhaps be about the missing colon before "If set"?

Yes, probably could be.

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Wednesday, March 19, 2025 10:35 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kaszewski, Dominik <D=
ominik.Kaszewski@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.ker=
nel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>=20
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed this warning:
>=20
> drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of k=
ernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HD=
CP Locality Check FW
> drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of k=
ernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HD=
CP Locality Check FW
> drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDC=
P_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
>=20
> Introduced by commit
>=20
>   84ff5895399c ("drm/amdgpu: Add debug masks for HDCP LC FW testing")

So, I am still seeing this warning and that commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/70l9yCFt5q6cURZ2okGbR7W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfuJD4ACgkQAVBC80lX
0Gycpgf+OxqiuWJRI6yXUWbkga/3jV1zHI/NmSUvN3yzJZKVRsN7iSq/hq48zwYs
oG1HjCFuMnaE5OF3EWnPpkhg9cr9c48vKQ57YQvBb9sH/+nEph1x84zj/rmAU/QS
NV7LGF5caNGnJAUhXS9ehOT+q7IrsGDeVffTqkhAZ7B2wFzCxFTKND+SFenIWmgb
opoXpCTnGCBDqCMeRRw6AOGcD3Asm6WIZZgcYSeSWhPIc0tATNFjgrt9cVhkmZ+L
64QR6d/kgpv82zKJu+qThzmUosXivGYKLiBJrYUHXjPVDlxATAsfm1pzFO/ZzBCi
xvnnTvJRDHUNi84s7cUrYMLOra0fJw==
=dtoV
-----END PGP SIGNATURE-----

--Sig_/70l9yCFt5q6cURZ2okGbR7W--

