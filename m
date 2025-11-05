Return-Path: <linux-next+bounces-8831-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23EC33D8E
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 04:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBDB421DC8
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 03:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E57C221FA0;
	Wed,  5 Nov 2025 03:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IMp7vhiX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36626ACC;
	Wed,  5 Nov 2025 03:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762313836; cv=none; b=iMq9CMj9GDxcxJ4WsjhapudCynKyFvi6ks9FwLnuX6VtswlU1VUQE2IfpG9wbWfKYsEjsDF8ydZbo9obV9J7hY3IjDiNiRzZxDl2R8aIzgxD1r4CgLdq8B+rYZ5l4Tb5rkBLjN46PY9U04saFLW0Ww5jmjET0UfIUALDa2bGud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762313836; c=relaxed/simple;
	bh=A49Hhaqyypmd7Y5Di6/3DOkaheIhd7DvA9Rar5iEbKM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEDmtJfz2UzOZAnFlDeocrGNXpwK6/WiaZuJGzr9h/bMTElAnckFyBvz2Z999GS4uEFw9T4Kf6nZ/728wDYsl3hGP6Dg3dToefEjjbpGOiN88Ttg1bSnI1UlOmzTpJoP/Nx/p8pl299crxiUJSUSWiLJt7XzlxZ4ZpOvWH4xgoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IMp7vhiX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762313829;
	bh=A49Hhaqyypmd7Y5Di6/3DOkaheIhd7DvA9Rar5iEbKM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IMp7vhiXkxWJiiGFISrg609AUSrTBKgnzM9zEdXbI3hnO5jA7lGB09p/XhB0ICZjn
	 U8NZcWFUdfosRHI1SYaFLoclgE5KxOLaFI5y5YI0ZX854l1PPnx2AYy1/nA8QgPOQh
	 8gDF5PrCUBlMmteGR/SSywlTY0CKQ1g4+blNXxHfjaLsTQ1Ijy/FXczs9AsFN3frW6
	 NqImCpgNBKhr5gLV31y70j8dyreWcHU7O7XLF/NsA4hJsAFzP/O2jBiRskQV0ucNX9
	 dAOniB7lJ7Wovw91LR0FboJY1CpL4Nbxqit4CuGVF2w4WxPPtBpX+meNCX69IcqGVU
	 YAmldu4EfffUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1WGX4D2Xz4w1j;
	Wed, 05 Nov 2025 14:37:08 +1100 (AEDT)
Date: Wed, 5 Nov 2025 14:37:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Add tenstorrent to linux-next
Message-ID: <20251105143707.5335b2fc@canb.auug.org.au>
In-Reply-To: <aQqj8yBEUUxfqPA5@x1>
References: <aQpkDYXT3N6qWiZs@x1>
	<20251105091947.2692a796@canb.auug.org.au>
	<aQqj8yBEUUxfqPA5@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gWtRr01+22b72356xalKpJF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gWtRr01+22b72356xalKpJF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Tue, 4 Nov 2025 17:10:11 -0800 Drew Fustini <fustini@kernel.org> wrote:
>
> Thank you. Yes, please add:
>=20
> Joel Stanley <joel@jms.id.au>

Done.

> > Also, should I update your other trees (thead-clk, thead-clk-fixes,
> > thead-dt and thead-dt-fixes) to use your kernel.org address as contact?=
 =20
>=20
> Yes, please update my address to be fustini@kernel.org.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/gWtRr01+22b72356xalKpJF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKxmMACgkQAVBC80lX
0Gze9Qf7BtEDeNyH0Sv5ojOVon5oITEQcNii+FqEuCIfidPXoXQl7yKIjoo+7U9Q
zGTNoyo936yMAz2JXPLrS1sy+FphyVeQvhJt3w7/7+VShnSUeV08O5I7AmBJgkPr
WZqvzswgDd3L3a8n/JYdLDv0nQ7V8vVqKD8ekEAVFSAHv/c6XuqR+6iPd12+0svn
g8NwWa2IXypgQSC+M+TS+yjFmtKOlb3becHa0aU1c6gPKv9OLpVB/x/PT8Xp8eD+
fVJsui6h+AhTiWQc1dO2ZAUoNHUEmMXsbBpHg0eXqtIolAqOrnWC0Y9AxPJPbauh
Cn6hn1j4Ws+5XFxOpZQ5Yhnfr+3bXA==
=6U30
-----END PGP SIGNATURE-----

--Sig_/gWtRr01+22b72356xalKpJF--

