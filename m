Return-Path: <linux-next+bounces-3960-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5436C984DE6
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2024 00:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF6961F24E10
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 22:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B5913CFB8;
	Tue, 24 Sep 2024 22:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bgKA3ZkA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788A84A2C;
	Tue, 24 Sep 2024 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727217262; cv=none; b=BAEA7XMNo5T1y7slVW3x7bJK8ftW1TrconBb3RAZi3v9BwZGFgtan9TKlZI3v8bG4a6grYJlZhltpyx/Ha2yqqK89tH7hGLmaKqWyyObXKWiFSryQTOgV4QaUlwMQm/jMrvuWRO1BTt+ElDEwLxMn8o7hVpmsnkT0pm3Ky72w0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727217262; c=relaxed/simple;
	bh=0PVoR/5v1qOqDBiBN/LRx9kWjXH0Ln5f3zb09MFgbOA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRBvBm7it5CQFZ4cBEQ/zBguHXVRUrFn5auCPgs8UFrSiEOn55imHGrL6T3Cg2WoQ1feCJmSAiJrzytJO/w45WD3kblj05APJp40eyuDI2cybNgseodRSElOxZMVaDADViXGYGhPsMM1vG0d1Mz9z28D9TgRCX1T4eqzy0y1zZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bgKA3ZkA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727217256;
	bh=+PdiF74Zj3+uPdW/jYy57BKkkqQL+6Mon45WVqcPNYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bgKA3ZkARpwKLyubUpdXUhZN1EdCyPobS8bUtW2PeapE+pGPruyuhyu13lcB0/ZIn
	 TOB6GE6gP/P3Ny2iK3s3z9rd6J0QpNPGBADVp9unwbExbQ7nhXvVxvXC+RycljFbvD
	 Y2JlI1llfGCoxqciBkciMscFit39aeaqUVm0gAk6ZIMSCoBO70pGQrFf+46MnzZhd0
	 fb2YZsKb6W5E2HVgg/DHjHWpH4Mvwrc3/nniHWDeHZkrcfgBsyClk4DWTDmp1xFHnz
	 m6TUAmRMeYxQ9UIcxnISBB6N5zuiyXHkBO4E26Koka4Yw1OCfjyN+h0EWdd2ONRYQ8
	 hGK6Mzk4RIfew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCvmS5Dz8z4wb7;
	Wed, 25 Sep 2024 08:34:15 +1000 (AEST)
Date: Wed, 25 Sep 2024 08:34:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240925083415.5cd7b465@canb.auug.org.au>
In-Reply-To: <20240919150513.067dd727@canb.auug.org.au>
References: <20240919150513.067dd727@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ChejGa2Wy9F7zDIk4wndHfd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ChejGa2Wy9F7zDIk4wndHfd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Sep 2024 15:05:13 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the ftrace tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Documentation/trace/debugging.rst: WARNING: document isn't included in an=
y toctree
>=20
> Introduced by commit
>=20
>   2fcd5aff92aa ("tracing/Documentation: Start a document on how to debug =
with tracing")

This commit is now in Linus' tree, but I am still seeing this warning (as o=
f yesterday).

--=20
Cheers,
Stephen Rothwell

--Sig_/ChejGa2Wy9F7zDIk4wndHfd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbzPmcACgkQAVBC80lX
0GwzfAf/bsocWqGz5t6NCUm+3gCFQvwbBb93MT75zxxsWNOe/I7kgAvdEMS5v2dz
zA/MFYUWgxLE0eUdP9LnE5H6nqnhk2Ehj3YpMe88HUwWx9LDuO0hyb/znbuN5dZw
RnYi/DtffJ5tnHIpZxhrxhpPzZRdy7I6ctrOb5ikAjsvU0y3PqHQxa4PZB2Yt6Gc
TN9UGLp06C/fGiScZYtVUmso1rnUlNrqwlnd7zzxnWoWXjyJivKrxxPPGLJm2Z6J
034Epg7Do+D63DnnvR6rqDqKRLG4PhxWjaNzG2HH7YK1yA+Z41aleHUb0rjQe7UP
EKj+CI1c1x60dqUs84A8CGEq/25J7w==
=cbt1
-----END PGP SIGNATURE-----

--Sig_/ChejGa2Wy9F7zDIk4wndHfd--

