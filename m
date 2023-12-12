Return-Path: <linux-next+bounces-366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B780F8EB
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 22:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B421F214B6
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 21:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B4265A84;
	Tue, 12 Dec 2023 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TVVp7yxf"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26CEF9F;
	Tue, 12 Dec 2023 13:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702415332;
	bh=iSx5Bj0y/FXR+lw0auLlt3k71asRFa7iA/EewgxT8Fc=;
	h=Date:From:To:Cc:Subject:From;
	b=TVVp7yxf5AFtipOXrrcW4dsF3pgZcdnaD0TXkQl5oHJEowjiWR93YmW9sa48ebUPP
	 1M2sUX/7OLUVBqOt3hwPZizAOq77n5Z+jmeSBcloEzDZMh5Fxf/6RQ5FIByZ42e1SH
	 z/KPVwc3B4f0SEU24HvocuK+e7BZaOKEwSl17ms0yLkwioxKQSTm+8bZOvlkFT7AhM
	 DsuT2CtJtNYMMGquB6WIiwRou/Y0hZ8BkGhNTrxNGEMmt4KO1UwX92WGiDwENb2ONW
	 AfOKQWXh/dgDOi7FTyyzRr288wf4WvjV2UvNygPb5TeeOhBQfjUgPB5Sxy9cca7Kbc
	 TKzhdR9Q4bdGg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqWSM6D30z4xM2;
	Wed, 13 Dec 2023 08:08:51 +1100 (AEDT)
Date: Wed, 13 Dec 2023 08:08:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the afs tree
Message-ID: <20231213080851.67322ec8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vkjR2Glp2AI4MsCX0N5KUaQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vkjR2Glp2AI4MsCX0N5KUaQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  12f24d02b2c1 ("afs: Add some more info to /proc/net/afs/servers")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/vkjR2Glp2AI4MsCX0N5KUaQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV4y+MACgkQAVBC80lX
0GxGvQf/bCDBHnNc0YmOiDh1NEsoqVKVX3zyoxs1+V6By54ldykg23tS4dTC52Ld
XYNwEL30gFKzfeQiAmbXU9TniLeL2YO3R43xQ1QlCNioA7PLX4bhHyS8MLzbUthS
BYM3epn1cmQXkGPenLf/OGfOIoGe7ATX03cQ/tAB7JixULyyADZAiYJN7wgG5rKM
DdWAhde/N2PApPmDn7ruteS8AgWwUflu31WwQNempoek5VSQGcON4TkJqwc1FzYn
U50UUK+oXDb8S9EmAFrc3aIzxl+zFj+qDU6XMB9JTnqXRD9tlgnPK5npIwd76xDy
jBXLkaleaDWy/kVg9qW9/h7/6nUQeA==
=ovP4
-----END PGP SIGNATURE-----

--Sig_/vkjR2Glp2AI4MsCX0N5KUaQ--

