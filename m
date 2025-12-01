Return-Path: <linux-next+bounces-9281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDE9C95827
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 02:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C23D24E0708
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 01:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF993BB48;
	Mon,  1 Dec 2025 01:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RtuMiMpD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F418D35958;
	Mon,  1 Dec 2025 01:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764553049; cv=none; b=NQLefe1oBbKmVUsclxjMZNW+0waki07hHMEiZsoo9KCWwE9AD0x+BO8wZgvZUd2VTvNuyRMQiXfdZ5yemP7UpV96sjHdciB157EfLfn6s7gd5LEwEqp6rayxPjcqgi6spJJHsFPKytmbeYcvvyZOgQNC7qU3/2ffenxloqR6KU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764553049; c=relaxed/simple;
	bh=27uPnPjGwiNnxX3Bh4DOOZatVfqyZf6t2LpaIVVcDxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fCorCtVVyFcrooqRBwsEZ2rppNNm8RcDyqnUm1VoHjsaeYdI2CR+NgGUnFgByWUHtLC8f4TarkYoqFJ2146sZvMqm1NE0rEQTOOV/vI1RFz8GsewTpsWEBG20Z1x8AX00omoNsXKqW9bB9iod2lXBKu3t1MP880oVA0mZ6V+N4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RtuMiMpD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764553043;
	bh=6sK0GIveJ4i0r+lJK8TEe41Tp/VGtkHpHpEly1/+iE0=;
	h=Date:From:To:Cc:Subject:From;
	b=RtuMiMpDGOejuew97p8amOvp53uMcntUs3IN7gsJS0HzMgugvcMecM8IODZ1va1cf
	 RCjI3gHlU0xKNdLRsGacpoKar7h/Gx18nhYgYQCf0iIUs+qHZ0wRjzRGX1Rx/1pMa+
	 J3A0TajmYTEpV+net0hcgBFA8fpvUd+Rd6TS1SO3QHxW27SGYOVS6T5HC8r5SOKgbZ
	 m/xvwUqULoPc3zRXa1uCZFrQ+0heudw2FeffZzd4LQ+2dyvL+cvhrbTPosmU2y4fwa
	 VKxMi0Yhcjen6IjmTwCpf/VK+VbP7feQsPPWLcHO3DVBQvzNQh7pQtFA+SStHRzFXi
	 AwAMGKolbOaVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKRNL6vsBz4w2J;
	Mon, 01 Dec 2025 12:37:22 +1100 (AEDT)
Date: Mon, 1 Dec 2025 12:37:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Usama Arif <usamaarif642@gmail.com>
Subject: linux-next: manual merge of the memblock tree with the
 mm-nonmm-stable tree
Message-ID: <20251201123722.19e5f034@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y/WDi/99UaYnvzCaGw_RrQG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Y/WDi/99UaYnvzCaGw_RrQG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the memblock tree got a conflict in:

  kernel/Kconfig.kexec

between commit:

  48a1b2321d76 ("liveupdate: kho: move to kernel/liveupdate")

from the mm-nonmm-stable tree and commit:

  ab65699f9add ("memblock: remove CONFIG_MEMBLOCK_KHO_SCRATCH option")

from the memblock tree.

I fixed it up (I used the former version of the above file and then
added the following merge resolution patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Dec 2025 12:33:52 +1100
Subject: [PATCH] fix for "memblock: remove CONFIG_MEMBLOCK_KHO_SCRATCH opti=
on"

interacting with commit

  48a1b2321d76 ("liveupdate: kho: move to kernel/liveupdate")

from the mm-nonmm-stable tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/liveupdate/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index 9b2515f31afb..86a58eaf433a 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -7,7 +7,6 @@ config KEXEC_HANDOVER
 	bool "kexec handover"
 	depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXEC_FILE
 	depends on !DEFERRED_STRUCT_PAGE_INIT
-	select MEMBLOCK_KHO_SCRATCH
 	select KEXEC_FILE
 	select LIBFDT
 	select CMA
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Y/WDi/99UaYnvzCaGw_RrQG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmks8VIACgkQAVBC80lX
0Gyd9wf/UQsEFB7m0G0qjhYCBc29Tc/y3vQW5mGi5tH23jfr736NPLhGwyPcF7KG
/nR+CdSjBfTx5eTEiXgstCGgNUdJChEiCXrwEMb4mS3a7O6BgvWgmVcPZ14gNzNO
ExqGhXDk0/n/QpuCW0LOFWfZJycFKWHUpidp0UKKp4Cg04h/NmENQPFT5Voh/+ZG
56aeEspaHBAhZg1n4UN1lyc0EzOuWj24fQUfQ++2axjqd5v6+ukimGmE4HxEynTz
fjOJFg8Ao/qiT49tNgC5xxf5o6g2XUSriqxheXjZn1iV7kecvlAe3ekRnnfczbqr
SRpSCCpiJLj5ODqLQUvILOs0Z6b+UA==
=xTdZ
-----END PGP SIGNATURE-----

--Sig_/Y/WDi/99UaYnvzCaGw_RrQG--

