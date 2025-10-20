Return-Path: <linux-next+bounces-8649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DABBEF25D
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 05:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20FC43B98D9
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C462D1F63CD;
	Mon, 20 Oct 2025 03:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OOWAuGez"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F8A1DDC2B;
	Mon, 20 Oct 2025 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760929792; cv=none; b=YpAjA+NstyH3dZNLF6bvAW/kCD2br+M0ibXwq0Ru2EBYRigAFZySFzH7j5ohQIsphBBDLlznghOU0Q8gQ6f2Eh7Zrw5a3y+NpaE/nij6B7C+2ar+ZeNEE5WldZ7HEAEXkfOyAF6Ztyk4CX13p4Dpvlz6nZSY68VrswR9vSJGWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760929792; c=relaxed/simple;
	bh=6z97mHrm0Up9qFuFwB6f+UuVSJTBhjMEP/sNL5A3ZHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhGcydUiPu8y5ZN3kEmGFefWu+V6Ywjst9VxBbtbwG4YSkJQMaPqoCJldbLEtZMiXLJBI7Ne2wNF/77AAlAwb8SuqO7u/eX7VWORaypcL+m1kA94yLlvmBZD8vah0toj8z/98JrK/dY9eqHL29GuPH3PrEi+nKedl2SUvLT2oaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OOWAuGez; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760929788;
	bh=EK1MIi+sb6cHsQz0mvnbsyZ7mAvdQ2vWHXSm9X0hQdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OOWAuGezXNzQ2/vSSV5HFYhvvNoFPZ9YbbvhU9iIzuYKjli4/o5Cs+r9cmsoG1R3A
	 BPKbHZl4XzOaAHrA/0Fhdl9yyYp4ypD6JpFdvlzau/exuxBbtbIyQvwYLFVi480cjY
	 f/d15vnqKeVowsPPx5/DGr/xqpT422x8/vJETeVUVDXDnnXHnr75RuOq4ByhckWXxw
	 3gx70WMGlHVgMtwVgAzGErm4gVhpMykFFiE4o9UJlt0gkUFCoOUwujW48Yt/shlU7/
	 oLlTWRGQk8SZrF8vzYRomu10t8fBeFB+4iOx1Z65OAIgyJIjc8SCpmgbANUBvrppAV
	 fx55MPzGhabfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqgQN3HChz4w0q;
	Mon, 20 Oct 2025 14:09:48 +1100 (AEDT)
Date: Mon, 20 Oct 2025 14:09:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: failed to fetch the capabilities-next tree
Message-ID: <20251020140947.0dfa07c9@canb.auug.org.au>
In-Reply-To: <aPWPWEfPpyE94qcs@mail.hallyn.com>
References: <20251020075738.2de7288c@canb.auug.org.au>
	<aPWPWEfPpyE94qcs@mail.hallyn.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q7OBhp_3KZrPtI1FsxY+7WW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q7OBhp_3KZrPtI1FsxY+7WW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Serge,

On Sun, 19 Oct 2025 20:24:40 -0500 "Serge E. Hallyn" <serge@hallyn.com> wro=
te:
>
> Sorry, there's nothing in there right now, so I think I deleted the
> tag during the last cycle.  Is the right thing to just leave it
> pointing at something like 6.18 with no changes and let your
> automation calculate an empty set?

Yeah, that makes it easier for me (probably just reset it to v6.18-rc2).

--=20
Cheers,
Stephen Rothwell

--Sig_/Q7OBhp_3KZrPtI1FsxY+7WW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1p/sACgkQAVBC80lX
0Gy3BQf8DVbYNAJmNw0UyLzXUAg3wEUkPzGVNtsWh/ohVkl+K5iujBtdKkICCWCU
jG/2YcMpHD9mcj875b7dvKXBuZtvEVOIaXtzeMASYxaf8R2LReV0uUKf+h24ofNR
ME2YiWzuHfQmCQojcQqeu3FMnYV3IkMWwJafIabtZl0khtEPDzSWu+eSCPfDqlPW
iQp1XbnUl8TxV94QS9TW4v3ylplAiBpWIuQUSHOwEu6hBlyOpBulfYsUuUIc1Pn5
DGmHE+7LF8dBSgfkVaqRC04wE81iriisjxQZyowv5MacHMPQbko9owpPdjEdk2GH
Do3s5hXtMj5Hbw7i942A3SJDnNPTLA==
=NwSQ
-----END PGP SIGNATURE-----

--Sig_/Q7OBhp_3KZrPtI1FsxY+7WW--

