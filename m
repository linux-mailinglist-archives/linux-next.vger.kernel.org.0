Return-Path: <linux-next+bounces-3316-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D94995197A
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 12:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A119C1C21B24
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2024 10:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6271AE04A;
	Wed, 14 Aug 2024 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YtnSR/51"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E926A394;
	Wed, 14 Aug 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632962; cv=none; b=UNGa1TtBuQnHen/JeJZ1pcSAWclMvJYX3PeI1WJiG0SXyaEUNUw0ch67f7CDruKDvKWN9FPBOnklgimTx7ZPQdws6/E82ztUHW9p1CGAi8nyrhSuVO6tvL7dySR1++Kw/9EqXpqBsTXdzBIPaDVer4I7j60ACiRThRcYx/Ob7HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632962; c=relaxed/simple;
	bh=fbblGeCbLrnCs+qqYqi5kuH/ctWJc2mWSjtoQIs/tO8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNadTZ0eK5tZDpF5PPtDDnkm0qDDKlKdtg2Yr30Qvlzjx3s23IgKdcY+u7HJneUZ6jXShikoXxT1jeWktXO5MJasxz+trDtWEwKgIiAer76nVdlkK72AMA0PhnPpr/Fk9QuLk6le7ufpj7juMHK41wRUMw2vlKi76mSnoBSiYVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YtnSR/51; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723632954;
	bh=kywZf4/mQ5nvpAwyISJ/TlGKSOROKrhethGpoXAcu/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YtnSR/51woGO3gylrfv1/3b0bkQS3CHK65wog4CnpzkIbx8drgoNH7GmKyV2N82hT
	 wmCD5yjNFXuZi/7ijWaw6TSNyeECkbH5Vq0Yg/NXvAuhUdh2zDj1jNHLzpXpBO/jrS
	 UJPqN8hyIN8DIPDcTFVnWQnFxZ1vXtAYvDxb/IKFNPXwKIaCq23gGXSvYoWogJJ6w0
	 vCW/pYspo84XFD+k0TkIPWELKpJzw2xhmMFiEYTZxBy7eApuEmI0/OjyG8hqhZMCSR
	 DE9TkT8OWpkCDMvMo0F+X4VL74H5S/WF6rBY4NvoKGlPy7DZFRvCjv1osa6PbFSdgw
	 d7R00LXupG+eQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WkQCZ5RSjz4x1V;
	Wed, 14 Aug 2024 20:55:54 +1000 (AEST)
Date: Wed, 14 Aug 2024 20:55:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20240814205553.0578fe9a@canb.auug.org.au>
In-Reply-To: <51158ec5-9f27-4c3c-b61f-485e6abc2ae6@ti.com>
References: <20240813085147.786004fb@canb.auug.org.au>
	<51158ec5-9f27-4c3c-b61f-485e6abc2ae6@ti.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+fl4i_Gi9wy6js0rdA8GfcK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+fl4i_Gi9wy6js0rdA8GfcK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vignesh,

On Wed, 14 Aug 2024 15:36:44 +0530 Vignesh Raghavendra <vigneshr@ti.com> wr=
ote:
>
> On 13/08/24 04:21, Stephen Rothwell wrote:
> >=20
> > cfi			2023-07-09 13:53:13 -0700
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#cfi/next =
=20
>=20
>=20
> Could you please keep this branch included for a while? I expect active
> contributions (although will just be handful of patches) here.
>=20
> I will remember to keep this updated to latest rc when there isn't any
> new things to queue for a window. Thanks!

No problem.  I will keep it.

--=20
Cheers,
Stephen Rothwell

--Sig_/+fl4i_Gi9wy6js0rdA8GfcK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma8jTkACgkQAVBC80lX
0GzYaAf/Z9Zq0W6DUevOcYZ/VUeHajv7Oq5iCPcTsVXnMeC5C6wl6hbj5hpukVgr
6ElIgl3HbH3ENpmOnU9Au9tPQdq+j3E8bDOLGS2hfbMhbgbfsGmUkrqBjV3cjPZN
yTu24gLSib/tmAH00qY/5mZaOGhor2vfxsiSNeEM+jMEz2x7S0vFuxDwdMssWS9t
cCL0E2eMysvdwvfzhfhUhK4zEpzI8b4fyeYPuMGtgQzk/Svts7xvdkC6jjrUyx2b
TmeogMoaO/0K5zVHVz4Sm/V60kk/UlTSskJy8AhzQbNbMACf4ycNLzJZRsOh+9a/
7FncYTprCVi3eNCSHtGX3PRcR9cSQw==
=Marb
-----END PGP SIGNATURE-----

--Sig_/+fl4i_Gi9wy6js0rdA8GfcK--

