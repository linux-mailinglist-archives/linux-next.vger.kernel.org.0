Return-Path: <linux-next+bounces-94-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF777FAD2B
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 23:14:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 505D91C20BBF
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 22:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36043487BB;
	Mon, 27 Nov 2023 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kUyuZ8iP"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4241FD0;
	Mon, 27 Nov 2023 14:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701123233;
	bh=tGnYwQcptrSZBJuctW7ZXlb98GcAKMT1kKOsCwBNdF0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kUyuZ8iPo4wMk4ZQONkXIKfnLpiJSdY5Sz30klGBELHgD6w//Cp9yhy5aZMhYhJwY
	 8atQFqWCc+U/QZVnqCHtvAujP3E2a6gzXd5uvjfxbK908lXjYIsJjaR4qnuY/BObxs
	 0kuRggBVGb8dgptRLaVFBWy/tAoqVvW5jDTTzxAthrX7g/mcQXgHb4AHuChLGb8jf3
	 YtX0/x8T6TnloNBPfb6rSWm5d+KMlrE1ZbBoSeSXOUF2Um41hihGLyg1hRS5bZ33GI
	 SdHPimo1bDxNXEVFXhWLzn2nUzNT0LuiRKGgejHHiuJtxohvThv9uahK6tM+4mWFAw
	 VI2uHtEq+xNQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SfKcJ4GFxz4x1p;
	Tue, 28 Nov 2023 09:13:52 +1100 (AEDT)
Date: Tue, 28 Nov 2023 09:13:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: "Aithal, Srikanth" <sraithal@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kspp-gustavo tree
Message-ID: <20231128091351.2bfb38dd@canb.auug.org.au>
In-Reply-To: <813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
References: <20231122144814.649823ac@canb.auug.org.au>
	<813f3aa2-3449-7264-fa54-eaafd9981add@amd.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TMd+Hj.aWPsUW8cxUbz38/0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TMd+Hj.aWPsUW8cxUbz38/0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gustavo,

On Wed, 22 Nov 2023 10:21:27 +0530 "Aithal, Srikanth" <sraithal@amd.com> wr=
ote:
>
> @Gustavo I see you have mentioned it as gcc issue. I was not hitting this=
 until yesterdays linux-next build. I am on latest gcc which RHEL 9.x provi=
des,
> gcc --version
> gcc (GCC) 11.4.1 20230605 (Red Hat 11.4.1-2)

Given that gcc 11 is a provided compiler on RHEL 9, can you not add
-Wstringop-overflow for that compiler, please.

--=20
Cheers,
Stephen Rothwell

--Sig_/TMd+Hj.aWPsUW8cxUbz38/0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVlFJ8ACgkQAVBC80lX
0GyAuwf/Z2vFUg77JRB4zuHgYjAOcnIpPcivXNVwtM9u18+pRUVpQCFyW1K5dL5Y
xsASgAnbwyT7CqNwOd8unCHaPQIgknaYsJC2OrvW8vWEujlRg2rLymqEJPFop2F9
Xpal2y9xj1/tQJcwuYUGdbz/hsBKRXOzIMsDDSVf9IwI7mv3UXVIn+XjOTmnB046
+SSgAiw06DYIH8HUSXJNhZVoxiAh4PgWRHn8UHa0VFRQTfhqOiAHEEDLnZfk6/Zz
eLfzSAuxJLr8WvJKfTQb4db0BaQ4MdbVYMpXbh0L3YhWtgOz9fczYw3KTn/3SbFt
TadE2e8oq4zCPsIp5X2GWSrYyvVQhw==
=OAdW
-----END PGP SIGNATURE-----

--Sig_/TMd+Hj.aWPsUW8cxUbz38/0--

