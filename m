Return-Path: <linux-next+bounces-11-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0707F3A2E
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 00:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83E012821D2
	for <lists+linux-next@lfdr.de>; Tue, 21 Nov 2023 23:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10014A984;
	Tue, 21 Nov 2023 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vLkRV6DW"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508BD1A3;
	Tue, 21 Nov 2023 15:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700608524;
	bh=nfRskNbuIurQ4Tzlr2gREYCPCNCgX9hSPRaPXiyP3aQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vLkRV6DWMBoR9fYbRHOscgI/IXtp3Ze5dll0yPXJ2ALXsuSLZb0FBnIh2U7w7lxjp
	 uW9IH6PG6oapUg704Cib6+lPi9Y22wyhRBqlMtoFaCG4TR5bxfgv6qSsueL0zK9FGF
	 a8YwXfOlSNAWAq64EvUyv+zrFej/h7//jpnb2RSGYpdpSMpUyZUSRMg9th6MXa0fgG
	 21LzQasVu0OwVFuMj7ldm7masX4L5BZ8vN0Dj2AbOt9pGIFTUyyXHHo+mryqXFAI3+
	 4uBTmE+2y4G5lFsHHGh6JIFEmOszfnt7VMnz0WJbM1jxXQgrDy9NC/CJBOZRIo3i6g
	 A3NDTlL6T820w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZgG4092Dz4wcX;
	Wed, 22 Nov 2023 10:15:23 +1100 (AEDT)
Date: Wed, 22 Nov 2023 10:15:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20231122101522.1c1daa2e@canb.auug.org.au>
In-Reply-To: <26671a7a-c3ed-448e-a220-108516a50deb@embeddedor.com>
References: <20231121131903.68a37932@canb.auug.org.au>
	<26671a7a-c3ed-448e-a220-108516a50deb@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3+ys0CtKulkH9pbOL3Om_cW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3+ys0CtKulkH9pbOL3Om_cW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Tue, 21 Nov 2023 10:31:16 -0600 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>
> I wonder if you could help me catch the rest of these issues by disabling
> WERROR (so we can get all the warnings) and letting your builds run with =
the
> following patch on top:

That seems to be working OK.  I moved your tree to merge just after the
fixes for the current release and added a CONFIG_WERROR=3Dn to all the
builds.  I'll keep it like that for a while and then go back to getting
errors.

--=20
Cheers,
Stephen Rothwell

--Sig_/3+ys0CtKulkH9pbOL3Om_cW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdOgoACgkQAVBC80lX
0Gw8xAf/fVS3WSyypZKj2SnP1wnhaU+ysoO51+LoACBTR1uX1tPEkmO2KTeTjixc
0yPjy5KRAFPHAhb8EZkeJt/xMw9qfdO6XOQqFbBbZ/hbNY6u2+D/gYulsELEcQ6K
ildXMl7NUdUjrqwtLADUoMBScIWDprwTtZFXm62ti5/BbcapsCvCAbpf+YSbXvdW
c9HH+lR8pk2ndU9aFK5fDgGEFKLk77dkorSC6ed7yxWifou7GUoDXFP/RBIx4rXd
VPZeEUZGovoFTtzc+9X4SqBKJrHzO+T9tuCRwJxh0ujczeZET9C/I8PT7ODzCFAw
WQWPUujNkDBBGDkioUZJbQCnxBhoww==
=xp5K
-----END PGP SIGNATURE-----

--Sig_/3+ys0CtKulkH9pbOL3Om_cW--

