Return-Path: <linux-next+bounces-9279-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBAC95633
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 00:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0FD043418CE
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 23:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA5822576E;
	Sun, 30 Nov 2025 23:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WXznex0O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849EB1373;
	Sun, 30 Nov 2025 23:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545521; cv=none; b=gDCeXD3c4byi+h4HzJDiY4WG9R+WStNJkViHfgIVFL0SC+FanNDaLRHy4au2lzJQJYllKp1CRB2Da7r4OyKanX3cHAnXgUsbHSQLr5doHEutkxbFlOPM5hLeXZ7ICN/V5/6tzSHnn0P537yjpt8C3smq4gco7DLyL5b92GcNwAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545521; c=relaxed/simple;
	bh=gnMxZXJcrD8TbDCFzxn8VNyiTZ/7vqbzG4tqqH39e9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G9TjitixuKmuOCKsrmjZhRKdMp+E5FRdJg3JI7DmwrXTWdKcxkBPBuSg6Tzqp1EgiF4cn75KF8b8ApUkwIpN61Ri6ggZly/zeR/Hqx+JSxJ65FEP1ZpRR+F+aoGWlIYAp9NH+r/ZL20pIJ1lcUdrM4XXG2GVAPxAJWjuSvXpZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WXznex0O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764545515;
	bh=swLxvc69zq2lkR6sGA8ys1Ro4Y5SQGNo8j0FEfyLnzo=;
	h=Date:From:To:Cc:Subject:From;
	b=WXznex0OICWyrkWcyegA6e0OkY5dB5m08PhS/CgYdvZqkrgHqyOTLOtJWGJ2eklXo
	 nshxl5coCImDeLSAZfDM4agGEPU1Xl4K5bhotzEo5675xNZfrrJvL9/vpHPQO3Ws7z
	 T/0A9yDR8Q6wBWWnX/evIk57wu3dT0k2y1x6GPIUyV+SljrnnQBexdj9BFYKmnPCCt
	 tnOTWEyCJ6ToutmQTXu1lFrDErJGvJ6+i3s6/XF28U+Sz1QzEKsLDkXBUqLjWHQjNE
	 S/NMzzDPmmDnF5Li7WarF+GadPVv6Zh838C9IRxQuuWFF05WMUcZ0DSrvCZZRjA6JQ
	 +erUCeRW3KRag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKNbZ5mBlz4wCm;
	Mon, 01 Dec 2025 10:31:54 +1100 (AEDT)
Date: Mon, 1 Dec 2025 10:31:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, David Matlack
 <dmatlack@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the mm-nonmm-stable
 tree
Message-ID: <20251201103154.32226085@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GuH96rs4kWLb3d+d9Bx/+v+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GuH96rs4kWLb3d+d9Bx/+v+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  tools/testing/selftests/vfio/lib/include/vfio_util.h

between commit:

  e6fbd1759c9e ("selftests: complete kselftest include centralization")

from the mm-nonmm-stable tree and commits:

  5fabc49abf7a ("vfio: selftests: Split libvfio.h into separate header file=
s")
  657d241e695f ("vfio: selftests: Rename vfio_util.h to libvfio.h")

from the vfio tree.

I fixed it up (I deleted the above file and added the following merge
fix patch) and can carry the fix as necessary. This is now fixed as far
as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Dec 2025 10:28:51 +1100
Subject: [PATCH] fix up for "vfio: selftests: Split libvfio.h into separate
 header files"

interacting with commit

 e6fbd1759c9e ("selftests: complete kselftest include centralization")

from the mm-nonmm-stable tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/testing/selftests/vfio/lib/include/libvfio/assert.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h b/to=
ols/testing/selftests/vfio/lib/include/libvfio/assert.h
index f4ebd122d9b6..986ad26d92a1 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/assert.h
@@ -6,7 +6,7 @@
 #include <string.h>
 #include <sys/ioctl.h>
=20
-#include "../../../../kselftest.h"
+#include "kselftest.h"
=20
 #define VFIO_LOG_AND_EXIT(...) do {		\
 	fprintf(stderr, "  " __VA_ARGS__);	\
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/GuH96rs4kWLb3d+d9Bx/+v+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks0+oACgkQAVBC80lX
0Gy2iQgAjNff0qD65n1ztIVIILFaHdceUmTi6O/92SjiDM4IhdIirCje/zBWdpsk
TksCgl0OI0S7O+33kbBRmsB63uq6DYeGyK0B65pJwkxgBRsodXsQ0tg3mJxawgiy
d54A+of800mNFIGib2+BVKiuSY3l7VVzKdffM32yvC4XfhhGyJ5CoJV0DSY1cOQ6
JQzjRz7eVpFgC/rilP7UK47cXGz2+rbdF4umC/7jZDiRp/IWK7Bjlvl89SARlw1R
YmV4EqQcPj9FIaYBtjogfIMAUq/Lcj5pbKCBns48rpjavDIwG0wnMScyyjTwAerj
rEuCLWBVN1LOw0dIuOhg+WEDSzIkEg==
=keFr
-----END PGP SIGNATURE-----

--Sig_/GuH96rs4kWLb3d+d9Bx/+v+--

