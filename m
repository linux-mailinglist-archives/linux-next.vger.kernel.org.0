Return-Path: <linux-next+bounces-6976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C7AC75F2
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 04:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3AEB500FC2
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 02:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CF719DFB4;
	Thu, 29 May 2025 02:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pKLC2uhi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173C19C578;
	Thu, 29 May 2025 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748486979; cv=none; b=BzFrIYjPkb6tK5ukHSRqElN1+kEOCUuoFxXE6q7Ru2arzG2O+7tRB259rE3fYtbvFLovi5WrPdLH64lFSbkjr39tPXqFflQ/tXk9zhVBaDNq3n4Hdc6iILDBxJdN6iejaoX4DbWVhQJU8m+bifGvjeTxexlwxqZ4HbYfQgnDKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748486979; c=relaxed/simple;
	bh=lIkGhfeBYdxX7uVDlsaPB0qJMrMUSjlDl0U3BfD2upM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqblFil7/V479LPpsfw4OKHAIC4TFzuQKStxKOM38pZnEgSGVF4sV9UNdY8IhzGf8xWVFxlJr2/CVZa+4iRaTOkan672m1oBw3G11MS3Ug+emLcBfkiXTNzQNWkt4bCVStv2kllEXULBEA9HAyJiJ9fqyp+kHDpIEHiv67UvNGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pKLC2uhi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748486972;
	bh=Ym1Itoust5YDpfBzANq2zHelKGzCYM/1jBNRYv6YHfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pKLC2uhi1pp+TCP2kOM/sNEOxyWRu4xj5eKMVq1aokZwZxWnhoF6RPwDRZRXAQ1IL
	 NCi4/TqBtHiy+vwjqeaoVINNch64QvNJDxa3t7C7IwhCB/HZwQP02vPHLt06VhpW+z
	 lyiOwfm7RpfPy/NsxzEiw0cD0Mg4AV4hhtcbNTXG66oMtbCKBxIEE4TNJR422Rrpkk
	 EU1Sti10ltW6T4yOJgpShiXkTsghaqA+UzkECNbBTs0/23fk8kkIVC9rTkt0pKE5NC
	 GMCRNP/MKaE9xGucOiEUgVd4LwzBaHswDHKCmtoLMY88FdQT5NbpsB64VCP42i3lny
	 AQnzP0dmPaLpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b79nQ084Zz4xCy;
	Thu, 29 May 2025 12:49:29 +1000 (AEST)
Date: Thu, 29 May 2025 12:49:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Jai Luthra <jai.luthra@ideasonboard.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Message-ID: <20250529124929.5217c6d9@canb.auug.org.au>
In-Reply-To: <20250428113052.38cf10da@canb.auug.org.au>
References: <20250428104905.2b54643f@canb.auug.org.au>
	<20250428112200.6f5cf3bd@canb.auug.org.au>
	<20250428113052.38cf10da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BxyjmXhuEZmxVsbCWw0eRw=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BxyjmXhuEZmxVsbCWw0eRw=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 28 Apr 2025 11:30:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Mon, 28 Apr 2025 11:22:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 28 Apr 2025 10:49:05 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Today's linux-next merge of the v4l-dvb tree got a conflict in:
