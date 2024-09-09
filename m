Return-Path: <linux-next+bounces-3715-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D99B9724DE
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 00:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3182843CB
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 22:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC5617C7AF;
	Mon,  9 Sep 2024 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nzGDgDG8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA8189BB3;
	Mon,  9 Sep 2024 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919277; cv=none; b=B+dj+QKTXPti8VD29oPz2bTn1aoGu9MIv03R+PpcPU47L1r175EbYJaAwJA2CJK5SMF8vSxkjrk5alMdAHDxnebR/2VrwnyLo6FptKlNZRliTHi2nZc4Mr2Sjd5faCCZRuqmW2SZODwY4PQT8IKDduN7g5TA6i5MhRycHhjc1xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919277; c=relaxed/simple;
	bh=AnjIpg0d0cZ5femIBnGfwN7xXRAnxaaaeCPxMpFBJxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OCf5SEfSewqni/lNk4lyNcQXUbfan9Q/r3WSzHTEup6kiERleSpUlwKlHHc/uIJQmnW4lyOUtWV0t+hZ51SXKUdNu/PaOnbKnCVnZn+pO/8yjgqRkxGEMxgKZfJd8Ccf+aoJotAzUC+2CBQfz+85I4S15JPrs3yrtc4+J8m48cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nzGDgDG8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725919265;
	bh=F7JSY3pWD7hbRDrROI+JG6dACgxf2qZTT56GjDeTXag=;
	h=Date:From:To:Cc:Subject:From;
	b=nzGDgDG83pHBBS+lSm0TkbP7PGEwmyfc0usOsHgj4jBtAD5L50ef36+tV9heEb6BY
	 gZXS7xTlv9u2V07tg/YD4bOTMEENvg2ukMK5W0QhnFhgq2W3ElgabINGG6e61cMgUb
	 W1OKiE/dGecysXaaV3eN9z5TptBUHm8PXHg/e9NddyZAnVbtN05Xd5PVXnATx5at+f
	 /kXrJ9FgYmJ0iBLxbq6VmKvgiKGxwteAS5RlaQpIwwD3JhJpCHTKKCy5yWgar0vJSW
	 hISM8Qxyqi32hc7/MHmLU1LfXZfPEs5E4cwBvdWmUVydH2ggXFXOuAyWeYB0hwGsIs
	 oK04mVFMGZ+Og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2gl54Cv6z4x89;
	Tue, 10 Sep 2024 08:01:05 +1000 (AEST)
Date: Tue, 10 Sep 2024 08:01:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20240910080104.3ab96fd3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RHeH8ALvhTK96Cj_EOBAMWU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RHeH8ALvhTK96Cj_EOBAMWU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  361753bd1195 ("bcachefs: improve "no device to read from" message")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/RHeH8ALvhTK96Cj_EOBAMWU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfcCAACgkQAVBC80lX
0Gxwgwf/WXnKHEpuSiFj9fzaYPWpshqsvMmPo8vnhxTjNFbv2CDEFBVZ3H0iG1FE
E7xTzp9cjCnoQWu+axLjFc/WJPQF4zoahU+3kk5IUe0b5okBN/0JfF4PesNvGJha
WtZTSp83HZbRq986XrhUzM/5xKYV6SBS4AWhbbqlXpEGfmVxyUY+52WPFCusRuiU
v3xQPOhVQgpihZJbi+SDyPZv/7qV02GQG2yEHtSEx4xfGAp+uCsiGjLSYejA414p
tFtmk6RbAxx7QaTt081AE+sXu9K9vTMbMydsDROeNsy4uLubmvLJDgjea6PaEgIy
m/9Tj3XLc7ZJVYhZvq5gF8VeYrzxjQ==
=Z70G
-----END PGP SIGNATURE-----

--Sig_/RHeH8ALvhTK96Cj_EOBAMWU--

