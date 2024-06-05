Return-Path: <linux-next+bounces-2471-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0668FD98E
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 00:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EB2F2833BE
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 22:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B42B15EFAC;
	Wed,  5 Jun 2024 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L//Vd0QQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507F449657;
	Wed,  5 Jun 2024 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717624878; cv=none; b=Nim5QfcFwqUllJVPcC5jUkk/K8t23tKd1VVLubFZOtSk+r+FcYBn5/oeLr/4imudUCdduxN90w6KbTafMnfH6HjsYFR/CjaJYPMX+R6fjcw++/uLsoy+oANEszDW1fP0ArOJtz91RhLwR9X0esTiF6lKPiGgZ601mfw7s5HzoQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717624878; c=relaxed/simple;
	bh=BKJYUteeNhVwwZJusBNsNNAMKcrF5l+jTmGfcevxoGo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AehSMItySo3zvi3i9fuJ656O9GVU1vpOGJwdzCILy72rXGHVu6dcmMkPosWb+efD1k5YSiv2PNjG2dKfvbscPHGgsCkOYtVAFoS5p0i5KAgtxeSiU+NEWEYeeDmq+KICqBhQ/7216aQfc07pbK12lLz5p39rtasKxR0okeHVFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L//Vd0QQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717624870;
	bh=gTTIjNfCJKhoYkH0P/Ecc5NtOSHh2zddmx71A7QIy3A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L//Vd0QQiZ8w4yBIqPwH+CezMOTU/NhItUa/d0UlIKNrdPNIoNcWr0cxCqaAMelSp
	 GSh1Evy2MLdWIiUFoXcOmwnBy/88UGF8JHCYsoucT/Vd2u2KSbiFeNlQV5yuaQxkjZ
	 +wWP8lyTQ+FXtL5lWppVtxCMwuUYsQQ9Je/Ow8b2/boThLyMnxHQ7j/AO+ZG7yBWN8
	 wX3dz19jXOYWROh7Xkq+rKkqmwaUbpfPOoe51UN0WuZ+31nd5sKvqNRYDK5tHo4guQ
	 xvs1eP529OvCwYRyaAtuV6hekUYFb0wt/JQxlO1WoipIEOfHIj6g7gHaxMfI6bxnn3
	 iIoqlP/4Bm9NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvhHT6TKTz4wc4;
	Thu,  6 Jun 2024 08:01:09 +1000 (AEST)
Date: Thu, 6 Jun 2024 08:01:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20240606080107.1347097a@canb.auug.org.au>
In-Reply-To: <20240604112010.4b29ffe7@canb.auug.org.au>
References: <20240604112010.4b29ffe7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qOCuCF5ixcGP9dk4WRqZLJn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qOCuCF5ixcGP9dk4WRqZLJn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Jun 2024 11:20:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the i2c tree as different commits
> (but the same patches):
>=20
>   5fb9780aa910 ("i2c: Remove I2C_CLASS_SPD")
>   fe69f7d19df7 ("i2c: synquacer: Remove a clk reference from struct synqu=
acer_i2c")
>=20
> These are commits
>=20
>   e61bcf42d290 ("i2c: Remove I2C_CLASS_SPD")
>   e6722ea6b9ed ("i2c: synquacer: Remove a clk reference from struct synqu=
acer_i2c")
>=20
> in the i2c tree.

These latter commits are now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/qOCuCF5ixcGP9dk4WRqZLJn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZg4CQACgkQAVBC80lX
0Gy9lwf+LOj5sJI1E3LK/DjLUaCmdPdKb47OfHwkyCyO0GDs07uRL07cS5G0jC5u
gGCiyAcEpZsYVulRbv+leaOWH8zCZGr81C1sWZcue+bMetRC6nkmxLFiS+k9yJLa
zMYT7UJKdSKWpsc18JQPodq65ZQ7OffS8SsYOP/6QoMiuCs7UeFz9LARryyeb2Om
mYsoShsRmOclRwmPkKmjlyKxHAvHNnz4iRJPtpqO4m8gvDxIEkfrLihEYMk6htJ0
/VO6dfl6v6yt626V1LnNRNPQhFkmOsQeyscyODIHvmdiEAu+3WmMMEczMkZt4Yiy
nPj1YV4A3o3mHo/K2wK+4QdqEpIa9Q==
=Mi/x
-----END PGP SIGNATURE-----

--Sig_/qOCuCF5ixcGP9dk4WRqZLJn--

