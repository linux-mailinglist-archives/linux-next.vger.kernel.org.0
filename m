Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D10D2FAA5D
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 20:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437502AbhARTj4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 14:39:56 -0500
Received: from ozlabs.org ([203.11.71.1]:55975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437494AbhARTjx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 14:39:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DKMY95yLsz9sWD;
        Tue, 19 Jan 2021 06:39:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610998750;
        bh=w+30ilWyMGcokES4mdYzzmdzBX7bjH3Oua+Cbj2Xdv0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g0xYd+lOPU1S/rhHqFtNeji9MGdy51QEAvqyRILIDcwex6iZ9emP2E13JGsMhCTZO
         Uof5iPztaKAzSFXCBwEwJBcL7hhZ6kmBrxUEvrCbxX/MNtSuZPufkec+zL2L/u2VWA
         /AHWE/pCrFqiO40VYArS0z2IaIgoVx4D2ShPyIgfRMPtM+oARyij6WiiKUaNgKqXAf
         4dt2Yd8ux1uUe0CEycc7UDfdv+jbawwyEsEovVG/DvjsEvyNWilY6rf1QdsW1X14iA
         hKdLpPqXt7w0kVDXXYfqJ+0uwJ/ZhOt5me8M+JjWGZJzMI7crbbt3eJap9qjgFFwh+
         +yjPk9IokBZ6A==
Date:   Tue, 19 Jan 2021 06:39:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86-fixes
 tree
Message-ID: <20210119063909.3dd6f6a5@canb.auug.org.au>
In-Reply-To: <20210119062758.75f9f8bf@canb.auug.org.au>
References: <20210119062758.75f9f8bf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NbVqk61jNcSVenIRdnDZpB1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NbVqk61jNcSVenIRdnDZpB1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 Jan 2021 06:27:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   99d53ba0d0d9 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_U=
NKNOWN_COMMAND errors")
>=20
> Fixes tag
>=20
>   Fixes: 81c93798ef3e ("platform/x86: hp-wmi: add support for thermal pol=
icy
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes

This is also commit

  b96705325421 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNK=
NOWN_COMMAND errors")

in the drivers-x86 tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/NbVqk61jNcSVenIRdnDZpB1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAF490ACgkQAVBC80lX
0Gwx0gf/SnnY6gEKdZK7IWTcQBZKt+mSPiGX2mqv04OoyUTf0+lDMpxIOebDPbyS
F5sHUn0E1AFkberR1p/wKI8jgxe+RqJKjxCKRbd/F6o4hL6vOtDgJeSyw8wgMEcP
hMiULC+nGCnoK+6EEtIX5qvYKfuH/5xiRahpnge8Cf1hR9AFp8eCEe+tdOPCkdeF
tl6Hwx27VYSLk0VfKLwpXriNFgEKmu6ZN1KW5z+9iYhHFRvjXBmtw5MuDoHbMCd7
iRnvr2kG2Z6UmFnX78xnSwS6N9MGZfy+E67HUthgor3ogd9RyRfLV4/1CEuqgB4S
1MKdIlpjskqFMQUvrDMZYz38yIG9Ig==
=U0Bi
-----END PGP SIGNATURE-----

--Sig_/NbVqk61jNcSVenIRdnDZpB1--
