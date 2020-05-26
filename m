Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27AE81E1A25
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 06:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725550AbgEZEIr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 00:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgEZEIr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 00:08:47 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4255C061A0E;
        Mon, 25 May 2020 21:08:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49WL701D55z9sRK;
        Tue, 26 May 2020 14:08:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590466124;
        bh=XCYEpLx2hJU0++Jzfm30Of0jjuMLXOrS3eK/9jvwsbQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eU9JPpF+ejhp6uiawmJc3Yu8oY2dhLpeynXp3nlRB8L+KanMHcY/MLcdDG8AB+Z/P
         F1sC/CqmYLS9byL42NH8SM1Fg9BV3GiMFMfxjQxnMXDKzoiuQtVJ+CBS49XK6DQAjP
         4ALI4gjT9WKewqwpmynZ1PSYp5ahLlhBbOG4ZjID1kPRgW1D2oKPSCbPiUqOgWzJHy
         0MS+nKKhaW+rjC5duEJeglnCzWCWNS5V2BR0KWcNefSysGaquxl8q6mYl2rzEVpOYm
         kWrBDWU/s8c1L4WcRMi5mea17jXVDJ3GUSrI8PeTaEkvFUlHHHjFrGduWeDSD+ipTq
         PglRZHLJ0l9kQ==
Date:   Tue, 26 May 2020 14:08:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>
Subject: Re: inux-next: build failure after merge of the drm-msm tree
Message-ID: <20200526140841.0a1d5c7b@canb.auug.org.au>
In-Reply-To: <20200519150955.1667566a@canb.auug.org.au>
References: <20200519150955.1667566a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8t_Uf+6ZsLciv4vCeeIrHds";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8t_Uf+6ZsLciv4vCeeIrHds
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 May 2020 15:09:55 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> After merging the drm-msm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
>=20
> Caused by commit
>=20
>   04d9044f6c57 ("drm/msm/dpu: add support for clk and bw scaling for disp=
lay")
>=20
> I applied the following patch for today (this is mechanical, there may
> be a better way):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 19 May 2020 14:12:39 +1000
> Subject: [PATCH] drm/msm/dpu: fix up u64/u32 division for 32 bit architec=
tures
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 23 ++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 15 ++++++++----
>  2 files changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_core_perf.c
> index 9697abcbec3f..85c2a4190840 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -10,6 +10,7 @@
>  #include <linux/sort.h>
>  #include <linux/clk.h>
>  #include <linux/bitmap.h>
> +#include <asm/div64.h>
> =20
>  #include "dpu_kms.h"
>  #include "dpu_trace.h"
> @@ -53,8 +54,11 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>  	}
> =20
>  	bw_factor =3D kms->catalog->perf.bw_inefficiency_factor;
> -	if (bw_factor)
> -		crtc_plane_bw =3D mult_frac(crtc_plane_bw, bw_factor, 100);
> +	if (bw_factor) {
> +		u64 quot =3D crtc_plane_bw;
> +		u32 rem =3D do_div(quot, 100);
> +		crtc_plane_bw =3D (quot * bw_factor) + ((rem * bw_factor) / 100);
> +	}
> =20
>  	return crtc_plane_bw;
>  }
> @@ -89,8 +93,11 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
>  	}
> =20
>  	clk_factor =3D kms->catalog->perf.clk_inefficiency_factor;
> -	if (clk_factor)
> -		crtc_clk =3D mult_frac(crtc_clk, clk_factor, 100);
> +	if (clk_factor) {
> +		u64 quot =3D crtc_clk;
> +		u32 rem =3D do_div(quot, 100);
> +		crtc_clk =3D (quot * clk_factor) + ((rem * clk_factor) / 100);
> +	}
> =20
>  	return crtc_clk;
>  }
> @@ -234,8 +241,12 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu=
_kms *kms,
>  		}
>  	}
> =20
> -	avg_bw =3D kms->num_paths ?
> -			perf.bw_ctl / kms->num_paths : 0;
> +	if (kms->num_paths) {
> +		avg_bw =3D perf.bw_ctl;
> +		do_div(avg_bw, kms->num_paths);
> +	} else {
> +		avg_bw =3D 0;
> +	}
> =20
>  	for (i =3D 0; i < kms->num_paths; i++)
>  		icc_set_bw(kms->path[i],
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index c2a6e3dacd68..ad95f32eac13 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -9,6 +9,7 @@
> =20
>  #include <linux/debugfs.h>
>  #include <linux/dma-buf.h>
> +#include <asm/div64.h>
> =20
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_damage_helper.h>
> @@ -174,7 +175,11 @@ static void _dpu_plane_calc_bw(struct drm_plane *pla=
ne,
>  	plane_prefill_bw =3D
>  		src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
> =20
> -	plane_prefill_bw =3D mult_frac(plane_prefill_bw, mode->vtotal, (vbp+vpw=
));
> +	{
> +		u64 quot =3D plane_prefill_bw;
> +		u32 rem =3D do_div(plane_prefill_bw, vbp + vpw);
> +		plane_prefill_bw =3D quot * mode->vtotal + rem * mode->vtotal / (vbp +=
 vpw);
> +	}
> =20
>  	pstate->plane_fetch_bw =3D max(plane_bw, plane_prefill_bw);
>  }
> @@ -204,9 +209,11 @@ static void _dpu_plane_calc_clk(struct drm_plane *pl=
ane)
>  	pstate->plane_clk =3D
>  		dst_width * mode->vtotal * fps;
> =20
> -	if (src_height > dst_height)
> -		pstate->plane_clk =3D mult_frac(pstate->plane_clk,
> -					src_height, dst_height);
> +	if (src_height > dst_height) {
> +		u64 quot =3D pstate->plane_clk;
> +		u32 rem =3D do_div(quot, dst_height);
> +		pstate->plane_clk =3D quot * src_height + rem * src_height / dst_heigh=
t;
> +	}
>  }
> =20
>  /**
> --=20
> 2.26.2

I am still applying the above ...

--=20
Cheers,
Stephen Rothwell

--Sig_/8t_Uf+6ZsLciv4vCeeIrHds
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7MlkkACgkQAVBC80lX
0Gx4LQf+OevSCtA6ybeDqh2xOqst6lelN3TGJ23ITVN62OfIXdVS8sn2xZvBRA3f
YYXPyH+7VnTlaqxR0cD73cio4OqZaiJNca+Lub3TyNmRqo5B0cTnKhEuHVBBsnqm
Q1ULxLmb2Tfymhtt1xhuZ22YFCS2+fT7xqQvUNzD7DzuPTrWQ5z4Wr03jedEvies
fCQCW+f76pqE5NcCws3sEDhi1fmtIMS3dEVdf8e7EwN5rondAUqy9gGga4o1Yy3g
Z6XPo5Qj/IfjHAWxUoYcWGtG7SgTtf2pe1KYZ/Egxlx+2M8IkN/GcZQTKIqXrEHW
mBdCH8DpqBQVIU9+2+T8nsVmXH4i7Q==
=DjW/
-----END PGP SIGNATURE-----

--Sig_/8t_Uf+6ZsLciv4vCeeIrHds--
