Return-Path: <linux-next+bounces-2329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 166148C6F20
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 01:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F17CB20E24
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 23:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555614D5A5;
	Wed, 15 May 2024 23:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fAky7Prs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DC4C627;
	Wed, 15 May 2024 23:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715815354; cv=none; b=F5NOPsiJpUOvi9RB9TUGeKrp4fpLjXe8KV4FezVF7yAlsKDTUFgLfqNiDbyNWFnw9fdfvyHLsutfeqK8UM6qXmHuXdjKagAeB/ESaMFhqGk+CwFWtbdSXJeU/OAQdl+h61Gy9wNYG0HAQksx6y9z/BRXwYwGMFfkNjcbN1BvGnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715815354; c=relaxed/simple;
	bh=OEdW9AZJDIyE2felfcDOz7mV2aanGxXRcf0OFsWsynQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m6vL1oTh1w4gtusaDB3RbBWcSpwbhUuFllwZIPIMphVo7T1Ijv5+akxOz2rMBHf5G+u8MWmrRclpf5mDU/Zf4NR6nnFa5ihzjR8Y+BHFp8Gm5zgR6hgMWoiqr51MHylL3DTTmxvBkz7UwsJEaF8rwExyvSOKVYkCqh3xYV5p5nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fAky7Prs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715815350;
	bh=kUby/j+ReeSIDLN6iTz0UTB+VZBhGJuMu6AvdFgvwR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fAky7PrsILAqbmsS2pWVk6UqeoTkAiy5gWeAFTsaAUDMvxcwiMOCvcREZZNgsTiEW
	 nbw1dgfoL5SRtmpspQ4Od1dnWxjoorCuGXFAaOECUUUbk6+BkGkyZUIG99O+oYr6rF
	 Gi3HokG0H/rm4fCXEYtt1cNGPibqHUtYhpcV4Ydk51PzZm1r3EDMeZkIEaavIsWXJs
	 fGYuojQGXd9LnlTYryigfRtK4tLDtXy+pXTDKV9Hi7cmVKMv+C9qj7KIak/n1wT/G2
	 9rou4yRe2JZSCR969hRyZetQdBJqr8aDO8Qxej8sdSOq/8gi1ONC9ZhPKGyRa0eTV+
	 Z7yrwcaKOTk8Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vfq5171rzz4x1T;
	Thu, 16 May 2024 09:22:29 +1000 (AEST)
Date: Thu, 16 May 2024 09:22:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>
Subject: Re: linux-next: manual merge of the net-next tree with the kbuild
 tree
Message-ID: <20240516092228.485bbd9b@canb.auug.org.au>
In-Reply-To: <20240506112810.02ae6c17@canb.auug.org.au>
References: <20240506112810.02ae6c17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AhHSsggpw0kU4Mga+WYew2F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AhHSsggpw0kU4Mga+WYew2F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 May 2024 11:28:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Today's linux-next merge of the net-next tree got a conflict in:
>=20
>   drivers/net/wireless/intel/iwlwifi/mvm/Makefile
>=20
> between commit:
>=20
>   7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for sour=
ce directory")
>=20
> from the kbuild tree and commit:
>=20
>   2887af4d22f9 ("wifi: iwlwifi: mvm: implement link grading")
>=20
> from the net-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/net/wireless/intel/iwlwifi/mvm/Makefile
> index 764ba73cde1e,5c754b87ea20..000000000000
> --- a/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
> +++ b/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
> @@@ -15,4 -16,4 +16,4 @@@ iwlmvm-$(CONFIG_IWLWIFI_LEDS) +=3D led.
>   iwlmvm-$(CONFIG_PM) +=3D d3.o
>   iwlmvm-$(CONFIG_IWLMEI) +=3D vendor-cmd.o
>  =20
> - ccflags-y +=3D -I $(src)/../
>  -subdir-ccflags-y +=3D -I $(srctree)/$(src)/../
> ++subdir-ccflags-y +=3D -I $(src)/../

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AhHSsggpw0kU4Mga+WYew2F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFQ7QACgkQAVBC80lX
0GwCLQf/SD2RL7WHWmYpOgmJlZKYIGQjpRCg7q99HXgIfjQ0KRu9dNzkJDC0HCOf
wQnlcXsxn/w2ESo77AMpB71lSqxT5jHdhQSiDCxSd6pAu0ORgvi8tW7IWKl8kD+H
arXtcpXm11jBPf4S3Xb/JF1A5eQTjYrr3EgB1I5lM1nBArx2QigCAhIgpoqCbSuc
dUsOI+LD+KCuxehW94TFHkcJjJ1Tdc6jz8Io0Oq5ADt3Tj/w3mh5kEGZvRC2Nx8y
lWl6eBy9QRARBaf2bQ1rv+PYen06T87NHk+WTnROqN4sHdPjTsh30k9phjL5B43u
LShT2vFKXW5uIJ7gOb+V8X1KTw7EsQ==
=Qsan
-----END PGP SIGNATURE-----

--Sig_/AhHSsggpw0kU4Mga+WYew2F--

