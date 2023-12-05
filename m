Return-Path: <linux-next+bounces-228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB8804889
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 05:26:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 911E2281391
	for <lists+linux-next@lfdr.de>; Tue,  5 Dec 2023 04:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46899CA62;
	Tue,  5 Dec 2023 04:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OMxM/pbv"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110D2FA;
	Mon,  4 Dec 2023 20:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701750382;
	bh=0xsDtfk0pwPkjTtoTAu262YPX33PM2BiPfKIHp76fhw=;
	h=Date:From:To:Cc:Subject:From;
	b=OMxM/pbvZupriYrl0f09ce1pcrXv8TNJQrAV0S+JVzKyw7hnZ+3wG4YqHf/e5bDuC
	 oFqfzVeQNIXyzja1VSlZOod+IISuN2B2MBOdZSCOowb9AN6xyYmUY3zh6uX90TgeHy
	 S3seiMa7Flv0I/7HiE9LGb8hGBukILqR23Wqu/ggtBzMJZ6KCOxrgjx0xUs11qo+i5
	 FDh+w+oHvUoQm5Zq6QuZhT1qGRhfH6hPLwIwK+7RClTDbUvbuFSUAwaSqLh1ofbZnf
	 BpTNy3i0dj5XMln7rlpcSSPVs5OAbifYYixQUvzU6g8CM28jPv+AQmHnaA5PRzUX7+
	 5E4s5vJvYPgiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SknXt3YPyz4wcH;
	Tue,  5 Dec 2023 15:26:21 +1100 (AEDT)
Date: Tue, 5 Dec 2023 15:26:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rockchip tree
Message-ID: <20231205152619.0ee82148@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iou3aoPFgBlr6t4PJm9i.8H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iou3aoPFgBlr6t4PJm9i.8H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ommits

  d892a562110e ("ARM: dts: rockchip: Enable GPU for XPI-3128")
  2cc98b5080f6 ("ARM: dts: rockchip: Add GPU node for RK3128")
  5e806176a3a5 ("ARM: dts: rockchip: Add power-controller for RK3128")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/iou3aoPFgBlr6t4PJm9i.8H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVupmsACgkQAVBC80lX
0GxBHwf/bB0R8qscmujATfTiyvIx/Byu5MLKEheZ+6DKiwhAHomkCWwP4bxxIQlI
9GI9zfpIPtHImkFuzYtvTiCO8BbPjnANtYf/IyHOvKBpR+2Oy6rzWpk9S2wctsnr
okbQ6266s8bF0ECiILo3KhagMZ0UPwMrxW3u/K7HPzm41syKGutCgsdMfOqQUt0h
y3bJnJa4JmZVSi1f48NuK3DISKE2oUcO10iLTT9/6jgbkb5l1obJS1Zr3S50Xp8B
915jBcJmAOJZQp96B9gwcjKAd1e521Aq6x8KEZzr1euwCDKZd21DEstVKjiiqaXV
/UYz8jw2yDM8lA/X6YT+bJx6nVo8vg==
=EufU
-----END PGP SIGNATURE-----

--Sig_/iou3aoPFgBlr6t4PJm9i.8H--

