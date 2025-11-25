Return-Path: <linux-next+bounces-9219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B3C87766
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 00:30:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE713B4370
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 23:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5F72ED85D;
	Tue, 25 Nov 2025 23:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mbsOAtOI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B7283FE5;
	Tue, 25 Nov 2025 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764113446; cv=none; b=bRC9NHLvBYsaw5p89XUzff6FdwUNaxEht33Imr2ww3ApBZqW4/sKbiowz7WB9BjmRvsc0mQ8uzHcOCkUwxMYql4zd+TbfmYpA67k/A5PQ0yVcZ7NY+aIHOoSIJrj/FaQ4Zf0j55e72b1XPijHaTtMC62Cy6cwmfNpWb8a4vuWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764113446; c=relaxed/simple;
	bh=1CL7F/EPmacklDgNHadvP88WPBBCXgrMdxbbyV9HARA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HSUlTCWJfusVownanOWq7W3+V9k8hA4Z4YqLGYdCzVOlRxM3WeUHbAY/WFn/Dr8YCbtyg0Lcmq+QydnVi6s/m7VkknvbTi267VXI7/cqegXg3/jGudDT7z8ATRDWERvpWcFiMdm2AsrAYBfXuBVUOH+zmzO/SQWO2qYevRTz+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mbsOAtOI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764113441;
	bh=zNjLddHCpjTdStFZIMsK7u7349FlcRJmEkd1jofbSF4=;
	h=Date:From:To:Cc:Subject:From;
	b=mbsOAtOIvymDKgbuh6GcVbPtBO/ROReOWr6ADegDDlHHdpNnxCGsQE35FunJbGQES
	 OlBbfBw7IlafNLfZ2xIgOY2rxQOqrGDd9oC5AnXrfurri0/ziWP5WgOOMU/hnBAFYC
	 DQLBmCG74KamsRd2PHKo8ZQMkZIGHfZWNHiv4QzW4d0h22SAspps4vfVb4QKDvL7Yg
	 O9HIUkFrAYwrjwAbD7JbmgkXgsH5k3hTYk3Yz3x5O01qmW6WzFc9gWxUMP2MzEw11t
	 wilPjvra+x1uF4Nd6PeQkErUVinXelX6PmpC9doOb07tX9TnjtTcI36v3kOv4O+kjF
	 JJ5sB4N0+UwHg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dGJpS5gXmz4w1g;
	Wed, 26 Nov 2025 10:30:39 +1100 (AEDT)
Date: Wed, 26 Nov 2025 10:30:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the
 mm-nonmm-unstable tree
Message-ID: <20251126103039.222a1589@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/St=H6mm/KUPwvf4+Tjheqk6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/St=H6mm/KUPwvf4+Tjheqk6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/drivers/net/hw/toeplitz.c

between commit:

  f48b6111ba40 ("selftests: complete kselftest include centralization")

from the mm-nonmm-unstable tree and commit:

  aa91dbf3eda2 ("selftests: hw-net: toeplitz: read the RSS key directly fro=
m C")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/drivers/net/hw/toeplitz.c
index 4b58152d5a49,a4d04438c313..000000000000
--- a/tools/testing/selftests/drivers/net/hw/toeplitz.c
+++ b/tools/testing/selftests/drivers/net/hw/toeplitz.c
@@@ -52,7 -52,11 +52,11 @@@
  #include <sys/types.h>
  #include <unistd.h>
 =20
+ #include <ynl.h>
+ #include "ethtool-user.h"
+=20
 -#include "../../../kselftest.h"
 +#include "kselftest.h"
+ #include "../../../net/lib/ksft.h"
 =20
  #define TOEPLITZ_KEY_MIN_LEN	40
  #define TOEPLITZ_KEY_MAX_LEN	60

--Sig_/St=H6mm/KUPwvf4+Tjheqk6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkmPB8ACgkQAVBC80lX
0GwljAgAhQxGnf7JM5bPtPAgMVXY4tSNHQfapralpqTo5PwD/H3IsY07Bo2YdnNP
AyxuYR4MRDjDPirTv7QPWGWiwOGIpmSZ7hV73HFwJRdK/idhlOrH79spzw14I4N5
uKj3e9X4SKLpoKb2mGir91/5hqxDcwRQV0iFpG9SMlsAlV/NfMWrN2iRYgPKdNy3
YBtKkikGrn6EW0YOxhTpGfESRjNpFgpa5fK87HAqn8Z08ZnRqdgwAnvUgyc+Yf46
2HxPFBpP5BDpck2D6Ez2TU3Jkwvz1m2zsaQxHtfhzQo9Js8udrQXYAa8liJWXK2w
qxkcZI4D0AWuHT5OK2g70oAdjEjw4g==
=PkBu
-----END PGP SIGNATURE-----

--Sig_/St=H6mm/KUPwvf4+Tjheqk6--

