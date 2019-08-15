Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B718F6B8
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 23:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbfHOV7f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Aug 2019 17:59:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40411 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730803AbfHOV7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Aug 2019 17:59:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 468gN50KjBz9sDB;
        Fri, 16 Aug 2019 07:59:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565906373;
        bh=NtF2YzBo9RjOgFQ2zd1MjWfpTOCNey98xfJF2oL6EkI=;
        h=Date:From:To:Cc:Subject:From;
        b=IGpfR8HzPYwcj4fLkIvhE4XR5h2QzHoXtuszYCEVoJ6p5AP3GMUJBFa8Y2FFSHo4A
         29gt/yjmhUFb9ovZ6eeq9StRhKP3DmxYUkLYe+qIh89c5stO7PF9iS3nr8/LtKv1Y7
         rfYFM1w1xEYfni0gC+Hv4tAlqz9JV36j8niCq/pesdbt9DauChGnzCFumnq8NXVWn9
         4XBkU+LJE7rL6iUZCZ4+gNjUavmQZ82b8iekCOyRcmKhEzWOz3n51ihxm+kFG1wM74
         uD7wqO7+PsPZepZX/ZUT5VcRVSn9GEEdJXLAiHvejcfL12WubRDXkr8o+0dMWc3gaC
         3Vv2cTeAeG2WQ==
Date:   Fri, 16 Aug 2019 07:59:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20190816075931.40c5e46b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jebT.h9=UF=o+NY0GL5HnhJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/jebT.h9=UF=o+NY0GL5HnhJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bed7f1469f08 ("ASoC: cs4349: Use PM ops 'cs4349_runtime_pm'")

Fixes tag

  Fixes: e40da86 ("ASoC: cs4349: Add support for Cirrus Logic CS4349")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/jebT.h9=UF=o+NY0GL5HnhJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1V1cMACgkQAVBC80lX
0GzETAf8CYhDyFDeviVL/OTcdNbsjho1QeEZImqnjeCXCaGiGJCYq/jlO9VkAJhQ
wzsy8Za0GKSxp6+Z1CB2Y6UEx3XlRnQ8PujfSI0rzMRETo8OZ+kImQsr8p3AD8gG
ySPlQ+g7WZ2XyfXo5vFgQukT+YnS3cCrYe+QU+LAarBf2GZqloLP5C/QjjdZf38B
psAUvJbJrRrFEbs1Kcn6+3FEhqsMFAX/kvZgcoyYmy0YbQ+nyAfGdl9OrcK8XLea
MFR3iQK0DUklQj7i+VPt2puhi8SM6vh7Ujp5rfukYOtbOdxyKHzE5vmk5WQbUm5R
SpE9qNFy5MK6FwMcMxFcxMA/F0uOsg==
=dRHi
-----END PGP SIGNATURE-----

--Sig_/jebT.h9=UF=o+NY0GL5HnhJ--
