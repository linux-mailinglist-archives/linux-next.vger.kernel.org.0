Return-Path: <linux-next+bounces-6442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63792AA3BBF
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 00:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED06E1B68527
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 22:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28CE26A09F;
	Tue, 29 Apr 2025 22:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cqk9gbZx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEF83C30;
	Tue, 29 Apr 2025 22:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745967207; cv=none; b=p9iYJWaPTBqxjkC0fkZ+FPcgAKoYr32NQJTMIf3JgrjWxCtwQ4WMBB9vCffTlhbyaS2Wdy/HFyQy3Nzt+jyaX8Ti4Y17WYYod5l3MCtdcxQTUPZxAvbApnqRnCcSeiyE4IocpOd3fRmX/zE47CkmuYRRa5QUBFLwVnvH9mYm/nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745967207; c=relaxed/simple;
	bh=iar6sjufeab+MFjjaanXav2S2JvWWgLfRUG1hiqVg+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lt+IeyAXgStmKDxO5zYdjuODNKYlInKO/nitGYa+nZRy2KS5eCulfLZMZTGG4NKIGySP03Mo5O1iZec7JsXZX4Xl5Bo3+HaTlsrN8J1dvbQUIlNwt7iPdxPEnWhcxMqtVHG6ta5wqNCjjwCYL6fwttUSN0oEfsLKRiLVgCeoJL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cqk9gbZx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745967194;
	bh=tWbs1bLeViWB/b7y63S6CYSeQgODZrVmfFV1hoAf2AQ=;
	h=Date:From:To:Cc:Subject:From;
	b=cqk9gbZxKcHfvvvFXhFk6AHM8o2YoPunorrCQx6C6XMb5Jf8oBlPcABmZGjAZYTV6
	 tDeHofttIlibhDx+djxT9oNFTYme7vjlOINhFAlM2B1BMLjMmgG/mOzL5fdCgFjWSt
	 G80qgbvM/7ucaJ2DLoDxJ6V52E/Qzb2gEHxeHKFxvaEnZplOlB6H81CwJeqpwhqXVR
	 eGT2xDW1+9CVYbaulNTlXGM39DEoyjvPu4xesoXThBJJjYzzUsCL1RgJ66wJwOkvEi
	 NeUUPkSaTD3mEgpJTJ+Iba3R7Gv2chFhPlN0jbqkjq/9ZNtgymPvRzJmUjPejAEvFW
	 GaDS2tyJW7ITQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnFwB1GRwz4wbb;
	Wed, 30 Apr 2025 08:53:13 +1000 (AEST)
Date: Wed, 30 Apr 2025 08:53:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Colin Ian King <colin.i.king@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20250430085312.41d04946@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/847MB+0LX8gYevskjgPphMA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/847MB+0LX8gYevskjgPphMA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b2f79c0b8352 ("ACPICA: Utilities: Fix spelling mistake "Incremement" -> "=
Increment"")

Fixes tag

  Fixes: a171306ed1a1 ("Reference count: add additional debugging details)

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: ff5340f8ac94 ("ACPICA: Reference count: add additional debugging det=
ails")

Also, please keep all the commit message trailer tags together at the
end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/847MB+0LX8gYevskjgPphMA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRWFgACgkQAVBC80lX
0GwxCggAjY0lMb0U7yMgjWRPHNI8KuHLi74pVb7TSLCHshBUDBDfRYGsMhqGz/zh
AhmVmxZlHA6bh63I7yA0z834KfOD/Ugx0wfIlJ40I2k0j1TgZEAfOx+NPROmcwM3
tlT+E5Ma1BY6qIHj9IwyNbaXYxP5R/ZC1skmfMxgDtvWMaL2aQUfn2Ur+QbpJQRy
Er8o9bRjRt+9kbGT3FPH6bdNW+FGYirO8nub/g4rLQOXoUqqNfPW1dGQ8pVR6JIz
TAfuvH82f2Nh6SAqukYvzZr/VnmCdCx20Zj1mwni0Q0q6qDFPMsgj0vk2K8DnrdS
lLm85X8IlfivItSHZ4GLdptHRl4jMg==
=FUew
-----END PGP SIGNATURE-----

--Sig_/847MB+0LX8gYevskjgPphMA--

