Return-Path: <linux-next+bounces-9530-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B363CF1A7F
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 03:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E47BB301510E
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 02:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E20831B117;
	Mon,  5 Jan 2026 02:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m+v0XQJV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6831B133;
	Mon,  5 Jan 2026 02:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767580742; cv=none; b=s/F+h4LuDBknCDan8hgytcHcghXRmKW7hBJ6etROxdfU04afHo1x7caBpZxNNPxAc91IEyLSMiTZPX6Om8lIR4ZYNa2PG0QcnPQ2s04W7TGjLmmKNdxubPGMs9K+Yizrx33ClAUp+GD+vfbgT5d6m5OR+g+NtL3LX70mdhmK4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767580742; c=relaxed/simple;
	bh=kLMAqaX258C46AQmIpIh9JcAF1ndbyKjnSv5/5KFkNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iHw22o52Y6HcPBimzliL4gVghkfi0xgg6bv/iAIDp/72VZGPq/rF9SFuctReRKz5CiCONlAEvGalhHKTZF55I6HSfF2PyXLdOpyeaE5eN+WCaTvIre1JYe5gPfI5Cf3Ax5ZefplFGyorpMpbU1Rw7kxUCx5DepaPA7UD2nXhCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m+v0XQJV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767580737;
	bh=4b0Qgsdj6PhUN0Eh709p9p2/uj4wKui/kg8oHBw+irg=;
	h=Date:From:To:Cc:Subject:From;
	b=m+v0XQJVAyeC9/VxY9ayErwLMJVzyVbH3bTz1BBgh/NhnZLmYCOHfJunxQ8oQgKBm
	 fSrFQvNt9ZCqhUUL4O296zzn71Q8uCPbCLswFGDn4WZiDHjU61OzL/I283yArdXNZg
	 Jcda4zlus1ZIvEXn24wud6BzxNMhYEtWBH7pf61PbAsilx/z2clcBly/UEDLvb7adV
	 XBOuj8oUFbTprVwiVBYEBaDyYX56Ta8XcV5zxllLtHQUrDjopEKffHoWVbJQoUF2lq
	 j+cgOxqGj6eszfP1gdKNVWP/OLy85SPlqKeiSdYDxwH4j5HOjyde/TkR5hmWv3VH9F
	 BoW54DE1W/D/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkz5C0RHdz4wDk;
	Mon, 05 Jan 2026 13:38:55 +1100 (AEDT)
Date: Mon, 5 Jan 2026 13:38:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the renesas tree
Message-ID: <20260105133854.166d32b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QfunTAlH9ukuF_tR1wxVpcJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QfunTAlH9ukuF_tR1wxVpcJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/boot/dts/renesas/r9a09g077.dtsi

between commit:

  2d8568dddc7b ("arm64: dts: renesas: r9a09g077: Add ICU support")

from the renesas tree and commit:

  9b1138aef9a2 ("arm64: dts: renesas: r9a09g077: Add ICU support")

from the tip tree.

I fixed it up (I arbitrarily used the former version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/QfunTAlH9ukuF_tR1wxVpcJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbJD4ACgkQAVBC80lX
0GyO8Af/UlyaJkhJEqKtYNiMMkGWLRW+m8N9sDWed0KvT5kc2hd3Mp7QsYXTfCAJ
gNwbJu8DomGJAh3EJSlt+koXJootQuJIdgeV9Emmw0M8tS0PQ/GXMVpvftZA/6gA
kheZ0xHTVzeXSlYfEaz3FBg+PL7wIQxoKvDQc37d6kqdMvsxZh+WD6RXHOcxO5xE
EK5CRrDx2lX/be7OUZ2l8H7czasBE0fjSXBJEGF9BasL7gQNzvBCzItX21xoNUTT
NXhGa6BYZ0tdDnu9mYPfLplU1rkptdvyyWLSIR1eFgkUmpEJx8XlSECDUjsajaVQ
oXmkUWtTNULbjWR4hNt/zlUSB+GdNQ==
=fgfM
-----END PGP SIGNATURE-----

--Sig_/QfunTAlH9ukuF_tR1wxVpcJ--

