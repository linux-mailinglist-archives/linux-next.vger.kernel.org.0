Return-Path: <linux-next+bounces-338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF080DC4B
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 22:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E4B71C215DB
	for <lists+linux-next@lfdr.de>; Mon, 11 Dec 2023 21:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967485467D;
	Mon, 11 Dec 2023 21:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UNtNO0CR"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772CFB6;
	Mon, 11 Dec 2023 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702328492;
	bh=hb0HJnb7XD64MfXJbiP0E9xbjutUuP/m+xdyI42u0Cg=;
	h=Date:From:To:Cc:Subject:From;
	b=UNtNO0CR9RyCkxXQSsJYz9DkegToLIamuGTe9zD0GyWRf0zfIC+nFGr9RvdK5+o1s
	 50xj8IuAHybtVbH+uuqH79xn2Xvmxq91L8H37OQPPaXYwXY88C2v2SpiGaAZeBE8q4
	 91p2y/A0ExxF1XU8tHrfWnI0H15Doeqkz0OqdlkXJvV+NKf+TVWuZO5LLF00fqNArj
	 gA83GSwE4Ghno/NYydATbPx9w2eW/vKgdftDfMYNtDwmVvw28Oopot4WyfBOa0xLmE
	 avldj8cgVjaxRumQjyW4sIJfMSDmxCx7criSwx5LErL2FSokmFUKnyWZRghec0UAye
	 WGrI7MF2OU7Sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpvLN3BP8z4wc1;
	Tue, 12 Dec 2023 08:01:32 +1100 (AEDT)
Date: Tue, 12 Dec 2023 08:01:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kunit-next tree
Message-ID: <20231212080130.7607dbc9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7Sk0TJj3/7sDirx8XIwzMeB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7Sk0TJj3/7sDirx8XIwzMeB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different
commit (but the same patch):

  b285ba6f8cc1 ("kunit: test: Use an action wrapper instead of a cast")

This is commit

  1bddcf77ce66 ("kunit: test: Avoid cast warning when adding kfree() as an =
action")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7Sk0TJj3/7sDirx8XIwzMeB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3eKoACgkQAVBC80lX
0Gx1yggAmB5JHCPkLijl6vBdUZn/NyTAGHc179BbdUSp55lgRheSmOiG1LncnZaj
vdukdvCzN6MxtemJ2+aMvJF5QGR/QgL5p9wh19BZw54WoH60u7gB6T3tGg0J36tm
eoAZ9sRtMDCEmsHcS1tic4R+Ni3+mvWFaXXV1qvrrj8Qd7mghjsgqwGNTRI0FMK2
XbLt4WwWJjbG4VsYz/aoMLAKjYMhno8pXI91TFD73qlGfObZBbWpnO8ZF2Tvxqi6
iWnDDR7WNgGKUsdLlZTrZ7vwxPEP5au0HC0x89j2L7kdo3KAlQ9vPAP/RezKPHxb
iSO5XulG/DFttupJjd9QXJ/9zwc3VA==
=zOIM
-----END PGP SIGNATURE-----

--Sig_/7Sk0TJj3/7sDirx8XIwzMeB--

