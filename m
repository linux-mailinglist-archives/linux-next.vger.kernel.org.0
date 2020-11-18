Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260DC2B85A4
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 21:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgKRUeF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 15:34:05 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40059 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725794AbgKRUeF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Nov 2020 15:34:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cbvff2nJzz9sSs;
        Thu, 19 Nov 2020 07:34:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605731642;
        bh=WmWF+ps2EREcv24sAFavjaZQ6LBTK4agB4G1ibhvLQY=;
        h=Date:From:To:Cc:Subject:From;
        b=J4a04O/0eanRuDIkPEFqdwTfXfSQx5NAnH+HN7Ci3ejsLKjqIl31XHhGh0Wjy8qNC
         WlYQPa9FzZYzZG7iiqlR3yPH1ZJPI5BPU1FU43QoC5TO7SVd7KKwRWzEEzeZyfuqNW
         1TrilabadrGMOTPZgHJj6YmTft2S0p+b5WxaKhcALPeGyHl5e2/PCuy50OipTj3aDU
         BbR8XBmJopUyf9mVLMivs8Jnh3SBUNCO8yuvtNcPkj10npTI61c/Puw3FxVy81n6tv
         /eSvxfKijeLyoEuW8cZWCy8u8iSD80fQR474To0I1aSyec7GQyfmbetSczH5Tnyxy4
         yKX5YaXIvgO6Q==
Date:   Thu, 19 Nov 2020 07:34:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pidfd-fixes
 tree
Message-ID: <20201119073400.6b209bd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s=4Xr+/UEaJw4S6yC/vvMyY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s=4Xr+/UEaJw4S6yC/vvMyY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  59b617b192f5 ("nsproxy: use put_nsproxy() in switch_task_namespaces()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/s=4Xr+/UEaJw4S6yC/vvMyY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+1hTgACgkQAVBC80lX
0Gx8yAf7BNjxQcM4uO+4E4jazX7S3p9bJ64R4HI48nksr52xoAKghEM34iWTcylP
dHuqvO3rO+C05WbkqIvDEm+9WXUSKAMlFfCNXzbD+kCBF4zm2y6BDQFNZ9eqdREV
PUp7XDM167R6OM9kM81q6pgZthBwTPwtA39+TMK4bizyBI6ahLBjU7BM2QJZRmv9
SAvrrVthle2frFl9ZHFmg1BAasr2y0YWPDBjppAJ0BKvPBhlZZhO1m10Ad89YFi8
gr6sRtTToclN2356Y7GlWDk8kL0L25xFxQLSQ3LGeHVv0q94sqi1Vm6XAgutuGwN
se/o2cKIdxi4MC6xJZ6mX6hB045ehQ==
=U0r0
-----END PGP SIGNATURE-----

--Sig_/s=4Xr+/UEaJw4S6yC/vvMyY--
