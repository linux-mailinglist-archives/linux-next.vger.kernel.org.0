Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E772DA670
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 03:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgLOCuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 21:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgLOCuD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 21:50:03 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1364CC061793;
        Mon, 14 Dec 2020 18:49:23 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cw2lh6R39z9s1l;
        Tue, 15 Dec 2020 13:49:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608000561;
        bh=8I3FxLXQ7qhVBbHNjn9cG+EGcaN4bW11ziSg4iW5eoI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c8sqEosK2ygrrDFs+uXr/DpnDGeUC3IPwk0e1OSz+97OrpXMYF4e6+2TEAqL8i4gq
         E4FeJ5uNieZBGTyFGAc6ufSpkWwqwM5+UJldUKdVbZOULmFR6yT1mWoh5NSUwEEPu3
         HhSGxaVb3/JHh5iIhlOJwOJDbtvviKNuLNjtlLNmBZDhZWPcgL/6wZ4ZAhH72ttDwb
         HjG6MDHrOwtZz5bp6hRmDX3DdCY9hmWwU2BWwFmYz2yTwns75TA2hgmtayZhzpOKOp
         fk9y4O+qvazgUQDPeknP01nku/yGjkibSGuXec0P+K9/W35ZoJWQZe9ze28+q4tRgY
         YLto6Cuj2ZmtA==
Date:   Tue, 15 Dec 2020 13:49:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Wayne Lin <Wayne.Lin@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20201215134919.3ac58796@canb.auug.org.au>
In-Reply-To: <20201215065608.2dab9183@canb.auug.org.au>
References: <20201117154514.2c378d99@canb.auug.org.au>
        <20201215065608.2dab9183@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c9im4qTPru9hrr7zn_VNE7g";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c9im4qTPru9hrr7zn_VNE7g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Dec 2020 06:56:08 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 17 Nov 2020 15:45:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Functio=
n parameter or member 'crc_win_x_start_property' not described in 'amdgpu_d=
isplay_manager'
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Functio=
n parameter or member 'crc_win_y_start_property' not described in 'amdgpu_d=
isplay_manager'
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Functio=
n parameter or member 'crc_win_x_end_property' not described in 'amdgpu_dis=
play_manager'
> > drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:353: warning: Functio=
n parameter or member 'crc_win_y_end_property' not described in 'amdgpu_dis=
play_manager'
> >=20
> > Introduced by commit
> >=20
> >   c920888c604d ("drm/amd/display: Expose new CRC window property") =20
>=20
> I am still getting those warnings.  That commit is now in the drm tree.

These warnings are now from Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/c9im4qTPru9hrr7zn_VNE7g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YJDAACgkQAVBC80lX
0GzqfQf/V+cejH0YOfBpCPjUFbZSFTyGj4Hd7ZdJv3QPuI1J5ELRBKZCGY+/cnQR
qh+1WPHhACKlYYDKs9k2olkzSnGxJubQbkmPyLxQdyo7ZtEShgTVPYxoxA/FLxOp
TGvy5FSJ9La7gynOhnur28gP+750wqcFi4Fjes3+3Hrt4Np9pvaItI0fKDCCsKM5
jL40IuMpU8Ved8u+VqlnfAUzsPfTSoE74CYQEvgzq8TKXDhPdsoOk+11HPux4gTQ
93LNsh5kB/paV2uXzMYLUKhgaN4QlikZTJ6MAOgT4JNOyKythTLQ7OCyro5edzSR
JPy1LOlcbafKJ2FvyvjFPb7UIFDWSw==
=YyMf
-----END PGP SIGNATURE-----

--Sig_/c9im4qTPru9hrr7zn_VNE7g--
