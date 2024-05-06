Return-Path: <linux-next+bounces-2183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8F8BC71B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 07:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94A728156E
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 05:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474E045944;
	Mon,  6 May 2024 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e/QeLCjQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F20B41C62;
	Mon,  6 May 2024 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714974327; cv=none; b=Fr/DecYhg4Q871GSUGeX8x1EhawcVlmHtfET40F3ZaLCW/xso/CP1ZjKeOq4aKRg+ThgVdRyxsRdztR6rCbm2MacBdrJXM44IX5I30fKwNhrx8cr2KdN9PZ9o40usYXH4SOnQH55IPUfQ+Zg+vUT3ltTMsu7bKhXv1HTiBzPZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714974327; c=relaxed/simple;
	bh=CA37Acmi3+rrCWvPJGXdJ3Rmi+5Bh8XXymrrE5Apap0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EDsj227ILrATBQipbDY/aUL1sxd4sm5g4Yjq0bNQhQb22wYhNLDgCJKjQDa0HSeIiDOz9EfBTMtYS3aSKFSduMpjn5jm1Sgatu70eVZ8BHe0PpoiJyJd1E06XNNXqod/ACiqgw+mHu4SpYMQBuEBROZ5bMS/oMjBURQkmwwYNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e/QeLCjQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714974323;
	bh=CA37Acmi3+rrCWvPJGXdJ3Rmi+5Bh8XXymrrE5Apap0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e/QeLCjQ25Bo+/plbgAoG9uEN46EpAOK7zpxQJE1/mGDv+wttjORuM1jbKUixddCI
	 XT2HkvNNOXp44h2yAE8Z6aOW/Xyq46yNYO3nGtVUV2kPxHyb6fN1uwL0gvvm2D1oZh
	 JftJWLfqdqGOxzHzb1iKelpMNn9oloTSZ+n9BbDSQ4U4mpsryggBNMFD3TxSLvIP3H
	 4rdmj9E8h88r795/AZM8ojlRkUdj1+6TCzCY5S8cdpp7zthC+O4OE+hTC6/ZydfzdO
	 UHHbh4OBKF+xz9e0uYkgh05+2v3zTxqcNfzohtH8TjpJ5xVhiWLBzRsHFsHPPASM3E
	 pMuFNujm8wUiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXr3R37MZz4wcF;
	Mon,  6 May 2024 15:45:23 +1000 (AEST)
Date: Mon, 6 May 2024 15:45:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slimbus tree
Message-ID: <20240506154522.782195cf@canb.auug.org.au>
In-Reply-To: <20240506152414.5796b14b@canb.auug.org.au>
References: <20240506152414.5796b14b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lU9xcw7aqQ+X8tx/396vC/z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lU9xcw7aqQ+X8tx/396vC/z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 May 2024 15:24:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in Linus Torvalds' tree as different

I meant the char-misc.current and char-misc trees, of course.

--=20
Cheers,
Stephen Rothwell

--Sig_/lU9xcw7aqQ+X8tx/396vC/z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4bnIACgkQAVBC80lX
0Gx9rgf+KyIGS6ItzQXS1n5huIVtmr6Cx0U6Q3ueqfZw0oc2zKg916M7Bc7eGqD2
uCV8poaCJw9ZXKU92eOQoJ9/rElDd5lyR7PekivgeFuxzPnzyRCzCp6IVY4L4ruR
EYSi7yd6+10locxDElePwAx0G7ag+zRngCLnjnxLZvEh+9QyEFSmCkqIKOgui3Nc
mK+IPCVeCT8qWSkE1hEz4RFicvluwYlbE3750Brh9gCLyt8SCPRawGtKfqzEti6Q
Ja12T7HJDe7idy23ZmXWAf9ZtVnUAQ6WKHvhSi2MbJfbZuzUufX1ISXevikBVKIB
E43fzZhfyzsbtPEyEB2Vww5o5OdCSg==
=pth7
-----END PGP SIGNATURE-----

--Sig_/lU9xcw7aqQ+X8tx/396vC/z--

