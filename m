Return-Path: <linux-next+bounces-3193-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319809442F0
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E69A1283F60
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 05:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510C218E0E;
	Thu,  1 Aug 2024 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qTZKJk6S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9361EB490;
	Thu,  1 Aug 2024 05:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722491805; cv=none; b=Y3T3LMi3AT5TnZi9E1JVHR12Vr77XapzgN+DrIKxw9rqptVPfIk+XiWcK0hasjWbEL2wJCO7U88AVtey6hl87m9Y7aVdt0rRd0VPh/mM5osLclxdtGQJqsWichrHXiWqXUOINw34taRo1wQ9+pZMloGqOaTY8d/9EvAIMe4D/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722491805; c=relaxed/simple;
	bh=U76Z4puSXDe2HNY7aWD83tgpRgC6EffWKbN3Zxon7fM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffZbQKboCP+cDihAaY61sG7BsLc1Nt5Ofy/m+GogAy+gduJ64WDGVBPow6FmjVcID6CPLxiC5JZ7KA+1zQNyETQXuIQ4oT9Txu9WL0Ht1ja3gaqKbvQIBwb3Wk/V/hHB4uPXtVT8DgFIhCenHVO/XsYV/NhhFVcKhxj7XyQGqPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qTZKJk6S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722491801;
	bh=65bYuY2tf0mE6YDibmIkUR0bVeVkoVP9aiqGIajDhdY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qTZKJk6SN8z8n42W6+R4qgrEjmZEOeNb75P4aTlc/9G+Jvf0yr7gvXHonNuVwt7VA
	 PYZbAZg4mvDdwvsF6Y+H9HDDTR95tUj7o31QNCxiMctJA0+9Ri5MPC4t57vX7NtoR1
	 IP1X9F6B6YqCkkS9T/zt2sv+OBTNDjFBufO4Fk2LD+HdPu4R3s9aYJ30O1UIwopzJA
	 C0UEhr+UBS+9A4k0MAm3ESbe9GkiVxTyml32a0X68GXMtmcnQDJSKGn8FyM87QR2vG
	 fZBiu5yTxn00u6FGtGjjms9Bxyg7jzgbkIMswBZccmvAUuSptVK+JU738gFJlLHJlg
	 xuwaKr2QA+Hdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZJBK4q2Zz4x6r;
	Thu,  1 Aug 2024 15:56:41 +1000 (AEST)
Date: Thu, 1 Aug 2024 15:56:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240801155640.4c54bbf9@canb.auug.org.au>
In-Reply-To: <20240801155522.37ba7641@canb.auug.org.au>
References: <20240801155522.37ba7641@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qjhUDPQy_d=d2/vuI=n.cwY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qjhUDPQy_d=d2/vuI=n.cwY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Aug 2024 15:55:22 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/filesystems/multigrain-ts.rst:83: WARNING: duplicate label =
filesystems/multigrain-ts:multigrain timestamps, other instance in Document=
ation/filesystems/multigrain-ts.rst
>=20
> Introduced by commit
>=20
>   f9cb86069bad ("Documentation: add a new file documenting multigrain tim=
estamps")

Also:

Documentation/filesystems/multigrain-ts.rst: WARNING: document isn't includ=
ed in any toctree

--=20
Cheers,
Stephen Rothwell

--Sig_/qjhUDPQy_d=d2/vuI=n.cwY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarI5kACgkQAVBC80lX
0Gw51ggAia98BOctWF6U4WyPB1ppSUO7Y3nTSMglaB3xRt8AlkWAbJt8qn8JHeM+
w/e8OLzNex2VOoab7BF2CbRsGithEjx4x56xbBKcmtrvaSOv8630jNH1iejA+fp/
rZgMlp+QRL+kqIQtc9l1EL+wEoH+chUoS+TCJjmx35zc6S77v8DMAiL6DI1G/MhM
XSEeXINzBITXP1S7wWAn3yL1H9HYJGoN5WMDq1tX+/ssZj7BSJFghj98y+aA0nsR
/2rDAIsex3NteUrVzVz0WZOn5ZaQf1Mvi+j1bisla3kOnh0pEsZLYBhHjcFSBFNU
0A9LYlU07Ipg9HNmq9umdxAq+6UDxQ==
=OLig
-----END PGP SIGNATURE-----

--Sig_/qjhUDPQy_d=d2/vuI=n.cwY--

