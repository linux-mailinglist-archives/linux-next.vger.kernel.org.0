Return-Path: <linux-next+bounces-3597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50A96CA26
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 00:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425B31F28880
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 22:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30BE81547F3;
	Wed,  4 Sep 2024 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dLgJUIB6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7651474BF;
	Wed,  4 Sep 2024 22:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725488438; cv=none; b=oMAGWDx4dPKJYBvvjnvd6YnKjpBKYQnDYQwOpez5IzwA/TgTLaSfhM9isRFi8hwlJOU9IuGn/6Be4hq1ME24Ft/lvzcS/6KTlHdErl399ullVJkLsPx66cdEZzph9pMsWz/6LE4J5YuZdy69fdjPsBTf8zqfjwU0513kT1nicx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725488438; c=relaxed/simple;
	bh=z9lxq0HFgo2q1DGzbWXTsfmuOP7H5na12FXnFGjK8yg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Shr9Idxjzo7NHMgivGrwstvFVYwGlLerw298UaOjFNm2fzV+rwWYQYGi5rhY7vFo/0xjXvn8Zk7Zd8U5oGLMTasuOyYAjAffvzUQFkYDi21JDOPJGKjx9Iwz/J9X8ruFmEyZ8x1rpO73YJHLl9LKjMvpLzGaJoXxghSFldsH+To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dLgJUIB6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725488430;
	bh=SjBzfwsVsii4wcgUs8pa8wXjYsczDb3ai3j7hSYpzuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dLgJUIB64ZpEhdiDfGa9U3+r/9G9IzEz5rrsgY2zyl8DRQWlwgJ0eudByGB+qlXqO
	 2Z/3OGzy+ss1VZ3gpLrOJlr3mlpRhuxOelybVwcvpu4LUT+UMYsgjhoHYB4+NKMhLw
	 Lsc/z7PlWDfu5TlnJblwE9hztB2XvSwq+jvu0HuGT9OHdZ8U4a19Dd3EAzG2SjXFif
	 GxGECmUk8mXQLasIcPDv100S6GGjepk4yDVPEV9rCoxsD4Iz66boYQAHWlW6p1i8l3
	 lBRQJ8MmgB1iOXTZclEBFJ8xLjS7EeXepq2XqiQKLbhDUAsl8xdHXMDDdIDiCyMfuv
	 xWh0goxCPLXQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzcPp3HR1z4wbv;
	Thu,  5 Sep 2024 08:20:30 +1000 (AEST)
Date: Thu, 5 Sep 2024 08:20:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240905082028.14012c29@canb.auug.org.au>
In-Reply-To: <20240903093343.78385cdc@canb.auug.org.au>
References: <20240903093343.78385cdc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6E8MwB4.rAV0gRet0.G=+.I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6E8MwB4.rAV0gRet0.G=+.I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 3 Sep 2024 09:33:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the btrfs-fixes tree as different
> commits (but the same patches):
>=20
>   d3e969781d9f ("btrfs: fix race between direct IO write and fsync when u=
sing same fd")
>   31c104266edb ("btrfs: zoned: handle broken write pointer on zones")
>   e336770f04a2 ("btrfs: qgroup: don't use extent changeset when not neede=
d")
>=20
> These are commits
>=20
>   95b3456f23e3 ("btrfs: fix race between direct IO write and fsync when u=
sing same fd")
>   b1934cd60695 ("btrfs: zoned: handle broken write pointer on zones")
>   c346c629765a ("btrfs: qgroup: don't use extent changeset when not neede=
d")

These latter commits are now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/6E8MwB4.rAV0gRet0.G=+.I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbY3SwACgkQAVBC80lX
0Gx9CwgAkbOP8fE6AtQAVYyld873CtEvRln/VqwZKfre8u4wlBUoyNM8PZ/Z1Egx
MLRp07gJvAwi0p/mhBzeDWj7ZI5qyMCHNsweSv579GFYUtn4anZ/8ULYvg5qzFbg
Xuz0VW7rZhnH/dl74hmmSIMuMAHpU94o7loUSvrDXA2JJu3+Ede6JLJXCdjfzVZ+
bk3eza/gLI7BN1A6BkM08RSnUehbpptP7i3mx9XUa9sPo8UBuH5vLrcxBYUDLcRp
Gx3eaxwQK0yDAiz2+avOt3uWsF/0ufJGCXZ1pVzYbEB/x7QUtkKFeBU1+H3tvc3V
pXaj+UjXEpEL5kK3yR9XfOlP2SqDRg==
=pLEp
-----END PGP SIGNATURE-----

--Sig_/6E8MwB4.rAV0gRet0.G=+.I--

