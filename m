Return-Path: <linux-next+bounces-5256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B568A16738
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 745A6169D79
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 07:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA1C1865F0;
	Mon, 20 Jan 2025 07:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UQMK7pXC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CEE4A1E;
	Mon, 20 Jan 2025 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357492; cv=none; b=ffkTEjEUVjpR3F7h58G5PNWY+en8EaIYFCod6UNOyWW9gMAeSUwhG5gUD2GodWIGjK15SMz7vRMZTpIkVqQqkwiYl4pE6clfKpC6op46WokOjhfj63hHaRU0IHWZyXEfKAeZo25IHIECbORvFqw3jKDRnvtUYBEcrg7G5gh/2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357492; c=relaxed/simple;
	bh=+jwgQLA5rMJmUP7TqPE+KbWlFX4XD0pkXUNFG32NLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Nut+AB1zOZE3ERakURuZM+X9KGwbHjFnpwjSxl0iV5ZHe9V0R2lTwvYZRi65RliEoDQe7Byg986M7AxLJfzKpwnqyRSDn6RbaAGmAG96lB9Wd3cAZl4SeB+8e/o7aj3PrqUc8WcsKSg1vSg7apXVxRZGQivwPJ0xKsgQ+L4bHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UQMK7pXC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737357478;
	bh=aVoU2iw8kWAXkfx/ny83IiQerMDqv70DDyIHosQObKk=;
	h=Date:From:To:Cc:Subject:From;
	b=UQMK7pXC+mrRJmQGp0d552udkSRpRKXa5TKdIqW3T/ce21OcCuTRasXSWlmLb54BZ
	 m949givEoQ81774zblpKlx7klGnRYhhr86CfDgNnAR9KTG8GlCwpBzn0U9BAJYFliD
	 urpZF59P6BGILL9JUJAx4GrvyvIUjZPEtMWcV93rJkVORoA1MC2yaIsPKUEgOdn2ba
	 1O+6ZBU0xz2tpCirLN0V/dfNZZiBcbzSN28+MCx6Ezz/8wB3DGLW1XSx5tPtN9SydP
	 Im4T46XxaMX4Aw58ikmx/+2JZ/phVdJ4DpVopKZv3h39EqDntZ3CyOKaZGss/8Tp+K
	 GvnfHf9kEq1Pw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yc1rj61Rwz4x6D;
	Mon, 20 Jan 2025 18:17:57 +1100 (AEDT)
Date: Mon, 20 Jan 2025 18:17:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>, Eric Biggers <ebiggers@kernel.org>
Cc: Baojun Xu <baojun.xu@ti.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the crc and sound trees
Message-ID: <20250120181744.6433557e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VrdD9JbP390UCfUpiYqjthL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VrdD9JbP390UCfUpiYqjthL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from lib/gen_crc32table.c:5:
lib/crc32defs.h:13:10: warning: "CRC_LE_BITS" redefined
   13 | # define CRC_LE_BITS 8
      |          ^~~~~~~~~~~
lib/crc32defs.h:5:10: note: this is the location of the previous definition
    5 | # define CRC_LE_BITS 64
      |          ^~~~~~~~~~~
lib/crc32defs.h:14:10: warning: "CRC_BE_BITS" redefined
   14 | # define CRC_BE_BITS 8
      |          ^~~~~~~~~~~
lib/crc32defs.h:6:10: note: this is the location of the previous definition
    6 | # define CRC_BE_BITS 64
      |          ^~~~~~~~~~~
In file included from lib/crc32.c:34:
lib/crc32defs.h:13:10: error: "CRC_LE_BITS" redefined [-Werror]
   13 | # define CRC_LE_BITS 8
      |          ^~~~~~~~~~~
lib/crc32defs.h:5:10: note: this is the location of the previous definition
    5 | # define CRC_LE_BITS 64
      |          ^~~~~~~~~~~
lib/crc32defs.h:14:10: error: "CRC_BE_BITS" redefined [-Werror]
   14 | # define CRC_BE_BITS 8
      |          ^~~~~~~~~~~
lib/crc32defs.h:6:10: note: this is the location of the previous definition
    6 | # define CRC_BE_BITS 64
      |          ^~~~~~~~~~~
cc1: all warnings being treated as errors

Probably caused by commit

  bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")

from the sound tree - it selects CRC32_SARWATE.

$ grep CONFIG_CRC32_ .config
CONFIG_CRC32_IMPL_ARCH_PLUS_SLICEBY8=3Dy
# CONFIG_CRC32_IMPL_ARCH_PLUS_SLICEBY1 is not set
# CONFIG_CRC32_IMPL_SLICEBY8 is not set
# CONFIG_CRC32_IMPL_SLICEBY4 is not set
# CONFIG_CRC32_IMPL_SLICEBY1 is not set
# CONFIG_CRC32_IMPL_BIT is not set
CONFIG_CRC32_ARCH=3Dy
CONFIG_CRC32_SLICEBY8=3Dy
CONFIG_CRC32_SARWATE=3Dy

It looks like lib/crc32defs.h does not expect these last 2 to be enabled
at the same time.

I have reverted the above sound tree commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/VrdD9JbP390UCfUpiYqjthL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeN+JkACgkQAVBC80lX
0Gxmzwf8DN8GqgYWJ8rLb71gCGShB4BTcUhaB38DEAz/R7tRqA5lpDpA15odX6vg
0HQh1SkXBU9CfLiUYpycq08NrZlVET+xVtxJGnYiYKDaeY97oAxDkrQksLq5Vd5d
7SdeH8iN/iEuj6Q2uz1R1x2ApeAr7f55gBVRDq6++0fSpOyaoKeekafBnOzSRfu0
OBeFDQHZvMvTQPIBOhZx/XYxHMFj57R5kHshhqVuhRKnMmRijv0JPyw9Aw3Dgg0U
bZcjVDrTMjzoiqY4mQ4X0Ir1w0X41Gqvk8zXIoG85Cc7OS07fH3Wx6bQDGRI+f69
PoT68r8E1rvH5T3xwG4NMbDC9hmZPQ==
=w8G1
-----END PGP SIGNATURE-----

--Sig_/VrdD9JbP390UCfUpiYqjthL--

