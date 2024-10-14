Return-Path: <linux-next+bounces-4250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECF599BD8E
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 04:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A81D1F22756
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 02:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FEB1BDCF;
	Mon, 14 Oct 2024 02:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TllUVZq5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DF168DA;
	Mon, 14 Oct 2024 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728871426; cv=none; b=P4hmp9xuAdQx57rKaMSV7104GuI8184kbk7Hz77apKlmvg2cQYjrLZpuPxC8vTypBCRjHp7eIjWTMc5GaWv6Eo2L2AW+3PCtoQkfNF487wvwgoEHtp1H0k01L6j6+LG3+cVbuXHK/tAdt82nIMllnZrzX/G5fqzxzp9IK47mQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728871426; c=relaxed/simple;
	bh=55KygzKNrRRbncpnOynXwhYTgClqb16i0hANCoLZWtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UKUyV9xHhK0aiU5usbberovtEQYYWxO2Tewdx8BZIK1A8H/NGzjYjKiV3wxG3oFB/nnw50qy7gNzXsN3ZajPoq4q26efJLqp5m+w38FqqLLi/PJsj/TtNtuFF/NJijRdMszxixehanXgY7hfUqnqFEboiFXI7+iWzAa3aRiNuas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TllUVZq5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728871418;
	bh=GrtT2hgw3LHFMU9et1Sy8beIqOvw8uKH0xUKvkoRMFw=;
	h=Date:From:To:Cc:Subject:From;
	b=TllUVZq5npJ1gSO8QCXtEqm+b7Fe+C8aTGpYq0cJN1ZwWYmDTIlgvKyVLspNWa4w9
	 TssoV8zFhV/glm60rBm89+Vvjdmy/jLhKq8dxwcbd8nW0WarD0ojcF1IaS2kf5VJBO
	 Sd3quoXeVXqe58w5ADi2Jw8DbjYEXlZQWoxae2JelwWteI5o28CPraBPZQh9cZc+Xq
	 EcDdXGwqagaUL4df6/zwzbS4Bz/Z41cxNmfZDHVdFVxt9GmKoNjvn2zCM31q2dBb9Z
	 bTKqrMSyIia+6RZZ/rwy5FbLy+zEoLxtlrmcsCIcQg7Y88+ZkhQLdfN3PlhzB8Nmi3
	 jUIQRwZdnmsdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRgWF0DB1z4x8W;
	Mon, 14 Oct 2024 13:03:36 +1100 (AEDT)
Date: Mon, 14 Oct 2024 13:03:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20241014130336.06b99889@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MHLTUV8f_8h5Ojzu9tTmLjW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MHLTUV8f_8h5Ojzu9tTmLjW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  6330e80ef1a2 ("Documentation/process: maintainer-soc: clarify submitting =
patches")

This is commit

  29ce0bca6d5f ("Documentation/process: maintainer-soc: clarify submitting =
patches")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/MHLTUV8f_8h5Ojzu9tTmLjW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcMe/gACgkQAVBC80lX
0Gww6wf9Hs/PfkHkpQCas6G//kajpU+eU8x+lQlHHWL3L7Hhi5m/CxW+oUkFmrxq
/tAihU4z/hTO6wsaZKnuuGbBHSzIuuWK9cFzMDGcwQlbC24s2cRgiKqfwxF+bObr
hrCLze6RjF297klfSPuTAdrIxcyaC+0wJ37I81tw7d7q0rpd2tX7XzLszroLgsEG
OkAIwo9KMHkZKjNYAHtWfYT4QMC9aPJ386qGKrblhhLR7kBQMTHxNUBQ//Af4y3v
KvUAl67cmNWRI0SwrvxlrfAXCwrITwr5YMP6fC04Jgal/EorHt6yCGVU0lMAbeoM
zUn19uu48Ez99oBzUvvDxZ/r+7CKBA==
=Tcmz
-----END PGP SIGNATURE-----

--Sig_/MHLTUV8f_8h5Ojzu9tTmLjW--

