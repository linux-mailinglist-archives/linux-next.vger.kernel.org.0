Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923D43E5A76
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 14:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240921AbhHJMx5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 08:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238995AbhHJMx4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 08:53:56 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B062C0613D3;
        Tue, 10 Aug 2021 05:53:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkXtx4Nw9z9sRR;
        Tue, 10 Aug 2021 22:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628600011;
        bh=Lz+/UX5WL+HZTcdv8Pr14jFjbXn4bwkIvTd9yVyuaqo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Z3X3GOsACpnzu+bN0ztSnLAKNmbIA1C36i+pfpDMAjlUmW2SoibyMuWVs2zLvU4lN
         j2gKTg2h6kuCecd0os4G4lB47rwuWqkdV84dvHOMdSVHUvAxUrJULVr8MclIF/BMVL
         aDKXWcZd1zzB4IvpCwM5hPF2tyaLqXKVlyBA503zyyqfBZ2j+SPq/c4+tEfBJQDKbz
         kqk7E8u3pcgvnJfVsX1l/hI30KhAS0NFZ9rYZSDVcj1Et3+t+WHrSXO1MSBfad9fBZ
         YuLxKgoFYK+k0JAIIDzDrLjTWw3+/pHlRz1F502Isz87secBDo0aR2+04NVBihA2tU
         uBWB/zCPj9RTA==
Date:   Tue, 10 Aug 2021 22:53:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Chengming Gui <Jack.Gui@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-fixes
 tree
Message-ID: <20210810225327.19cabbf1@canb.auug.org.au>
In-Reply-To: <CAMuHMdXNAe3_TK-YWDwxjQ1uRMb0zLSSgx7w7FYCXvRmxG3pAQ@mail.gmail.com>
References: <20210806120417.49878-1-broonie@kernel.org>
        <CAMuHMdXNAe3_TK-YWDwxjQ1uRMb0zLSSgx7w7FYCXvRmxG3pAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/APvPHLzbU6PwWJ9UKay6TmO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/APvPHLzbU6PwWJ9UKay6TmO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, 10 Aug 2021 13:56:12 +0200 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> On Fri, Aug 6, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:
> > Today's linux-next merge of the drm tree got a conflict in:
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >
> > between commit:
> >
> >   e00f543d3596 ("drm/amdgpu: add DID for beige goby")
> >
> > from the drm-fixes tree and commit:
> >
> >   a8f706966b92 ("drm/amdgpu: add pci device id for cyan_skillfish")
> >
> > from the drm tree.
> >
> >
> > diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 5ed8381ae0f5,d637b0536f84..000000000000
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@@ -1213,13 -1212,9 +1212,16 @@@ static const struct pci_device_id pci=
id
> >         {0x1002, 0x740F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|A=
MD_EXP_HW_SUPPORT},
> >         {0x1002, 0x7410, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|A=
MD_EXP_HW_SUPPORT},
> >
> >  +      /* BEIGE_GOBY */
> >  +      {0x1002, 0x7420, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
> >  +      {0x1002, 0x7421, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
> >  +      {0x1002, 0x7422, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
> >  +      {0x1002, 0x7423, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
> >  +      {0x1002, 0x743F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
> >  +
> > +       /* CYAN_SKILLFISH */
> > +       {0x1002, 0x13FE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_CYAN_SKILLF=
ISH|AMD_IS_APU},
> > +
> >         {0, 0, 0}
> >   }; =20
>=20
> next-20210806 and later have a different resolution, duplicating the
> BEIGE_GOBY entries before and after the CYAN_SKILLFISH entry.

That's because commit e00f543d3596 (which is now in Linus' tree) has
been copied (as a separate commit) into the amdgpu tree (where the
CYAN_SKILLFISH change is present, with the BEIGE_GOBY change after
that).

I have dropped the current rerere resolution and will redo the
resolution tomorrow.
--=20
Cheers,
Stephen Rothwell

--Sig_/APvPHLzbU6PwWJ9UKay6TmO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESdscACgkQAVBC80lX
0GxBpwf9FWU/lpCEK5ENy0KNiqr5k4OpaG2Bmza5Oqs+lezdKD8cXulO7xyHQQf2
kR5jR7S9a4bZCQEBEfIngBMgXGXdVDg3SrlXnsY/slALXs7nFC97bDitdn52Vx1a
vNmjomxB8n0O5FCC2OpWJgNsMbLkoyKMemJ5zsQhA5sfpVLLNRcX6t5CVNVfzGCn
r8pb+qJyzuF7zZZbVdC54GXQEDlx/DcGcqmAMEL+KpfMun97DQJOrcI2ju3pBxbz
/zDCaajFEQf+u4Hf6vLa6Wyv/m+wdMYBo7Xy/W/gVHbeSI/737q39bGVifb/T7Qi
29/r3go6idcwR87Qg+JpbMAiouN0jQ==
=jLVG
-----END PGP SIGNATURE-----

--Sig_/APvPHLzbU6PwWJ9UKay6TmO--
