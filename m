Return-Path: <linux-next+bounces-6425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5159A9FD4B
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 00:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D50287AB047
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 22:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7811DF269;
	Mon, 28 Apr 2025 22:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A942cwmp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243434C80;
	Mon, 28 Apr 2025 22:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880591; cv=none; b=tH5GwHwIuNhxM0MK60BwzMMfyeHMlqxj6yfHItKmF9beXkE/p7xTck6titEjHT41TeAxzqGpSGleZ+pRb/naEX7y8fmEKHh1NfJ4Yni/IVyplaNyU9+na3ZQFOu0RCnov0JP9sk4pZk8HL828XMwp5Oii/iZqKWm/n2kbHFR+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880591; c=relaxed/simple;
	bh=NGsqrbZETszqdda8n882oCreq4vk+atqRTD3v4fd4Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Frc2KaLMBuO8PIOTvb2ETBNsbYtc3jiIanSPNQWeZgVbviuoApJHU4VqPoI8jUAvQdScUE996qFhVk8LFKYBIegrkIuZZGUQwydvvK7+68KwOjocE9ZDDzjLLOM30kYVao+jXuAO0uHeGathW3SjUaHZcHxoMZ82sT5TAh4FHQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A942cwmp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745880584;
	bh=NGsqrbZETszqdda8n882oCreq4vk+atqRTD3v4fd4Bk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A942cwmppAq9eVoPZi0vuHwaQKTaIeBaKKr5zAUOFSZ1eX5QPKXaDbdWuvk6Iotte
	 CMDN0XFOfQG5Aja7zMiSBE5Vmf11jSNWe9ZC/z0qOWsQ3hx0nf7VcfPs0Ey+lMZ0gq
	 uSzVApV2LE+3i0byLd7KDPWr/9ygDrwAw6+DahJ4OAWbzWCkRkLIXKbxsW8C6jjQmp
	 JbDr1CglH1itc9fsTr8MJECqbc42Wbsm4JKLm04JWAsABpWZtHqvxDl/bDqUSTQ61K
	 kJR4Eg2i+vMhTw+BitWAaZZL84Q8NHuUW6TnzMI09Aiu5BUQfquvbFUhg2Y1sd8Kuv
	 JjFtEbM7SedBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zmdtc6TDqz4x1w;
	Tue, 29 Apr 2025 08:49:44 +1000 (AEST)
Date: Tue, 29 Apr 2025 08:49:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error trying to fetch the clockevents tree
Message-ID: <20250429084913.36846723@canb.auug.org.au>
In-Reply-To: <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
References: <20250429082047.4af75695@canb.auug.org.au>
	<db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/186SkVbskYydBWo.AKfWEKi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/186SkVbskYydBWo.AKfWEKi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 29 Apr 2025 00:35:49 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> Seems like there is some issues with the servers recently.
>=20
> Could you please disable the tree while I migrate it to kernel.org ?

OK, no worries.

--=20
Cheers,
Stephen Rothwell

--Sig_/186SkVbskYydBWo.AKfWEKi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQBekACgkQAVBC80lX
0GzjXwf+IRysPwBLodXMnZMboCr4csbrystSW1TWkSE0XNqWs9YprXG6gyPoKwLn
lVAifh3/pMYNuy20oL4tIxVFGLuOZKLzIqULqroupAlgl90LQHRGZRDAsPciXXa0
2EprjKsVqYf+yg2eGqZa1AgX5QNbYxRG8E/LdmvGUSMFbQ0nABTbYGMBklR+YNCS
2X3IHOBmm3PM5ypIjjyoODx+YJ6/tuoLCBGXMt+h6AwFQ9zM593+XWH82MyxKSoV
cnlgmhooz5PjGm+R+AxhcdAhCMyStEDfnaMSCfDrD3/5K2/tFCQeBuUeqpWlenDJ
6d98NG7hIY3SU7QIj/B5jDgO/II+lQ==
=8ivN
-----END PGP SIGNATURE-----

--Sig_/186SkVbskYydBWo.AKfWEKi--

