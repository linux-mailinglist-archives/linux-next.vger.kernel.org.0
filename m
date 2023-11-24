Return-Path: <linux-next+bounces-53-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4275D7F6A9C
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 03:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65DCF1C2090B
	for <lists+linux-next@lfdr.de>; Fri, 24 Nov 2023 02:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E421364;
	Fri, 24 Nov 2023 02:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KRbPi7TY"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE07C10E3;
	Thu, 23 Nov 2023 18:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700792587;
	bh=BdxTtBTNwuZ3yFojTPPgGifFlNF6nKUbtqaHvUDgjYU=;
	h=Date:From:To:Cc:Subject:From;
	b=KRbPi7TYYoa06NOJRQXSiVSixgI/CJ98J/E+WVFsCiwGKZm54sKh6CpXLAkoc91wK
	 0AJgX+aARIHDSqhiA0ozrNfUtkDGkWlf4MnW+68HQ/hfE1QBIiGgLN6r/6UAz27HLh
	 B0w/eOxlTVDDV2Jlz928NvczTqKAmM72l7HWSoUaS7FYARPOCd/HH28O4/YvC2qZ83
	 xoohmkCy9C3Lq93ai6NFZxa7e8Txmj9BocpTl4duluZ2Tgc/94SM+VDJcf+IVm7vbP
	 s+m2G2wX59CBnfNQm5EcBnzf+ajEtE6kn5yVx+LXhXHxkUKHNpPlxFhNM7ZSgSVwIi
	 tQjnE3sch2apQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbzKl3kZjz4wx7;
	Fri, 24 Nov 2023 13:23:07 +1100 (AEDT)
Date: Fri, 24 Nov 2023 13:23:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Donald Robson <donald.robson@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, Sarah Walker
 <sarah.walker@imgtec.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20231124132306.71dc0b00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kwqQ2nWEleYn6NbZ7dx/r13";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/imagination/pvr_drv.c:1: warning: 'PowerVR Graphics Driver'=
 not found

Introduced by commit

  815d8b0425ad ("drm/imagination: Add driver documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVgCQoACgkQAVBC80lX
0GwEZggAgNCZ6cOdLAXtf4EfHDn14njznByiG7UJTeYEfZpHHDZbw4sBVdOghNjC
wp5Ikc4JFUH+idv0L/5CCk3ZXGSPL/trXNuesgecQYdtbM5Z/5jXjlBKdp7GZ90F
TZtdphvyeP27vf4EW1Zr93+hLoYpDo612KH9vBDsGp1Orh5qntDxXSD5T/XxQve1
c/71mDQkz9k++1gbcoy2bxC3mOjswyxWxtrb4QaYUIP55AF3p0hWiHFI8JCdD/Dh
Uf/Po3HzhsrzAa5qDstJOaS+SpeRlYWOolAnkVO2/o559cw8QE3Xlznxi++KFKl2
+W1DzZXyptwZ40q3Q4jWepWQvU/3ug==
=WEuO
-----END PGP SIGNATURE-----

--Sig_/kwqQ2nWEleYn6NbZ7dx/r13--

