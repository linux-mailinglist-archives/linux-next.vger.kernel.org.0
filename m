Return-Path: <linux-next+bounces-2857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AB92AFE9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 285FD282A6F
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 06:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF6A7D07F;
	Tue,  9 Jul 2024 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Te7qhJcm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90A823CB;
	Tue,  9 Jul 2024 06:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505856; cv=none; b=hACaaQ93h569ZXATlmBCiWKKo1oIi3MjYl73hJvX9+55LS2g7dhF3Wxbmi5gPMTB2zJIknn94+VUE2/G8nLshmTptpSbCIWqzV0vSLKyb6f+bQtE+asYB73T7w7Ky85S+MKJThdyF59AifTqKJDGz+inUjtiP9ESPbpimeQuD7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505856; c=relaxed/simple;
	bh=/bfYY7Pnc67tx8QdrXOIBMHY3IgLTiYcHaZpJXjVgAw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kayQdDMgvF2LYgTzdeqClH3y4oP3Pk//qI4GT5x8VZyk98cSMFyTIMLVOsmyTzJ4BqjXkcy5DjJD5AYdp6/ekmqkjhdXHJy9zGUyfR2HG10ondbHpaudbtU2gPaPQRnDLKuxne5+xCtGH0ljdTODBsiw7kadECXNQROtHzFM6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Te7qhJcm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720505850;
	bh=KbpHW5yZYIKeJu8Op/ee9nPOYZvAeP9lvevF2f5gKbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Te7qhJcmF/mvFTknAfKj66jKLiHPkgcl61UFHdWs7IrddGL8JOHmW9QiIid/4Yryp
	 etiQ+1xtKIfi5FwStnMUjxhDlDP5A5VmxL/WYfpF4ndpzVVoK7ptX3z4+aowrFr2fD
	 LjAgrbMH+DNj3HE7NF4sL2u9drnjyC7hNRV3XQgay7g6YDkJjxA/nxqU/d7JOYabIi
	 WZ9K73TFzXuOhR5bSgAARwvigHY+iK3Sexv/UK2pcsdLecIWrVGc5NyKwtmEfQvMzH
	 Wk9cH5SngsJT7N6gHrYvH6whWuH4978vkWdX1LpyayQ+x+fbdai6aqL7zE2RNh4xrE
	 Y0Vu6NkJHE21Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ9kx5F6gz4w2F;
	Tue,  9 Jul 2024 16:17:29 +1000 (AEST)
Date: Tue, 9 Jul 2024 16:17:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the battery tree with the leds-lj
 tree
Message-ID: <20240709161729.27935749@canb.auug.org.au>
In-Reply-To: <20240709133420.55645c59@canb.auug.org.au>
References: <20240709133420.55645c59@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mc3oXx/Mhhq8Bo=lCwPs1TL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Mc3oXx/Mhhq8Bo=lCwPs1TL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 9 Jul 2024 13:34:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the battery tree got a conflict in:
>=20
>   include/linux/leds.h
>=20
> between commit:
>=20
>   6b0d3355e5a5 ("leds: class: Add flag to avoid automatic renaming of LED=
 devices")

This is also in the mfd tree.

> from the leds-lj tree and commit:
--=20
Cheers,
Stephen Rothwell

--Sig_/Mc3oXx/Mhhq8Bo=lCwPs1TL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM1fkACgkQAVBC80lX
0Gz/+gf/Qc2zGWCKGOp+3ATE6/bgoiUwsPm8STlQU8HicbwbyziKpj2VI1ZjFiEY
bydSVz633I82VctcFSKa4hxLsdHJw0Wqj7JPXAjJQRap1SihPbXWpm/t+pR2Hz/G
+2PQjbJtOlFXI7L/ec0Uj11NseDYs5p0V06lW6UB0n50euc4BuFVKW4zDfjrX9PY
yD8a8UuX3NvYl5ASbub+ud3rsYjbDCLMfv7F9uAEHW36T9R0A9CC1enT5v9E8ZXh
t0BEVB1VaLNUic7b7q1JjcRVrzberNzsyNiJZZwxX5gI26DLSsXJUUZfgcoTVFCa
9nBcc+LDLtvVq/c8SHE7R+JrXNXSUw==
=3RVN
-----END PGP SIGNATURE-----

--Sig_/Mc3oXx/Mhhq8Bo=lCwPs1TL--

