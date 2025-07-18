Return-Path: <linux-next+bounces-7632-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D96CB0A104
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 12:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7EB51C48614
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 10:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CEF2BD590;
	Fri, 18 Jul 2025 10:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YZFoTqmc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF61D54654;
	Fri, 18 Jul 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835670; cv=none; b=L+IdJU8K6nU4x3b731jwUc7L/TB4Jd85XxHcHIvsu+PHriEwoEjye1goYH337xAoyEJN+gpkvRvTrCZdZuw8dfI43k9wrUd54iFdNzztt0cCevO4oiwMokLhXbVULkvlL6c5+ku3vicK6tfB9DezfGeK1FT8uKvZREuWemYVuM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835670; c=relaxed/simple;
	bh=z6gVOJfxiynYeUPM0bJS2uQ7z3BvE6IrkaCNhMFuoH0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AHx570xmqF6mcfQhWKwPGkSSJgRA1FwlB/+tt2LTVlxlHmiW5+1sALJieeEHtU5YtfAFv+nOf141Kw2UZPhR/w27utKYa3q1epgmQczIz3fky63PiAUugTsKvF9Ps+xBy8kbz3IAbYKjUXHw1XGE7HT5CNMt8siL+BZB8YDD3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YZFoTqmc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752835536;
	bh=SfqGx57HbJOqQpUdTI0A7vhAsxIoUys2M/SD1c64K3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YZFoTqmc2NvbFAc66WB62e74wl6uzViwj/GCMCX9QdYw96xKGNzd6HLwURvW9YOOo
	 a3O8dfAfAqgF7/+nEY2EX65qevypjBc9kWsYtzNJl2C8rIDFVeRoqdfQD4/te1wGgO
	 3RS5b0inwMZ4ys2vZmeQevn2D4/juI3Ffm8FU+5IsiHSVvcEvAYKPDNVbGN01UL/JI
	 05bSL0Am/rfS6K/22qDXW1m7Ge4Qk6sOeZl1ci8M+tggITcSS0hBpLfaerurURZkAB
	 uXYme7aMY1oVKY+l7PLnmcveEOS8iJT/RM95eoObWusXOIpsQuYEaKJv9Y1JnqlyQh
	 nkcYf2sB+q65w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk5zh0dmTz4xQN;
	Fri, 18 Jul 2025 20:45:36 +1000 (AEST)
Date: Fri, 18 Jul 2025 20:47:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core
 tree
Message-ID: <20250718204746.729d027b@canb.auug.org.au>
In-Reply-To: <20250718202612.15567f80@canb.auug.org.au>
References: <20250718202612.15567f80@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7E/mEW95xT0qdRiG6Nk87VD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7E/mEW95xT0qdRiG6Nk87VD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,


On Fri, 18 Jul 2025 20:26:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the rust tree got conflicts in:
>=20
>   rust/kernel/device_id.rs
>   rust/kernel/devres.rs
>=20
> between commits:
>=20
>   8d84b32075fb ("rust: device_id: split out index support into a separate=
 trait")
>   f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc")
>=20
> from the driver-core tree and various commits from the rust tree.

Ignore this, I am redoing the merge ...
--=20
Cheers,
Stephen Rothwell

--Sig_/7E/mEW95xT0qdRiG6Nk87VD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6JlIACgkQAVBC80lX
0GxVfQf+KVoTW5SxKdLx2uIzQB80xTQu4oTF6asAd1XawbhMAdmN92b0Qi2lb932
GPWtqOKIZGov3CA1YPwfywTgruurohud0SE/nmCd696q++98lvYiPZVCZTov2VWH
epI3MEUkTkLc2U8PAS+JdWV4gv6qXgPAfYNX/M6PN7lsvuZKFpkD+nYNByzg796+
YZW0e5Z/1NQ1VEK7syGWwoPfMwg+Hiw56xDTKhGUdDfYEl8REOCd3oHBI/t0oua3
DOUor1axXxhzNp+65UQsbfR2ZF1AuAjXZPByQulU3z2ATpxgdEWW+iKmr8F+zZfe
lfxtwRuzcrxQjrMT9+6dM1TpoNctIQ==
=hBqb
-----END PGP SIGNATURE-----

--Sig_/7E/mEW95xT0qdRiG6Nk87VD--

