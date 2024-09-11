Return-Path: <linux-next+bounces-3747-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D68BA974BA1
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 09:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B2AE28D3F9
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 07:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDB542AB9;
	Wed, 11 Sep 2024 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EV2U67S6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77139FE5;
	Wed, 11 Sep 2024 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040429; cv=none; b=Cw6qp8XuSZ02pzuK7d228hWXRrZ+KcKoSaw3i7G0s/8kYHvfjTjEJ19F2w5movAjkHqZYCu8bxYSdufB9aLWjcu7aTZO1so37ZKClGCayOP4qfsccLKhZfpbsz+AKviNAE925L8OltGhLPO78GhUUbBNWjIjtkuRRRAlvNL5Jlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040429; c=relaxed/simple;
	bh=eEurGc0lzelkzKE7Y4tAt7yqOWfvypBsiNPtTeh+2nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iOzEmXfw9MhaxrrsEn3hAJrIWvj76sF1QRdbfGnr7Jcx2E9TMjwCAd80z/DLP52M4ow/OH5wR3wbw6OXMIu43CbeI1oYTxVxUsrypTQ3LXQtzkyNNagQj+Y51mK7Iy8jtSFBg9cXH2WLhhTedxY/MZZuBIr31b6kUqexNl0cEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EV2U67S6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726040424;
	bh=gXQ/Rhu2tRAqzXn9dgKji/sX/U2W16S/vzVPUrY0w+g=;
	h=Date:From:To:Cc:Subject:From;
	b=EV2U67S6HA3f3oWC5tO9vRRhc6OAoieWmoDQ72uuqBVYQtnmVYizeMyzFzf7OQkfh
	 Yxdi/fDxO0PjYWE2buCR0Q5H6iM7Ywe6CUlUwP0k040AjzI84MwcqsHReg6+Xz1bV1
	 MxG1+BI9FyOGUqs2LOBMXaYJMNHpL+g/FP8WjqGQuI+9eadjhQSgI7utTqA/6ISzIK
	 LcVPkhk5puUlIf9JjsOO+UB4wP/g4rV9COFUmiX0tDzH/siOtXv2vzLwe+eVisB5U9
	 5xQ31qWOTTy6MHBfaPBmowIeIG6cJ06oQvFhJJ0lxEB0JEe3ZH36MiDJ5mxy6nr3Hb
	 t1N69JU5HCizQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3XY35S0Xz4x42;
	Wed, 11 Sep 2024 17:40:23 +1000 (AEST)
Date: Wed, 11 Sep 2024 17:40:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the cgroup tree
Message-ID: <20240911174023.0d0d9a15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eF9JH.c8hEHu9V6CsM9tr=j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eF9JH.c8hEHu9V6CsM9tr=j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  af000ce85293 ("cgroup: Do not report unavailable v1 controllers in /proc/=
cgroups")
  3c41382e920f ("cgroup: Disallow mounting v1 hierarchies without controlle=
r implementation")
  659f90f863a6 ("cgroup/cpuset: Expose cpuset filesystem with cpuset v1 onl=
y")

These are commits

  a378d53133d3 ("cgroup: do not report unavailable v1 controllers in /proc/=
cgroups")
  36bf4ad72e18 ("cgroup: disallow mounting v1 hierarchies without controlle=
r implementation")
  3055c9be424d ("cgroup/cpuset: expose cpuset filesystem with cpuset v1 onl=
y")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/eF9JH.c8hEHu9V6CsM9tr=j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhSWcACgkQAVBC80lX
0GwBfQf/U3v+ii9s3XwCnWruhhZLZP/0s4FHdGqw/vZJpIFXFPK65YmBd8nBods7
40erEH04m0pOxhimxVlYqpGI/v3+GQ84zx34ridDMgzKaWVGEMgxrzwqYo25Q1bo
0NjrPFqIDSncMVBWD9iJGXRd/hq+aabtlhI7Qcf1B16UXri45/1wj6YNfuxq6INc
SmJK27a2yQZyaeRBO/ptsw296ZNFds677DSmTNX076hetSRc/cVTzq2Zf4y0xd13
q4G8IBM0mCi14Pss0kQi3muISusN5jJmglVphsYCRfQag971FaNeugBAM2PzEu1E
3X5b5TgOprcar2uZKnvQFEom68sH3Q==
=G/KL
-----END PGP SIGNATURE-----

--Sig_/eF9JH.c8hEHu9V6CsM9tr=j--

