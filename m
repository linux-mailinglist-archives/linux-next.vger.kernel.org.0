Return-Path: <linux-next+bounces-3628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1A96E5FA
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D9F81C22A84
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617591B1D54;
	Thu,  5 Sep 2024 22:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TO58wV+H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9201A3026;
	Thu,  5 Sep 2024 22:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576834; cv=none; b=klwiy6+yRsVxYnnOHUeAqxxvnB93CN/8nl92TWhZeNYjtRlscSnu0GvnyzaTwGCv1AL9JvlGR9y54PXcqSq+8oJjrfp8WSFfjzcz4evlI4hkIz2Xr1TRPwmGzbNXE39Qxnb7rJKijTkrbymegZz1JFOvBss8QRn3yn+94OGPfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576834; c=relaxed/simple;
	bh=AFEBkuocnjOSuH4Ti5BcjfAnH3PAq6mITSOo4derMHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pL8wPdGzC3MalUW3POeURRPCdvZx5EfEcCpEcX4wxZ2gZ5A7PtkWdATdAhBtBLGHF0kDTxXbkFZt19v/vNoM0eiPX5+nfs48HL5VtoF5GRtHZAqek+FhkC9RGBrXuN5Tt0guaEDRHVaFkjfh2NrCXdZ/EHi9atNKD9fWD8y7izA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TO58wV+H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725576830;
	bh=bKqHT3BlqHXl+dt7zF9RpbNhUKh6FD3z26r8NKmP5Mo=;
	h=Date:From:To:Cc:Subject:From;
	b=TO58wV+HYigGzPSAANvYSrfUjYmvnHqZxKeNVkiP/Xr0T3Tr5+fnKRPdr3D0qk0ze
	 e/PZB5BNh6ZgwHuLxCMu4VU9aAJrMJxSvuvXVeHH3jn3iwGMUG4QOq6mxhoi1v0nBJ
	 c4vW+Xgu1J4E5Fa8XdFy2dD8mCQ/G6aXjgv6JG/VDpLJwTQJXo9nj+4iZLJE3S0gvj
	 mhv2eM41E//aFFEzQeG/9mKpty8ZOtTsgMVSeCa4WN1zzYpPkCrys/IAJqgeaf7SPG
	 me0pTyROa66gzvs5rWNjhfjuwG6haUMG0kKaJah2DYa7tREkhOHrGdIN50LHK+F1O+
	 bm8Bbxvg5Nbxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0F5p4Xjnz4x89;
	Fri,  6 Sep 2024 08:53:50 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:53:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Jeff Layton <jlayton@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <20240906085349.4531d454@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/auM31/Ie/7uPLSvfuewWOgR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/auM31/Ie/7uPLSvfuewWOgR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  include/linux/fs.h

between commit:

  77b863655092 ("fs: add a flag to indicate the fs supports pre-content eve=
nts")

from the ext3 tree and commit:

  a037d5e7f81b ("fs: add infrastructure for multigrain timestamps")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 6f3a50c0a958,a6b2addd80db..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2501,7 -2542,7 +2543,8 @@@ struct file_system_type=20
  #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
  #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events =
*/
  #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle v=
fs idmappings. */
 -#define FS_MGTIME		64	/* FS uses multigrain timestamps */
 +#define FS_ALLOW_HSM		64	/* FS can handle fanotify pre-content events. */
++#define FS_MGTIME		128	/* FS uses multigrain timestamps */
  #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during ren=
ame() internally. */
  	int (*init_fs_context)(struct fs_context *);
  	const struct fs_parameter_spec *parameters;

--Sig_/auM31/Ie/7uPLSvfuewWOgR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaNn4ACgkQAVBC80lX
0Gzq8wf/cNJoK4imn2ksNI81uuk1PfDDJl/cOlbKT9lNu2EgbZPl2PGLFu7tERTj
lazVOIYz7MqM3am8eYTBvOz9AHbFxO0Zf5970UHcTHLwhXSDp7CV5a5DoSrtPGxk
nc+FtUKoxYaFUYRip99+gMVBMF4M0bgalphHqYvDX78bN+BhwNHGSfratMCLT/Qw
Eb+HCZei3uBnkfGZTzLY4sX2XgAozPjkUQN54Iruc4wJd+pMBX3ufDE1xsdg0/MC
hpEJ0jOtis5VBKBrT9qphPTWtaD1RRleBNVtU7oHl2okMeyC0mLpejyqab4t8StI
bIVbN8tM/+t9FCKbvEp5LkQ85DJ7rQ==
=xpfB
-----END PGP SIGNATURE-----

--Sig_/auM31/Ie/7uPLSvfuewWOgR--

