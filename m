Return-Path: <linux-next+bounces-6604-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 759CBAAF82D
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA6531C22035
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC481DED57;
	Thu,  8 May 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gQ3nfwgI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E19B665;
	Thu,  8 May 2025 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700858; cv=none; b=KrCXU8idISa1hsfCjJFL5S+Z+iGzUFNRFBrKeB2oFkuL/izKSfaE7+i5hZEDhYlRJ9hN42H3I13GidHFueBs8f7CyS+lZNu9yxBTQMYCCapaOT63NbQVLReF0WyeDSCwAhTfYTGvfrhzh7pIMvMtHvDXs26MlteAB1QdjFgWfPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700858; c=relaxed/simple;
	bh=X8ilbw35HJyCoqhnaOgKCWUDN7IEqX7SCoCjtp+z0Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GsTKPbTfKfWqbDZWPMt2J26ibRu/3ifhqn514fI8Ti147FxuLCS96CUudiOYS9xpx9SvcPBYwVqY59VO8RfEb/GcRZrIbEyMetl8sHPhaNY0oEyUcvF7joQX5dyITbGTuJRC0ZLVoTmKKqLaTLZV7PdKN7XeCSvSXcNEhhDfefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gQ3nfwgI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746700850;
	bh=ETN/ODreuFvhk3ZQ0uiL4zD9JN2rL3qe+sA+0JIiLk8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gQ3nfwgI8lev2R1pQhRlxZfAoyrnjC1+XHCG9yZX02bYhdJOWoMuHiGlzGPJWL3Ev
	 Us3Yaxh8EkisCsn8Zm9qzh3BI1gJoCfdRzoeyjr1Rs9Q0UmSce7YkXKjujGNxiasqe
	 7g4FZLHyzmq5HJvpm0P9FdksVMwka82e1jLU0PM5nZkypXY9H7BhNcrVuSuH7E55r/
	 SZf74LPWsR5YS+qDIvuThzSiAFcmzJ0geXXqd4aSfX/heLvan27TEIakmjGNzkasPI
	 6ByJLIDBuB74Qs8hcVXHsJ30V491eC8u6mRYYm9FbvwNfkCk08XvxpRoIVhKQCPWA/
	 3RcMsW3b0cjIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtTDy2w8Zz4wcD;
	Thu,  8 May 2025 20:40:50 +1000 (AEST)
Date: Thu, 8 May 2025 20:40:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd
 <sboyd@kernel.org>
Subject: Re: Add thead clk tree to linux-next
Message-ID: <20250508204049.216eeb69@canb.auug.org.au>
In-Reply-To: <aBv6v5mVX3ofsRyG@x1>
References: <aBvsGRZqbz11HPwM@x1>
	<aBv6v5mVX3ofsRyG@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=85dbOunXWVnKzH7MZVsglB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=85dbOunXWVnKzH7MZVsglB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Wed, 7 May 2025 17:28:47 -0700 Drew Fustini <drew@pdp7.com> wrote:
>
> On Wed, May 07, 2025 at 04:26:17PM -0700, Drew Fustini wrote:
> > Hi Stephen,
> >=20
> > I'm the maintainer of T-Head SoCs like the TH1520 and I've just created
> > new branches for T-Head clk patches. Please add these to linux-next:
> >=20
> > thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
> > thead-clk for-next git https://github.com/pdp7/linux.git#thead-clk-for-=
next =20
>=20
> Apologies for typo 'thead-clk for-next'. Please use this:
>=20
> thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
> thead-clk-for-next git https://github.com/pdp7/linux.git#thead-clk-for-ne=
xt

Added from tomorrow.  In the end I named then thead-clk and
thead-clk-fixes (just for consistency).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/=85dbOunXWVnKzH7MZVsglB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcijEACgkQAVBC80lX
0Gx4QQf/RzQpzfCeueO5/DYbne7cRC/FJNQYSUXAlUNiH0zG8S9HB6VeSBQkWIUq
tpSjrtvGdgKPXFa7Xe7RoUd7ToTlu2CeZvujidO55xSCajc2vdyrk8fMBsg14Fpw
v1RpXOTFj+yhLCpG7u8AMKVBDXkMk8Jetieph+nSdqApIgBYAyWjxPdMSTfxUzM1
R7zEZqoeIVD1H1BHPiUbtc67b7zZY+/t/ZiHeqosl8hGAeZ83nZNftkmjgVi9pwL
nR/jvnnbNEXAbJEmmbGzQ2x/29VhvU7PPLJdqkZV+BheUTo4z/mvlcHKJ+e43Kyw
/WORrYdFT2HoyjDaum8PhqVsccZjJw==
=uiZk
-----END PGP SIGNATURE-----

--Sig_/=85dbOunXWVnKzH7MZVsglB--

