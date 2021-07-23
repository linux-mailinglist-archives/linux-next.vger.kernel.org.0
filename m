Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B79F3D321E
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 05:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233506AbhGWC1q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 22:27:46 -0400
Received: from ozlabs.org ([203.11.71.1]:39423 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233368AbhGWC1q (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 22:27:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GWDm32TzSz9sV8;
        Fri, 23 Jul 2021 13:08:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1627009699;
        bh=juWx6JEmBlfY/hXTeotgtpNHxgO/f40Z10DLhKyCX00=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IfHJfEqkGUbWipeER+fI5fzAq3G/QQFzJ14eSRFgeG/PwWe++n6Jd543ruDjH9nk4
         /9jpkzNwayzrUNpNYp2sgSbilGcR+sMUhOXS/muGt0N8iqsIwgmGT8KFEooIl50uoB
         QOe/1X9j0CMM3vZKMTbjeCN42f+XHGImoPyAbEx3VnM9dIM00WN42/V4nbMi5+y5Us
         z9J155SoFE4yrPeyW374k9o5kHCjegt/CcLRUe49cOzfb8UvxhERlsur26mznzgXZO
         w+h5IEGT+h3EjZpkVP80I2cv2chlmWEmymTCKnEbkcYVcHxVhyrxB/rYfOJUtzwi6n
         Rvfldep25MxUQ==
Date:   Fri, 23 Jul 2021 13:08:18 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stylon Wang <stylon.wang@amd.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with the drm-fixes
 tree
Message-ID: <20210723130818.1a33137a@canb.auug.org.au>
In-Reply-To: <20210723125807.3c779f68@canb.auug.org.au>
References: <20210723125807.3c779f68@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TQBcQZ487Tkwv/LKABop_Ae";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TQBcQZ487Tkwv/LKABop_Ae
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 23 Jul 2021 12:58:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>

> + #ifdef CONFIG_DRM_AMD_DC_HDCP
> + 	if (cp_psp && cp_psp->funcs.enable_assr) {
> + 		if (!cp_psp->funcs.enable_assr(cp_psp->handle, link)) {
> + 			/* since eDP implies ASSR on, change panel
> + 			 * mode to disable ASSR
> + 			 */
> + 			panel_mode =3D DP_PANEL_MODE_DEFAULT;
> + 		}
>  -	} else
>  -		panel_mode =3D DP_PANEL_MODE_DEFAULT;
> + #endif

I corrected that to put back just the closing '}'.

--=20
Cheers,
Stephen Rothwell

--Sig_/TQBcQZ487Tkwv/LKABop_Ae
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6MqIACgkQAVBC80lX
0GzFjQf/ZusZ3vNUug4X6dFtIHKVLSoalBpVlvRCwj/RLimGfuPkQiqqOxWRVseb
05xkIYX76Mvk3N8Cy84kN128dZVG1uW0MQUtVCWcL4l+FQQySiZMH8erwA5dsrXO
lcLXD3W75s5HAdvvhgmTJacHn0ZpQI/mv5hAOsnLwB7TupZEYSdTFHtGoubpRNoa
uJdOXntoA0nxd3KmM/VsE9wn03tA0ff9QQoVCjB4zST1vogDG0dXtBFN4HGyslbU
Yw/xaibJS66n4fMAMFuvWb+EJGEJQholdQ78KWjKxPB3+AKcOCicXREvb3RXX++z
LrU1abJt+u92pvXN/JBcM0oT/oczYA==
=tUzc
-----END PGP SIGNATURE-----

--Sig_/TQBcQZ487Tkwv/LKABop_Ae--
