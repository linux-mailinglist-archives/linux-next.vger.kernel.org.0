Return-Path: <linux-next+bounces-3766-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48485975D4A
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 00:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA1B7B217D0
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 22:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CC9185B5D;
	Wed, 11 Sep 2024 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aTkduiB+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4A15442D;
	Wed, 11 Sep 2024 22:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726093986; cv=none; b=E8tdssgOEybtPmG2Y+dtgyl3Gm/qH1kTb5O3Kw5Pjheh7rvRxOnzQXN99gsHXFScbWgD2lZS5CduP4ygOFG19FJMgnZuOy+nBn/0RVKBbkRXSYQYazhqJsQfAEiqwelv8EtO1Zf6fZNiajZ0OfYbh/TaxL+N4k7Nfod5CR95VA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726093986; c=relaxed/simple;
	bh=MTQil0PVuo6dZWE+07P/G0EJIa/lxSWcbf5rZ7LKkFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X3uvZhtGwp8O/WRM9Kns+S4UyPYewQKTthfI0bMA1LuQjSvdPh1YsXOF2IQsxWtmLV9Ve81TjeI7TWAjfu/z/Qb06vJ9Xea46iZct+GzTwQpxvoNWQPCVNnGawVI8NYdmtOmeAvdyaS/aG4UgzjcfRUNDlwS1mxFOO1Q+g4KA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aTkduiB+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726093978;
	bh=dIw/I97nyOSuSoNnqas0N7JMs8pcfS2d44H3Hh+U2QM=;
	h=Date:From:To:Cc:Subject:From;
	b=aTkduiB+hddq+cZIH6ge91MFhZjezyiDt0v7GEUqeGmY3MOxeDl9mC/iqpUBoSxV+
	 Ian1T5Vm58YhX7i/xdasKxj3pWmLjZoJD4UAzRMoBeSM7zZ3WAZKkYJSa30VbBne5q
	 J5KayLLlxK4ggGrKb1nT3Sl7o809pNSOSppOnczQb6b1BjnuijJklemvlJXjb1ZrjO
	 iuQNszPfqeSpTpOmK/WKYjasM0y6bo37+vlalEC4ihRfqqGFXOeHeZW5aFbLXRPq3J
	 vSw7APfvjnMBdBqkJEY266Skf131cKaIUjnPGfTFa5yVocGpuY09tXEkReS1XNkao5
	 NfH5keS/PaE1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3wLy2Xbpz4x3J;
	Thu, 12 Sep 2024 08:32:58 +1000 (AEST)
Date: Thu, 12 Sep 2024 08:32:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20240912083256.27843fd0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gPjd3Lc7HOEzLZDkk4Ui7s5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gPjd3Lc7HOEzLZDkk4Ui7s5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  cf700e558e1d ("ASoC: dt-bindings: cirrus,cs4271: Convert to dtschema")
  f579278d690c ("clk: fixed-rate: add devm_clk_hw_register_fixed_rate_paren=
t_data()")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/gPjd3Lc7HOEzLZDkk4Ui7s5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiGpgACgkQAVBC80lX
0GzX+Qf+MnfBr/+l0kHd85FIh9tC1V3+wJb3UI6AVkUvYGs5qAbpb/TbBG4joxzt
XYHqBTycQOH0jlg/NIX1w7dKb4CO1qqov0pfhhFSKxbuspkH3rmVcHh87jd3VeFG
beylkEBjIu7NxJEi9pseTm6jjFu195TeEkykuUgw8g86iEyB1ex61PAkLJLOZWVE
VyktswZAu69DTnWLYArtyc7K/BHLDqJbVK1IGVTyD/VFN5Zh7JQLRyKPlEna/2ds
iBwoLNCGcKvOgL9sHmSKGjl80guO9Xjm6IZmezUmgGOw9L8xVNEEufNiF+yyqy+v
w1sVGvg0Fq+P2G4UENMcx8b7wiqRQQ==
=2195
-----END PGP SIGNATURE-----

--Sig_/gPjd3Lc7HOEzLZDkk4Ui7s5--

