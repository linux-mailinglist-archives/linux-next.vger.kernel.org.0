Return-Path: <linux-next+bounces-2744-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5091D822
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 08:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 831012823C3
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 06:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE182AEE4;
	Mon,  1 Jul 2024 06:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e832vC/8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1F1EB39;
	Mon,  1 Jul 2024 06:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719815876; cv=none; b=Zzbe1gpscIXGYs3pxIGyTQxa0N18X1JbEozxH7zQpo9lKAKSaIN3/5EaZPc/MmQxZ2H6Z98XsOZ7PtC9ouTPRzEWhCg6HHtrGiCxpD135kwIgKN4fEKNMA3uQ6xhfferTP293nu+XUd1xAbyPwA20hHX3WNgTCT/dwJ9RH4ntI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719815876; c=relaxed/simple;
	bh=22m8O6MUi2tt0pFEovdLdAAmF56phJ3NrySQcEh5Ieg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iIWZBJQnASRt16LwmSdRw0OE3PPhO9O/k+Z6yiGk+WQvi+4CAQT1/eqQX6LG5bNgdy+pYmCUSw96vUTyMZW9LkKJWj260kdenw0Ocoi+Ma6DCw8XsdvE6+qW8b2YXcKS9+mJh5DJrLhKjM9odx7N7Vef/9ApV3fzYVHawi+XmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e832vC/8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719815870;
	bh=12iGK4Ul/rycZjL5lbskDhlvRrR1H34Pq5UiS5GkvEo=;
	h=Date:From:To:Cc:Subject:From;
	b=e832vC/8asNXJk190rvLk6nQm8TMhxUirDHPgPO+e4o5J3F0D4wv0ckxsOoumPzKB
	 rjLVM8iLfv5pPz9JdS7AcbxuSPeCp59/YzoaUR+3RSfu64eaCoqt8nu1TnNHEeL5qb
	 GK1QEVBB8i5d+vmRz/FVga3Y/1t/GbIAe0ixMJQZwWPHzhkc2GvXEEhjAjo3m/fhV5
	 89qYjmytWSCeYneP+1pFnlH9X1BG4FAJfBBfP58jw6cYGuNHoA2ZeLxD4ojUglbAIH
	 BZJx4AzaAWPOOilk1hyiJ+W09NOspATLjdgWO/tIa11LXxU6Eoj7PeEX8O07fqANwT
	 csLTof9Gu3kLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCGZ6440pz4wc1;
	Mon,  1 Jul 2024 16:37:50 +1000 (AEST)
Date: Mon, 1 Jul 2024 16:37:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: William Breathitt Gray <wbg@kernel.org>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Judith Mendez <jm@ti.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: linux-next: manual merge of the counter-next tree with the ti tree
Message-ID: <20240701163749.1cb88c8b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lawX54KGzj4WtjT3MpcpoND";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lawX54KGzj4WtjT3MpcpoND
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the counter-next tree got a conflict in:

  arch/arm64/boot/dts/ti/k3-am62p-main.dtsi

between commits:

  3ad6579f106d ("arm64: dts: ti: am62p: Rename am62p-{}.dtsi to am62p-j722s=
-common-{}.dtsi")
  77044cfb9346 ("arm64: dts: ti: k3-am62p-j722s: Move AM62P specific USB1 t=
o am62p-main.dtsi")
  ed07d82f9e3e ("arm64: dts: ti: k3-am62p-j722s: Move SoC-specific node pro=
perties")
  84935117f25f ("arm64: dts: ti: k3-am62p: Add gpio-ranges properties")

from the ti tree and commit:

  131eaf47c4c5 ("arm64: dts: ti: k3-am62p-main: Add eQEP nodes")

from the counter-next tree.

I don't know how to fix this up, so I just dropped the latter chanhd
for now.

--=20
Cheers,
Stephen Rothwell

--Sig_/lawX54KGzj4WtjT3MpcpoND
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCTr0ACgkQAVBC80lX
0GzpKggAjWeo5DrL9ZZgqXb2EYOGinb6/nT6eHv6bCJtOgYTRT2ka/uS6EG0ZaV3
8KFuTcVKcKYVVrpWMqJUzWGrIYXxJrvHJM+n0EOEhX/rmJ92MTgVEzvelAnevnpn
cCu/34wXOW5VDsnKyBLKPju6zuR2ZkJlRNk2dg3H89aDzhFkaAxSBifGdVFcgIr2
EdqV/GZhgGMNshILpx0G0AbGb2caVkv1ndwd50pV8W+qxljL3rkPn3DmhfwpcX1K
F7KPSqotb5+YmwtMucNuBZFgffDLyKfhpll1F7NtJ2g2toiql7gV0RRHOg+uzztF
Rng9Yc9eUSlohw8pLyNlJMl/bAcENQ==
=biE3
-----END PGP SIGNATURE-----

--Sig_/lawX54KGzj4WtjT3MpcpoND--

