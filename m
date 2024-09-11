Return-Path: <linux-next+bounces-3757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF797500C
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 12:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2C21C20C09
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EFF1865F2;
	Wed, 11 Sep 2024 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="enTUBv7+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0A186604;
	Wed, 11 Sep 2024 10:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051727; cv=none; b=nyrrqc+2PlucrVhEYeWJpBH5jefXpnBYGy7/nif4/OFJbVk/Y1s+j+46RJMrjErHcTtR8unO9jB5NoIUTKaTdgfUsTtQzSdAu5zrSxirDwSy1AtdjDz6RSv7XEm6F5uCdErv3vRD/8pQveqOyaD/IivfQ/xyEus9JtAjmWvx0d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051727; c=relaxed/simple;
	bh=AaZvyqHwMXiBX+LwSYencAjZ0+qqLO1QCkQFGzaOexM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGT/uhV3j7U7Lz7xohejeDtM4jqE3novmCshZrVl1OjciiP6rgg7O1bZE9CBAUWedV+rKsC1K8/RJPgu//SbambQBEBZq3OSuCm3IqdBOONmw95Z5HLElwIDCeq0kM9FD6c+vqqrjppeQZ8PEg/r+YvEYWQuLcwNF5Kx5l1unt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=enTUBv7+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726051722;
	bh=AaZvyqHwMXiBX+LwSYencAjZ0+qqLO1QCkQFGzaOexM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=enTUBv7+2Ju9v9VTVs0ZVI961x7jld+5EEMiSHxeTofT8X05VBlQSLUEfXb1Af3ic
	 jseKlO9ivrK2vXNhcxARE6eCmlGYGuAAd7aZx2se7PLuN+S7ke0eeuj8vReJLJtwlY
	 XzZb42vyXrYAngc28pv2zpNGZTL+3FZoVTuvmDZ7nIN79HYIhWVAm3g+pj+7xjLCvp
	 hr+Gu8zJTN9ST2A/KMmTVQAGpxYAR34iJxVdoLsG4I0xdnaYCsahuOIJJGIrbQ+UkB
	 ykteGdvXFiYmY/EmedlxZDoYt0rI87okUYevG6a6zMjmk3Vs+LzWmn5A5FIyOUrfmG
	 XUAAMJ8d1S2Eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3ckG5FvKz4x7G;
	Wed, 11 Sep 2024 20:48:38 +1000 (AEST)
Date: Wed, 11 Sep 2024 20:48:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20240911204837.6320d8d2@canb.auug.org.au>
In-Reply-To: <TYYPR01MB702455E1EC2DC714B41490B7AA9B2@TYYPR01MB7024.jpnprd01.prod.outlook.com>
References: <20240911145543.270c9c9c@canb.auug.org.au>
	<TYYPR01MB702455E1EC2DC714B41490B7AA9B2@TYYPR01MB7024.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_pXQ_k.aeNFkxKEjK73kxP.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_pXQ_k.aeNFkxKEjK73kxP.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 11 Sep 2024 10:42:18 +0000 Prabhakar Mahadev Lad <prabhakar.mahadev=
-lad.rj@bp.renesas.com> wrote:
>
> Can you please point me to the watchdog tree.

Sure:

The master branch of
git://www.linux-watchdog.org/linux-watchdog-next.git
--=20
Cheers,
Stephen Rothwell

--Sig_/_pXQ_k.aeNFkxKEjK73kxP.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhdYUACgkQAVBC80lX
0Gw4mQf/QQ4K2DZ8TZIPHqNCDvAJVEqobNuZoIjvl2KwmjggFDD/eo+Dnm6SCtLd
TArzaG+aZsTRgkFW3chkCfTnEkwAi0ZTaoRp9e3VNVrslyhu/8BbS61LUktp5vXp
IZg89v3X0/h78qjJTg8zRGc4Q15K3dXfbkw6/ZuNnLrjqo0r+QD+ZsjF6d8gFBDs
oatmcTGIFFU2sMOI6mW5Ud2+ee2D7SelO307iTndG/xR+Qyi8HUupoEn6dbU5yu0
kWXQ593ICjKby3DG/3YSlO4e6fH4fL5jEYPXmmtMsYlGdL9Y0A04AvRtlmtlVWz/
5KV7EnX5AIHVKCpBbmorNQUXufrkrw==
=6q4b
-----END PGP SIGNATURE-----

--Sig_/_pXQ_k.aeNFkxKEjK73kxP.--