> > >=20
> > >   drivers/media/i2c/ds90ub960.c
> > >=20
> > > between commits:
> > >=20
> > >   3ec29d51b546 ("media: i2c: ds90ub960: Protect alias_use_mask with a=
 mutex")
> > >   818bd489f137 ("i2c: use client addresses directly in ATR interface")
> > >=20
> > > from the i2c tree and commits:
> > >=20
> > >   24868501a744 ("media: i2c: ds90ub9xx: Add err parameter to read/wri=
te funcs")
> > >   2ca499384e98 ("media: i2c: ds90ub960: Add RX port iteration support=
")
> > >=20
> > > from the v4l-dvb tree.
> > >=20
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.   =20
> >=20
> > The actual resolution is below ... =20
>=20
> I hit the wrong key :-(   Resolution below.
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/media/i2c/ds90ub960.c
> index 5a4d5de110bd,1877eb735cc7..000000000000
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@@ -1056,11 -1271,10 +1274,12 @@@ static int ub960_atr_attach_addr(struc
>   	struct ub960_rxport *rxport =3D priv->rxports[chan_id];
>   	struct device *dev =3D &priv->client->dev;
>   	unsigned int reg_idx;
> + 	int ret =3D 0;
>  =20
>  -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg=
_idx++) {
>  -		if (!rxport->aliased_clients[reg_idx])
>  +	guard(mutex)(&rxport->aliased_addrs_lock);
>  +
>  +	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_i=
dx++) {
>  +		if (!rxport->aliased_addrs[reg_idx])
>   			break;
>   	}
>  =20
> @@@ -1069,15 -1283,18 +1288,18 @@@
>   		return -EADDRNOTAVAIL;
>   	}
>  =20
>  -	rxport->aliased_clients[reg_idx] =3D client;
>  +	rxport->aliased_addrs[reg_idx] =3D addr;
>  =20
>   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
> - 			   addr << 1);
>  -			   client->addr << 1, &ret);
> ++			   addr << 1, &ret);
>   	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
> - 			   alias << 1);
> + 			   alias << 1, &ret);
> +=20
> + 	if (ret)
> + 		return ret;
>  =20
>   	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
>  -		rxport->nport, client->addr, alias, reg_idx);
>  +		rxport->nport, addr, alias, reg_idx);
>  =20
>   	return 0;
>   }
> @@@ -1089,11 -1306,10 +1311,12 @@@ static void ub960_atr_detach_addr(struc
>   	struct ub960_rxport *rxport =3D priv->rxports[chan_id];
>   	struct device *dev =3D &priv->client->dev;
>   	unsigned int reg_idx;
> + 	int ret;
>  =20
>  -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg=
_idx++) {
>  -		if (rxport->aliased_clients[reg_idx] =3D=3D client)
>  +	guard(mutex)(&rxport->aliased_addrs_lock);
>  +
>  +	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_i=
dx++) {
>  +		if (rxport->aliased_addrs[reg_idx] =3D=3D addr)
>   			break;
>   	}
>  =20
> @@@ -1103,12 -1319,18 +1326,18 @@@
>   		return;
>   	}
>  =20
>  -	rxport->aliased_clients[reg_idx] =3D NULL;
>  +	rxport->aliased_addrs[reg_idx] =3D 0;
>  =20
> - 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
> + 	ret =3D ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx=
),
> + 				 0, NULL);
> + 	if (ret) {
> + 		dev_err(dev, "rx%u: unable to fully unmap client 0x%02x: %d\n",
>  -			rxport->nport, client->addr, ret);
> ++			rxport->nport, addr, ret);
> + 		return;
> + 	}
>  =20
>   	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->npor=
t,
>  -		client->addr, reg_idx);
>  +		addr, reg_idx);
>   }
>  =20
>   static const struct i2c_atr_ops ub960_atr_ops =3D {
> @@@ -3231,21 -4370,12 +4376,14 @@@ static void ub960_txport_free_ports(str
>  =20
>   static void ub960_rxport_free_ports(struct ub960_data *priv)
>   {
> - 	unsigned int nport;
> + 	for_each_active_rxport(priv, it) {
> + 		fwnode_handle_put(it.rxport->source.ep_fwnode);
> + 		fwnode_handle_put(it.rxport->ser.fwnode);
>  =20
> - 	for (nport =3D 0; nport < priv->hw_data->num_rxports; nport++) {
> - 		struct ub960_rxport *rxport =3D priv->rxports[nport];
> ++		mutex_destroy(&it.rxport->aliased_addrs_lock);
>  +
> - 		if (!rxport)
> - 			continue;
> -=20
> - 		fwnode_handle_put(rxport->source.ep_fwnode);
> - 		fwnode_handle_put(rxport->ser.fwnode);
> -=20
> - 		mutex_destroy(&rxport->aliased_addrs_lock);
> -=20
> - 		kfree(rxport);
> - 		priv->rxports[nport] =3D NULL;
> + 		kfree(it.rxport);
> + 		priv->rxports[it.nport] =3D NULL;
>   	}
>   }

This is now a conflict between the i2c tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BxyjmXhuEZmxVsbCWw0eRw=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3yzkACgkQAVBC80lX
0GzPwAf9G0b7tKSX/vAwlVzrXPKX6teygBFqZ0tu1MFU3fkAxHWAc7XEjhQLekMr
KLXbW/S35Zv5a/Mf6JKU18LsSDbaKpyKSl1snva+amVuZHidAIRNlmhtauEGl3MD
YjV6mrsGUP+ZXGmeCeUZmspIPqCb0jG+i8vVAwc6dvRFf8IzMp+3n5tteH0Cx50V
j63Ia8teLq2g1i9RWvVU1BLQyY1ScG6CimDrzKLkv8nan3i9BXLPyCC5DdguJocN
/5n/F75i2vF2tEEL57R0VO9alu8xUID4lNCXzNpp9IbJH68icIHmEB8QcyppVLM0
jimPVMletikB1A62JDD9fI+srn2jwA==
=qQ5q
-----END PGP SIGNATURE-----

--Sig_/BxyjmXhuEZmxVsbCWw0eRw=--

