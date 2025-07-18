Return-Path: <linux-next+bounces-7617-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 097AFB09B16
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 08:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2D47A452AD
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 06:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B9D1DF994;
	Fri, 18 Jul 2025 06:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CqD0dyvi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7317578;
	Fri, 18 Jul 2025 06:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752818662; cv=none; b=n0pU9WDkj630IwAVf3LJAiPd4CYGnXukm2TYZrHnQHvv79QN8TlQDQOFDcODwMod/LzRXffHF8ijGciD054EuoNsvtvEO5U7SFrrtBlMWOqpvFqLHhMG+ey7VQMsI5f3h5/Sk6klziNKrhprkttFHX8hySnu8uIXoRIroY5nsrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752818662; c=relaxed/simple;
	bh=wf/hravHlEJOVBzGs8JdFGSe+OuIMU8btgpx5fHC1wU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nfsua8+UoNT5PmY3irLBzaAkLLYZ3RYqz2nuoBnG/+iA4KeK+k2nGuB6frxvB1o5oORmmSN/8OaWc0XyCyZlYLAmqv1eb5Id8J3HrD8SEyeU5mz2PxTI7kOuE40JJRw99PcVDgngGvojcQojtXAyX45fbtpSx2v3K4qs2CZMjqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CqD0dyvi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752818521;
	bh=vZ0caIWbcYMSdzQC0YG3LfOTL45OUgfdaAhdU+gMsxk=;
	h=Date:From:To:Cc:Subject:From;
	b=CqD0dyviOLOmh/m4kyAikCVokip5XsUkA1rnH+gDpR58iyu7XEFtWUzmzvQ2uykdf
	 JfqLp0VSapmdKLbIZnlEavLV1irjUwXMPauisGonwd54fRU7NFJMxavCQ6Co1r8goO
	 UBPAkNOYLo5bG3blAbEXL53TWfNgX7qM5nBNwPiSx9K7WdwgdJ7h4lkqK/hW4jJ37R
	 EU4CjoMB4NaaArIxreLIswEtMm/oqktkrBMqugElETUaFjzLOMgwb5yXf4/Dt87RPG
	 GYNXK2xC/hm9/Hy6bnYCEJMTaUUTJ/jRv5FNUprZjHcBNHVVpEyehXObDy8Jftcfe4
	 E9+s7PQDaJ9NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjzhS3XL8z4xPd;
	Fri, 18 Jul 2025 16:02:00 +1000 (AEST)
Date: Fri, 18 Jul 2025 16:04:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the devicetree tree with the mfd tree
Message-ID: <20250718160407.011e2389@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8jIM0Qb_UxlxYVxUMHGFqOS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8jIM0Qb_UxlxYVxUMHGFqOS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/trivial-devices.yaml

between commit:

  e65e2b0d0f7e ("dt-bindings: mfd: adp5585: document adp5589 I/O expander")

from the mfd tree and commits:

  4fb2210866f7 ("dt-bindings: trivial-devices: Add Analog Devices ADT7411")
  828e50188de5 ("dt-bindings: trivial-devices: Add undocumented hwmon devic=
es")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/trivial-devices.yaml
index dd6297392f72,95c9bd36cc63..000000000000
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@@ -39,6 -39,16 +39,14 @@@ properties
            - ad,adm9240
              # AD5110 - Nonvolatile Digital Potentiometer
            - adi,ad5110
+             # Temperature sensor with integrated fan control
+           - adi,adm1027
 -            # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
 -          - adi,adp5589
+             # Analog Devices ADT7411 Temperature Sensor and 8-channel ADC
+           - adi,adt7411
+             # Temperature sensor with integrated fan control
+           - adi,adt7463
+             # Temperature sensor with integrated fan control
+           - adi,adt7468
              # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-=
Down Silent Switcher
            - adi,lt7182s
              # AMS iAQ-Core VOC Sensor

--Sig_/8jIM0Qb_UxlxYVxUMHGFqOS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh549cACgkQAVBC80lX
0Gzp7Af+JrxtmVBDAwpaOhQmTo7VnyEoYtrGSX+26JEVsNl6ZDT4jJvyFKAXd0vF
oO344cIvtoFDaCpRU4tn1i7kps3uYYjO8UY52dgImW22HwBbD4ihzGyEXp5tV1aw
I/LPKqt/n+hYMU3RcIum+cAifO5i0n3Q2uQ14Sdf+Durfg5aU+3eu6ml8K/UUxqA
oqDlPj0sgaEomWEBZjXizbG45+u66VLIsO0FgBrjjjz82Ku4vV+sRTx96AHHe2ZV
64EC3beMNDspPywC0Heho9JY4zR6Zm3vGrpsJ6FEN/FTMY0n6Od0+YK+4i8aARUd
Aapn+MoGGGMqbzihxMgacdKfELO7gw==
=SwO5
-----END PGP SIGNATURE-----

--Sig_/8jIM0Qb_UxlxYVxUMHGFqOS--

