Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A22273CEFD7
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 01:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347221AbhGSWrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 18:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441928AbhGSW0v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2021 18:26:51 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D312BC0613E6;
        Mon, 19 Jul 2021 16:04:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTHTs1crwz9sS8;
        Tue, 20 Jul 2021 09:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626735857;
        bh=U9dlsr4YHzfWpAfVsdW9AZpPXJCMyfPY5QJPYdcMf8k=;
        h=Date:From:To:Cc:Subject:From;
        b=mHdA9Bl+ScuVImzL6201tvS35kzq9MuECxPbx7+/Jl4Yz3LjaZ1KoV6rFhgHtmFPM
         2YfdtS46upio1APoA33QMvwEaqP6TOv06bqqbRW0nrBP7MGRliK+6fuJw11+sx0kQ1
         yuvJHoTLvkDq6Xul2ceVyg5ERyvaWH3PcY9GhvaDgf1WnKZC41OpOUYmc58K7ZKlks
         nMrKyQVKbSArW5Ie2Ye1tFBhDbWg20cXC+Ro0izoHe3cU160hAx3bx4mrAMmyuzTYY
         LCO2CJAHdB+zNOHyKcPqx7cqyv4Xs/d7emEfz+j42R834ARKMd8rUQz6Dsw7ZrrcUs
         0TbXDDAFjIHvg==
Date:   Tue, 20 Jul 2021 09:04:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the overlayfs tree
Message-ID: <20210720090415.279cbb19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gym2R/aMqFK1abFsmh.cgpp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gym2R/aMqFK1abFsmh.cgpp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  3132b5adad49 ("ovl: pass ovl_fs to ovl_check_setxattr()")
  d1e717e0032c ("fs: add generic helper for filling statx attribute flags")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/gym2R/aMqFK1abFsmh.cgpp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2BO8ACgkQAVBC80lX
0GwBGwf8C5Q0551FvdLACT0oXWJ+PdLFm4hPZp36900tzsv2XHO0KbzSZ3sqAT+/
O8iDOS5rNw2tCxS2Rul56pB96c6hOshOoe9+UQq6VAZ5vHo52qOUzNo7Leno/vba
PHu7jtAnE5XZ3u4dnoMa0N3qd5qcC8Vojo0250k+EACSe7Qibxk/LYUw9/LiqfQx
CuROfPIwrsJZcG5JrNYLCzG8SR4i75Hk5+TXLMtn+6vT6A5lNmvCp3aPAv1CGKGm
nLa+knAnw0lQa8jTCOV0p13+dy3ub68jRmrf7x1D+qe+HxgxgXHP+QYCWmvttVhO
ZvgXNqwD8ZcgcI0EPgOp1cNYMzoChw==
=4CT8
-----END PGP SIGNATURE-----

--Sig_/gym2R/aMqFK1abFsmh.cgpp--
