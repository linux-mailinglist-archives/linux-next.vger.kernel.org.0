Return-Path: <linux-next+bounces-2999-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A3930C97
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 04:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00AC61F21137
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 02:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A264C9D;
	Mon, 15 Jul 2024 02:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Bmnb+5TB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA15629CA;
	Mon, 15 Jul 2024 02:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721010067; cv=none; b=dNpUKOn0dPSVneMOxvfbMnPbpMRQHS3b6EsvWF9A+8TbPtu3M8WoO6TZlIYkztAlNBJ44n21Z8UNvInAdRt4nQiM5YwkOezzCAofG5nB+4g03t2I0c1dA3O9CLXonFo5F4QvIcVRAONIidhGVIozlzhZaEFKx7jrKbJX0/wfmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721010067; c=relaxed/simple;
	bh=rcefzzYqvfPvMclZvpRsAmAmLokPfoE0S8KCmyX6qDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IHymupz166UvOUjn8YXiydZSYf+lvRaP5t6Api2B7UNxEHmOyMdDv1jH2yPtQQdl92MXt+dUGmF9P2tLUkoZ6z6k3xYJ+msV4VdIH7CvuGg79z4GwNA3n62tB9GdateXkr3JG1jVAjap4rG6ScfyoYrf//ewLTJxtG0io64Cdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Bmnb+5TB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721010061;
	bh=wvT0CJPB0yLw+hllkbYKOiDylZDMHD9c1R7qQnPpDdw=;
	h=Date:From:To:Cc:Subject:From;
	b=Bmnb+5TBm9bK4bihiRA8l8LCf3Sbz6qmGqsWCNMHY0U+ve1PQ5+4O5eo9FVed5ACU
	 AicIpnnp5kUw4jdIy8VUh42fvvXbo0xIzSWvKyGpHcyaLbcALMe435I3oC77bMbOhr
	 gog4DiGa0EfjDwby8Wp4ZaC/shkIdRl5CkzXshO2BlB8YMCzQK1EQCWz1e7LjL7Brx
	 acgFQAiS+RBe/3Tf9RBLULPVWbs3SnOzhX2gHSi6BKlSIe+BkmFaD2fR4apKtIqnsv
	 uoAEXF4JdFPd6tNIyIeEtTly1zTSxR2N1X3W7XeHgI4PmqprpkqHcQzD5RTfwxGRhi
	 HIX1uOu/1pVBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMmCK37H7z4wbh;
	Mon, 15 Jul 2024 12:21:01 +1000 (AEST)
Date: Mon, 15 Jul 2024 12:21:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20240715122100.1defde20@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3usN7rIjpT2jFBmL7STcsJQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3usN7rIjpT2jFBmL7STcsJQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  ead30f3a1bae ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")
  e6491bb4ba98 ("power: sequencing: implement the pwrseq core")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/3usN7rIjpT2jFBmL7STcsJQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUh4wACgkQAVBC80lX
0Gx42wf9Fd7ugz0rdBU8NwGx2fGS5cjDzpOtJuAigo5np1nS8JI7FXYV6w4lGAS+
No5rPMfm5LK6wPMgnwsKWnQ9fNyRpiCLtSdOVUmFx1OhM/C4cYOXUmiwawQcMO8/
T77BOGYCw74tG1qSPr8+iuj51h1pyibvbio9P1Q+FeBB3W2cCpflsdwAiepjiYaY
qSyUX5MaMZISPQfLXwktazYI0nxEPOHWlb2QXNTjgxFHoTVq7/AslOU/PzqKgw15
k+i6D+TdRMv2a/6FzD37cT18d3Hr+CHrPvSS5wQ6gZ9OPaNYxOvgyB95Rb8cJTW/
3h3RXvownnEfftQNTylUWPgd2L+9BA==
=rWEZ
-----END PGP SIGNATURE-----

--Sig_/3usN7rIjpT2jFBmL7STcsJQ--

