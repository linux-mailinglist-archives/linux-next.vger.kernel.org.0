Return-Path: <linux-next+bounces-7737-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A34B145F3
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 03:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B10D7A184C
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6464B2F84F;
	Tue, 29 Jul 2025 01:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s/byBlcg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8987410957;
	Tue, 29 Jul 2025 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753753626; cv=none; b=YPThF61ulXuZLeOdH+X8Oc2oxqPs7p8xeYN39VB7XSyXSLNfiPMY/MfkwcAjZbYMatBhNw3o3zvFkLcZ+AsSENy9PNGJj5fcV1p5dI1ggUNUPip48EPHbe1XAWHds2kmLogbQ0O672x0RurPOdIpameshd+EC0Awx8CtUKMNkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753753626; c=relaxed/simple;
	bh=yd8/gdTxsg7BCwN+XzjlvHSBn4P6HGDR2eLSqO5OIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=grYiiJ7YD+ro5mo83aPN5XeXeVt8LFBo0gJJgpHVpVqEZRvojH1vQFVxVKV8r+hm46FUyeM9a4eiqMmHbctp6FC0QqROElNxTsXFjPmNrCQMls+4UXzpHRTI2jYH0cnlyK7ZWyD2AAxSO89QMhuM1IlP5EyJSO+mBRi3wacq3EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s/byBlcg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753753414;
	bh=dVnieHhvtec+/x+mN6pUJkkUaZjGr5IZABNNXjP2Q6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/byBlcgX1NmJ7xgnFcvAwSA/5wLX1Ul41FhZ1XBRAHkOKABoksksRjCpgcQhWIFp
	 U+7gIz2Hx6+AcyTdnllALz6mpt528Yr8vHj7JMPIlKsN3H9BYTkK/niHo9zWEjlCwq
	 LZQ8ldnZYV7nZO4OJ2DCyeqtafXucQ+uO3sDyvqrcPg3RbZK6Z8orxyQdHwvVgPEFT
	 3ghiYCmh4lkZ0u9lmgGr5kKdsICgROk4k/iYmM+i+lgkH5xAIPEDIYrxEmOVs/+WKu
	 RJCFAHfJ/trf4c+B8a4n8Id4ZLnKrRvChBF7rTmnjwpiQX/adkgdrx7kaReZoqpwWu
	 4RLqIqVS3tJ/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brdR940y7z4w2N;
	Tue, 29 Jul 2025 11:43:32 +1000 (AEST)
Date: Tue, 29 Jul 2025 11:46:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jens Axboe <axboe@kernel.dk>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the jc_docs
 tree
