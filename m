Return-Path: <linux-next+bounces-2415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC638D2BB7
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 06:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FE4AB23736
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 04:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483F615AAB8;
	Wed, 29 May 2024 04:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cVI8tKmv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135812F37;
	Wed, 29 May 2024 04:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716956705; cv=none; b=r0gf6SkEFr6IxVh2YF2+0BWhyMSvBBivgn7jzt7Pr6qxPlYvt7PDedp94wuxO7K0jmypCNZmGcUp6mb14lDRsHxVcKrEhDGfPCkJ8Ef4nowT7kPSdz+mohoiN3k5TRe02tBrqsfR6c2KUzoi2qON08eRUOk1vaRkzgK/sYsCE5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716956705; c=relaxed/simple;
	bh=t/wyqOZCUtaJj94OWxcggJOyzt1ZBavPfMbI2zcPKiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M59FZpXft87LKz9BxXPm/B8q6qlXD7ZqjZtxWEB6+1K0MDOrZPtKoHf4+BY/srMrYxR9uZHJrYlXy7ha6jLVq76TyALF+v+XjX3mSZqYtws3rJx35PBz2j3qjvKf3aqALFaXcjZBoL46EVtYOE/cOxTREae4cGI3m5St3NJ5TSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cVI8tKmv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716956698;
	bh=QS9UC6q6IV1lekvIOBY7aqCAICP+q66LAbGf/Ww1y9g=;
	h=Date:From:To:Cc:Subject:From;
	b=cVI8tKmv8tr7WpEwlbt1Dw8sUdgt/numMfkLFBJcwMkojqffPhDPAYrOo//zNHFop
	 OIdrA1sVsvjvbxGAj7GIcwstCYjJVNYBCAlkUIbgQSWGMjxYYLErQsGX9KLU4kjvJm
	 l2JUImvNkc+GIvuPhpRmmmfWPXGQYmnryCcbjY9tVSiRSeL/bM0ZWmOD+rwHfJhR5X
	 wmb6Z1YE2GKkUkk8dQp5g7zIBzWmSP7jtjePkSlfhzCPdeM2JIUTFdHtAzws62tBNW
	 S+/eLio11EcB+iOge1O5wPtdI/aQ00FhsQJfCuyk9g/w24+zVDqYM/WzIzOjq4MKH1
	 qwGex9zCmm/1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpxB22tcrz4wqK;
	Wed, 29 May 2024 14:24:58 +1000 (AEST)
Date: Wed, 29 May 2024 14:24:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson
 <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the gfs2 tree
Message-ID: <20240529142455.1c68e65a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fy_UqbgbTx50A8B2YiQfi8t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fy_UqbgbTx50A8B2YiQfi8t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gfs2 tree, today's linux-next build (htmldocs) produced
these warnings:

Documentation/filesystems/gfs2-glocks.rst:64: ERROR: Malformed table.
Text in column margin in table line 7.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Field              Purpose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
go_sync            Called before remote state change (e.g. to sync dirty da=
ta)
go_xmote_bh        Called after remote state change (e.g. to refill cache)
go_inval           Called if remote state change requires invalidating the =
cache
go_instantiate     Called when a glock has been acquired
go_held            Called every time a glock holder is acquired
go_dump            Called to print content of object for debugfs file, or on
                   error to dump glock to the log.
go_callback        Called if the DLM sends a callback to drop this lock
go_unlocked        Called when a glock is unlocked (dlm_unlock())
go_type            The type of the glock, ``LM_TYPE_*``
go_flags           GLOF_ASPACE is set, if the glock has an address space
                   associated with it
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Documentation/filesystems/gfs2-glocks.rst:96: ERROR: Malformed table.
Text in column margin in table line 7.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Operation        GLF_LOCK bit lock held    gl_lockref.lock spinlock held
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
go_sync               Yes                       No
go_xmote_bh           Yes                       No
go_inval              Yes                       No
go_instantiate        No                        No
go_held               No                        No
go_dump               Sometimes                 Yes
go_callback           Sometimes (N/A)           Yes
go_unlocked           Yes                       No
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Introduced by commit

  ded323aef6d5 ("gfs2: Update glocks documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/fy_UqbgbTx50A8B2YiQfi8t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWrhcACgkQAVBC80lX
0Gw4/gf/cx3o8BXTNavjVPnJteNrPjDc61CCUC9RoN4jpaC1mbzIu6+IKm9pEV5G
SvdT/9PSwrzurw72lnc7E/fL6cgDxw91sS9W6JR+MzfxRV+B5k3tN7OEY4wuGgH1
+Qy/6+/Qh5M/YuFBsZ70/LDHTm7sRi+2Djxxp3dqlX4CBSuIOV/0UVwf4QsVSJCF
lpjHeoW78Tmla6ycYsosAjKlyeLkd/qJFGUsLAH68TCWqvsvt36SGmhC+XN5WGpq
uzMk6AGlAAejXW9WFOOnegaP8nKoKGp9lKdJN0cvDiQ/9hNQaXjnhA78QjlCwIzk
W1lrUKSVDC3MUaWXnjFt9JoLIkw1gg==
=J5PD
-----END PGP SIGNATURE-----

--Sig_/fy_UqbgbTx50A8B2YiQfi8t--

