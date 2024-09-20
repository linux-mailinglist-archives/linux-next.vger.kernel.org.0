Return-Path: <linux-next+bounces-3931-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0FF97CFBD
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 03:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04C41C2324C
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2024 01:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BEEAD5B;
	Fri, 20 Sep 2024 01:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j06ngM84"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE3182D2;
	Fri, 20 Sep 2024 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726794915; cv=none; b=NU+b3zmKOA0GUoDVKON4ZwZXkUuerEs+4wd0qFHUZj1VWfV5npB/3Cd1JoYT9j+/Mo0ghYImqmlEBs+cXhB3N0FWuy8qCB258CwifBRXIWdgimqS/KV8F2/gK0CAxLTuDHYhVD8Zwu7dqNdFcpuKpkRMRZsksunWMVYWMcif0OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726794915; c=relaxed/simple;
	bh=PwiXeYCGvDfGxgFouUHOfx2o8lYt+eicS5wksJA2IPA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oa3niYO3hxHW/6GKPomcnRSuo2MkkrmSVcNbXDAjdxZxZ4/ykMjJhf9KxxGFhUfXhsEHQIi3w3Gx/itj5IUvDCDewJkZ4/HnLJVEDfaRyKU1lUArExQMci+8A+0zPYjpYcnXpjrhvzAMK4DntuPjgt+UnXZ1reUy9i9tp04M0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j06ngM84; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726794908;
	bh=LhBHkv/COxRlZ/4sqR+vlBkz9MC6ByEpaftHTpa2Sp0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j06ngM84qDY7IAK6IU6onPh14CZ/DDGVeojz9pkYX8JA9ClazEih1HnG/HZl1Ikh0
	 poxIgQJbmn4yRPOOdotADLePWah3YTX9a+6jpbCtgk3Nw5ouP4LbqTmxyyHl3HodNL
	 Uh3Riiu/eVHK29lXmvu++HHk5uHQ4ICjpkVHPuyaq+639HUACICTIfB/0YVBun7o2a
	 G9g4obVIFTqbBp+3CCuhnsOjENXnkSI+EfDm2Vm2RaD3HyNC5TibXnQrCid6/Oqo6z
	 +QKqh6JZRMQCFWxHFuPdHByF8zsd/KfClkQZOybssR7z8s3zyNq0uWHUcB+sFH2QzX
	 QPf+iWOfTuMTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8vZM6YQFz4xGl;
	Fri, 20 Sep 2024 11:15:07 +1000 (AEST)
Date: Fri, 20 Sep 2024 11:15:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Frank Li <Frank.Li@nxp.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Simon Horman <horms@kernel.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the input
 tree
Message-ID: <20240920111507.043f84f7@canb.auug.org.au>
In-Reply-To: <20240911150802.378ccf42@canb.auug.org.au>
References: <20240911150802.378ccf42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QXaf0HGlDijeiYZ5N8Q0vRj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QXaf0HGlDijeiYZ5N8Q0vRj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Sep 2024 15:08:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/power/wakeup-source.txt
>=20
> between commit:
>=20
>   45d6486d2a5a ("dt-bindings: input: touchscreen: convert ads7846.txt to =
yaml")
>=20
> from the input tree and commit:
>=20
>   bb763d7890f6 ("dt-bindings: wakeup-source: update reference to m8921-ke=
ypad.yaml")
>=20
> from the devicetree tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc Documentation/devicetree/bindings/power/wakeup-source.txt
> index 9a4f8310eb67,128b55be67b7..000000000000
> --- a/Documentation/devicetree/bindings/power/wakeup-source.txt
> +++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
> @@@ -25,8 -25,8 +25,8 @@@ List of legacy properties and respectiv
>   2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
>   3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-=
keypad.txt
>   				Documentation/devicetree/bindings/mfd/tc3589x.txt
>  -				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
>  +				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
> - 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,p=
m8xxx-keypad.txt
> + 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,p=
m8921-keypad.yaml
>   5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsun=
g,s3c6410-keypad.yaml
>   6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidi=
a,tegra20-kbc.txt
>  =20

This is now a conflict between the input tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/QXaf0HGlDijeiYZ5N8Q0vRj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbszJsACgkQAVBC80lX
0GzqIwf+L2uLIIN7yi35cVk3aue5J5KAdiY8U3kSoKjSaUFP+w7gGtABkZ8dZJxA
n3GeJ6SU/dyI5zpgbmOLIzQrPC8KtouSz+ka0cJOs/WUPbsFfvqd76FwkCuwO1+4
bzot1B41GUtNPZD+hVj86In/Ac59nKtZeIUk/TBQ6BRDosLASY/7uwIRWDVEpnF8
GV13cMBmanDf7WIgAqwirCmtuXVp8aWwZQrVBI8C9nNSJbDOnnyG2nJJ5ng+DjOZ
wlPRRJmAfAd1w/DlR9jfIgf4m6I7dc/cHTPVua9leQxv/Udc29dPesC5daoQ0beT
fab14/fp9pG4mKiWblJAIDfyRS1Rgg==
=0FlP
-----END PGP SIGNATURE-----

--Sig_/QXaf0HGlDijeiYZ5N8Q0vRj--

