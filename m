Return-Path: <linux-next+bounces-2436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFF78D5A49
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 08:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE181B255A2
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 06:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C44A7E56B;
	Fri, 31 May 2024 06:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="drmHw7DS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417574079;
	Fri, 31 May 2024 06:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717135717; cv=none; b=HDZNI4gUYcHB4w2vJUklWpWffJTrEPKkACEsIzzEPH1LYc7VVgcJJ3MYOXJKEn715XecgqWdEukdLh7bApTy74xOv/AYcXTH2h2NAfQqMqBZBpYPNcteBLxGanuWA3FMhjCrrwLAM5Lb06aDYs7nM1Eawy87qeekKBvfpX/bG8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717135717; c=relaxed/simple;
	bh=MzVxy5DlHw4ZX9PtL87OSyV4W4BtLW69gypnpUnB0wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LRbvfHQQLWm5MrpR74q5j9Dy5yzD9K0mla0y9kxKZ4e1VQpRCbi4WGsC8oyZibLqY1VGdQnEf4UH7luwa0xZnEmefBpznbe1ciIp5STlnWSE97nzx4SrnDAhIcTvDTyY5ZjwEXi8ltHVkH+HxwX1qPSo80ykEmsVE+KA2/nBWaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=drmHw7DS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717135711;
	bh=W6d0zv9ygwQK7qUazX8KWdCWHVIy46WSYDpawXxywAw=;
	h=Date:From:To:Cc:Subject:From;
	b=drmHw7DS9rSq+IEkMa6A31xrP7HMg/uA2xDVBVpM0cM0TbiqVS30GW6a0lM1kLwMs
	 qfHOU158ie2Eq74Wh9eHjSemA/NragUYuyiuHSyDWwWPU436WgfwisdCsD7QXFiKLt
	 K1D8YLZb7L+IYFpoCT0albz3kMFLbAvM9lIJHpglSU8+e9Vmqbo8xvaR+Ofx3nj/kj
	 MruzQzEYnzbctovXgEKEJF1CrRAIOODz0vKLqRwkVZcZqm8jna8i9onaCWgI1MDHdi
	 mVKkdnHiip6ksLYNHWEjKm9nRnqhKuNpRwMhtO5qKrTrMnKsH2oiUZYvoqJy1S+d15
	 v0OegcmmiPxFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VrCNb1RlQz4x3q;
	Fri, 31 May 2024 16:08:29 +1000 (AEST)
Date: Fri, 31 May 2024 16:08:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20240531160829.343479a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mEqnJQNTZR5q./cIVggby_H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mEqnJQNTZR5q./cIVggby_H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bba1f6758a9e ("lirc: rc_dev_get_from_fd(): fix file leak")

Fixes tag

  Fixes: 6a9d552483d50 "media: rc: bpf attach/detach requires write permiss=
ion" # v6.9

has these problem(s):

  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Thus:

Fixes: 6a9d552483d5 ("media: rc: bpf attach/detach requires write permissio=
n")

In commit

  b4cf5fc01ce8 ("powerpc: fix a file leak in kvm_vcpu_ioctl_enable_cap()")

Fixes tag

  Fixes: eacc56bb9de3e # v5.2

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

Thus:

Fixes: eacc56bb9de3 ("KVM: PPC: Book3S HV: XIVE: Introduce a new capability=
 KVM_CAP_PPC_IRQ_XIVE")



--=20
Cheers,
Stephen Rothwell

--Sig_/mEqnJQNTZR5q./cIVggby_H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZaV0ACgkQAVBC80lX
0Gyd/Af/ck3DTMTIcL8TElPVGteCAykgZuOkZ25mNWrRjwbIVCrBwIRw4WHu0dum
fhyO+dw5yTKF8nwUbISGjObvc3IKUPzX3UH9dVwMIVV6epCVwdPndRopYDx9Wbpx
gbUKLUx7RpOy5ISr44gvk6V2eAlGQjfT+vbetXweGxMxs5CyCE/NmqrYBEkcKZOE
xzpC57tE7DAkxgwbvoGN1nR+qc7sHhdcyzRhnpEAiHLBCfXhXCakGtbHCSkBQ03k
fr0R9yBaufQQ2/fngiC6cqrGWQLzef0aXZRUhAAMFOnch7jJXnL9rKbj8IxNAwMg
cK3qfAi9YKa6/uZVZ6Qm2tLcFCWofg==
=aVAD
-----END PGP SIGNATURE-----

--Sig_/mEqnJQNTZR5q./cIVggby_H--

