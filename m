Return-Path: <linux-next+bounces-8833-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A32C33DF7
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 04:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A53C34C916
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 03:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2076822B5A5;
	Wed,  5 Nov 2025 03:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mfXp85mM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AE22424E;
	Wed,  5 Nov 2025 03:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762314313; cv=none; b=XHlHB9e9hxzocy0fNRhmTi5MCuw0e8s55JHKZnmTecqJL17Lue1o7LtqzYLxle9qR0H1bDSlwFxv0sItZcwE4wfQKpWop8H1Jcwx1xL/LGLXPe6fZ/gcLWbK8debBZ9+h3qtlUP1FRhojNq4FJIxqfNk8mM/vc+FSxoFZU5Z5YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762314313; c=relaxed/simple;
	bh=u4a8kzakFPj8vNRJV1Rd0XvaxUsFNMpjZbVNQGFPFD8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c+aU+Zi/pO9INUPIS0ig0I5IBxgLF9bA42T6m/MIouNnypN33t1KZlUdBWUU3GKOfIkMud9D75uFH5caAWx5VbkPFkARfttS+8qpI1B1/zWELQwQqVOAODgWbKA2cmfdjltWgeosybd6OzUeq4PxmrO8pQnmt8szFzL2eV8XSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mfXp85mM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762314307;
	bh=u4a8kzakFPj8vNRJV1Rd0XvaxUsFNMpjZbVNQGFPFD8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mfXp85mMKWeIafO1zauT/CzEiNstAPwrVl2SSTLn6fPr8xpC249CiwGOkVIEul3Rc
	 HE7tAM35WiQCCwda8nBKlZ7zOP7WRLu/+mVRzdPvg9hoVfGMsBAuVnUd29A7T1SV+z
	 WzczxJLd04qrGsmXz/Uth3+r+J6XADoFcGhXyUgtgYqzMv3Zjy95b5hOtSiZxBkW4K
	 mF7vcnnDPF6N0uetnjcJFx8nUk+TdNZE8n+kZKU3N7DGEpnoQGdjCPtwdQEM4j6SXQ
	 V2rEKUNUdwy7HpthAs/RXgY7ai8/6QPGjFFJ53Rr0kZxTx5t06RkN3n4YUsqqRwctX
	 DD+gP/nkBa6qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1WRk6GDzz4w1h;
	Wed, 05 Nov 2025 14:45:06 +1100 (AEDT)
Date: Wed, 5 Nov 2025 14:45:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [linux-next20251103] Boot Fail on IBM Power Server
Message-ID: <20251105144506.01ba08c8@canb.auug.org.au>
In-Reply-To: <87seet45z0.ritesh.list@gmail.com>
References: <5fb6199f-7077-45a2-9a54-2ef731d8a606@linux.ibm.com>
	<87seet45z0.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l+UQhk=DxnBs257YrwYF89e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l+UQhk=DxnBs257YrwYF89e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 05 Nov 2025 07:04:59 +0530 Ritesh Harjani (IBM) <ritesh.list@gmail.=
com> wrote:
>
> Since you must have the previous linux-next tag which was working for
> you - do you think you can git bisect to identify the problem patch
> (which if reverted boots fine?)

You are better off bisecting from Linus' tree (which was SHA
6146a0f1dfae for next-20251103) to the linux-next tag - assuming that
Linus' tree is OK.

Also, please cut down on what you quote in replies.
--=20
Cheers,
Stephen Rothwell

--Sig_/l+UQhk=DxnBs257YrwYF89e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKyEIACgkQAVBC80lX
0Gz04Qf/bIlXkSw/IRoCLGG/j6ZOLEYV6DYftSarKyl+Gq3+j8Azzyc5rqLEeV/C
Oqf//MUhzlCfnLtCYclSFBfDYr/w3pf8dSkzi3hOMXF/wqGfAHR++FC6cXNYyIj3
3y3KTISr9kd7QUfYmsa3BVD6o1ozmvjGFXMr+YsQ5EOUujg4iC6js6W/ZvZ8Pj4o
80XcL/+UTQGO4mCY+OMth3KvIFlIdi8UZQQ8c+KEaAka5tJJVXAzMekchUH39pwT
6LgUaDYJ1wrAxKzsaK9mUdJxjaqwPb+neL0BVBVQ+kBfgKWGzUNZJJyRXNHVFXHQ
nQXcSoAYWUIzKEbIiwZI7KqSW1vghg==
=1fvF
-----END PGP SIGNATURE-----

--Sig_/l+UQhk=DxnBs257YrwYF89e--

