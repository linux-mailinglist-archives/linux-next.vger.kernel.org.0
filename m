Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F156F1BB91C
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 10:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbgD1IsU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 04:48:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57245 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726363AbgD1IsT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 04:48:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BFfT6qWNz9sPF;
        Tue, 28 Apr 2020 18:48:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588063698;
        bh=d8AgwdncpihCPJg9Rd0sNUrNC0g+QP45tDJm6gWK3Cg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SojYqesW58phHbQG92YTOXWFyG1CL20YQeymfkPtH/jiAyZ7W2xMClpbN0EEKIyY/
         1P0m87AqkhVaaaxtSDwCGBpeny34qq1Hh0pPSfAPqV+Yle3ekg2YycdOHru7pdzkuB
         +fLOqnSLkUaXO5QAWbnQIxKTAPRFbuZXTa1m1l+nDRjWqZ/BBz3MeXhNI+4z7FUafd
         zQIRCuBcNBZDzPrI3pBuf03HCVARZmTaS4dMdMQ/N+LVbkNCxkadWVAecZQJ8ZQUlL
         zmdfNeUMWuGFxLu0akQAtPIGnlD/z5HpzkCsvBF04VxMBdhO+KHlBSl9lPvSq767h2
         wRsLFFVRi4ZmQ==
Date:   Tue, 28 Apr 2020 18:48:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>
Subject: Re: linux-next: build failure in Linus tree
Message-ID: <20200428184815.7b790114@canb.auug.org.au>
In-Reply-To: <20200420214611.17a6411f@canb.auug.org.au>
References: <20200420214611.17a6411f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0z0YOynmG9pzEO7kb5P94hw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0z0YOynmG9pzEO7kb5P94hw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 20 Apr 2020 21:46:11 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> [reported by kernelci.org bot]
>=20
> For a while now, building Linus' tree, the linux-next build (arm
> qcom_defconfig) fails like this:
>=20
> ERROR: modpost: "rd_full" [drivers/gpu/drm/msm/msm.ko] undefined!
>=20
> Caused by commit
>=20
>   e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buff=
ers")

We are still getting this.
--=20
Cheers,
Stephen Rothwell

--Sig_/0z0YOynmG9pzEO7kb5P94hw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6n7c8ACgkQAVBC80lX
0GwR4Af/XALLXSlMEOSxthKX8naGN+PyEq5PeXevBxEILH6SsZSOqPnMIvzcWu8W
1QXUA7xjVSjJ3L6cTioY/JB5PbPhgNdyWts2kztevKjk2jdCZUz17Qh37s5NnyhJ
C3RC3Pjo6wa5JdvUHyfsVE2tleWgaTTNLLQIqFRRs91QVU3RmtDhSlUoG9ZwnLbt
I3b1f17Gzj1WMRKnsqH4eBMLcXnPb+BBI7gDASxrdRt5x6ZdqeTC5HV38FL77Hon
AGaoaBRge7XwdZ4kCH9uuSDaruMJBa9HyP6ISSY8NCafU8N+uUScwf7wtzWnEUSu
xdnTgD0LbeOG7XWkKpgbu1uLiZP6tQ==
=V6e8
-----END PGP SIGNATURE-----

--Sig_/0z0YOynmG9pzEO7kb5P94hw--
