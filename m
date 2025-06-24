Return-Path: <linux-next+bounces-7213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FDEAE5885
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 02:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D3301B64B1D
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 00:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D661DA21;
	Tue, 24 Jun 2025 00:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bVVT0CAD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16B4400;
	Tue, 24 Jun 2025 00:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750724461; cv=none; b=afYXUBw+1qgCbqkZOLdpNgCegxsb5+CFh7pubx1OAlASaHQcKWOt7lyEmM2LZ0MuR8uHYpTHe+mUtIqXvoFfDmhzZq0Fm1m1q9K+drisiQcrH5hOdskJ7SMfx2B+Asv2cU+xVyzSwwb7TBbDvQO3eNALDzUeNu+hQORlti7nHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750724461; c=relaxed/simple;
	bh=/lYbmNXZSsypE5NsCyq0Nu+zftBLAOaNurnlNqlIDIA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMf9pdOOXl2hzRNu7829rgy8hYVpVfzSk12kc7aryFmK1DlUUnm2FaoL3H6VTQZ8a3K5pXH1cQcz8NvgQbHEPRTYCSBKntOZcdXjvCnVUgoqNVskEjQkQmLtlf/JxbdIsXL6yx9IdlwmIDOR7pFYUqAxvLE/WFH1K+llJjFgOfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bVVT0CAD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750724457;
	bh=XOvt0O8jZq6aieTrCx4HnFVRFdA9KoRAUxMkATOmUkE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bVVT0CADibaX/jcwThLBn6t+0MaCgeQKadc9NmNr93ehws56sG6IiQnFNdzCidFN0
	 Ac5nGyowZGphtp8ZBOb5D/D79nrvPRbYVnB6FWKPzOAf3u2pXgzCwSOOeI3c6eonOY
	 GhyAPoN9PmMDhUC4ZXrLG1KbHUHPE5GcqdHITk0Y+ZexGKimleMwla4dqe3iBWj4B+
	 IrHCSANE+HIct6SrkpLwXpBGw1cY72jPw+fvskhO684HhwmcqvOqR5QbzT5S1jOOU+
	 LBgWEJSwqv+iwOVMObWVEpiBzOmQHdoTpX7QvAWzuKAUGgHavYbmAPvW7Y4V+wzF6P
	 32AFfO/TRy8AQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bR5G06B7Jz4wbY;
	Tue, 24 Jun 2025 10:20:56 +1000 (AEST)
Date: Tue, 24 Jun 2025 10:20:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: akpm@linux-foundation.org, Paul Walmsley <paul.walmsley@sifive.com>,
 fustini@kernel.org, duje@dujemihanovic.xyz, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
Subject: Re: linux-next: manual merge of the mm-unstable tree with the
 risc-v-fixes tree
Message-ID: <20250624102056.63da9f87@canb.auug.org.au>
In-Reply-To: <mhng-B82EDBD2-2149-412D-961D-9B999FB009BC@palmerdabbelt-mac>
References: <20250624100851.40f8b416@canb.auug.org.au>
	<mhng-B82EDBD2-2149-412D-961D-9B999FB009BC@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JUHeMetRpI4_kJmh2V88qXr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JUHeMetRpI4_kJmh2V88qXr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Mon, 23 Jun 2025 17:10:31 -0700 (PDT) Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> Thanks.  I think this one's just OK to call out as a trivial one when
> stuff goes up to Linus.

Sounds fine.

--=20
Cheers,
Stephen Rothwell

--Sig_/JUHeMetRpI4_kJmh2V88qXr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhZ72gACgkQAVBC80lX
0GxaCQf9F8TSuDmXy1TMhkiVO5YelZ0mJfmaNStBvVO4CXI0a4KRJ54tOfziU7se
5le1sqK/vE4ws6FBDEQVfL37Z8Mnz9Owx2IqOiAUQAfYMYLqaPHskTkwS4l85yAg
K1SVEXbsJfji6yYmafEEOCsLn2aAueuXRHus5lQhLYXaPxpvEQhL6CIKRs6LyxOr
VZ3P26NQ/nvI/0gXsEZp74oCeGSCtGhIdZShzp6tcZ4gGYIbS9FvOXDwvNi/iP2C
nfFFnCDy8Wg/kTG+xd2TkYu4inSQL1N55QpBlvQt5hJBCziQoO52LzLgOxGn+TTe
lge0+ae1XYg9clAHijVSG/etGb53Fw==
=AXwc
-----END PGP SIGNATURE-----

--Sig_/JUHeMetRpI4_kJmh2V88qXr--

