Return-Path: <linux-next+bounces-6115-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DA6A76FC0
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 22:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9AE13A56E8
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 20:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D192121B9FF;
	Mon, 31 Mar 2025 20:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aH2U2qFj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E521B90B;
	Mon, 31 Mar 2025 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743454601; cv=none; b=cQYZGUTiuIOlkK6raMbktleKLeOUfp+peqXbbwPCCLd4PH1bxmf5dynlQ9FhvQcKe+WxOC5A8SXqgTlmfeFaWQEnvvFlmcnpKGGLEatX8e5V0PMwbdxt6WwGDWhz3El70I1JLO0CLqDSzYZEG6boqFeLgb5e6LFteSJdcQ6nC5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743454601; c=relaxed/simple;
	bh=P/sdOzjELHSLJJ9C/09DXKbX1k444N0TOsx1VRDNn1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sGzBZmq0KeybzZ6VUP4tJ0ZnWLiFSWiRce9Vp2ajLHW41vwVSH+nOeoVUYUzAirbgfnOmpM1TCFjmbT3BIu63Ah0Dkq+0EYsausw7BMuXFQA+w4fTEvfNP07SNeNzEZzUq098oOk7C0xLvnF4GKJ0jDa6SxvCQCXz8my12VOBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aH2U2qFj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743454593;
	bh=uTWAjVbNN88UhtAgPAK/Vp3NKR30ljP31iJDKc5Wa9Y=;
	h=Date:From:To:Cc:Subject:From;
	b=aH2U2qFjxdmM0W0mqFhvaj/kvMa6Oe1NhIFUGWLtzT47OkHXncWvp5gMaXwpusFnh
	 4OGQxYaC7OpGF9BoTJUo4DyEmb4DO7OVcHlakmWeN8lka4R7v6E5ztV33LSXVkoQTC
	 HqtKyeCkxVKIZtsgxVajj13serqkfsnekpTeVQZNty81IyUAtHdgY9l5A/CY6f6d6B
	 xgEvH/Qu2R09cYWjqMDrKpgrP8dboZp/H6OImDrS9ytzdLlIC+B0K1qV7ZtIwfJkCG
	 glkxHFUYho0dlPf0iwF128GTwXdF5HnbdbAOyfDq04YGxWgeEhqU7pZaL8cLehML7H
	 KfXDOcnI3g0NQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRNhx3CYVz4xG8;
	Tue,  1 Apr 2025 07:56:32 +1100 (AEDT)
Date: Tue, 1 Apr 2025 07:55:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the fuse tree
Message-ID: <20250401075555.58704b6e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gg65qDZRA85OFm7/NmBAN/P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gg65qDZRA85OFm7/NmBAN/P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  1dfe2a220e9c ("fuse: fix uring race condition for null dereference of fc")

This is commit

  d9ecc77193ca ("fuse: fix uring race condition for null dereference of fc")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gg65qDZRA85OFm7/NmBAN/P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrAVsACgkQAVBC80lX
0GzL1wgAjbAsjrDCvAwqDgFQNvCjO6fViU3h4nm8cGsK7PkX77aC03h/dywBzypm
qIZS/djn8nFi/pXYsk0eJfiTqnt12Y74ss999GL1JPYPcnqPl5+tSyj8qa61hsuO
HX24w+LWMf9+6N4Mhq3RinGOybhnSFeRiaVBqk/jA1+Uu3lNQy5sb69Vkv7Bu10/
PLhszlCEw3cEWALWnjPaiFUUV3KiYS5hjQtXn5Oj9NZy4ISSRYAyEc+iUklxrfZQ
fBemPyOQdYPCr4hUkbvGgS0Efi35EQQynquh0KHn8aKoz0N6s3aQPHjffQP72Mco
9yYQTyf8dKK4VFX1/LYvy5JpFH9fSA==
=497T
-----END PGP SIGNATURE-----

--Sig_/gg65qDZRA85OFm7/NmBAN/P--

