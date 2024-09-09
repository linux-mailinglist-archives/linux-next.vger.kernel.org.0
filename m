Return-Path: <linux-next+bounces-3700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D722D971889
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B3931F22AE0
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AEF1B3F02;
	Mon,  9 Sep 2024 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AODXm7Nq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB761AD9E2;
	Mon,  9 Sep 2024 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882340; cv=none; b=POpINDGmLRkDrdLXCyLA6qxQ+HEprwXkr1ECBHHjay5NjKbBYekuWzYKo+E5fE1UzJtmh8+z5VDLfL8zNOAKrnXHGfXzVzHLPUDsy+Cyf9iIWMkcqaT/IFAroOhJkqeo6kfY9wUoJbP31SjAvQ0lzCzGle8tZ5BilvgM+kc+o0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882340; c=relaxed/simple;
	bh=+VbOgxh8Te9JpwnikVaSXK3gS/+L+IjciUJ0GIfwIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X4ZEOWktWg2AUPiWSR9zKQZYJ2UKusn8N9GYBUstywcpvVBBec5z1Iqet0YH3o1yzVCokyQRLK+wCXLLb9Ra/TJ68kH4h2KuORY+Nrki9kAVfy/KNiJ6R/r3f5Xy4PH52pblPnuD4GH7wY0hKMoBqeB8O7PMQBUHTVLx2zLHtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AODXm7Nq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725882334;
	bh=Z+/7TehSQa6sX2ijZ5edXDeCGf9uxqR4wP01lzzmbMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AODXm7NqL+lx0CjJ+PMfcPAJEf0OdJB+6hxaimWUWcJ8k41H8AiUQ/R4fradbvExo
	 V9Xaj7VucO8r7BDNlR6UfYIFdBizceQBJbtvLboFIYJ+mUnl74opYWTjGR4jkW4Ow6
	 GpHmllvlZI6/9LRC7ZccjTHWGfkFQg/x5P/mVPxfMHK/Y+w4LGIN87l8LEKw6J+d5/
	 m2r5E19GocGXtPfCA66RUKHhUwXfvHaqw0dz8nB50Uq3TvqRSwo3w/rxNM/ORm1zSo
	 J1IPOp8pJqPkz6V8Jq1lfJWKQKfo67Eemi/mhBLcZPtoBk0exgqiOzEJZ6fMNwNbat
	 vVJzim8SWWUqg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2Q4t269bz4wcl;
	Mon,  9 Sep 2024 21:45:34 +1000 (AEST)
Date: Mon, 9 Sep 2024 21:45:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909214533.0f8437ef@canb.auug.org.au>
In-Reply-To: <20240909-kratzen-holzweg-c1fd7da1f895@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
	<af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
	<20240909-organismus-sattbekommen-06332e10fcd1@brauner>
	<5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
	<20240909-anvisiert-weltweit-d3b485680666@brauner>
	<ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
	<20240909-missrede-abverlangen-dfccd1414bb2@brauner>
	<20240909-kratzen-holzweg-c1fd7da1f895@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qYo8m0Hz7yevmwSTPmIQM6s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qYo8m0Hz7yevmwSTPmIQM6s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, 9 Sep 2024 13:02:03 +0200 Christian Brauner <brauner@kernel.org> wr=
ote:
>
> Ok, how's it looking now?

I just fetched your tree.  The top commit (vfs.all branch) is

  a80a1ee241e7 ("Merge branch 'vfs.procfs' into vfs.all Signed-off-by: Chri=
stian Brauner <brauner@kernel.org>")

and commits

  f2b8943e64a8 ("fs: pack struct file")
  c0390d541128 ("fs: pack struct file")

are included.  The first of those was in next-20240902 through today,
the second is new.

--=20
Cheers,
Stephen Rothwell

--Sig_/qYo8m0Hz7yevmwSTPmIQM6s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbe390ACgkQAVBC80lX
0Gzdjwf5AWf1MWYy4viXA7nxSlXBBjN+JDNLAN/0ae/2l4FO5hvKamMKZFdC//4X
B4esFvJCQ+2+g14vWkI/PDSSRoqehMp4U9aaYrOBiRKTMH08o9SXPZ++kp8+ZBeo
OcrQ7kfsYEOe239q0T1FNy1X1RV9V215HAvBBLa2q6A93eRMSUZKc/q0hVGC4g0m
q5uE8Ncjf0lk4Zlsqz47xDeDY+JzPw887+tZ3LK88GlnrelKHlRzaWjVhdFU5WR0
erWoHpnFW8cSBoAMCi/m+tm1AgIx64BLGBwazDNMep24tC3Ctu5YevCx2LcLjLLg
/h21uQbTdHthq1IBosmKbGzKmmRwHQ==
=rNxj
-----END PGP SIGNATURE-----

--Sig_/qYo8m0Hz7yevmwSTPmIQM6s--

