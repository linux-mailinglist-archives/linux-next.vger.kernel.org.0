Return-Path: <linux-next+bounces-4706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E039C17ED
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 09:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F153F1F2175A
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 08:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FEB31DDC26;
	Fri,  8 Nov 2024 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Geq8oo5B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76F1DD9A8;
	Fri,  8 Nov 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731054525; cv=none; b=t90V9LgdBFd2b6Jfxq32NxS32qI45mZ338HhKLmAq5NOUeDc7wrBMLsCsfRzTTGA4Ds6q77/1E6sFrN6c3n8aa/HFDBwaN3J420l4efqY4LJrfpfZ3OiP3TOT7qbySrj5VKr8JFo4xw9xCaaEtArx7XD3d68uC1R1HNimOjnwV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731054525; c=relaxed/simple;
	bh=i055ZoCKfr3UEwx/psrl3Nu0Z2FbLjeNmlWckujJ5JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=il0VJIu9ditj49gCuM3spMRRkbOX/h8qxR8/82BSv4fk8cD1D97bZvLrG3v7Iiw8aRJS5QIhjZL2jhn9eB1lWgDgjEq9mg6o8L8kvyRXuCwQ5ctj/O9ga4aXRXPaTToDdBdT/jnC1/g/wjJUQjyi7MglCDwb5kOjG9tODO7wH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Geq8oo5B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731054517;
	bh=hF9N1B5LH8ZXu9L5brN7gFTdiBajXJCwJvnaJ+NN4As=;
	h=Date:From:To:Cc:Subject:From;
	b=Geq8oo5B+6YooZ01uJDnAxrS+pYee49z5RO/3U4CNjCAVbvRZARFXCa7yBkbCqAvr
	 34xtW1GI0PGDyFU3xKul8NgUMM/lpZtRzDvrVbndYU1FCOyZrpB5J8rZ7qELlqVPdV
	 Icgrf08sbUzrC97lNpKQP55CCFqUrQIkn/dhVyb315Q03pvzm7UvmNJh84017fJA7d
	 c5s9BwPfaGU0yE6LzSS9ZF/s9kDI//H/rtbmUfj0Rl1Y1Uk54nOKhnelCGQ9icFfTH
	 sfNdfb3mezxApC0Y8rfQ1+xyiVd5uM5s885gPCbFPX0hFhHZlhcq6P49HMhHn2HlC5
	 ivEqYg3OsYp4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XlBsx4FXNz4wc1;
	Fri,  8 Nov 2024 19:28:37 +1100 (AEDT)
Date: Fri, 8 Nov 2024 19:28:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hwmon-staging
 tree
Message-ID: <20241108192839.51a8f29d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aGtj.JL220fYaeXDL+8591G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aGtj.JL220fYaeXDL+8591G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  317e5709fced ("dt-bindings: Add SY24655 to ina2xx devicetree bindings")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/aGtj.JL220fYaeXDL+8591G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcty7cACgkQAVBC80lX
0Gx+Twf9GXjsf2moblMdJB7Cj34My4icctjH2VUNcMNjVX05YG6X2CDY9cW+Race
oMN94kNqgZXUhu+pfPk2pafQnYJkG/gtUQuXDbND3KZHW9eu4a9kF+vJPGvWGjQa
TbFTpclcHWnzxBnaKxbOYJS61U+DflHFybrBMlQPXkdGz8wjpvBpEwgXpqZ9gDYn
7l/jswoTGv2fiEfU7/KoK1vnMEUaNwdTQvEOH9Iu5wAey3+co9Hp2Y2sIQwxHm+l
Gqoiw5OA9N9FPvuyVEycaRJG67T16btpMAtDbFLQfD/5vBVxz1dZxtQJ5DuHv89m
NfFxs1/k1IHtuLsQigxKJ0p0cOYTYA==
=4Mb6
-----END PGP SIGNATURE-----

--Sig_/aGtj.JL220fYaeXDL+8591G--

