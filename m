Return-Path: <linux-next+bounces-2171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEA78BC4C8
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 02:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B68B3281474
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 00:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9232BA47;
	Mon,  6 May 2024 00:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r2p/GYhl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F2181;
	Mon,  6 May 2024 00:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714953752; cv=none; b=M1/kI6LnAU6vD4UfYcru5I1xGTccjiqTiAYsT7Smjkl4dSxsJeuTpze/JEsXYr/zJ5ECdHUcCOMQE3J7a6TAOWtfavOE87s+o6epV9CR6U1ad3JJFli1j+wSeP4aYXupr2j5A3wHr2UK7NtEiRREGLWRUAsyY17YVt0yN/VmY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714953752; c=relaxed/simple;
	bh=CH9DCGT+xh02u+NWI0zVLq3Erda6d2hK3GHIBz/SNLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i+uO5SWfqp8UVIUDG8CRo/y5qE/8gwyKJ0Xv3MOPnfKOYkYI5sbeZ1oxmQ67wTGOyEaVgqPVSZ8Cviw3q3WPMZQd/mSEaRPc9c4aCmtyCREWJ5MxNp2HRToCZsNZMMPjGBfPv5SwOi5RjL+5NWpNm3D6wyHcl75DM+O4CDLYyj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r2p/GYhl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714953748;
	bh=x/W2XGCnSjK/r57pGWJLcyDLh4e+NkqZjfWOMpTILaE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r2p/GYhlkkqBzWUJq1AtOe85x72JkHf9aa2vLlgxlGsGOEWKMze9qOJ7q8Gxb8Yae
	 yqBtTc7uSvmUifEG6AsVpPqQ+NQfdCMnLT+gDv7Ndt9pi/cb0sQpRKavyXzRdPfW+p
	 WT3TcJ9IW4wO+UK/iZvLoYEC5aK7y1aq6k+Hceyxd/1gGx9p+yYUNakZ/rKCgtHf4X
	 PTNkb8FOOaCek6h6zibn2fVsvawDA10baHov68FITnfgdw2KPSfdjPy0YByLxUniA3
	 JjUFiGnws7uh8CAdRtSdKbiuWVU6i9tTuarf3OtwX3+QXgnr41DZZSRMKwhoYUE8aL
	 oUOJqhOSc+egw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXhRm3cPWz4x12;
	Mon,  6 May 2024 10:02:28 +1000 (AEST)
Date: Mon, 6 May 2024 10:02:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the bluetooth tree
Message-ID: <20240506100227.5931714f@canb.auug.org.au>
In-Reply-To: <20240503130722.2390748f@canb.auug.org.au>
References: <20240503130722.2390748f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h.7L_fW4lVjB=DPUI/FQ8DE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h.7L_fW4lVjB=DPUI/FQ8DE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 3 May 2024 13:07:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commit is also in the mediatek tree as a different commit
> (but the same patch):
>=20
>   f90ac18d01cd ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")
>=20
> This is commit
>=20
>   7c9faab9d28f ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")
>=20
> in the mediatek tree.

The former commit is now commit

  cd17bcbd2b33 ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")

in the net tree and commit

  a757a088c27b ("arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node")

in the bluetooth tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/h.7L_fW4lVjB=DPUI/FQ8DE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4HhMACgkQAVBC80lX
0GxE4wf/a3e7zrAATW+rhLafOoci0v/ZaUmOGDfcl/v3VYaFsOD9IHMdwiaoueiD
ufJ9GztLsBn3pMnUYgv7RsWkT+N5y/42m955D5LIG8AqgFS7sLENvHMibsNV7DbE
hfq0pBcwX2W5nhE90TGI16Kr4hpZxYIC8UJsRbzVKDaqYsBdBcFYbhbSOniVdtgg
Nv+ijyAI66wgU2uwfDd0/Lnwfoq40Vhl3+3bJWLNYDScnivJsqRKwApyEeq2Zzc9
6KX+2WAfxg/cF9MMq6oUzoUCcmXWgf8hKuZteq3ZK0mamlfwOfuqfiWbpbhFh25M
PFSRgk4/aT8vFjWd4scDjFdT5pb6ZQ==
=w49n
-----END PGP SIGNATURE-----

--Sig_/h.7L_fW4lVjB=DPUI/FQ8DE--

