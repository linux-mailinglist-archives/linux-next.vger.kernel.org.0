Return-Path: <linux-next+bounces-2519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86D904865
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 03:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D94481C22729
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 01:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78BD51865;
	Wed, 12 Jun 2024 01:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dyzncG6r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3C17C9;
	Wed, 12 Jun 2024 01:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155676; cv=none; b=ipR7GkSKTa9zri39vBEcduV7KRE7TuRC2DswgHoynrJlLA9jbRm2mogeR7G4rQ9XXi/lFYZdVqy+BK70InGbfrwciME4c6/8y9kYR2WBXsWtCpASUsoAbnGAhj2QaT3Va7AGcGoKUGsDYxjFg9dnD8nNWRsGUtb+qM+UZs+7dPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155676; c=relaxed/simple;
	bh=72ccGiqpasKMW/KuF0ZWk8xmKm5MkMvQGTh43Of7jks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RKLpqITOOgGVggpAxkmppi6+I5urJ+FHYLgGGNbo6CiCic/Jcm1beL4njaCB0MMGM3PnJ+JvNNIX2fY7bBYgszQKHWmm3o7u8Q7Ik4s+yQT4orMpBzIAKYKKv3yAkXhm4efxN2zVDW6Jv83yVT4An4lYfWEJTZT6sFCyyveTTxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dyzncG6r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718155671;
	bh=aenrKh5vxiZhj+lFhogAzKc1iOwHEHknWWsHgrgrf2E=;
	h=Date:From:To:Cc:Subject:From;
	b=dyzncG6rDIK6Q1P1pek2X2HGCvOLLvO9d6kaBeaiYFFCduUeauiopPbenV3ahkdi/
	 qtnNmsvVDM9HIyRMZ70ekQoOZ0BhSTa/4zIWTUwPGOrofPk5Y63uhIQkTXXm5t3DKk
	 D+M7VxRwxGN/W+1FZLQp/8pHp6Hsnk7qPdjOQ/LtzXgBSTPXTSraR+6tYaeWA9CiLS
	 WfDF+x3Jl48kZXKDG1y57+ZE8C7E3ZaLHj+85ddVk0ThNXYR/wyGM3EU+oRjZH7JUs
	 6zQeDR6qjrzZizW/fTZi/ZEDL43NL0ZjeQ8SlF9G+W1EQtY7JVmjxvWRPzSpSI1MIg
	 BGEArgKWS7vTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzSb64rXCz4w2P;
	Wed, 12 Jun 2024 11:27:46 +1000 (AEST)
Date: Wed, 12 Jun 2024 11:27:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Borislav Petkov (AMD)" <bp@alien8.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, Yury Norov
 <yury.norov@gmail.com>
Subject: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20240612112746.3130d68b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YOSTDTDlMN0uXKzhX+3sSTZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YOSTDTDlMN0uXKzhX+3sSTZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/cacheinfo.h

between commit:

  f6a9651bfd74 ("cpumask: make core headers including cpumask_types.h where=
 possible")

from the mm-nonmm-unstable branch of the mm tree and commit:

  685cb1674060 ("cacheinfo: Add function to get cacheinfo for a given CPU a=
nd cache level")

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

diff --cc include/linux/cacheinfo.h
index 286db104e054,3dde175f4108..000000000000
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@@ -3,7 -3,8 +3,8 @@@
  #define _LINUX_CACHEINFO_H
 =20
  #include <linux/bitops.h>
+ #include <linux/cpuhplock.h>
 -#include <linux/cpumask.h>
 +#include <linux/cpumask_types.h>
  #include <linux/smp.h>
 =20
  struct device_node;

--Sig_/YOSTDTDlMN0uXKzhX+3sSTZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZo+ZIACgkQAVBC80lX
0GxisQf+OmG6pg1a7Pj2fCoxVz3x2kbRExO5WJss2J8RJZWmyUs+q7NOkLb8QhA/
nakSdWLgocoJ5AwgCCZjidYIPzQtqTM54R9hQsymo5jWk51xYCLhmWTe8rEElK7P
pkH99Shjf3D4ErISee+9pQCfMp1D3vC75eb70fZIYqucaPbqJtkQ0JwjGAFflv6Q
wFn+VQAwlfiXkIiS2gUYOKTSN7KqAJZr95+VzsWCvjMP/vUUIire6WY6p+8RMu8F
PgnsHYWP79PONHrOyBcnnDau5IgFMqUgLFSerx2gxEXUFdFBKG1MEvEB5L3KiryU
L8sPSAHgeGHDJyf0KKtifnrJ2Vb1zw==
=iA/m
-----END PGP SIGNATURE-----

--Sig_/YOSTDTDlMN0uXKzhX+3sSTZ--

