Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38BF3FC033
	for <lists+linux-next@lfdr.de>; Tue, 31 Aug 2021 02:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239138AbhHaAu3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 20:50:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236374AbhHaAu2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 20:50:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gz7qw39b2z9sRN;
        Tue, 31 Aug 2021 10:49:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630370973;
        bh=58d4ifL/5a6hPCPtM3Vh9aotKkhRJuYUDT2ZCuYAMVw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c4+DzjtURsxjw5+l9DKUDLyU1Ctis6hpi0QhNmX2Bsy2uGgRIY5hhaB77C929t249
         RChPFm0twqe4+z3fjUm7u4sAZqXjcpN5xLWb8dkZwAtbd0Ap9CIwjFy2QpGKdxwQuE
         lyewGL2pXZT2PgkRaQv1josEgtuWkoaa6TvvuiMBehtf/FnTC2b7ODJvJjfj0vE/KF
         tSdHgHhwgSZRKoiGYoQG30pt1JEE9vu74TXp+O22e5MEb/XI2VbuA5BJQjZmdLHzw+
         roPzyBqMLoDjWlcPN6KeuhZB9ugAgvdhWuQFQKDJNGVbfhG/XcwRUeeNlV8ZcW6Xrw
         ycEZcuCalvscQ==
Date:   Tue, 31 Aug 2021 10:49:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, edmund.j.dea@intel.com
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <20210831104931.04c91075@canb.auug.org.au>
In-Reply-To: <E98E0D1B-4865-4177-A98F-8274B699E25E@chromium.org>
References: <20210830184429.1ee4b4d8@canb.auug.org.au>
        <E98E0D1B-4865-4177-A98F-8274B699E25E@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QM7CbSBWn6PFPN=vS+BXXrk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QM7CbSBWn6PFPN=vS+BXXrk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kees,

On Mon, 30 Aug 2021 16:50:55 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> On August 30, 2021 1:44:29 AM PDT, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> >After merging the kspp tree, today's linux-next build (powerpc
> >allyesconfig) produced this warning:
> >
> >drivers/gpu/drm/kmb/kmb_plane.c:135:20: warning: array subscript 3 is ab=
ove array bounds of 'struct layer_status[1]' [-Warray-bounds]
> >  135 |   kmb->plane_status[plane_id].ctrl =3D LCD_CTRL_GL2_ENABLE;
> >      |   ~~~~~~~~~~~~~~~~~^~~~~~~~~~
> >In file included from drivers/gpu/drm/kmb/kmb_plane.c:17:
> >drivers/gpu/drm/kmb/kmb_drv.h:48:23: note: while referencing 'plane_stat=
us'
> >   48 |  struct layer_status  plane_status[KMB_MAX_PLANES];
> >      |                       ^~~~~~~~~~~~ =20
>=20
> Ah yes, thanks for the report. I encountered this too, and have been told=
 the warning will go away soon:
> https://lore.kernel.org/lkml/BY5PR11MB4182ABD607EB99C1F68777928CC69@BY5PR=
11MB4182.namprd11.prod.outlook.com/

ok, thanks

--=20
Cheers,
Stephen Rothwell

--Sig_/QM7CbSBWn6PFPN=vS+BXXrk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEtfJsACgkQAVBC80lX
0GzJFgf/UN2tIKKv1/UjL3Fvg3mIbDyMAj+JESXOqTdOv5AJIi563Xfyt1GOzobp
+lIVtRv+QpSPgTQ/ZoX77zPVFyJ79KgQzWI0LcsM10yvI/whZVWrTL21oKyXQseL
AIvcGXGIRCgXDDJSfUuvIz6zhShg3xrtFnm697dnwL7UhDNWGWCsnsS3JaOswdLg
C3nrfOV19DjxT/3vg8OdxPVW/H6R5aDLsXzCNeRhgecyzuMwuhIaiKINObSz3PvK
Hx9d7Q2tX6MVEI+CLDDc22qBYIHx5+I7sSiFbkGwo8kk1qnUvDIJ9lDow4Reg8gC
brOMH+oefKFmHddu9m8oyk5Hlf2eHQ==
=P51e
-----END PGP SIGNATURE-----

--Sig_/QM7CbSBWn6PFPN=vS+BXXrk--
