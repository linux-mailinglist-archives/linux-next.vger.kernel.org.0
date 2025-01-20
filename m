Return-Path: <linux-next+bounces-5266-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4EA173D7
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 21:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF0B165C0F
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 20:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7541EF0A9;
	Mon, 20 Jan 2025 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DOkspP/h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E72188A0E;
	Mon, 20 Jan 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737406526; cv=none; b=ICW/FFPzUA5c9JShqxTTuilKF3I7Xk7i5JE6qShF6CDwnm6dbOWQYAepsmhOJgzH4eNm51Uicj4lVak3PIuPsqv14Gpdd/xm/pa5MSm8SqLqvP23FDJGbE/lG7Nv45rq8pkLILkFWb4wv15Orf2zgH30uusc+DDEg2mFZg/X28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737406526; c=relaxed/simple;
	bh=0lqeWCC1fUdouQiSzksJsSUgb5yHrCYy0sbpjQZheaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wusl+v6K3S5eT+6J8dIpUV3wbNcnn0khp+uKEu+YkAY8AtgwONX7nZdZ6oGN93gFRo/gJe/NeJ/Gy80JsfhUkB9M5ImlthaI5koLktS180asnY/CYPKTeBOg2bZFSUXgom3quVOjUUv2Fi8iaSCF8e/AuMgXAZvz6iLwpqnUI+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DOkspP/h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737406511;
	bh=0lqeWCC1fUdouQiSzksJsSUgb5yHrCYy0sbpjQZheaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DOkspP/hS+zZ3IQqJ6tKBNOu3JDsAOPUcqOTcXz3czqEhpnvN709lpkwrQVLDDs8F
	 7mvCmW2sB67EbcgW8Uk9djkX57Iqyy4aOxktl1f0KPvLPvUd5dsqI4QpyGwTqd0+1g
	 SE6By1oPGWAxSEF8s9pWlTKsgaTCh+zLyZjXd5XWHaeTDaMbcu0rLhK4Jap+PrYJAQ
	 LCRYfBt7nERQ5NJZDvhjT36+gZH3QXJuIA7MVlubvrmOmFEwUUzKKL4OtKu6tlGwp2
	 2QWBrIT6yCs6lotlVuEUNFaTjeQ5mZsFelWW1X3GC+8LwE/xiHgCPPsavFGfTkibvl
	 McMEzKQkGiiBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcMzg5Fn2z4x89;
	Tue, 21 Jan 2025 07:55:10 +1100 (AEDT)
Date: Tue, 21 Jan 2025 07:55:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20250121075517.76bc2c97@canb.auug.org.au>
In-Reply-To: <20250120-juror-halme-dc19277bc465@brauner>
References: <20241213152724.589b38d8@canb.auug.org.au>
	<20241219173235.6600d08a@canb.auug.org.au>
	<20250114164812.2bfb505a@canb.auug.org.au>
	<20250120192504.4a1965a0@canb.auug.org.au>
	<20250120-juror-halme-dc19277bc465@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RgT.cS1tpiQyidEjI0IkmZd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RgT.cS1tpiQyidEjI0IkmZd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Mon, 20 Jan 2025 13:15:07 +0100 Christian Brauner <brauner@kernel.org> w=
rote:
>
> Thanks for the reminder.
> This is now fixed.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/RgT.cS1tpiQyidEjI0IkmZd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeOuDUACgkQAVBC80lX
0GzWyQgAjGOm/G+bjCRdR9btacuH6HzPgvMlT73wsRcTvMjm8K2C7psHfKytR6A8
L3bQfgebyroRDzIXrAydn9liSKeztoaSP4Aj1eiTjWp6VokhDMH8Amn7qKnAR1W/
sTC6UwJWSABfwW0vzs1kxywdvAo9/A0RAt+8KUQuhqyHs7jGfaqcAY7F4TRXJjA/
Xpu945lakiAsMuhTPtCMxfJw2zY2wqRHDDn1A+B7xEUxkrgvZBrmGcuFl5MhAhlb
QzVz4XfMq3SXIlRUrm2PVCHwG4konyazDXU+eqdEXml+QNip9XYgXlA/z4vJ+vL3
GUAYeaEW6uaQ5qs62orn/adWxDogFA==
=BrW2
-----END PGP SIGNATURE-----

--Sig_/RgT.cS1tpiQyidEjI0IkmZd--

