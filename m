Return-Path: <linux-next+bounces-343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F080DFCD
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 01:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94F981C2147E
	for <lists+linux-next@lfdr.de>; Tue, 12 Dec 2023 00:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC4F15B7;
	Tue, 12 Dec 2023 00:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GOT9eiSC"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE461D6;
	Mon, 11 Dec 2023 16:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1702339457;
	bh=UYeug0TkALRuKsXEvg5RGABft1sb5wpjMQeuFth69n8=;
	h=Date:From:To:Cc:Subject:From;
	b=GOT9eiSCgrH41VXo+nidTNDvBzNW6VEzDgCuEpoQdRXEWrhY42B+Pd4Hmvw9W6Gc9
	 Ws6BQFV0g/MPU7LhWbi2g2QsKJ8vjxaOwSW538Ac42IpH2M5tAuK1vKarrzY2JXBZH
	 MvKp4Gx72Z1j9GxwPmye8/lEQqGhuQF0qRIl25+UUQkCwVwqEKb67RiJAGnkCADOcO
	 DMJxm8JmUERHklEi1u90oGeHnxgwmj+zzu2az90PZ7I/0vVEvZ9tTZGXnoRlF00qPH
	 mTF7tJ1hyopy5ixG0WO3Dh3PvqF1aWV87Yypuh5qtHMTkEDePNRU9JxhTA2gmKBBmf
	 ln/ugliQcUWDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SpzPF0W2Bz4xGl;
	Tue, 12 Dec 2023 11:04:17 +1100 (AEDT)
Date: Tue, 12 Dec 2023 11:04:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20231212110415.6f849fb4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d51_/xTNjGL=+PDFCQ_=FRm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d51_/xTNjGL=+PDFCQ_=FRm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpu/drm/drm_atomic_uapi.c:366:1: warning: 'drm_atomic_replace_prope=
rty_blob_from_id' defined but not used [-Wunused-function]
  366 | drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  1d2b049e4582 ("drm/drm_property: make replace_property_blob_from_id a DRM=
 helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/d51_/xTNjGL=+PDFCQ_=FRm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmV3o4AACgkQAVBC80lX
0GxXfAf9ErV1nhD9ueslUkYTMwByvQzvkSLhEkIUg/H37C0BN66pF84JuqAZQ93Q
6NsWX/tyA+mFC9u8k9xgvMnpb0YyFiEyRp2Tk2LGqYtNP/cdemU0TqnXwJJDq3Y+
IZcwKuYl3SAqMFfzuQ127+CmErOteCLZUl0izsPCZ2j5k+XwruMbqLEjkBpiM5DA
a2At2C18xGIGZUDJlPRI99jycRLa752P6DuXU0SnPbDAz+UhymIOG015B4YkzVg7
NcSmoSL1h/3qPKUs535ZEbArlf9AMZmFZBvWGm24hGK9rkhNNumqxzsZIMECi8fX
/x6iPdgmVwnN6aQ/eM7DgnKXN+fa4Q==
=Vudi
-----END PGP SIGNATURE-----

--Sig_/d51_/xTNjGL=+PDFCQ_=FRm--

