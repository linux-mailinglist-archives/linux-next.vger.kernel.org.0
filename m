Return-Path: <linux-next+bounces-7805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7EB17C23
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D716F3BD698
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453731B3930;
	Fri,  1 Aug 2025 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oES9DDJD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789F626ACB;
	Fri,  1 Aug 2025 04:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023348; cv=none; b=qOFoQu41EjK4ypf2pWLwYeWV9MMtav5J/5hrvZtTRaC3TBOkBFY3UueG2pzMGK7KCZ3o0A3RhNJgkjh5duH1dR/H39CFOl/0gfZr1Nz2KFZEjthh3JLOzYt6zx91MSk/ML4OaWESbPDSJSVRjoGt9Mnn3K0BSqTjP1E6GyuZDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023348; c=relaxed/simple;
	bh=bxU9ECAr23vaNtPkIFi0Fk/WeojPBmbBRv8gFfkS13E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jDOnXoVbpdp4XdRnPqrRZbR67Drz/YI4wql3/0AoqSi3unbIKKyysfgzyiBkllhWcE/pzPTHS1zJm2+U8j7xCYnjzAU2VjgI+zIa+BmKqYhXD4qfYdotAKnk2EMCNND/gyZ1OXQUTajUc+XNd65fIsd6d0oh1DZepfcMgA6nOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oES9DDJD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754023114;
	bh=OpmXVVtIx9OZXz78jVY1XOc6ICTOIPj4d71BX7EMmxs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oES9DDJDyLUIzV0qJeny2h0M8d6/8KNQkapB41ki0coESI5+hN8G17UrGermiWFx0
	 H1RccpEQyqlFq0sz3BzueEAEgvALmC9qigftx5lJnUd1x3V80ak6WjJbKTR96KNyEq
	 dcwc/ThNF+fNfJ9I9dOjd5ANkX6GzqpFVhjzHzk/o1cNzkcy+K/xVt+eKrbcA9o3tE
	 smYGx6lwoBbterYV6peWpcGXdnxaaFyWgJGDIJgHPsgAHXFJBp0KbzAaX+e7i28/H1
	 nNsW98JmXTMEBxTNcqIJzg6JrI7uOUXpz/zRyslDuxqng9ThjeMKdM1wyg//eF8oAP
	 yyXPVmRvdsAPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btY9k2wG2z4xPG;
	Fri,  1 Aug 2025 14:38:32 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:42:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the net-next tree
Message-ID: <20250801144222.719c6568@canb.auug.org.au>
In-Reply-To: <20250711183129.2cf66d32@canb.auug.org.au>
References: <20250711183129.2cf66d32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/efUNDp8rsp1vjBrMh1ZLb5y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/efUNDp8rsp1vjBrMh1ZLb5y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 11 Jul 2025 18:31:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the net-next tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/linux/virtio.h:172: warning: Excess struct member 'features' desc=
ription in 'virtio_device'
> include/linux/virtio.h:172: warning: Excess struct member 'features_array=
' description in 'virtio_device'
>=20
> Introduced by commit
>=20
>   e7d4c1c5a546 ("virtio: introduce extended features")

I am still seeing those warnings.  That commit is now in Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/efUNDp8rsp1vjBrMh1ZLb5y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRa4ACgkQAVBC80lX
0GyDKQf8C9nVl2BVW7G9JOpGM7MdKBVZwXN0/1XGgHdTGEt3MYMneDn8fGhY1J8h
37fXcT0iqvoWgCs69byUQRXuVdWEeZZszs+KaMqxm7Y+XU5Dn1q3G/feeZzqQWf9
Pd4+ZmFKCPyAcXs7P6uaVyIsCh9i2HLcEkVq5SUGyxHDHOks9xHvCIadqRpTOqse
9jE+zIVVTtqDTNsTqtbGwyXjdK2LK5wQGNQJ4pDlLJq2sbIMvV8cS/ObqVdum7PT
8BWnA0+775sy4CO+LsEm+0kZf3bc3tg8JFlt/1i+bOTJfzBK74vEYFRTK3NG1qe2
ILijG2bfSbJvG22S0jFysputnXZExQ==
=CnQk
-----END PGP SIGNATURE-----

--Sig_/efUNDp8rsp1vjBrMh1ZLb5y--

