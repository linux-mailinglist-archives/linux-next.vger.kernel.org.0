Return-Path: <linux-next+bounces-7566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA6B06CE9
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 07:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B73614E2B4C
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 05:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6131DB95E;
	Wed, 16 Jul 2025 05:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NdqIiKML"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51B80B;
	Wed, 16 Jul 2025 05:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752642163; cv=none; b=tI3Ud9gTdckzfuMnjh5S0kecySEMeWADsufSd4DaPDHCwkSyG7GcidAOZSWEy8xaF31bhSKu5EHq8cZagM90bvOHzdJ0MXlmp5pLk/CohOm4imdJbv1k8bh+aDMHXd1bxZNZmNw/i/MNRUODd4zkbi7nbQVyAaax3kJmEiPkxEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752642163; c=relaxed/simple;
	bh=Bdm6Z+rIcZb52afCL05qwI9t84Oprd8A8oXx3N79dWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZMWGvX3keT33ALIkKyHvqnlyOsGIRagHiFuSAU4w6nK+HIRNLAcSpy7ooTSP+p0GfCFJP+hcnjAGgo+HjBu2mPg+OUejX4RlpVBeL5mr5sDxyT9whWOtpca3XDVEceukduXvUZqF2sU58IdOV/F8Ag3ORoIXwamO7Btgga+8pJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NdqIiKML; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752642041;
	bh=p97HC3PRGkP2K2c9i06BIOEYcA8nOtYu4zUjYK8Gjq8=;
	h=Date:From:To:Cc:Subject:From;
	b=NdqIiKML49VUDyVb1RaegLwzCdC17TrYEzolO2q+eiBUPpZOpumTtyobc4CNOKJ10
	 sQTRFlDbif1N58VHKXjyLv3ZwLBV4LQ5bVamYg287IN1O9tzr2/u0vRs/Cn0VyOVR1
	 foEH739fIZfFoCV5sM0F0efiVa+tabWnvfaBC8Gpvq7rfwtHTQRyetcN4CFU9P+ELR
	 YN5mXqMar7T+XoaTiM9PP9MXIMtcTkx6xPg3dPArxAkRKf1Af6kZRrnM1W++SfMWct
	 HsVA/X15taRukjAvWTnGexUGxU3u//qMFnqETM3pD+VibEjLsTasH6OX7vwehSBNTP
	 VDHe0if3GsZug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhkQc3zgkz4w2Q;
	Wed, 16 Jul 2025 15:00:40 +1000 (AEST)
Date: Wed, 16 Jul 2025 15:02:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the jc_docs tree
Message-ID: <20250716150234.52ec0d5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nbaLaHHG=c60=MtgujnNaI4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nbaLaHHG=c60=MtgujnNaI4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  Documentation/userspace-api/ioctl/ioctl-number.rst

