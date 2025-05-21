Return-Path: <linux-next+bounces-6880-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5143ABED4D
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 09:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 322341BA2436
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 07:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FDF233140;
	Wed, 21 May 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gwliCfW2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5017BD3;
	Wed, 21 May 2025 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813807; cv=none; b=t+yHUB+pDrEMDkpmdgGDXq2251TaiMs/NQfrzbuZ3XE/GeaKebRHUi5+Cd5nW3gsJP/uPv8UsFbuvFn2J5TOXlG1pTgP49KFo9RfuAb+uWnVyg+uM4pPW7V17l45J3s7uiPOXpzE33PDvSps+b4NjlxYmyi6fyDUC8DQyDETqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813807; c=relaxed/simple;
	bh=M6hHegyD98TL0m8czfxH786jd/dfOqlyQNycRL0bd6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FrsFKZF2WL8gGeRhu0Q3KSs8TzQsvYpFihLLPfJEHhMN5eF9iIcPuR3FQ31+rOYdiqIIRO1us1NyZJ/1HeHGMmbpSB+fdxrQcmBjiYeZaXYOb7+UGAolakWj2IrYJR9Xx1dUHmhzM68gNm1qVb/KhDfG/IyI6ZTiNuvaZkJQ7+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gwliCfW2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747813800;
	bh=Lj73Hfw2rwfwGEJZS38M+p85uC7Tj8Ga1CjAqHRR7c8=;
	h=Date:From:To:Cc:Subject:From;
	b=gwliCfW2wFU1SAZMpy/4hSmTxf52QT3rKpIxPTY4p4D49lImIel1vqHHDMq4aIHF9
	 XsxB0E9E2XfcLB437PiAnoMxU8ndFgaLUfmDxXgX8hbXkPrCIVyGiQt0aBHb2TwiOI
	 pNGFtDDtaNBqbJ4fRW0URWGHOt3Q3YGEF4So8GmVbeJmalyI8Fvz0WrUj258dGdBVC
	 NMRRXSBzMsbVlzmA5KkBC++ezrdFHYuoooh7o4fYAtawJqgODiksUkbbkg5SD6s6Yi
	 4DP9Dl3NIm98KnWGpp3mjgGu2wvF43+o7AD7gfMzEwFQYcxZUlBa9gf454XNmfYw2x
	 9RIX1HenfCaUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Nqq6gqLz4wcy;
	Wed, 21 May 2025 17:49:59 +1000 (AEST)
Date: Wed, 21 May 2025 17:49:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: JP Kobryn <inwardvessel@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: linux-next: manual merge of the cgroup tree with the mm-stable,
 mm-unstable trees
Message-ID: <20250521174958.0b7354da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T53aqvqP+S+xEMAjxbAB1Yx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/T53aqvqP+S+xEMAjxbAB1Yx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cgroup tree got a conflict in:

  mm/memcontrol.c

between commits:

  60cada258dfe ("memcg: optimize memcg_rstat_updated")

from the mm-stable tree and

  d826d981051a ("memcg: memcg_rstat_updated re-entrant safe against irqs")

from the mm-unstable trees and commit:

  a97915559f5c ("cgroup: change rstat function signatures from cgroup-based=
 to css-based")

from the cgroup tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/memcontrol.c
index e936f6651f47,fde0934e2837..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -573,20 -582,11 +573,20 @@@ static inline void memcg_rstat_updated(
  	if (!val)
  		return;
 =20
- 	cgroup_rstat_updated(memcg->css.cgroup, cpu);
+ 	css_rstat_updated(&memcg->css, cpu);
 -	statc =3D this_cpu_ptr(memcg->vmstats_percpu);
 -	for (; statc; statc =3D statc->parent) {
 -		stats_updates =3D READ_ONCE(statc->stats_updates) + abs(val);
 -		WRITE_ONCE(statc->stats_updates, stats_updates);
 +	statc_pcpu =3D memcg->vmstats_percpu;
 +	for (; statc_pcpu; statc_pcpu =3D statc->parent_pcpu) {
 +		statc =3D this_cpu_ptr(statc_pcpu);
 +		/*
 +		 * If @memcg is already flushable then all its ancestors are
 +		 * flushable as well and also there is no need to increase
 +		 * stats_updates.
 +		 */
 +		if (memcg_vmstats_needs_flush(statc->vmstats))
 +			break;
 +
 +		stats_updates =3D this_cpu_add_return(statc_pcpu->stats_updates,
 +						    abs(val));
  		if (stats_updates < MEMCG_CHARGE_BATCH)
  			continue;
 =20

--Sig_/T53aqvqP+S+xEMAjxbAB1Yx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgthaYACgkQAVBC80lX
0GyhuggAjRTDmVby8lZHoF49axV60kbGBM3lT/y4Il1Ui0kCF7xp31ydzc7HsyeD
iGF8ZgEjbgdSuFTm/4KphRY+k3jdRediZVziF/nMT9kW+oZYmfOLl3vwhrE6Wz+r
JV2u5WAIVx11lNE4KvkSLbktlJHGKLNmPc3ygiupFvQGSzd2xtyyt5A/nzpofILt
924clywvJsEMPfctlkZQiyif7KcRHCbVK8upU8672K8YTlUJqfpI2M+N4cnWSFdZ
k4BMplhTo6T6Ze/V+seH3h1T5FNj72xEDiHQkMceQ5E6xzlj2QjCE5GdLggDxj2U
68VhgT7lv6qwKoWUsS3AxgjvvGF0MQ==
=xfWM
-----END PGP SIGNATURE-----

--Sig_/T53aqvqP+S+xEMAjxbAB1Yx--

