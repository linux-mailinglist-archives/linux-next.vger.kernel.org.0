Return-Path: <linux-next+bounces-5839-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589BA661B0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 23:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 916F33B4414
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 22:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891EA2045B8;
	Mon, 17 Mar 2025 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HOjnEtto"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80761CEAB2;
	Mon, 17 Mar 2025 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250692; cv=none; b=ussQH3UB2StFdOCGWFwPgiDdtCKLtpnxCycPuMB1RVaC2f2EMQLQN9ZtVRia9kzUnOS4wsw5IyNqH0BEfIuUgc87bxBIKWBa8hUvcInVgEF1nFmU9C8gsHcakhnRG2opr+hgB9AsW72/vpwIhrvCQsjlLUoC9CI2hlaCpEvwp0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250692; c=relaxed/simple;
	bh=Id1Rq1dXAeY1PskZAbDnZCCle4xFZLr7+SR32OwvM4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tn9ekwFK4ssqDd2HAuRDUjUYn0s80gaEPARVjMQua6hGIXo7JJVWLixcEqWCbk4kihUAtNERW7w0fG0xsxsWKPqwA6lwTs693JdpehOzCHkFQcyhVm7tgK4w4s7edvirafTHiMkM9EduQDE7hU9w3ewdGmfbbrrpVhMr/EUA+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HOjnEtto; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742250685;
	bh=Id1Rq1dXAeY1PskZAbDnZCCle4xFZLr7+SR32OwvM4U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HOjnEtto0XGQWfBnTIJBTbBCaVvQAoydxBIU7HRL05L8TjTuzo2ofHsnCHzhRZIBG
	 dojwrPIE3M6hDPOC/EJTStgtmorThvq5oTRIJTG77yhZRWqL6KNXd2q3y4S8Pq5nlZ
	 PTVfJRM0Fgk6kJ6CX80HW2P3CgomKiZ2l6QqWzyUCrl56ZZemVRHOZOlGlKj9C5ZS8
	 RVFTjun5QKxlCUYpG/cs9+jiuss2agLGbWl/G6n09pXRbbApmzQ1cSSkphcu+p5g9y
	 omGJNJl+sE7cDDYBeLC6J4wCuCIPskFW8xafmcR7GlX+BNi8rprsMO84HLOntZZhnO
	 Bz+z9mKxJJQ0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGqSr4ktYz4xCy;
	Tue, 18 Mar 2025 09:31:24 +1100 (AEDT)
Date: Tue, 18 Mar 2025 09:31:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alban Kurti <kurti@invicto.ai>, Benno
 Lossin <benno.lossin@proton.me>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20250318093123.22f584df@canb.auug.org.au>
In-Reply-To: <CANiq72nD2ezPVHH_mZhB4+FmD_Un90dGL+q5-Np+zUDj97UWCQ@mail.gmail.com>
References: <20250317212047.46580935@canb.auug.org.au>
	<CANiq72nD2ezPVHH_mZhB4+FmD_Un90dGL+q5-Np+zUDj97UWCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W_07QCzb35HABjsKHsuaR.D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W_07QCzb35HABjsKHsuaR.D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Mon, 17 Mar 2025 20:37:14 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> The part you did here looks OK, though we will need another line fixed
> elsewhere, since the equivalent to that line is now elsewhere. Please
> see the resolution in the last message.

I did not receive your "last message" - or is it still on its way?

--=20
Cheers,
Stephen Rothwell

--Sig_/W_07QCzb35HABjsKHsuaR.D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYorsACgkQAVBC80lX
0GynQQf9HK99qmUBvnmrzemwsgj8e0jBirBM2g3LnVGJldVT5/gyX2GCW5l5FXhm
PBEM16N1YatH513SWfCRdqWDaZaFO4FDMtEVs6ffGGinPVaeJ0vrMS+N61CFXzwh
MXCIrYmmr8RxQwo2CUdmUehzibwqn3QmcH/lgeNGNu/YOrBFgPlJWU7uUDMyzMQY
ljRU8PuD96sZIJZ+bObtX8OR0rtmw+zdSpJL1DDivr7oOpa8GWL3iTwW4s1UVhKQ
+pdNTtFsRRsx8g3bJCt8bVGDdDoWkzB/jupoNiKG6jGDk+gy+/bn4PTNCeXi9t6N
NI/31NEOKj9jR16lmBV51zCbeau4qw==
=g9kK
-----END PGP SIGNATURE-----

--Sig_/W_07QCzb35HABjsKHsuaR.D--

