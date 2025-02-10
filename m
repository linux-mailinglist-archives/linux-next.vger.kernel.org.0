Return-Path: <linux-next+bounces-5402-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2FA2E2EF
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 04:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1BFBA7A2942
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 03:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52222125B2;
	Mon, 10 Feb 2025 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QuD2iPsa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7043179;
	Mon, 10 Feb 2025 03:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159513; cv=none; b=GsLUxYl6tSxIAGcShIOGxu/8kkohh/pbQiVXAlf+u+wxl/GK7JV/XodiDi4HHG3DJpf/CIMkjY2lJRhz+F/PHrtD+UfPD9zMW1rTLek8aMYCFQufsZO+clcyXsY/T9qotV05TeAzQiMiE724lNnl+NQPbka2xMm91eBzZ022rDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159513; c=relaxed/simple;
	bh=USxjU0Ejh8dzpgjSPKAsKXHOWmUqAOKs5SMG0Vx4Hos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qjoSDZY3kCSMoxDYlbPvRMQfCKTrXjCvLSuI7CBk6USr5GW4XBIsXGciBtZBvJE/EXlUK4MthJbd6tXiFGvVdW+heJtNZ1xnt4wI4usauEycP5M5Oe6ZrY20FT+g/jwIhig2R8AffhBLVBTism0IlDhutXMJoIlrHtCwEqs/ukQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QuD2iPsa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739159508;
	bh=nH66e4zZp//nGIZAmkjOk4zKpfsbVFB0TMVgq7LTyqs=;
	h=Date:From:To:Cc:Subject:From;
	b=QuD2iPsa5QTk1qecuSPHEjek+9hTwSX6IhlbDTpCpVv2nl060ARDqek2Cu0+C2GMs
	 pYQxmiHRavhJS01Bdew6UKzNINpaQyhYhe2bepeatKsO1u+95/GfLI+4ZWu7rJXoQR
	 D1yc1lCesVtVZhKR9KESnE9iDMXlksffp6qvXY/AcY3940LpaQKxn1BgOBU3aH0AoX
	 LBbJDv7Nb5ui4ZNZ6NGd0lRH/YE/zDy+wZm5ZkGxVNyVQfaioiHmRm0QDdUJauCMXf
	 b03+Awq88/w0pVCUmD7nNSesawDKHtDkuwS4xmJo6xtiZI7aGT7xqghIhCiSQg92zf
	 2vroQyyNURtHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YrrH86KR5z4wcw;
	Mon, 10 Feb 2025 14:51:48 +1100 (AEDT)
Date: Mon, 10 Feb 2025 14:51:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250210145148.23e53bea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/obA=5=yVVnXJ_2zj7OEoAm1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/obA=5=yVVnXJ_2zj7OEoAm1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/memblock.h:60: warning: Enum value 'MEMBLOCK_RSRV_KERN' not d=
escribed in enum 'memblock_flags'

Introduced by commit

  2bcb44ca91c2 ("memblock: add MEMBLOCK_RSRV_KERN flag")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/obA=5=yVVnXJ_2zj7OEoAm1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepd9QACgkQAVBC80lX
0GwfXQf9G1QnCVsSHXx7mHF1WZf0tYQmoOeiqMaSk0GAr1j6LLDWn8SL+Idg/R21
XbRhhwprrM8j/BBzn6W3XrFwJ+H0Qz0epQhTu1T1mD49ZLDelf/mKR7VxyhQ11jl
jZ1W61EkV+7jsmcmvM38Lg0GgfnBbaRiGvSuQVpe72Ag/Y1PUx5oUpbZl+jIFIxd
VJY1TisiRO3pYBUr247KGZi/r6QEnmBOfJHhvCN4UwOaSYuIPV/v+i1I6f+LNCLG
54A6E23gzOVrtjuEPatCFdBWK/Q279pP8oB+cThdS0bMC1BJobL+v+i88CCBj6Aa
7Mqbq3zrgGqkz1MVaji2Ey7D6XIOvw==
=4vy4
-----END PGP SIGNATURE-----

--Sig_/obA=5=yVVnXJ_2zj7OEoAm1--

