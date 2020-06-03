Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1C231ED84A
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 00:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFCWBt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 18:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgFCWBs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 18:01:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A17C08C5C0;
        Wed,  3 Jun 2020 15:01:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cjYQ5x93z9sSJ;
        Thu,  4 Jun 2020 08:01:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591221707;
        bh=iwpqfiMGr37dLvcr3M7VNBtDautVKQ5f7NSqlAtZjKM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p/NlZ884MCoMZ9jq9I4Xz9gA2Mg4WQ/Azz1rk/80+BGAn0J8FC40mb56vMhD+qg/3
         POS2MfD71jeAm/Tw4xjRlsMb/Z+t2dx/B5hzKfLRNYVRXcAuUIlHU8XZfvXO+yszy9
         DTBfgZ5KGb+qwWrK0SN+Yekb/9HqJ/93TDCEjn1HG0mcnRlf3AHS1+LuJWUWfnBEaM
         kaVDwdknc80NALiojZceB7J7C7V0LMjpdq+0HBbRQR+VHCodJpLxD+WBOZquRArV/D
         khOV6jtpQMJYboMhRTr8mL1vdHtdl+U63+7UJ/TsYTtEw21GujrIqs9NBSMV+QW9uY
         Ak5wOzknvlvVg==
Date:   Thu, 4 Jun 2020 08:01:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the amdgpu
 tree
Message-ID: <20200604080146.15ec455d@canb.auug.org.au>
In-Reply-To: <CADnq5_P0SCBUE=zmg0Bezp=6C7x32-T4DW0+iSsJmrYtaB=sJg@mail.gmail.com>
References: <20200604073544.1ef1e38a@canb.auug.org.au>
        <CADnq5_P0SCBUE=zmg0Bezp=6C7x32-T4DW0+iSsJmrYtaB=sJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OpRpw96UTqB2/IYLNRoyOEn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OpRpw96UTqB2/IYLNRoyOEn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, 3 Jun 2020 17:44:31 -0400 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> On Wed, Jun 3, 2020 at 5:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
> >
> > Is all this new stuff really destined for v5.8? =20
>=20
> No.  5.9.

Then it should not be in linux-next until after v5.8-rc1 is released.

--=20
Cheers,
Stephen Rothwell

--Sig_/OpRpw96UTqB2/IYLNRoyOEn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YHcoACgkQAVBC80lX
0GxNigf+L80orgMLD265grnHap7WS/SrlMflDW1clF55MK8pmZ772Hwxdk1UywCF
Tl4X/vNufFwKVltuYJsQAUd05YaL9cr00bCFUXoTIkhqr/3TfT6juUEdmQxjpQhW
0xLAYvHJ/srUekNZPi2po1DLy1xAbZ/WRrujzDCSDkH0IfLtqzfq3H7v25wV5JeG
cFRZH/5IzTT/a/0P2nKXzn5/kLEOrvHiB+P9zsjniR9cl50y9SDDKZXQBOv1TnsM
WsbDBi395eAaYGiLSOQVnSLGWOfhkExGkieC6e9Evk3ePyF1ptfvOrfyGR+YU/GF
THQPlnm+rYZ/Cw+TZQuVvirkeowqqg==
=LA3R
-----END PGP SIGNATURE-----

--Sig_/OpRpw96UTqB2/IYLNRoyOEn--
