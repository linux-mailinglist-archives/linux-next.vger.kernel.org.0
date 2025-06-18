Return-Path: <linux-next+bounces-7166-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFBADE2BE
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 06:48:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CC73B822F
	for <lists+linux-next@lfdr.de>; Wed, 18 Jun 2025 04:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28678199E9D;
	Wed, 18 Jun 2025 04:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tt/PYyQm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6101C13E02D;
	Wed, 18 Jun 2025 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750222079; cv=none; b=jXHDc6bVInBas1p+lLMIhSAE9DETr+qQc+Jm83VYJ75+HD4+JUf3kfYeUCQsk26+0mm2JGud5uqnxVYW5H/n8pfd6U501JoTPocLfvemYRKI2slG9ysa3oONW4219okpThI9VnD9H1vBf1Wnp+Pugxa87uakN2LMnUDBpL3MZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750222079; c=relaxed/simple;
	bh=wPr7Uc2Oh8NzamXL10SEcRpC+weFB8VxIXdkTIntRjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UM2a5CGO2JKP/MrmPAPP2Kghumz/ycwzN9l6KeMSdCcIwCed9cFEmg6m011FFr5Cpfub/HgVeuQVaHq1TzWAg/Gt0ONGvDnhcMwiZhJSkeKOtPIQvAZYzyAeX/oGpKJnMgnk/RI1934oaWCg2eZyBMFjGFrxbk4qP0KUh8Umpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tt/PYyQm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750222071;
	bh=Ea0r7e3rb/JuhP/1c7g8mD/C88HYhR9CAZzLq89zg38=;
	h=Date:From:To:Cc:Subject:From;
	b=Tt/PYyQmv3EcF+bhla60OYtWUAFeX6vL6OX804nRWSTshOiqXtqoS8dl4rMEaZL4X
	 xddBbX3kzls8NBYdWnvwtyI+749sRah4liUDK/pbrrsNihGLFRDnIUDBon2i+LRQvV
	 UoAes45XyRMlgHSrxVU+GvMv8lG4hYheWqL0B2av2lAnVgzrrEBvjMEGDp1/JdEYL7
	 2/o5jhQBjq52ONakP1Z5yzcHBwhW0WC2Y+Sh0ITb6OE8y9jgR01bgVMoDYKCMHYMn8
	 MpB/K/prxKhoxIF1Fg82O/R/sR8DQ25SMPPOc7Rwm9Hbml0UnkCkygdCj+e1+LHAWL
	 q32tAhRjjERww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bMWSl393kz4wcy;
	Wed, 18 Jun 2025 14:47:51 +1000 (AEST)
Date: Wed, 18 Jun 2025 14:47:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Eric Biggers
 <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the crc tree with the s390 tree
Message-ID: <20250618144750.092d01b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t_05p3FfZs.BlvYR6Y8Ah=s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/t_05p3FfZs.BlvYR6Y8Ah=s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the crc tree got a conflict in:

  lib/crc/s390/crc32.h

between commit:

  65c9a9f92502 ("s390: Explicitly include <linux/export.h>")

from the s390 tree and commit:

  47e6269f497a ("lib/crc/s390: migrate s390-optimized CRC code into lib/crc=
/")

from the crc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/t_05p3FfZs.BlvYR6Y8Ah=s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhSRPYACgkQAVBC80lX
0Gxigwf+NVszkluI11AffXGDRcwIDTl2f4W7Zh9qvN3XgPQX+HQjdrDAVdo51TaV
VMXyEK3S67SZQXDc/LmqtAeYDlQwwNMQd3bsBVv3R1t1mYTJg99AstPTywtPlORC
I0GJsuHZrrpiWrSOYIvTuPRZdCI5mkqmOilj0RdczCGZDPKX4JiS705560qWi4uE
feA0TENUsed4kZ14PvvJ0PWgJ0AQiKBBwLTiDJ6P9AG4a0jSqwTQskIg9BXpolNG
aw1z3lauyBsbrF1PwU3gjp19kdKbo8OmzDV+2EdsQYFqUSOTZHx0N1auk/8tvNl5
IenaRH5SWhWat43C7uyNmkVEalhpDA==
=Tpem
-----END PGP SIGNATURE-----

--Sig_/t_05p3FfZs.BlvYR6Y8Ah=s--

