Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEEB3438F5
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 07:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhCVGAv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 02:00:51 -0400
Received: from ozlabs.org ([203.11.71.1]:44255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhCVGAT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Mar 2021 02:00:19 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3kPC4nF5z9sVS;
        Mon, 22 Mar 2021 17:00:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616392815;
        bh=2nqo/mFoq+yQSu69SkrOw2tczYCjXiVZ5UcSVuDw29c=;
        h=Date:From:To:Cc:Subject:From;
        b=hJXbW4L/id2m4Pgw0aCavXynCSVPkU9sUWRts1QjWp/mCCj6yE2dwqLIrATo5YswE
         r0SSJ1Yn8sMfEQirP+U/Kj8w1I02rkSNTy1Sz0FnVLWnL6alngvUC2rcaZNgwYK8EJ
         Uaq6/AiFdn6DWaehZ1QWy3MejBbwK7xYdkr6P1Bd/WXebKncEWy5kz/x3MtCs092Bt
         8onWbHcpQU4rPE0jKxJyg1Xb5Y5t5fBUPWmUw8JyrpoQy6ud95ucPXbvR24YZtHG2K
         4hyVhkVWe29DZ4K5ffKOa/I7RUkFzpBib545DeoZx13/6uR9uVLcokUiUoPv6Gd3bZ
         rXBiRh6mK65/g==
Date:   Mon, 22 Mar 2021 17:00:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Leo (Hanghong) Ma" <hanghong.ma@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210322170014.3e022928@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bA6CjuFWScGFFuu_2FOn7j6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bA6CjuFWScGFFuu_2FOn7j6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:405: warning: Function pa=
rameter or member 'dmcub_trace_event_en' not described in 'amdgpu_display_m=
anager'

Introduced by commit

  4057828a1283 ("drm/amd/display: Add debugfs to control DMUB trace buffer =
events")

--=20
Cheers,
Stephen Rothwell

--Sig_/bA6CjuFWScGFFuu_2FOn7j6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBYMm4ACgkQAVBC80lX
0GyvlQf7B9bdtd/wqsVdW6u9kSRpTX5mG2BVOJUgVJPZGBHZEdkdXKYPHR2lE70+
EpYsMxwxmZHkc8B4T0vjFpC1ZI8PzW8VhLpLx1xNtZik421XOhqQXKHaYSUPKW7l
zw1cBNn8/TLf3KWcYu7tpSSjvGI4INuq0pDCvfm/bffJRtrwgVjm/kuigBMCEFGZ
LVc0PbwR87J9UKS3eSdcSZRfHUvapQvHzWEJQMaaN5F+qJzgTdsapQI+j6/CT/Eo
c2P/C/nC2gGETRebwrZgFc8nnsHFNDUHwr4vc/NqmFWjDJ2Wl5IgOMYwqeK9xtCM
aRHgtEY91ymMPqyU7pTAoZm2OuVJmw==
=Ebpw
-----END PGP SIGNATURE-----

--Sig_/bA6CjuFWScGFFuu_2FOn7j6--
