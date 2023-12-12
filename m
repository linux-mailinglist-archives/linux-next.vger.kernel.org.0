Return-Path: <linux-next+bounces-351-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF10A80E43C
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 07:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91E10281A39
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 06:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2FE156EF;
	Tue, 12 Dec 2023 06:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FnG/RHsY"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CECFBF;
	Mon, 11 Dec 2023 22:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702362309;
	bh=6FXciDOk6FJw/FyZAH+ChmYphbgzU+7buoZzINDwj7M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FnG/RHsYZH5RE9Idh9U57qbBLBioaHdoZ53FMN+qFxti77h1edLaX/wyouOUgK7/q
	 L7Xe/g6+A4Gj1g0MkTJ1H1thFfuZYKybJdJyRmdpjbAq7fN7pAUg99LSHcA6Zrg0ZM
	 bmWdiZYGItqQSik60e293dUcwi7c6FZXJt+o/VohUsS5MJ9iCrNT3MCr2AUJ4PG0SA
	 mxfvHSKvJhCS4ZPyVkQwzQ/4wSkReEWxlOpj3Scoey+gNa/mZxkxLa5U1+AQq+XU0i
	 MkRiAd35q7NCSbzrw97tQnsC5yEK8fNNuPYOJS5yMsubZdb60BB9DMx9MSQkZAvZWE
	 /ZrliNwmmG3VQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sq7rh6V7Nz4wch;
	Tue, 12 Dec 2023 17:25:08 +1100 (AEDT)
Date: Tue, 12 Dec 2023 17:25:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Dec 12
Message-ID: <20231212172508.5b6f963f@canb.auug.org.au>
In-Reply-To: <20231212143215.7c2283ca@canb.auug.org.au>
References: <20231212143215.7c2283ca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8.wA3rvlF5iasU6SZKLrtX1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8.wA3rvlF5iasU6SZKLrtX1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 12 Dec 2023 14:32:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The nvmem tree gained a build failure for which I applied a patch.
>=20
> The percpu tree gained a build failure for which I applied a patch.

These two trees actually lost their build failures.
--=20
Cheers,
Stephen Rothwell

--Sig_/8.wA3rvlF5iasU6SZKLrtX1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3/MQACgkQAVBC80lX
0Gzf8QgAhfG+7eEXRIVngcvzOZnvXw3A+fnYjiG3HJQl8g61VGXsUXLSaYupcFZ4
7UN7QWfaYcVzwX9cRhI/ZK8RhkU4pCRm9d4Lk5r2DlNMWccPucW6XMgZr4ANOE7Z
FOH9ktyC2vUED2x2k4lRNwEhxttHmJCTvvOvBINTHLjluN+SQuW2tv0D6FolMlZX
TtSUzmx9J9dEUnSr3fGqfU7DOCVH76xbM/7HWX7TbSd/BD+5tKZFmNrxv4A4ykL7
oAkCFK037dK56xouLXmNZ1jze7SSKKpE91DRRNaOB4GKYv3BZmZ3UXdKlom8Nqx4
bR7S+MLKnCWUtV0uk+xYmb9RIN5D/w==
=jCMe
-----END PGP SIGNATURE-----

--Sig_/8.wA3rvlF5iasU6SZKLrtX1--

