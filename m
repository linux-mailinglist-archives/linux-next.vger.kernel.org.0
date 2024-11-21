Return-Path: <linux-next+bounces-4830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E079D567D
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2024 00:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25B76B2322B
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2024 23:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F501D3573;
	Thu, 21 Nov 2024 23:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hGia7MHt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7019F410;
	Thu, 21 Nov 2024 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732233520; cv=none; b=SoouUYNCsyRvCO0zlzXvU9cGFdtmELoVgwkuhDxgXktpsHCDV4ioBavfbD/cW6HwgCarFIK0zgVdKIrNzWOv9/ln7WVsoXXg/FkGtWLzBx7VsCIcvoWnC1ohAhljLILE6M1cOKEegsFyna4aQDqgfXP5bqjjKou7yCabhEWPHtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732233520; c=relaxed/simple;
	bh=Uvl3wsFegsjMfK6muO6ob7tn6o5EzVH/IOzUyaAbTk8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPV21TFF59+jrUfGef7h+gb2K0Pve/H6NeyGs8nrxwwv0n07qLQ1cRp/vgcpUTFZ+2hfiQN/K2yJXDteeRxnWvW90ST8IP2VPvmNFDrIJulON9+ELeR1vd+RJafjWnAyRpoS+ezJyvymM1d9ESYcPvn79YgUTZHkddTQis3fCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hGia7MHt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732233513;
	bh=X1IjupogZMkiWNSZk3JFoLN4U2FqYuIYTt2Pu/GfsE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hGia7MHtBcQU2yw0Co9WJJ6eVcmsrPnicykB4pYjaq7KouNNxlDo5EecduXLMWViA
	 /rUfwyytG1lNO8wEB9CzeinxYC0P47XpOLvj1rYXAEoJSzjX/Cafk1YZycJgE65V82
	 uimMYT3+UImEPdJw0V78VRF5jAweInGuSMD1LVEA3P4BXivmFYuGF0QmV1j5F2G79q
	 hA5i6LgJ197RPqKoKpVpwYhf+/LRa5w1GhFh4u90rKM1RuyZZO9C4uWZosUIc1BOqc
	 3FgvuTlaUB4MPAmbqu2kV5YC/hnB/+3aIFZuCOV/0WZU5aNuGor0DQo7NPFgc1GJIF
	 EiUlTnDutYc9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XvZtw3Xn7z4wcy;
	Fri, 22 Nov 2024 10:58:32 +1100 (AEDT)
Date: Fri, 22 Nov 2024 10:58:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ceph tree with the net tree
Message-ID: <20241122105835.022e99fe@canb.auug.org.au>
In-Reply-To: <20241120113015.294cf1d2@canb.auug.org.au>
References: <20241120113015.294cf1d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WNHmlPmIf2uQLOjs1_iNquO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WNHmlPmIf2uQLOjs1_iNquO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 20 Nov 2024 11:30:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ceph tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   4262bacb748f ("MAINTAINERS: exclude can core, drivers and DT bindings f=
rom netdev ML")
>=20
> from the net tree and commit:
>=20
>   6779c9d59a07 ("MAINTAINERS: exclude net/ceph from networking")
>=20
> from the ceph tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc MAINTAINERS
> index 54fc0c1232b8,3771691fa978..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -16235,7 -16179,7 +16236,8 @@@ X:	include/net/mac80211.
>   X:	include/net/wext.h
>   X:	net/9p/
>   X:	net/bluetooth/
>  +X:	net/can/
> + X:	net/ceph/
>   X:	net/mac80211/
>   X:	net/rfkill/
>   X:	net/wireless/

This is now a conflict between the ceph tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WNHmlPmIf2uQLOjs1_iNquO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc/ySsACgkQAVBC80lX
0Gxv2wf/cNuZPWEQiC28p04NjgbfgoFtJeDQYEzwlf2qnqxZX2Pu6pGZtbZGXBbb
JHgojUi+gvWC52E27KMl+chudGTNbRbkywDSgCGY+nmMUN4UrcWKeY8aTPwVd3yQ
dOcEqlvOYnKuYzamUfCiYIzp48/w1Ncl/m3T9EOcNJ+FLITB44zEIi+/mixaKSFG
wDrZGwvSODHMp8LID9W8kFFH7F+/Tdqyi4rtc28w6cq/BBquh4YzBqgS+GfNu416
mpM8NtnHVjNvl50SR94X6Bpa8i3si59sVSiP3Rff+RObytxVkBhy5z2keEZyYLJl
31KVHsyR8VtRV/qJFOOpUx8Jg8qjBA==
=iaWa
-----END PGP SIGNATURE-----

--Sig_/WNHmlPmIf2uQLOjs1_iNquO--

