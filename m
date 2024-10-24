Return-Path: <linux-next+bounces-4422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A969AF474
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7239B232B5
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209602178F4;
	Thu, 24 Oct 2024 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="luO/XxWm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6088189F3E;
	Thu, 24 Oct 2024 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804228; cv=none; b=Hn3PIea1pcJiGXaqtZEIiLhzXjJqatV5agpA36mbuQZYwfSYb4iKntLuLO/hkorjY80/VXpTzTgj48/ZD3x3oMtbAVvOvCrq+pzyCQmppIZFo8L2AOhCzaSA2MyB0zkjwuUb8k40J3IED53apIhav2ILYqi4CoByVT5yULR098A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804228; c=relaxed/simple;
	bh=T4SI51se7MNeBUliQlABS1JGX+KzKxqPtaJ3R8E3R/I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mWsel58f7X7a6++14EBQ+8Ld1JHKmnKaPaUpbZlvA2xg43v8r8hWOe2cqvdE6kZlYJ0XXe7xAuKl7QvRbOrKkX4veg0a4C4K+rvFRjTPJ6dsf8dfjAA/x1eFnopmflPmfwu9YAXzdxOqGCpuLYWabelBL/5cu7FY+7csY4Ep4Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=luO/XxWm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729804222;
	bh=0eHtwl754KQjRekdCNrYRe/M3geAq2wpHSHy/nOWY8g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=luO/XxWm5E/y+puUekL3U8ebr7LY4LcIMqz1PLQL7iJekGizw4hnggljqRlk8FRLD
	 ECjyIaJZpf8BZy7JpTI+nl5/U4ZEU3JI6Pxo2jd9f8g9DqIqRsn0cTbU7t44dr31WY
	 JD3q+7IQFtRxQmsplwkxZjZSM+vPtqyxU/+TmKhdf+1pytBR93a3JtvtXys2DAavrI
	 5dG/htbb3Oh36zx4ZT+udPZbuyS9KOmcFg8/GBTAi9zDnIk6DeNFlJu+HRg9GE629c
	 cCX37noxDQbGZhVq5u9/nsidMJKwnczjMzhYtbFQ5Q3DT1DTQuB3ypx64Jw85Zymh+
	 o/lyuyaDik8wA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZJTp0P1Xz4wyk;
	Fri, 25 Oct 2024 08:10:22 +1100 (AEDT)
Date: Fri, 25 Oct 2024 08:10:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>, Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
Message-ID: <20241025081022.5af39f10@canb.auug.org.au>
In-Reply-To: <20241025080800.354b7575@canb.auug.org.au>
References: <20241025080800.354b7575@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/._HsJ8bK_GkEAA5F6Z6GEhM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/._HsJ8bK_GkEAA5F6Z6GEhM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, this should have referred to the pm tree not he pci tree.

On Fri, 25 Oct 2024 08:08:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   7027b415ff1a ("cpufreq/amd-pstate-ut: Add fix for min freq unit test")
>=20
> Fixes tag
>=20
>   Fixes: 642aff3964b0f ("cpufreq/amd-pstate: Set the initial min_freq to =
lowest_nonlinear_freq")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: f2542c904294 ("cpufreq/amd-pstate: Set the initial min_freq to low=
est_nonlinear_freq")

--=20
Cheers,
Stephen Rothwell

--Sig_/._HsJ8bK_GkEAA5F6Z6GEhM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcat74ACgkQAVBC80lX
0GyXOwgAi0MmE+1oHvDkCEagHArUiCeS56uVSdteuVw7Avf0Ixj2W8QhuvRm/qZ1
Y7g8UkFrbVmJxMCVX58HdS+NwMu8VbHW+hF6f9WqXK5A5LvpWo65SsnBbvawE6l2
lr5ygriHFQNoGY7BVQy/gf4fopb6IFB/feQxWszhBNjdXC6vSkTCQKtMQq8CEjJo
4ft9cT5jAUtNC7vLbrsnTlqm2WoMI/07VmlPrWt6A8Fq3NEedY/t2G7nGC1xzaB2
TnxjECXH4iKY9mGnEapFOLs3PxmFSPeyKiZyyr88RKNQfjwEturscD4T2sPmxaAx
UwLpaNStqtX3MUl8NJp5LjMDvKHJtg==
=xde4
-----END PGP SIGNATURE-----

--Sig_/._HsJ8bK_GkEAA5F6Z6GEhM--