between commit:

  15afd5def819 ("Documentation: ioctl-number: Extend "Include File" column =
width")

from the jc_docs tree and commit:

  1cea5180f2f8 ("block: remove pktcdvd driver")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/userspace-api/ioctl/ioctl-number.rst
index 677456c31228,4f1532a251d2..000000000000
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@@ -223,32 -219,31 +223,31 @@@ Code  Seq#    Include Fil
               fs/xfs/linux-2.6/xfs_ioctl32.h,
               include/linux/falloc.h,
               linux/fs.h,
 -'X'   all    fs/ocfs2/ocfs_fs.h                                      conf=
lict!
 +'X'   all    fs/ocfs2/ocfs_fs.h                                        co=
nflict!
- 'X'   01     linux/pktcdvd.h                                           co=
nflict!
  'Z'   14-15  drivers/message/fusion/mptctl.h
 -'['   00-3F  linux/usb/tmc.h                                         USB =
Test and Measurement Devices
 -                                                                     <mai=
lto:gregkh@linuxfoundation.org>
 -'a'   all    linux/atm*.h, linux/sonet.h                             ATM =
on linux
 -                                                                     <htt=
p://lrcwww.epfl.ch/>
 -'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conf=
lict! qat driver
 -'b'   00-FF                                                          conf=
lict! bit3 vme host bridge
 -                                                                     <mai=
lto:natalia@nikhefk.nikhef.nl>
 -'b'   00-0F  linux/dma-buf.h                                         conf=
lict!
 -'c'   00-7F  linux/comstats.h                                        conf=
lict!
 -'c'   00-7F  linux/coda.h                                            conf=
lict!
 -'c'   00-1F  linux/chio.h                                            conf=
lict!
 -'c'   80-9F  arch/s390/include/asm/chsc.h                            conf=
lict!
 +'['   00-3F  linux/usb/tmc.h                                           US=
B Test and Measurement Devices
 +                                                                       <m=
ailto:gregkh@linuxfoundation.org>
 +'a'   all    linux/atm*.h, linux/sonet.h                               AT=
M on linux
 +                                                                       <h=
ttp://lrcwww.epfl.ch/>
 +'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            co=
nflict! qat driver
 +'b'   00-FF                                                            co=
nflict! bit3 vme host bridge
 +                                                                       <m=
ailto:natalia@nikhefk.nikhef.nl>
 +'b'   00-0F  linux/dma-buf.h                                           co=
nflict!
 +'c'   00-7F  linux/comstats.h                                          co=
nflict!
 +'c'   00-7F  linux/coda.h                                              co=
nflict!
 +'c'   00-1F  linux/chio.h                                              co=
nflict!
 +'c'   80-9F  arch/s390/include/asm/chsc.h                              co=
nflict!
  'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
 -'d'   00-FF  linux/char/drm/drm.h                                    conf=
lict!
 -'d'   02-40  pcmcia/ds.h                                             conf=
lict!
 +'d'   00-FF  linux/char/drm/drm.h                                      co=
nflict!
 +'d'   02-40  pcmcia/ds.h                                               co=
nflict!
  'd'   F0-FF  linux/digi1.h
 -'e'   all    linux/digi1.h                                           conf=
lict!
 -'f'   00-1F  linux/ext2_fs.h                                         conf=
lict!
 -'f'   00-1F  linux/ext3_fs.h                                         conf=
lict!
 -'f'   00-0F  fs/jfs/jfs_dinode.h                                     conf=
lict!
 -'f'   00-0F  fs/ext4/ext4.h                                          conf=
lict!
 -'f'   00-0F  linux/fs.h                                              conf=
lict!
 -'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conf=
lict!
 +'e'   all    linux/digi1.h                                             co=
nflict!
 +'f'   00-1F  linux/ext2_fs.h                                           co=
nflict!
 +'f'   00-1F  linux/ext3_fs.h                                           co=
nflict!
 +'f'   00-0F  fs/jfs/jfs_dinode.h                                       co=
nflict!
 +'f'   00-0F  fs/ext4/ext4.h                                            co=
nflict!
 +'f'   00-0F  linux/fs.h                                                co=
nflict!
 +'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       co=
nflict!
  'f'   13-27  linux/fscrypt.h
  'f'   81-8F  linux/fsverity.h
  'g'   00-0F  linux/usb/gadgetfs.h

--Sig_/nbaLaHHG=c60=MtgujnNaI4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3MmoACgkQAVBC80lX
0GxOwwgAmxnFBP1MkgidiDGk0ioFO3qx4XASPDKxSv6p1X+QQ2j6kjUWECbZgd2P
axiQd7srnLTehrR60tAOIQVhmUP+n011JqeoIZxTtzShdUfc5MMqDMYNsTCgdKS/
Y0t+d6XF7JK9+eDJdOwltjmpEdxN1DO4PB73UpLBALKH49U0LTNld2Dqz8J3Tkan
6REkCRe97UcjxAC1oV+sx4jA2/sWrSYTQprX/EAoZelIzUAalCBng6hOHQsbKzuR
fL2owp6jC9jjwzfMslq/A1tcpfCvGALyKjUEVQks1inQzFkHgnctgJG0JRkZ2VB7
7+9lbjGu6Fa2+G+uMYQbLwN8PQTlIQ==
=b2CR
-----END PGP SIGNATURE-----

--Sig_/nbaLaHHG=c60=MtgujnNaI4--

