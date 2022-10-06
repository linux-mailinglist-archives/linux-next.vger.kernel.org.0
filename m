Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2D75F6252
	for <lists+linux-next@lfdr.de>; Thu,  6 Oct 2022 10:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiJFIMw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Oct 2022 04:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiJFIMw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Oct 2022 04:12:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060794B4A7;
        Thu,  6 Oct 2022 01:12:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjkhH5jsHz4xFv;
        Thu,  6 Oct 2022 19:12:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1665043968;
        bh=31lYof3k6TiuWy0jh42ikNoE+6WvWJWGhXoZV4qiUiM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ninumLr0iNSJyGMXf4X2E/vre60REOGPsV/mYzG6Nt4wZnsEKOK4BtU+gm/SRnwCJ
         edrp3BSvqVcDFCI+KDMCNg2CGaE92XHDfOlrn7CX6PYK+HwK6W9H6fx+IkBpq+6VQF
         mPpMfLna9jswtO1VCo7+/cWVHeP0EV7hrFtFbtGzmNsf/TF1qlm9zbfDN8vUyFNwcd
         44n/lTks0r2Hj6/E5bC4KT08YaGnn7Fa01A/bFKpuZsD58jAA6xQL98mjVcfjDJM7/
         qCn2RlxrWDoaq4POb2w/4O7QFlKVy5YrG2e7I3hItTy5RZZ8hCBoXxH6kyRG88mfcq
         dOc9g6a5R/BrA==
Date:   Thu, 6 Oct 2022 19:12:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Airlie <airlied@redhat.com>
Cc:     Hamza Mahfooz <hamza.mahfooz@amd.com>,
        Alex Deucher <alexdeucher@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20221006191245.11bb0e2c@canb.auug.org.au>
In-Reply-To: <20221006092810.0c3a2238@canb.auug.org.au>
References: <20220930105434.111407-1-broonie@kernel.org>
        <20221004132047.435d42db@canb.auug.org.au>
        <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
        <20221004140558.64f59f2c@canb.auug.org.au>
        <YzwbW4YQwQPsRPYw@sirena.org.uk>
        <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
        <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
        <20221006092810.0c3a2238@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fQ7FPaV88=DQ7b76DFZdCk_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fQ7FPaV88=DQ7b76DFZdCk_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Oct 2022 09:28:10 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> I have applied the following hack for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 6 Oct 2022 09:14:26 +1100
> Subject: [PATCH] fix up for drivers/gpu/drm/amd/display/dc/core/dc_stream=
.c
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gp=
u/drm/amd/display/dc/core/dc_stream.c
> index ae13887756bf..a5da787b7876 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>  	}
> =20
>  	/* remove writeback info for disabled writeback pipes from stream */
> -	for (i =3D 0, j =3D 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i+=
+) {
> +	for (i =3D 0, j =3D 0; i < stream->num_wb_info && i < MAX_DWB_PIPES; i+=
+) {
>  		if (stream->writeback_info[i].wb_enabled) {
> -			if (i !=3D j)
> +			if ((j >=3D 0) && (j < i))
>  				/* trim the array */
>  				stream->writeback_info[j] =3D stream->writeback_info[i];
>  			j++;

This works as well, and (in my opinion) is better:

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..fb6222d4c430 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -499,7 +499,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
 		struct dc_stream_state *stream,
 		uint32_t dwb_pipe_inst)
 {
-	int i =3D 0, j =3D 0;
+	unsigned int i, j;
 	if (stream =3D=3D NULL) {
 		dm_error("DC: dc_stream is NULL!\n");
 		return false;
@@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
=20
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i =3D 0, j =3D 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++)=
 {
+	for (i =3D 0, j =3D 0; i < stream->num_wb_info; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
-			if (i !=3D j)
+			if (j < i)
 				/* trim the array */
 				stream->writeback_info[j] =3D stream->writeback_info[i];
 			j++;

--=20
Cheers,
Stephen Rothwell

--Sig_/fQ7FPaV88=DQ7b76DFZdCk_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM+jf0ACgkQAVBC80lX
0GyyIgf/WR7MxcXzbxhywbtkI+Sx+47sAft5hdECwLaEzF1auZ3Nv3xKH4yY79fR
npO+OjDaVJ9YXdXXi/tpoBTMPfzFIwbcd0aGfGClO0OtJjDM2p0roXx64TMXM3f3
TIZjRXIyhRWZscBae7/M4iOgcrSJ5ac2fZB5j70pnuJi144QbQc0ttaGRiqdWgTJ
3c2UurXu2DJlSu2VvNXaID3NkvSF55mbonCYmuOhwy1yPqPZPnubMr0EBi36ztEM
QB+LZ5XyvE7/Iyw320ImgsZMjenH1sphsOVukH48H6nMFBdwhX1bO8WHqB1PFO3u
oGyN/rdPlSafTCucGLqFK19xsG0LHg==
=Xs6o
-----END PGP SIGNATURE-----

--Sig_/fQ7FPaV88=DQ7b76DFZdCk_--
