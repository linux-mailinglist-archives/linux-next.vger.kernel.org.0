Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86260428451
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 02:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232813AbhJKAkA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 Oct 2021 20:40:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44453 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhJKAj7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 10 Oct 2021 20:39:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSKdd4pmJz4xb9;
        Mon, 11 Oct 2021 11:37:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633912679;
        bh=Ax1GJIXnCtIn0NUDYilG5pwOdgBFXtOsdMYg8/AgB6g=;
        h=Date:From:To:Cc:Subject:From;
        b=jVs6WrPVvJ/IaNBbsDEBDvMOdEwsInrHiQXLjVUAK+70ERxRKtIJF2a8fF7X+178m
         K/J2/w13i5qwm5JT3QP9HkR5U/v6qqc0LqScOYL3glguaG5xsijF866MDHE0cO8cR5
         tkr5oNE7ZBLIz16CP3F/CwPuIE6/X8GzrnqRNklvntD0Zs6wKcxclsnOIHgFltOF9i
         FiC2TavL9c4W+dCz5vTSsUvrF0MwMsedEx4K8Xz7pKCpFPxW9f16GvhPNIKc/3vMUH
         QzRzqrEKWDNc2kbnL1cNTI3kxIUahOrP4ZojEQK8CnNWN5l046X0uP3wMDemCVnBzd
         f3l29kYgxOBhw==
Date:   Mon, 11 Oct 2021 11:37:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Jude Shih <shenshih@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20211011113755.7a0597af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HOhXqr_tUBv5nIVqn1p28Y5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HOhXqr_tUBv5nIVqn1p28Y5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/include/dal_asic_id.h

between commit:

  7ab0965079bb ("drm/amd/display: USB4 bring up set correct address")

from Linus' tree and commit:

  13900e6fde3f ("drm/amd/display: Fix for null pointer access for ddc pin a=
nd aux engine.")

from the drm tree.

I fixed it up (I used the former) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/HOhXqr_tUBv5nIVqn1p28Y5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFjh2MACgkQAVBC80lX
0Gy3/gf9EhTj4llOseoDDJw9Ky2BbHLscqr+d3jCLVp/0A287YlSFrvcsX+9fgw4
QGoLlP2jUqy6krXH2OnYRx8KAEuDhmGe+iqRYeSGIwHteUbUPlzqMD7IMPegxhRh
RO5h4G+FrQVljzzBLhDUL2sonHaTexAoS/GANJj7vdc1bkK/IwT7yTcrvmytspb3
5mVXqyMbtfxUFGaLFsHX/NrlbpwxDxuQLS2DItA9PHkAxG42pcpavwEfswq0DWH4
5sNRKkyKyPeaTJj5ar31/qrIe5ZA6e0VSlXgyEypDsllznRpgeIAQQYLwQRpFhSH
91/w9fLfL0F0TN9a+woSIPkzwBbo6w==
=gR3t
-----END PGP SIGNATURE-----

--Sig_/HOhXqr_tUBv5nIVqn1p28Y5--
