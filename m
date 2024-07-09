Return-Path: <linux-next+bounces-2847-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5392ACE5
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 02:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D5D1F2201C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E85519E;
	Tue,  9 Jul 2024 00:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MjgAukN9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2E620;
	Tue,  9 Jul 2024 00:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720483541; cv=none; b=BeJTPQAJe+8MXYnGA5KPzpcZ71ADe7661AYhARWQHS8wax/LdarmjT9EdFJTng450ykdF0yZSPFDPe+JVZhLQxoIy5STi3sLxf/n6Zk/6qPMI8iVlm0U4cFZwOZLaIExB8hgcjs6dK2TwFVdujo+EMw1aNdjFZyr7wQh3wT7b0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720483541; c=relaxed/simple;
	bh=Z7EHCA8NaiIEVH48mZPxxu3q9I5V2v72cRt1kQ6mQ6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dhz2UfwXWTBgf3R7WRS25SBHvaUSpjsbxkvEhWbDsHqvceiqXa27414mEf02qCv36VBWu6jWx1F4zbcf4oKeAf7vgGYVtai+A0ptp/L4Ti4q8nLuAfDozHzWnbIeziZua5KWzs5esJ61hDbPPZlDUjC2eDYNJnY73J9UF/ACCmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MjgAukN9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720483537;
	bh=PaykyPH8ziJi5niwI62T2Oudzl3gDNlj1sJowYCkoB4=;
	h=Date:From:To:Cc:Subject:From;
	b=MjgAukN9XvYl5pXcJ9RIEfNQzzN7zECoPcvkwUBS6Fgjx/wa81B8ixvvcFKlxcQZc
	 9E99AVgyfnUzJZXjSye4lYJYCC71VE3MvxgMCAZIeKAGUYlEnFEImY3s8xIAMcgMAP
	 /g4benLru3Yd1z7bEtpMoB/jO1tcKOIhSmsnIhitGsJRdVUKT4OHry/Ae3awXAlN4I
	 nGw6SNRay3ed2CsiAMpuk5+kAQWEUfKbId5k29dXMgev04pA8mh8mNQxwSHxlMhNdZ
	 Pbd8UaxK4cvwdESkFdwzrgzq7HKgJrc3AWBftt0JLriVW64RgQp3acMOZqprDTCZtx
	 /xKklwqpbqkWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ1Ts08Nnz4w2R;
	Tue,  9 Jul 2024 10:05:36 +1000 (AEST)
Date: Tue, 9 Jul 2024 10:05:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>, Arnaldo Carvalho de Melo
 <arnaldo.melo@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Ian
 Rogers <irogers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the loongarch tree with the perf tree
Message-ID: <20240709100536.238f4d12@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a+ilXKgZ+tAeMFl71gmgY2f";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/a+ilXKgZ+tAeMFl71gmgY2f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the loongarch tree got a conflict in:

  tools/perf/arch/loongarch/util/Build

between commit:

  e467705a9fb3 ("perf util: Make util its own library")

from the perf tree and commit:

  c4d8557f0f71 ("perf kvm: Add kvm-stat for loongarch64")

from the loongarch tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/perf/arch/loongarch/util/Build
index 2386ebbf6dd4,b12d374d7096..000000000000
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@@ -1,5 -1,7 +1,7 @@@
 -perf-y +=3D header.o
 -perf-y +=3D perf_regs.o
++perf-util-y +=3D header.o
 +perf-util-y +=3D perf_regs.o
 =20
 -perf-$(CONFIG_DWARF)     +=3D dwarf-regs.o
 -perf-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
 -perf-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
 -perf-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o
 +perf-util-$(CONFIG_DWARF)     +=3D dwarf-regs.o
 +perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
 +perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
++perf-util-$(CONFIG_LIBTRACEEVENT) +=3D kvm-stat.o

--Sig_/a+ilXKgZ+tAeMFl71gmgY2f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMftAACgkQAVBC80lX
0Gyt4Af/QD5jip7UipOwbE7fgRxYLvbsl4IQo/G6xhc3VL7bdeePojG4AAnQ/2LR
bPEEAgmCYnSdQodGJtN/rOO4Thxxnus9Ur+u78nbztIom1Tg7fRiaAgd7HwPdWW8
wJvQxy1O5rcwkPTTsK/OxW7vYcnZ9JhDyJdldRZ40MS1BRp2kB6fdMC8AxCTaRVj
evDZ7GOc4TwWcO/KMnkYD6wtG+8L/+UDU8C2z8iWnnnD8gVQ4FdTojqpOVBc5NQB
0JzdHoDMQo0qx5PWOWd8/3jFDQ3lNI88ramJi1TB8Y9lpOoteSPZYu6A9UAxkTia
iM3vkSWqVwIulZXbf6WG+pI92XmyqQ==
=X7Jo
-----END PGP SIGNATURE-----

--Sig_/a+ilXKgZ+tAeMFl71gmgY2f--

