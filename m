Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9837E22E460
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 05:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgG0DYd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 26 Jul 2020 23:24:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgG0DYd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 26 Jul 2020 23:24:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BFQCL6Lx4z9sPB;
        Mon, 27 Jul 2020 13:24:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595820271;
        bh=IfBRA6eVpcHJNAolxx2wP0Kl+Bk8woNPiXAVx2Spiss=;
        h=Date:From:To:Cc:Subject:From;
        b=GhiZxUwrNcfLYCccmWTarHNB24q9vVGsdR9zWrd44uVlPUnQzKzAMBt+cU5KlrWdy
         uyp6+nyFmuPqi/W2myMoYHPZnO0FyeYp+plGUfFk8pcUdfpBTjsMZf0zQx2l71QRsl
         UZt3GinFN94VBckgC4mxOH6gamBgyWcshTn662+4jn8lsKWfjLA3ne4Ca31x0uWK/f
         RVzwZQlYY33UkZv3PstbhQMXYHz0d5IHMfZv3P4tPRQTEIT5d6OPdUwiGNoE12395+
         mq9NLD4qBvIHv3f84Z/EcjaGuz/7LTVQtumP/yf3XauECL+btulACvHFF+PL10gfxE
         DBKtt1dqgOQdg==
Date:   Mon, 27 Jul 2020 13:24:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the devfreq tree
Message-ID: <20200727132428.2763f57b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J8q3D4iwceZKDr7Y4ZEUwtl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J8q3D4iwceZKDr7Y4ZEUwtl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  332c5b522b7c ("PM / devfrq: Fix indentaion of devfreq_summary debugfs nod=
e")

Fixes tag

  Fixes: commit 66d0e797bf09 ("Revert "PM / devfreq: Modify the device name=
 as devfreq(X) for sysfs"")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/J8q3D4iwceZKDr7Y4ZEUwtl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8eSOwACgkQAVBC80lX
0Gy3rgf/W4KKU6ZgDddibwcN/kNPBKAq1JV3dAWeIongnd+HYZvME0+lSJ1WqPhm
hlOOLufYNQd15KGAo8YWtvoee4yt0EBq7lAvUSAq+l7mGlb98rUiiXmUs/DfMnAs
WT3I1h56FpLn+GCvy7fvJvR+jdktV968RsWe6kyM3eZ0y+u8BxZgbqPkFZwwyElZ
Rhs6u8ef76kctSaDgJ8wLV9gOY0dFZ2UAKm6qFi0FHi28Zx6wx/BSqTAIt6ikF+3
iBLNGxMX87PDs/UgaY7+t4/0yvhUXQU9Pnm6MS55HmJaYI54fU8fgMzoZ4dHsZgS
5uCSNvNgeWOK228DaFv28Tu0hHQbRg==
=xLOt
-----END PGP SIGNATURE-----

--Sig_/J8q3D4iwceZKDr7Y4ZEUwtl--
