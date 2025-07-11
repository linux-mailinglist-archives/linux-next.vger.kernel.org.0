Return-Path: <linux-next+bounces-7469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E557EB0107D
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 02:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B17F56445F7
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 00:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7384622EF5;
	Fri, 11 Jul 2025 00:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OSJMllmz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2C5101E6;
	Fri, 11 Jul 2025 00:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752195503; cv=none; b=cQdqkuzooQQkKBsxbEeUMno28lgnqfya5gAM1OAJq05c/2OWwdUQdQuLt6jZoRF0SQjCSeDJLpe7oIrOLbJyOvs3vBJQyv//ZvibgFEXpFqyDFTw6vnPlphBNVerlwdniJ86Yt9b4Q6bviswkefh9brQPSF5zztS3cmUFeIuVFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752195503; c=relaxed/simple;
	bh=nQgbCUnHSE1BV+VKX/q2oxRSIF1tWWJbE9oHolY7rX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fp0GsUWxLziQTeunBQYgt7cJLvw5DX64g3z/DrvY/VxGPYnUMJv8yTgE/4asWshK/+EnbEOnnBxJqRDYWIK3fN9k4EYH9tLkzsJB85wX6JP9b4dmM2yzdcOoKJAqfIoOh0fb1mlE4SbBQC/KvxZPyIbdJfLdjkvgRovkA5Asp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OSJMllmz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752195409;
	bh=4bVSc7zEJGZIxhXRM+75TSeVqKTSEE/z9XkoTfOCYmQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OSJMllmzT5NS+DNSM6VfSD3iaP626/j+j4x5vSV+z2SCGJqiYZk/vr0TLZ3YrP1gq
	 /mzDVAfzTerpcbRkE764NGWwngSufLoVDiY4y+Va9Kw7WpujDO7dZwdafvBF5UN00g
	 mfVyGXl78/4GwC1GEgFZRDztuxGu00gXhtb1X/OmiCrUXtcvzPP41cnZhwfaEQNw9q
	 51DeO/j2aTT2AmrWRIltfgep72SaMLcla4l7irdaUcxfefalFcW3ynPiZsBPylk0eq
	 EoBPasQfQhqVPydKvWC2DVDUsJGRiTJFENhtubfY3CC1gazltZb0GeWAR6st2Wad2m
	 EwdSUup/HhIKg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdYFY2r0vz4wcd;
	Fri, 11 Jul 2025 10:56:49 +1000 (AEST)
Date: Fri, 11 Jul 2025 10:58:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <20250711105804.3447e832@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2eue3gnPJ5qC1KmZ.qQmvP4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2eue3gnPJ5qC1KmZ.qQmvP4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

kernel/kexec_core.c: In function 'kernel_kexec':
kernel/kexec_core.c:1138:2: error: label 'Resume_console' defined but not u=
sed [-Werror=3Dunused-label]
 1138 |  Resume_console:
      |  ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  fbb5aa47e7b0 ("kexec_core: fix error code path in the KEXEC_JUMP flow")

I have applied the following fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Jul 2025 10:35:39 +1000
Subject: [PATCH] fix up for "kexec_core: fix error code path in the KEXEC_J=
UMP flow"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/kexec_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 842611c0b51a..351cd7d76dfa 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1135,7 +1135,6 @@ int kernel_kexec(void)
 		dpm_resume_start(PMSG_RESTORE);
  Resume_devices:
 		dpm_resume_end(PMSG_RESTORE);
- Resume_console:
 		console_resume_all();
 		thaw_processes();
  Restore_console:
--=20
2.50.0

--=20
Cheers,
Stephen Rothwell

--Sig_/2eue3gnPJ5qC1KmZ.qQmvP4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwYZwACgkQAVBC80lX
0Gwb6QgAkKEZkdCifICMGdanjTPTdnPiTpAN837U80QyUJnn1jOZDCDZ82saC24C
yvdPXd8iA0TtlATudKRA+V+avzLFywcDYznO7+LLqH53xKIXmHEmWLpzZIFMrUo5
V015f35IL3yCwzTPpNK6rXKfv1INItLIZNXorrUtEBdPK2M5eSB3emVkzau34c/S
FAi6mgwRomFbdq3XhUtz9HfcXAQUlL90+0hAWU/52HgZvuDd7D54KJL/W1yUPSbM
rOJPrkAejrA3V6FRiHDMDx6+Dc00b0ber8rkohNZ5daA6eGGGrnsiecECOW6tl7f
sAv3yjgjAWpB/VeGOwMlnYxeh7OHCQ==
=1PxH
-----END PGP SIGNATURE-----

--Sig_/2eue3gnPJ5qC1KmZ.qQmvP4--

