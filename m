Return-Path: <linux-next+bounces-39-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 615717F5682
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 03:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0C61C20A06
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 02:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8383117C4;
	Thu, 23 Nov 2023 02:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gORI8rUn"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12A91A8;
	Wed, 22 Nov 2023 18:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700707547;
	bh=TEx2hkCoBOjDhspfbnS7KuTYyc0yi6VsIhBcpQ2tTB0=;
	h=Date:From:To:Cc:Subject:From;
	b=gORI8rUnblpr9Lw1cfWvbInBtOy2a0x4y6bEn+8EfFGqaUTJwvuALeIOLYlw3MOtm
	 Lqda1/TgvngfSvT5M96wEpjP6JeAABlJxpMd/l9O91zBIyU651M+SIKM7M9rPKBYRS
	 aSFYFJIy6+PUjOB2cWAC4SYUWU1uS9t9rMkxl2Cz8UemqHjvl31kfCH+19wsRCsYPo
	 1Hr90mdP25eYPg0fytn7XqxMfmHxlH7V8ttOZTTEdhOxEEYmH/ntc3zsfp1r9lkJHS
	 TOMTCscDuqabktBPpL/dz6s3FE3zGvU8V2q5VGzlOO2Wpgm2n0UQObobloLARqWTFX
	 zPOXCuD4pswMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbMtM1MByz4x1R;
	Thu, 23 Nov 2023 13:45:46 +1100 (AEDT)
Date: Thu, 23 Nov 2023 13:45:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the net-next tree
Message-ID: <20231123134545.3ce67bd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ud56VJJErToe/mhvryWCuaP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ud56VJJErToe/mhvryWCuaP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced this warning:

include/net/page_pool/types.h:73: warning: Function parameter or member 'ST=
RUCT_GROUP(' not described in 'page_pool_params'

Introduced by commit

  5027ec19f104 ("net: page_pool: split the page_pool_params into fast and s=
low")

--=20
Cheers,
Stephen Rothwell

--Sig_/Ud56VJJErToe/mhvryWCuaP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVevNkACgkQAVBC80lX
0GwPywf/abEsjOtqlmt08zTsQZq4NBY743XvHVD3DcubT43lnsKyFliy2FlGs4mC
Gu7dcVinO3zHhhD/b/B42xl8FegYMP6S1HSoR47SEzfOvzcEScmyMkmqr7CKywld
lYhwQ9TD6ISd29YbW1lb5x2ZuuVh8nOGb40bhSDZnucKSoxKXUjWnQDEbicZB71J
D9DieZIaa4ILuGoZ/LstLKkQUDo/9L+qjc+SE62PlKZNUOg4YrXsVkTHBifGI+tu
ThZDYQGR/Ms6rqAmrbcDSv0832ElRqWYbi28M6bgbAf2wDTEQk+PidmZQ7RA1vIM
GnOmvsoGJanCjCsqZwwxKNBAAUdzsg==
=Xz/B
-----END PGP SIGNATURE-----

--Sig_/Ud56VJJErToe/mhvryWCuaP--

