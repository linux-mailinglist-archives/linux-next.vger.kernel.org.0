Return-Path: <linux-next+bounces-7210-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA34CAE57AA
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 01:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76C5E7AF3C5
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 23:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFA3224244;
	Mon, 23 Jun 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="otIwQ9ko"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABA14C74;
	Mon, 23 Jun 2025 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720127; cv=none; b=MG7nNY08V6D1KOumU6QPxCqodXedciQWZbCK4vWHYwDxY1qn7pPoVs1WYvRLTUVBGMh07ngDLPSMEEbZb0GyAcNA2eYvxqfWvbGpceIbOhEIDn4zMA8edlWMWvxAoB+Awf49HVganOvptCEhwUbvp8CxIpDJgy1ORv1r8TzZruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720127; c=relaxed/simple;
	bh=6hJamPpPUPuedbaskgMUILpEfdAXjVIKaOarvoRNI8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hHxV3RnmLZC2UA/lRwooHhib2Fvs158Ve4snqAutAdFlilJ7AhRpCiiIWpu10jnimSQZBU4bbz70ADVdIBAPr+JMEDQCGc+JFtJi7hvai3tSJn71iEJ4mYGP5DdIwx4d+qrBo00/RUov5l2PVe9AvEamojfhBAhOOSaa7GzJGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=otIwQ9ko; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750720113;
	bh=UNLuWcVv/Wd++uC1+dHbdJBssXAyC/kv2jEQw10n6/o=;
	h=Date:From:To:Cc:Subject:From;
	b=otIwQ9ko5q38DDQ5XDZfMMginYOStA8FjxQjpef+HAfZ0NpAhofhdg316lB1XdOgH
	 0qtRBXeyzFt42Tcdb6OLsYpHIjP1LLkXS216C97ba1UlIcN6sX+7yAtsKFHR0MbRZU
	 mXwnBU+kee4SaFp+5Y71jyY4R1LSxQOIkP/qdoUccexEuqYhrg7UifrRGlly0+Qssv
	 x7qSf1qcKklN/dBsbh5EIpHq/MFTDiSljKQvpG34LVcxbvnngQrOEA6vJ3IAqdYaOz
	 ANTtV0xYRuBr2ZAMlh+V7K4Qwntj8y3UlVkBS2t/WlKzmR1w6YJAxnokJMR9sSNaMf
	 b79JTiTOr1omg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bR3fT472zz4wbY;
	Tue, 24 Jun 2025 09:08:33 +1000 (AEST)
Date: Tue, 24 Jun 2025 09:08:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Serge Hallyn <sergeh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the
 capabilities-next tree
Message-ID: <20250624090833.37257b51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/coJPjRQM9rSFnP4qGTkY0mm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/coJPjRQM9rSFnP4qGTkY0mm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  337490f0007f ("exec: Correct the permission check for unsafe exec")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/coJPjRQM9rSFnP4qGTkY0mm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhZ3nEACgkQAVBC80lX
0GxsYgf9EylnCs9A+FhvIyk/A66z1Fpq0GTjYDLM6ohGHUobq4JKmRf8olJedRUd
7NJsnJJQu93yfeobpN6oiTkgLBhBHugAsdZR2xd4uuRe28bS4ZIJkuB++IkoQIVY
ICTtrg8JeornpLG7203ytJjMAPeTNjw846Ih/P7MB/Lu6NcXLvmPc8fDzN4NzI4p
a+CrCTaulvT2VZLMSQgemuKi9GGQ7Esn/hEvzD47b2RVeSvI9Ypt9yNZRCEjefJT
D9x11SstTrXXfsCxIC3u6hTY695q4+S/c7CnNbQsYoc8aAVjf4f9X7TZk13Rf4XT
J4xChaPqkfnqWots4WyXckWkUrC9aw==
=jok3
-----END PGP SIGNATURE-----

--Sig_/coJPjRQM9rSFnP4qGTkY0mm--

