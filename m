Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AED1E51CE
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 01:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgE0X37 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 May 2020 19:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0X37 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 May 2020 19:29:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088B3C08C5C1;
        Wed, 27 May 2020 16:29:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49XRrP2FbJz9sRY;
        Thu, 28 May 2020 09:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590622197;
        bh=LIoCRDHWCSt12oTlKU5hbRoSfau0dTS0ZIKctflBnws=;
        h=Date:From:To:Cc:Subject:From;
        b=hTgIxhi2tA1pYu50DOT3xrvRysd6K8TVBNZY3TkEIecX8O5+ZdvxGgSLSr41Pu2dx
         U+4Mwlx9VFREXMnPv6IzQQh2glXKTzrThqHM6LhZ1l8IFmNEPrhu+cg3vpeYACNCh9
         FOumSv1g2DybWm2m+jtHunJIW46/um9P5F4Z4uQJGCWQljkRFzzNIl77/eNOMUn9tC
         cYfv03m57keD692iTUfvAIqXg12ogb7lGw29t87uERh6kLZyvR7oIH3ICw0PCOTbcU
         /BhNGQMbh21/5Ap44+LTeuHHK3qNY1uiRlyCHCqJ/CuMhAlEbFS/JkBViP8D0LIDKt
         XyND4H1hsB6Mg==
Date:   Thu, 28 May 2020 09:29:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20200528092956.462e55e0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vzcan2ywOy/HGT4..iFz30D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vzcan2ywOy/HGT4..iFz30D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  31fba61da070 ("drm/amdgpu/pm: don't bail for in_suspend")

Fixes tag

  Fixes: f7c8d853b029df ("drm/amdgpu/pm: return an error during GPU reset o=
r suspend")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 2d0021bb7157 ("drm/amdgpu/pm: return an error during GPU reset or su=
spend")

--=20
Cheers,
Stephen Rothwell

--Sig_/vzcan2ywOy/HGT4..iFz30D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7O9/QACgkQAVBC80lX
0GyY/Qf/cjAOa6AwB3Gi1TkdJDRasCZ8TOMpWC/I+pcudBaaGRA176Dcf88EgO1z
/9tLhO5lvZ8uR4xA4HYznQD8VCGwaXMuwDE7N1/u6wT1uQzfF5omxsdsz4K+wvkC
QF29PW5bknNPMBd0GrZtknvk4LYaiFNb99JA0Z8qZ91yrewEt5M2jGkDStTQYqLI
bpukya2MYDlkObA1QRUMNdTXoZlnZckqSC+5CZqU45JVZMhC52JhEQi+VrXQqc6/
Iwuk2XjARt/c9/VpX8XghwS9kZLAZNi32he7W4jNvZ7d1s/xFGhZqkcmvFysNYym
udk5ouKqcXBs2gsE2idZ58ZofmoaHg==
=wMzD
-----END PGP SIGNATURE-----

--Sig_/vzcan2ywOy/HGT4..iFz30D--
