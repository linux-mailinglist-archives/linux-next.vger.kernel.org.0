Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B7D2DA0F4
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502843AbgLNT47 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 14:56:59 -0500
Received: from ozlabs.org ([203.11.71.1]:44245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502833AbgLNT4w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 14:56:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvsZx6Gj2z9sSC;
        Tue, 15 Dec 2020 06:56:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607975770;
        bh=D225fojlVkyln/nCCwFPyr2X6g5KUEfhjfVCSa+PxA4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tMgXCn8fBQKVLDZcQFCPkQEsEtxMlYlXc21oST0T9ucfKGmra8m7syx+7Hg+ZnnO7
         P2E42AXUHLlaEToqrARsclfbckhiwzY+uMsc4suVXK40paLGMb88d88vfmjBLgvka8
         hVt9ZQONZHndJDcYcW3ZUxdtRD7b2bWzorxYmiu3kH6IFkP2Yj71wA9Tykz78NJJFE
         MFFVqj+vXI9QN4xEXoMOwGSlbL3+1D1gV0/hcXgZ5wpJ7GHMJN1r7C0V2kSUNEsywP
         oksHA1kw0b8C6COCPKm/SHvKKJYuU9kEsL2lvq4/VcIoCph33Xmmzj/RDvqhAgNfrt
         V6HnSYQ14nP4w==
Date:   Tue, 15 Dec 2020 06:56:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Wayne Lin <Wayne.Lin@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20201215065608.2dab9183@canb.auug.org.au>
In-Reply-To: <20201117154514.2c378d99@canb.auug.org.au>
References: <20201117154514.2c378d99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/veK_XLxH7h.ZUQE9kF+X01l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/veK_XLxH7h.ZUQE9kF+X01l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 17 Nov 2020 15:45:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function =
parameter or member 'crc_win_x_start_property' not described in 'amdgpu_dis=
play_manager'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function =
parameter or member 'crc_win_y_start_property' not described in 'amdgpu_dis=
play_manager'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function =
parameter or member 'crc_win_x_end_property' not described in 'amdgpu_displ=
ay_manager'
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Function =
parameter or member 'crc_win_y_end_property' not described in 'amdgpu_displ=
ay_manager'
>=20
> Introduced by commit
>=20
>   c920888c604d ("drm/amd/display: Expose new CRC window property")

I am still getting those warnings.  That commit is now in the drm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/veK_XLxH7h.ZUQE9kF+X01l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Xw1kACgkQAVBC80lX
0GwPkQf/avnvyoYbDk5fkyrrUKkVPZ4NglzRpnqRX17r4c6OcjzIqDZuOc8LW4zz
MIxIpBj0F79fbx9r+4kolZhGLWsgYmAxCdRPmpQ1JuyrmRC70pN2vyEEYtFTYRTs
5R+pGXZzJhT4Y8nTgnGqt8Ho1Pyvv977xBV8V0Om5lpEfvdtFzQf5CB9lt/OnPDR
wHh4cbuSbuUzm+TKUpmli7dg03r50xn1po/ugwgMfdx91BQtM6fI53hgwYMhIcPP
QEvCVE+vHxQmGgPdm/jJeRK31ymCjb+lqYJIvY2Sd4LL46HdfhOD/MX6cxRJbF/1
k7r/RiYEykhqZB1f2HmCyWPB9Kva7g==
=6c/m
-----END PGP SIGNATURE-----

--Sig_/veK_XLxH7h.ZUQE9kF+X01l--
