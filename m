Return-Path: <linux-next+bounces-5005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDFE9F8607
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 21:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA05E16C630
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6AC1A0BDB;
	Thu, 19 Dec 2024 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LCEBMASw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93521CEAC6;
	Thu, 19 Dec 2024 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734640622; cv=none; b=LiqW63GxaHC0iGjd9qEbU0dQdgw6xHaLFQHJYbzF1WqPt+Gy5/iDKWSLfQLetdcAiwr+AGrOvv9Jtj4ZPMIuxBBatWPS8Rdv/VfqBlIXZfBrLSJXHMhfZV8lG6gvL9+74AIpq19jrlXcLmP/aQ3eaefPidPQ/diwovVmpGcsG+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734640622; c=relaxed/simple;
	bh=ek4wTyGCqBHYzxiNJStubHnkAmvtntx/iVrYyVICspc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ik+3Ilj5d+SbHrPzHr5GkSz1kPfr9VtGolkM3VfjmtS01KvdNsptmbM3doM8uy4K0pcfDP/jS8p2I/YsWG70YXJk4nLOKmCKv564Bqo8VwgTNFEewrFecimpLcXqFrbxjitg4j7MOn3VAKTOQwLPNXLFjTQDg9NM4q6zgWW0zjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LCEBMASw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734640611;
	bh=ek4wTyGCqBHYzxiNJStubHnkAmvtntx/iVrYyVICspc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LCEBMASwwVlWdI5WNEATQB+8pnm12tAUkTlgNCWxTRn9Ep3rcK+UX2Bmdhp63H5yb
	 xs9nFKtoxB0ovjwH13dPIe34Nse+4OVZ+CF055kz4Qjfp/u/Cv2oxI0tOnS44sYjGe
	 YpD7FT5SuCPQzEM3A4cKFGhTrYGKL2Khs4RQ93f/KrWrkpqTMsLLVizW4NR8FE7S0D
	 xT8LjgrUNFAEJa9ZPAiP2uPi5Tgah4pN4AlImsy0buertC2kPkiJVk9v28U82fq1F7
	 ctDYnJ8tHMOyE6DbopsIW2MpywzPvqqWOJcMIId6DDqnlIWxF8aNamP50mdbD7Bwdp
	 xCZ1kXKnbJCxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDj5H1nm4z4x6T;
	Fri, 20 Dec 2024 07:36:51 +1100 (AEDT)
Date: Fri, 20 Dec 2024 07:36:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner  <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20241220073655.0c423a50@canb.auug.org.au>
In-Reply-To: <fb6ada81454134c8a37aec7cef17b7c068ebdf85.camel@kernel.org>
References: <20241211143701.5cfc95a7@canb.auug.org.au>
	<20241219173156.7dce2f07@canb.auug.org.au>
	<fb6ada81454134c8a37aec7cef17b7c068ebdf85.camel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FrMSthlBp1NmPM+ssjA0d25";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FrMSthlBp1NmPM+ssjA0d25
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Thu, 19 Dec 2024 07:40:05 -0500 Jeff Layton <jlayton@kernel.org> wrote:
>
> I'm not sure how to fix this the right way.

Some other samples define __SANE_USERSPACE_TYPES__ ...

--=20
Cheers,
Stephen Rothwell

--Sig_/FrMSthlBp1NmPM+ssjA0d25
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdkg+cACgkQAVBC80lX
0Gx9KQf9HWQvMRKNFXz60ES6knKjGmpMnab6QkWV9hmd/wn/bgxa6RJMDMCRmdUU
fXvoqm75jxlX2WFaYk9qc97oVe0eH5ERzzQXURU8PEuzjevw003CQJRc4HEwcHXT
LuZ76tzsfLiPyEOilGJG/oaxk5LOUUxFmrcOc55I2Vu/4I8PQR7bKwA3OEaxzQFQ
2vc2bMiJT/jla88tXGvw+w4arh/pADNXBcl8frDF+HlWaS9YXc0ffKfLSxKPLr4y
r94w/68ii3ioQSzVUkSXUgU5lbfsd3TvUksxybY3qyj2hVt7FBDCr2/BlKvXmya8
hUoS8qfWRaVKPEv+G3qZRPWetVAuoQ==
=9Y9D
-----END PGP SIGNATURE-----

--Sig_/FrMSthlBp1NmPM+ssjA0d25--

