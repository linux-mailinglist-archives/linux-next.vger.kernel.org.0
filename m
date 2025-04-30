Return-Path: <linux-next+bounces-6449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA2AA41CE
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 06:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3671C018B1
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 04:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A681129CE6;
	Wed, 30 Apr 2025 04:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qIfk/1e2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9753017BCE;
	Wed, 30 Apr 2025 04:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745987020; cv=none; b=ZvmttkSeefhIuDNu1wYsUrfJ6qWgC0aE9eeCKlPhkBIfwduASnWh/R+eFcSMO64vce7QfblGa7HhWaxMvgcyCvdWnImY/C0xbKnfIoaTbbvgAA1gvDQJFpt5gKA7kczKtKYHL1mxjhWLN87NW/KzveKOpVE6nudurBarhYm9p9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745987020; c=relaxed/simple;
	bh=O98FWOskzEjhv8AsCbD58NyRKD6v9QMlVURgUwTo2+U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B/0QQZaZFA8FRrlLg+d8miuxrMWuUpZCTmtZhEPwWTP9j5zqNXzEONUHdm0zTUrDUNZu5uqWTI5R1ODZ0yKVoF/2LnC0DPngZKYlws6TfwoqeXZNh/4ey+wBprnhA02+5aPuhG580qv01LgV9DStx0WVYTL75OxyLLpWERpn4Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qIfk/1e2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745987012;
	bh=ZSeiAmQnv3iJLnl+NkZtlIkDMhPpBo8ssW9VuZMAzZE=;
	h=Date:From:To:Cc:Subject:From;
	b=qIfk/1e2Zmo+qcAiK2i0qxlKrlv8pjASU9VSaBpRwBWPTl7NZNIlG/UV/5bt2t9+Z
	 PIC1F2nhNzm9BB0YWxMfWhHlH8f06KJWHdC5dCMWr0fCKm0+BomUEXpwvkjRBQyYc5
	 C56pw9YSUOiFqfxJ6xS8+xzfYCrMRBy8dGBhPelBcnyZXkb/GqX/8e7mOd2+RsZwXJ
	 xRTNmly+DJjYO7K6jl1kT5eVWZ1X/k1uWQSjSnnV6G5zwa44MsF5aLc7BwjfoIWQfY
	 TlVXpfd5W4CmioGDzzU+FDVUWHz0EMwkasAnV8T3IEmFh4H20WPRt7A2lha6hKHrJM
	 9ivXFgE19rWUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnPFJ2J00z4wvb;
	Wed, 30 Apr 2025 14:23:32 +1000 (AEST)
Date: Wed, 30 Apr 2025 14:23:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Eric Biggers <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Steven Chen
 <chenste@linux.microsoft.com>, Tushar Sugandhi
 <tusharsu@linux.microsoft.com>
Subject: linux-next: manual merge of the integrity tree with the
 mm-nonmm-unstable tree
Message-ID: <20250430142331.468074f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3ZSz2RhNa+53.6kQ_tTaDlE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3ZSz2RhNa+53.6kQ_tTaDlE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the integrity tree got a conflict in:

  kernel/kexec_file.c

between commit:

  912e32afb858 ("kexec_file: use SHA-256 library API instead of crypto_shas=
h API")

from the mm-nonmm-unstable tree and commit:

  9ee8888a80fe ("ima: kexec: skip IMA segment validation after kexec soft r=
eboot")

from the integrity tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/kexec_file.c
index ac915eabb901,0adb645072aa..000000000000
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@@ -762,7 -800,17 +786,14 @@@ static int kexec_calculate_store_digest
  		if (ksegment->kbuf =3D=3D pi->purgatory_buf)
  			continue;
 =20
+ 		/*
+ 		 * Skip the segment if ima_segment_index is set and matches
+ 		 * the current index
+ 		 */
+ 		if (check_ima_segment_index(image, i))
+ 			continue;
+=20
 -		ret =3D crypto_shash_update(desc, ksegment->kbuf,
 -					  ksegment->bufsz);
 -		if (ret)
 -			break;
 +		sha256_update(&state, ksegment->kbuf, ksegment->bufsz);
 =20
  		/*
  		 * Assume rest of the buffer is filled with zero and

--Sig_/3ZSz2RhNa+53.6kQ_tTaDlE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRpcMACgkQAVBC80lX
0GyH0ggAoV8adaVX1n15ldi8UwqpTLfaa/UmDJXr29jyr1tkIQifHAqaxvPNrr7S
wK2MnyyrvBdBllmza9piChbH9oSkdTVtFf39PGg2X3zfkYiQT/xkHgalt3ZrCL7c
oLHaCMo7smA+KK3PSFUFStq5kPLeHiXrCibpM4B2C9ePbmEwrrZgANzVgzVofyN/
zPuXiuh5JzDguDqikVj50WZ6ec9ojHqAwCldmnw1uJVyBXaxQ8D07QYcnBiPuFVE
31qH81o5EPD4SB5nHPy9/40b/uRSckxmg2ezxTgI8v3bQkAyNmHx9vdjEN4tfIgQ
X6mCpr06xj+I2VB/GKnagSwUhXHaxw==
=QEfJ
-----END PGP SIGNATURE-----

--Sig_/3ZSz2RhNa+53.6kQ_tTaDlE--

