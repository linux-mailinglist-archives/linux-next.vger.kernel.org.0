Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B0D446C0E
	for <lists+linux-next@lfdr.de>; Sat,  6 Nov 2021 03:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbhKFCgA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Nov 2021 22:36:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41069 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhKFCf7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Nov 2021 22:35:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HmLyg0C8rz4xdP;
        Sat,  6 Nov 2021 13:33:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636165998;
        bh=lNwfFDfi+cW2f5II4TY7fSXciVYL2Y/RkZE0XKE+6dg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YncAUBuh4FxIacRfDkFGVsVPGb0hqDzWK5kbWrTxOOD0xsTjRVabTwLAhcrzd4oPB
         pCw1y/xzvOMqHBXfpm+2hqv71Y/3oaZZeC8mffsmT7+XBBc4qSmiI1Do84uwcSLC3M
         MgfDEZmyl78NS7kPdqYRLAxOGBJAsButOHSrMywQTFPFDRZKJNKFoyWkB64iStnFlS
         9TVVzKVUQymEfnCC3+7Hs2uxQ9+y4yAEpaXNTuNcm3WjLbFThmVz1xjwOnBv2NKHUc
         /u99x/BjQDiODkWbIg4K0a0ZxMZmoayxkr4m/KtHMZhGJc/xsKoNNwax897a6kRj1T
         Tw1m03ciBWCpQ==
Date:   Sat, 6 Nov 2021 13:33:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211106133314.42e3e308@canb.auug.org.au>
In-Reply-To: <874k8qampc.fsf@intel.com>
References: <20211015202648.258445ef@canb.auug.org.au>
        <20211101194223.749197c5@canb.auug.org.au>
        <20211105171517.287de894@canb.auug.org.au>
        <874k8qampc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bGM7tivz60/e3E/Y2e3LMTm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bGM7tivz60/e3E/Y2e3LMTm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, 05 Nov 2021 13:03:43 +0200 Jani Nikula <jani.nikula@intel.com> wrot=
e:
>
> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
> __stack_depot_* name conflict") to drm-misc-next-fixes.

Please do so as builds will start failing otherwise :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/bGM7tivz60/e3E/Y2e3LMTm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGF6WoACgkQAVBC80lX
0GwVZggAh6PkcNMcaVnFW79ZbDy59Idmp4qw5FehvnY6mLlZogpBIULjjxCnubwt
B7FnBfZtmXYDQR77gFRRBpTVRzDTV5Bh7mJwTcmqNH/GM9ewjJRzHVCf1zrjyPEQ
n2H5Y3jfUYT7WmLJEuHoDpEGPkjNZ0i0KPF9t1paW8KMV5dCW7jKBHbArLQ/IOiv
u2FgsIZmHKUuXoM1KglbBg4gF6KWDJYC8M2KzDHAsRqVO+vdQgqUz3g493IFZgZQ
NnLCbJSnoPkBwdobGDESjjOJYJVWY85kUDNle3z/j6T/YqXEQ+vTNwuvLjK7sdsV
IkRiy7P1dyrLQDa0wA6UBiG024lZPQ==
=GHRg
-----END PGP SIGNATURE-----

--Sig_/bGM7tivz60/e3E/Y2e3LMTm--
