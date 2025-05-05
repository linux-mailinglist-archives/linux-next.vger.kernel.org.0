Return-Path: <linux-next+bounces-6529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219D6AA9E58
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 23:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BA93A97D6
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 21:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5BD26E158;
	Mon,  5 May 2025 21:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GHuMv1rt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FAC1C1F05;
	Mon,  5 May 2025 21:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481499; cv=none; b=bqtGul7ohclkO6UWl96EMj4vupvkjrnqfXV+LW+fQz9QT2p6WpQ4qwbd+Uh1sKGU96nUZIus8Gkh6PYIJUWnxamao40nS1fikWgWKW1CdOyxH1QwPkY+Ppit9Rj2MM4Yu/i8zz5Uo6CxyG8f5fZoAF4rbUIZFv3cFBD3NBEaH/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481499; c=relaxed/simple;
	bh=QlQXqiJRcUcsqLT4BtgsUCAWJ+bsHCvuv98JrHBbUus=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAP6GUSPuNBhJ/zXPDCNuTpgj3/u6CiBooq8NrPeIniwb/L8XyVv7MB31ZW4dj1R42W3PgbBshSscOZVtCeMt3aZOQtGvjG/rHK55DGkbdKP9yd9tAmxC+m0eS5g+bprZITt9bbhaPaJifF4sGXex9tEsfZTWnCImTbCm3pdJoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GHuMv1rt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746481493;
	bh=/+s1iPc26YCmSpvShRrXdax3x1rFHs/iyPOXRBhDmYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GHuMv1rtBvksDbCJuFZxN5ToompGNH0vaiIaGpadcwgN6ZEuSgLUQMt27bEYyjhvj
	 UK0++hvoB4xoJY1MgF1X1yNOnHYR7ymEUf/V0wWeBCKgdviWoY9eQp1H3Vfgx9VrsA
	 OKychBZJDNQTmkE8FFOmEfCJofxzy8Bhifj8uMrFmGWSN9gy6fV0g20Jw65ECZS+RJ
	 EM3YOkZpFEhQOyJ3wjl7usRRvY6Y8vasnFQOCfaEtm1/2DkEy49kohqyLkTbEMwIal
	 Sp8u0XUZ6QvCBDeTKeetIHnlVS7/mC0raQHDlPPq9evDsflIyHE3tYd2TDbG36j+Q+
	 /RjGa5XBRkOng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zrw6Y16cmz4wbr;
	Tue,  6 May 2025 07:44:53 +1000 (AEST)
Date: Tue, 6 May 2025 07:44:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250506074452.65f4e0af@canb.auug.org.au>
In-Reply-To: <20250501113753.53f6fc88@canb.auug.org.au>
References: <20250501113753.53f6fc88@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zMy.MsZf4ijzjRR=.y.Gt/_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 May 2025 11:37:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the arm-soc-fixes tree as different
> commits (but the same patches):
>=20
>   0530a74f3f43 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp23 SoCs")
>   6485975d7832 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
3 SoCs")
>   635ff238ff7b ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp21 SoCs")
>   2ae67a2e7e4f ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
1 SoCs")
>   97d0a619e248 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp25 SoCs")
>   e5694384b07d ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
5 SoCs")
>=20
> These are commits
>=20
>   2ef5c66cba61 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp23 SoCs")
>   3a1e1082097b ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
3 SoCs")
>   1bc229e9bb9c ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp21 SoCs")
>   02dc83f09c72 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
1 SoCs")
>   06c231fe953a ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp25 SoCs")
>   de2b2107d5a4 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
5 SoCs")
>=20
> in the arm-soc-fixes tree.

These letter commits are now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZMVQACgkQAVBC80lX
0GzyJwf/dlMQPP5xQckkJraDiIWaxvaUG5t0WidE1Zo8gsr4U+0BtV5HWeycgSe7
tKbO4AwXoLf+ACJ83EbpuLOah4oF+Gbn9Dp5DIMvS7ilx2+s5VsMnggdGP5dZtxr
h7KeByL73xlaZZQdcUZvxe0aDE+Yra9Dq+LfDKryzMkt7y0SCQtEghIx6hA4DLm7
E15Rrai23FvmHhQxx4ftWk3razwkR5IG0IFBg83Nh2aa6SnGn7rvGAif9Lcny6en
gYhZPEvcXbgfDxTHqYNNNnVSf9X4uQ0Oa9LOdJ7UDdOojmNaE85QIH8NjU43ixCs
Fwhlybs/VCx+x7u4R7RIibBZwlBvfw==
=4q8H
-----END PGP SIGNATURE-----

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_--

