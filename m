Return-Path: <linux-next+bounces-7656-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47148B0BEDB
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 10:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12002189D194
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 08:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AB82877DD;
	Mon, 21 Jul 2025 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nVy8vyOd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4521C190;
	Mon, 21 Jul 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753086452; cv=none; b=VoKWg1OAj/qoZFoBTHFrMcIvLELYS6LnbArMZTC3NXfrviHX41wmKbzOZGaSdMgC8sQ+IuZtqkWvMuUso2i9ckKjs4Jl9wMBPGahWoiVImtgA2f7xBgtBemxJyxxjwxewG/KXjpUkGwD6Gh9JBtCHkSehw24Xxccs85KQxYYEis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753086452; c=relaxed/simple;
	bh=YxEmM+loy56EvXBQAerKHJbeTFi9ctoBnSJ1NoLcB7o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMiBWwaO6mHWfaLUI7Sg7M3uMlZ9Z1zNO9LJEo0faZyvz7aFVdg0KwTPRuFA8Ov27r9xHVg4d2vE88HmY5Zxin2IJjE1CnWOykfhQs/teYhChi5cE+wkjHzP9LdYxLa7Vw9+eDKpWUC+1KGurQ7jlZcD9zg/fZLnPzug96iiH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nVy8vyOd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753086295;
	bh=Q/Sp2Ei4mG6semz0kFGl8S5t0HYN7HFOUrEZDzrIxm4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nVy8vyOdwQ3mTs7RhKyjuBqF0BlG/IfiSOs5E8HbQLl/XKBzBou0wlxSr2GBIF5G4
	 6WgrtT6Jbl20sELcUJYJJBkbXUcq2kYciJLIaiaUfUItXZ55F47I9DdRP4ZSzUYlUQ
	 GiThWv6A7h/hiWJbP5nZOzWFyTBjgfhE6xD0Bk8BvyXoOn7kInoGVT+uEnaICbVtoG
	 eMIQxI7EvT3I2nkvhCoqMHw/k1VK9NTWMIVQvnZ9wzZ9v3KRkV4p/ZlgN3g6yYGoAz
	 qJzx2Au3AYIHRlCXqWhXQxcMnjQbrX8lQVRmEzi7dVuBDjx+1mPDPUa2L9AxV0GYnO
	 FRqU7pR4CnUrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bltjz2nMmz4wcg;
	Mon, 21 Jul 2025 18:24:55 +1000 (AEST)
Date: Mon, 21 Jul 2025 18:27:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: Move thead clk and dt trees to kernel.org
Message-ID: <20250721182726.7a155137@canb.auug.org.au>
In-Reply-To: <aH3wrHifvImaUUiN@x1>
References: <aH3wrHifvImaUUiN@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YTODExdJKup+cd1gp9dUnR+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YTODExdJKup+cd1gp9dUnR+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Mon, 21 Jul 2025 00:47:56 -0700 Drew Fustini <fustini@kernel.org> wrote:
>
> I've recently gotten a kernel.org account moved the thead clk and dt tree=
s from github to kernel.org:
>=20
>=20
> thead-clk	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux=
.git#thead-clk-for-next
> head-clk-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/=
linux.git#thead-clk-fixes
> thead-dt	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.=
git#thead-dt-for-next
> thead-dt-fixes	git	git://git.kernel.org/pub/scm/linux/kernel/git/fustini/=
linux.git#thead-dt-fixes

I have updated my configuration, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/YTODExdJKup+cd1gp9dUnR+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9+e4ACgkQAVBC80lX
0Gztmgf/eecZV6WTY4tJ6e4P9tGJHBybeoJ3sSnzUXYh0Ints7V+n9nFfd81xHFw
pJb2ZVxh5Hr/i2hTlJ1v+Z1DoB7SWskJvHQ2DHJjK57gApsCJs792Yyupakm8xce
BdK92WKj+h6+/3tJE8VFxqYiIMzdNqCq3Zd/QaeZOyPGHylZsiOD25okmrgTOj5D
0pm9xZCarUtciko6FUOE9f4/PxPMHkqiVfsMjVmDaeLmbSJLniV8C4KctFKVm/VN
GIIj6WFgDSScvFRA1sSv76rGjupTu7jJ5l2Ao6Al/7PaeRuN0w7i4XulSHistia/
ybPusvokiEGp1qU0gbnAmyLDoVKWhw==
=hX1r
-----END PGP SIGNATURE-----

--Sig_/YTODExdJKup+cd1gp9dUnR+--

