Return-Path: <linux-next+bounces-6727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A48AB4C52
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 08:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3EF19E73D7
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 06:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388DB1E885A;
	Tue, 13 May 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a7BkOpEC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844B1A5BBC;
	Tue, 13 May 2025 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747119168; cv=none; b=fqlF8q1wQ4NPMtK17gK16BWvENU3jIZmKPbzc7RvPkd+tTtQhYsjujhnPegXZpbKNmy+i2mvVdcBXhSd5QCOJZPuS5yXBdC3O5ZEUImptMKNaZetct3On//5yJ9qZMieaMfPeJfTdTELRr2GT/ch1OjpTTwF+uZyN8Nh9R3jdD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747119168; c=relaxed/simple;
	bh=+z/e+aboEOztJsWgaWpu1EcA/uHgHYW0ZV2vM+ess4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uqmAQFOPTaGJnrb/Uw3nwBkKRpkQ6+L4zy9gvwI6Gstz/OTuufLFrw9KknJ2xlkLI4xHlm1KQo4Hvz8lt8qAXSAVaBMK8BmQkwyzH+bz+3evVoT2j8TrqJFI+OqU9cQ1gUIblmfYKJ+63QdRbKWtzpfdI155e1Rmx5xiUTIFvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a7BkOpEC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747119161;
	bh=9OTQgj5muoWkxqojS3cZ5J286S4W1Edkg/LlrpDXOvE=;
	h=Date:From:To:Cc:Subject:From;
	b=a7BkOpEChD3ZcStCF3/WBJ3awxaKZjdBCyOcnuRztgtWkOsHJ/cAky3WIiLtwG/zo
	 Dg4fCsEd4TGuhP6aO7vlSIn4GAuWopX0Hppz0C6FdeBF9VN/WqXy3QiKDyXiDGDFko
	 Jjn2YOPIRGZXef2QHUWVLGmZJH6p1m966TupTPhAhTeXmfvOSZh+oPpZjcTCdWoYQf
	 hGwBi/BrX/XwcZfQpG7lV2XslJmTts7wCvB9Q4a3nQcAyYX10axND2Nd64hntlMR9M
	 KpsXab066kEzEOoABWUTOTnMXC814ipVko1lnm8n6WrwtN/x9Bc2WXAu6nBjPfWM4l
	 JYKOsDQGAbP1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxRxP4m8Yz4xN3;
	Tue, 13 May 2025 16:52:41 +1000 (AEST)
Date: Tue, 13 May 2025 16:52:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20250513165241.41f9f20e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6c6yHfNi19lrI0_vcUcCLtk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6c6yHfNi19lrI0_vcUcCLtk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/base/cpu.c

between commit:

  f4818881c47f ("x86/its: Enable Indirect Target Selection mitigation")

from Linus' tree and commit:

  4e2c719782a8 ("x86/cpu: Help users notice when running old Intel microcod=
e")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/base/cpu.c
index 50651435577c,1c4359366cd7..000000000000
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@@ -600,7 -600,7 +600,8 @@@ CPU_SHOW_VULN_FALLBACK(spec_rstack_over
  CPU_SHOW_VULN_FALLBACK(gds);
  CPU_SHOW_VULN_FALLBACK(reg_file_data_sampling);
  CPU_SHOW_VULN_FALLBACK(ghostwrite);
 +CPU_SHOW_VULN_FALLBACK(indirect_target_selection);
+ CPU_SHOW_VULN_FALLBACK(old_microcode);
 =20
  static DEVICE_ATTR(meltdown, 0444, cpu_show_meltdown, NULL);
  static DEVICE_ATTR(spectre_v1, 0444, cpu_show_spectre_v1, NULL);
@@@ -617,7 -617,7 +618,8 @@@ static DEVICE_ATTR(spec_rstack_overflow
  static DEVICE_ATTR(gather_data_sampling, 0444, cpu_show_gds, NULL);
  static DEVICE_ATTR(reg_file_data_sampling, 0444, cpu_show_reg_file_data_s=
ampling, NULL);
  static DEVICE_ATTR(ghostwrite, 0444, cpu_show_ghostwrite, NULL);
 +static DEVICE_ATTR(indirect_target_selection, 0444, cpu_show_indirect_tar=
get_selection, NULL);
+ static DEVICE_ATTR(old_microcode, 0444, cpu_show_old_microcode, NULL);
 =20
  static struct attribute *cpu_root_vulnerabilities_attrs[] =3D {
  	&dev_attr_meltdown.attr,
@@@ -635,7 -635,7 +637,8 @@@
  	&dev_attr_gather_data_sampling.attr,
  	&dev_attr_reg_file_data_sampling.attr,
  	&dev_attr_ghostwrite.attr,
 +	&dev_attr_indirect_target_selection.attr,
+ 	&dev_attr_old_microcode.attr,
  	NULL
  };
 =20

--Sig_/6c6yHfNi19lrI0_vcUcCLtk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgi7DkACgkQAVBC80lX
0Gw6xggAlkxHimw8zY1LZEvt3ksFZCeZvCsCH8LEdiRDcHJdOxpLS7Y3UL6itRS5
luO6bcSJhQG9puIFnEleIWOD5BJ+Fav3fYpkALH7t2f6U3hDAwkyYK09xZnc+7zT
N9rH6TT3566kYjvVb5mkik0ylXy6fdTZVkAWl1FKW79NaQ8iYJ/vgaq6jXtPKe3k
JaRKnkN4FKfnXwHRPMm3PCpoRB3QhRna/gvIONl+V5K4WjwG10ydHKq2aaZovq7N
o5AsJuB68K1ki7fIN9UsYoBC5C0QNCeZuV50hZFySqCAnoNf5vIKknaXmY75i4oO
7zhtOBZWRhdUlCdnXW8aGLQJWXlv3w==
=eKRC
-----END PGP SIGNATURE-----

--Sig_/6c6yHfNi19lrI0_vcUcCLtk--

