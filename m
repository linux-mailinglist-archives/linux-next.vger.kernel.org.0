Return-Path: <linux-next+bounces-25-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB77F3D35
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 06:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDEB4B21764
	for <lists+linux-next@lfdr.de>; Wed, 22 Nov 2023 05:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF1BC8EA;
	Wed, 22 Nov 2023 05:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="by0I28/0"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113711A2;
	Tue, 21 Nov 2023 21:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1700630146;
	bh=sBU/bZ+FI04HRQr8KUpAG3G+oEHUx7aT2DD1neRzC4E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=by0I28/0Ia9PtGFkxTsnowDFQdz4092pbJbC6nc0mmm4Bh05SiaJVZUccmJ6yVO0o
	 NB60sd4srA1VmCnHV2JSIuLPw+y1/gJfXAL8p4ZjIPz1Bvv0kW3TGpJ2ac/GB3QjBP
	 ZFWsJLgtEzq64gkiyktUZxwnR0tITg9K7nN0e0DUEWMyHP9ZYl9vPgWzDn6B3uUcUh
	 Iuf3bU6ET+q4GmDujMy1OgZ9xPmazcupmT50xpsMTRArSBg3ltLrJXVNR/VUaTJhWm
	 HDrnzJ9woNlmLO7wGPXIDqqbw2W16pM1YJIfjWRvpjgCHSN6z1Sxn9olVnN2rONnb7
	 vY9kGqI4hvYrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SZqFt2ljKz4xQZ;
	Wed, 22 Nov 2023 16:15:46 +1100 (AEDT)
Date: Wed, 22 Nov 2023 16:15:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
Message-ID: <20231122161544.7a7b8c13@canb.auug.org.au>
In-Reply-To: <7e58f7a0-440f-4067-87e2-381f05bfce2b@embeddedor.com>
References: <20231122144814.649823ac@canb.auug.org.au>
	<7e58f7a0-440f-4067-87e2-381f05bfce2b@embeddedor.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_4PvN/owei9VOaqELGmQvX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P_4PvN/owei9VOaqELGmQvX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Tue, 21 Nov 2023 22:04:17 -0600 "Gustavo A. R. Silva" <gustavo@embeddedo=
r.com> wrote:
>
> This doesn't show up with more recent compilers because it was an issue i=
n GCC.

Sure, but we do still support gcc back to v5.1 .. are there other
earlier versions where you may want to suppress these warnings?

--=20
Cheers,
Stephen Rothwell

--Sig_/P_4PvN/owei9VOaqELGmQvX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVdjoAACgkQAVBC80lX
0GwiXgf/W7PUQRjy7g6IroLCqEuyh0YPInNsu9hQTKahLIcRGBASypxJbI0YslHd
4h9uWWQ8/J1zeQx7PcQ7WwYWOZIzTDX5xxtN8IX+MUGb7/uPKiQ4zCn5QobnkayC
5b6Xn89YXFliIMHaD8kmR4vUskVRQJ9STjnBob7FLNxSuJlJH2giXWXboduiwu0h
zFa2mnKHiCO/LKdST6TTClgfl94oi9kDz4eyf/oA9PAN/mCioyj9v7B7dZZVg0fg
6l5Wm/x7LR7dIiLQq5uTWgk2OmOQ5p2BSwQ8CGu/dZiMcouqzPN01U7HpkQLheSl
LJIwL50xmhE4OuRopDmpZbwUvQosRQ==
=BX0M
-----END PGP SIGNATURE-----

--Sig_/P_4PvN/owei9VOaqELGmQvX--