Message-ID: <20250729114658.110c8353@canb.auug.org.au>
In-Reply-To: <20250716150234.52ec0d5f@canb.auug.org.au>
References: <20250716150234.52ec0d5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pglx31VE10ziz=QB9P=mM/O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pglx31VE10ziz=QB9P=mM/O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 15:02:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   Documentation/userspace-api/ioctl/ioctl-number.rst
>=20
> between commit:
>=20
>   15afd5def819 ("Documentation: ioctl-number: Extend "Include File" colum=
n width")
>=20
> from the jc_docs tree and commit:
>=20
>   1cea5180f2f8 ("block: remove pktcdvd driver")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
>=20
> diff --cc Documentation/userspace-api/ioctl/ioctl-number.rst
> index 677456c31228,4f1532a251d2..000000000000
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@@ -223,32 -219,31 +223,31 @@@ Code  Seq#    Include Fil
>                fs/xfs/linux-2.6/xfs_ioctl32.h,
>                include/linux/falloc.h,
>                linux/fs.h,
>  -'X'   all    fs/ocfs2/ocfs_fs.h                                      co=
nflict!
>  +'X'   all    fs/ocfs2/ocfs_fs.h                                        =
conflict!
> - 'X'   01     linux/pktcdvd.h                                           =
conflict!
>   'Z'   14-15  drivers/message/fusion/mptctl.h
>  -'['   00-3F  linux/usb/tmc.h                                         US=
B Test and Measurement Devices
>  -                                                                     <m=
ailto:gregkh@linuxfoundation.org>
>  -'a'   all    linux/atm*.h, linux/sonet.h                             AT=
M on linux
>  -                                                                     <h=
ttp://lrcwww.epfl.ch/>
>  -'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          co=
nflict! qat driver
>  -'b'   00-FF                                                          co=
nflict! bit3 vme host bridge
>  -                                                                     <m=
ailto:natalia@nikhefk.nikhef.nl>
>  -'b'   00-0F  linux/dma-buf.h                                         co=
nflict!
>  -'c'   00-7F  linux/comstats.h                                        co=
nflict!
>  -'c'   00-7F  linux/coda.h                                            co=
nflict!
>  -'c'   00-1F  linux/chio.h                                            co=
nflict!
>  -'c'   80-9F  arch/s390/include/asm/chsc.h                            co=
nflict!
>  +'['   00-3F  linux/usb/tmc.h                                           =
USB Test and Measurement Devices
>  +                                                                       =
<mailto:gregkh@linuxfoundation.org>
>  +'a'   all    linux/atm*.h, linux/sonet.h                               =
ATM on linux
>  +                                                                       =
<http://lrcwww.epfl.ch/>
>  +'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            =
conflict! qat driver
>  +'b'   00-FF                                                            =
conflict! bit3 vme host bridge
>  +                                                                       =
<mailto:natalia@nikhefk.nikhef.nl>
>  +'b'   00-0F  linux/dma-buf.h                                           =
conflict!
>  +'c'   00-7F  linux/comstats.h                                          =
conflict!
>  +'c'   00-7F  linux/coda.h                                              =
conflict!
>  +'c'   00-1F  linux/chio.h                                              =
conflict!
>  +'c'   80-9F  arch/s390/include/asm/chsc.h                              =
conflict!
>   'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
>  -'d'   00-FF  linux/char/drm/drm.h                                    co=
nflict!
>  -'d'   02-40  pcmcia/ds.h                                             co=
nflict!
>  +'d'   00-FF  linux/char/drm/drm.h                                      =
conflict!
>  +'d'   02-40  pcmcia/ds.h                                               =
conflict!
>   'd'   F0-FF  linux/digi1.h
>  -'e'   all    linux/digi1.h                                           co=
nflict!
>  -'f'   00-1F  linux/ext2_fs.h                                         co=
nflict!
>  -'f'   00-1F  linux/ext3_fs.h                                         co=
nflict!
>  -'f'   00-0F  fs/jfs/jfs_dinode.h                                     co=
nflict!
>  -'f'   00-0F  fs/ext4/ext4.h                                          co=
nflict!
>  -'f'   00-0F  linux/fs.h                                              co=
nflict!
>  -'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     co=
nflict!
>  +'e'   all    linux/digi1.h                                             =
conflict!
>  +'f'   00-1F  linux/ext2_fs.h                                           =
conflict!
>  +'f'   00-1F  linux/ext3_fs.h                                           =
conflict!
>  +'f'   00-0F  fs/jfs/jfs_dinode.h                                       =
conflict!
>  +'f'   00-0F  fs/ext4/ext4.h                                            =
conflict!
>  +'f'   00-0F  linux/fs.h                                                =
conflict!
>  +'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       =
conflict!
>   'f'   13-27  linux/fscrypt.h
>   'f'   81-8F  linux/fsverity.h
>   'g'   00-0F  linux/usb/gadgetfs.h

This is now a conflict between the jd_docs tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pglx31VE10ziz=QB9P=mM/O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIKBIACgkQAVBC80lX
0Gye9Qf9FQrH/+V7xuILJ7bjlxNH1JsPcuzC5SVoF6Nie/jLqAxw7X4rm0iHCGJc
tQggTjCeGjGWvyRCR1cFNVDhCgpV5335h3xcIQgREtMNdw/teIb9N7rVv/pbEnhK
qA2a857kVvkT/1qVum9MuvPPTSGszH9QVMJplyrlFsb1Yprh/4QziqG/W3IVRYc3
mzexfEXFca+pGKjyyXFyLQWhULc/jdhoYoLPBd4KM7Nc6yqSs0DrjH9XOfha3L6V
v0herJ/vuFPfTA5C4Fi25dYtcEepd9wG6/CfgDeTIyvTFhl5CcM266O7A4bwu0mq
lp8PwPBEAwnWMWU05s4TCwmam0DADg==
=+pNl
-----END PGP SIGNATURE-----

--Sig_/Pglx31VE10ziz=QB9P=mM/O--

