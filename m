Return-Path: <linux-next+bounces-6740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848DAB542E
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 13:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99DB3A2628
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 11:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313AF238C34;
	Tue, 13 May 2025 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MZX/SRgu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705A617A2ED;
	Tue, 13 May 2025 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747137512; cv=none; b=UbP/pk3DZ/rJWdrbha9Oa+ir17iuuCcqlGZ7EmCB22ko2eaSDVQ4xwAqZRokBSWX5B9Qs6y32h3UXMDULYm3m9wucblddFmmcQzvItrb9KNEmJqEPtkwqXtkTdOjnHHcQ3XYHLZpIXtHweNYtWmdOGt8OjUTG0Ou7n31WEAwhMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747137512; c=relaxed/simple;
	bh=5OnMqy4x/fxysop1pI30I+DFYwCEXMalkXpph2ZdJaw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXv4hoYZHMR2PpizzXvjgl8CdvcbnPs3dlT+fxZ8JsEkXDuiu5R9AS5lqG4Cg+VogiB196t3jyedAXowSzFy5JiTe11RjaXK+09x+E8/q047oxZy418rLTFpqc35rP9gmi8IG3v4kghbpsSTIqIkR7KziEKJnbOoCsdBkg7TKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MZX/SRgu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747137505;
	bh=5OnMqy4x/fxysop1pI30I+DFYwCEXMalkXpph2ZdJaw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MZX/SRgukj+hj5idAWEfzjXMKmLh6ZP3LcfRvGUHDaqvXOp4KcBaBY5j8sKzwnjV2
	 H0nGcTDcuNKy4wnd4gUS2BRQSLfdzdohc4uEuTEjEIYDmKcQMPTLQTamZ05Lo1W13e
	 npEVZ82R3gqmcNJwQ6dRWHiSrPMp+udCv0ErW8vJfsM1JGojuSOXpWohWcYTf5NqO0
	 GV/iS6aGKoKiu+5mCUfYbBkd11fyBq78h65S5xk5evzz/9g3cXabAkzD4Uyh1VOxhE
	 Aq4/2MY3CWZGZW6YK0gHi4WH41w5ZW2cMskdW7j4THEjk+I4BYRAQJRMU0yEiPawqO
	 lQvtF+SkcmFUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxZk83FJMz4wcj;
	Tue, 13 May 2025 21:58:24 +1000 (AEST)
Date: Tue, 13 May 2025 21:58:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: warning when fetching the sophgo tree
Message-ID: <20250513215822.3c026a3b@canb.auug.org.au>
In-Reply-To: <5muhaygt7rpuyvtx4ppmuuebsqqh7z4bp43c7akmuimxhrnqva@hobausqvilur>
References: <20250513212242.2f951e70@canb.auug.org.au>
	<5muhaygt7rpuyvtx4ppmuuebsqqh7z4bp43c7akmuimxhrnqva@hobausqvilur>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZrQZlmU7AvylNt6Cy9EMY=m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZrQZlmU7AvylNt6Cy9EMY=m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Inochi,

On Tue, 13 May 2025 19:29:05 +0800 Inochi Amaoto <inochiama@gmail.com> wrot=
e:
>
> Sorry for the mistake, I add this file by mistake when doing merge.
> I have updated the repo and remove this file. Can you re-fetch it?

No worries, I will refetch your tree in the morning.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZrQZlmU7AvylNt6Cy9EMY=m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgjM98ACgkQAVBC80lX
0Gz70ggAjI+/qhdM90ex2Ga5iZtWTOwvwZ95JK1oIwn6cRIACRA0YAKWImdgj3HO
qKhICe59sKbyhpN4H/xcmO+urF2OTHeYaKcIDkSlrRE6mQfg85uWmqWI3MY2/khk
N3uwkGASvo734l42mdgbuoSe9NxnYgRiT+o1LIOwSruMQw4ONANuswc14Hgy41IV
YreAJIWPMv4Y3u9WwDeqfsdV1u70YfswOTLNc/ueUOZIJr/hlG6fjozg0aLsFmWD
hycoxyqg7GjEr+5dH3416g2zlFOGPAXT/CCWFT5gLC/uAqGhXusxKBHPO+6FeUFT
nOzqeYggIqbdcdKKPVmr5KXvIPGwww==
=AKPK
-----END PGP SIGNATURE-----

--Sig_/ZrQZlmU7AvylNt6Cy9EMY=m--

