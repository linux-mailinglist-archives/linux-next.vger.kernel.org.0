Return-Path: <linux-next+bounces-3728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98545973612
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 13:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631E328556D
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 11:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD12171671;
	Tue, 10 Sep 2024 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="dMxUQfWq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7217D341;
	Tue, 10 Sep 2024 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967174; cv=none; b=R9sHTp6LQYWe/TAYx7e5fZFHsW1kBcqmMmnvK6eLSNM8ZVU11RTs784wgWbiR7JkHlA0TPHkzFQ0PdIIWQny0p1gdHxYjKDjNjP7BJ+aI4TNKDsMAY9Mk9Zt7RpEgmrnFm3+F3DP99dt28vP3yeDyVIORFysELI4YD55MssTVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967174; c=relaxed/simple;
	bh=gvYbGN5m9KyGDNIgLldowFMfOGC1YzezrFwnf7wx4tM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuclvAGYpgPdAHomn+pGfWgp6PSsb6dawJd+IuBO2fiTFjcEmFUVhWjwrUtjhk+Qq7vzY2uNIcS965TTRuTBp5cy28E1FLAJXvdoaXkA5D10JEgRrZomTHowDa4Csz5oECP8DUzSxqYHtcQNEB0JggEcXj2lOdK9O2/DgLkvVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=dMxUQfWq; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1725966759;
	bh=1YSX8ly098Vz8AdfJ2rvkzXzPY1mICGapU9qpEKznOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dMxUQfWqHHtS0WV0W+a2bjFE+CpVUpAkVzchnqi6HBwfXAfrEV3JtA2ObAuqfIvwH
	 BLVZaC6bQOchcefpzIPoT3c4N+5cnW6ANiW7ZkPFEmf7fBIeqX453DA3/w4C6V07dC
	 OdM709zSsFFMuJ2jwoXzw9waMfMB9fCbW48M0Al/+2INl2CpPGohAEF+w6wPQ1yw4/
	 J2fWHXF1UlZPeAgw43iRoEzBfsV0nu493WzdD8XsSP/VhaC7r2iH43wwMny+OTpDmz
	 kOmIC3m84090Db8L2HXBtmVVO3Rf1KWt36kLt2nF0zy9945aRS0uvq6AcErB7+rX+d
	 drJu16sAQLZUQ==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4X31JP5W12z6k;
	Tue, 10 Sep 2024 21:12:37 +1000 (AEST)
Date: Tue, 10 Sep 2024 21:12:36 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20240910211236.3110457a@oak>
In-Reply-To: <20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
References: <20240903092745.370fc0c6@canb.auug.org.au>
	<20240903.020556-bouncing.saws.daring.donor-5KuFrSsG4K2W@cyphar.com>
	<20240905105809.6585eec2@canb.auug.org.au>
	<20240910102332.4f171bde@canb.auug.org.au>
	<20240910-donnerstag-feucht-2e1aaf9ae8af@brauner>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//aPvin6071cTgRQpRjvxsbv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//aPvin6071cTgRQpRjvxsbv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, 10 Sep 2024 10:50:39 +0200 Christian Brauner <brauner@kernel.org> w=
rote:
>
> That's weird as I removed everything that touches tools/ from that
> commit as the tools/ repository is updated after uapi changes
> separately. That's what I've been told multiple times. I can add this
> change but it feels odd.

I did not notice the removal, sorry.

Tomorrow I will try without the patch.  I guess my fix patch will
apply correctly even without the actual commits that caused the build
failure.

--=20
Cheers,
Stephen Rothwell

--Sig_//aPvin6071cTgRQpRjvxsbv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbgKaQACgkQAVBC80lX
0GyWygf/fbe6YsSxhsp+dEdwIj7t3+6ito6HMnxL09WS1WGm2tr/wxr3CAb3UKYV
h+mdvoYtUs3WcV1EfnbfdzHbO9ZxzrNlrCsxqVlkL6tWyjDe/ohqefPBw1wrdfCz
tF+aYE/6nFDFsh8O0NEZyVD5dVhEAb4Y6vo6nFhsjAJ1vTf6ejuXcVDbpXqDq5nj
x9s+FVn5JGZ7OBt9RRr2syhXTsdyrwE6WKIt1R4XRD/xFDhd91BOts8EEwD5xoa2
vzpuvrQCJMZWXStL+ytqMO/ylXqZesIQp/FYJAhlkiSvk09+MjEU7Hr+mdgn8Zkn
D+1QOCAeyZ768BedgnkW2bgwPoyhNw==
=5zHy
-----END PGP SIGNATURE-----

--Sig_//aPvin6071cTgRQpRjvxsbv--

