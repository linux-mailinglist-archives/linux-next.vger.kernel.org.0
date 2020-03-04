Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A660179A9E
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 22:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388351AbgCDVDc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 16:03:32 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42513 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388335AbgCDVDc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Mar 2020 16:03:32 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48XmZB3Jpzz9sPK;
        Thu,  5 Mar 2020 08:03:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583355810;
        bh=5Mq2Vg24FYBNc7J/XQOn8Ph6KKq8r/hE+o9gyq5RNSY=;
        h=Date:From:To:Cc:Subject:From;
        b=R/IUNLCcFfVC2RcrQHLGbLdvBxSLu1rCQUopk0EAav2vygLDLEWlpTssgF1+m5zWs
         OMvtxNWV8UhDDiKx5p2tHzngJsW7Cux2XR4R2ePvR0fD+HDHo/jQleLco6MAoA4BCD
         VW7jIxQ94/ULssn7zonjQITvIHdOHrLP88IA/gX/JHXtRvqS/e0d6pOZty6b6f7dqp
         sxrxZYmwdHlPtJ6YUj8joFCJRPxE7C+x4zneGIKIXkuhOABR8ePPI54epT3Mv1bm3+
         XRpsKOYiwJBAU21xe2jgewwoG1Or5ILcTsb0Q+HNe2S9vqULxyxqebHCf3AqmXPs/p
         Hgqy0+N+dEwqw==
Date:   Thu, 5 Mar 2020 08:03:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sasha Levin <sashal@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wei Liu <wei.liu@kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hyperv tree
Message-ID: <20200305080328.6057e006@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xUbj52=/Gy5my.NDArHtlwm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xUbj52=/Gy5my.NDArHtlwm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  40d1d2d6e89e ("HID: hyperv: NULL check before some freeing functions is n=
ot needed.")
  1ff9f3ae8459 ("Hyper-V: Drop Sasha Levin from the Hyper-V maintainers")

are missing a Signed-off-by from their committer.

BTW: Should I have a different differetn contact for the hyperv tree, now?

--=20
Cheers,
Stephen Rothwell

--Sig_/xUbj52=/Gy5my.NDArHtlwm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5gF6AACgkQAVBC80lX
0GxlBgf/YzTTKGCNSj5FXjN4Y/lkPb2crA5mKlLzWK9g0U78xPuICyA8yfeE6mQr
PauTywMbqKkA0nYHmO/dVEVL50/8F6ZrOLbnx0X+ssLTPtC8nNU9AxMIEIZ0GIJ5
9zxQyrBfmNdNoI9GnG0AmtuRIfEmuoT5jS5KOoSuefLzalLrCKTokHJpRKGnogan
OaUoL0aH76D4vm0XCAJECqX6TrdeIBwbNOwufPHJFkPddlT0PgjpraKBnBvkDeu8
IGilgMGO1xkRz0DD5tDxB0WOO7znckcdwEISFOfmqrV0dQkvPC5zHiBY4b33oIK0
dpMfzkDLE6waYwjXdM4KnMu9QgV8qQ==
=zgWz
-----END PGP SIGNATURE-----

--Sig_/xUbj52=/Gy5my.NDArHtlwm--
