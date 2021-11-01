Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB5B4415F3
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 10:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhKAJUa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 05:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhKAJUa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Nov 2021 05:20:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA59C061714;
        Mon,  1 Nov 2021 02:17:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjS9v4w2Pz4xbM;
        Mon,  1 Nov 2021 20:17:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635758276;
        bh=3PZGj0sci0bcIw2HkwJH0u3E+keMCC3880sW+RDPpLA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Sz8NDmRJfupih7wwXJd+Z+oIWl/sTJIaYi4SfEV/BOmIogtNZiLSOL0OSX/cfTk4A
         LcUra4B1MNgSrhpstI9NTJ074f+vZ5MN49AzZEIgZ5N/IK6nPq9fmBZareLVWZe888
         i/lctwsHkNXVLVQSSQb0Pt6u2QojcRa1ucVykkpsOGvPJztdKS198eFFz7X+suQ0f5
         grkcAPcNq3jvKtDMfecwfbb1y9FwlCBK8Fi2cec4GRUNv9CfPx3uKqMjsRxT0f8IlF
         tzXMJAsJpoGipTQ9l5xgOIzjs9rBxUh176JQcM1mGhGHhbEhh3ZzpPmyGuGFwVa4ZK
         Y3gIANeGopJ+w==
Date:   Mon, 1 Nov 2021 20:17:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211101201754.53c6c148@canb.auug.org.au>
In-Reply-To: <20211005185940.382720e7@canb.auug.org.au>
References: <20211005185940.382720e7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pPtQHmT5cGItirLOVele=Cw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pPtQHmT5cGItirLOVele=Cw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, 5 Oct 2021 18:59:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_in=
' not described in 'dma_buf'
> include/linux/dma-buf.h:456: warning: Function parameter or member 'cb_ou=
t' not described in 'dma_buf'
>=20
> Introduced by commit
>=20
>   6b51b02a3a0a ("dma-buf: fix and rework dma_buf_poll v7")

This is back again as well :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/pPtQHmT5cGItirLOVele=Cw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/sMIACgkQAVBC80lX
0GzqjAgAoHMxsBNaMEZw8e0gYsvplWSyRZUsYI9du1Og34jxHCucN+9CRgFHjflb
sBjS5ZJzVSGYeT+igTiHoq3m/kHtJP2IcxuRPDaUQCT/SVGowUwCLgL8nZAbWunc
rlB922IvJU14KTCQ8CFhptddX4LE9RwP2mHoHlmd8E6QnZBvR1Im2qWBgCtb4lWr
YdljQP8dYl/Uw1Kj/XexiLEhVX92yakc/tZuqiC4Fyy07k1IbPehqn4LG7jxfgBY
FieVWxLHqyPtpcVwWZUPhqCpxYJ6VXZJZ021HYGIr05bYfSZFrRGtZCqBATQBB2X
/Mzeq3fVoPI3L6NBsUqX/BQCEjh+qQ==
=wLoe
-----END PGP SIGNATURE-----

--Sig_/pPtQHmT5cGItirLOVele=Cw--
