Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FADC421902
	for <lists+linux-next@lfdr.de>; Mon,  4 Oct 2021 23:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233373AbhJDVLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Oct 2021 17:11:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43743 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbhJDVLW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Oct 2021 17:11:22 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNYHr6sFLz4xbR;
        Tue,  5 Oct 2021 08:09:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633381771;
        bh=hEo4aTDQD1Hbsl27RAuXrtLCQbIhYm9njhC2MUF5ffI=;
        h=Date:From:To:Cc:Subject:From;
        b=XKYsy1Sg5tsgr5UfsCMYy52+bVD8ImDZtwo8RRWGxo8S7u1QjBAT8hyIULb8IlRx2
         azwT47IFQu5x6IZtkht2+ZB3XLnwWy+bycgNvISXG5umVDIo/ucI2NuKglSRRm3+W+
         cOx89IAD1BLvNNjCgxUlKXuahyvUFtyMN9d0x6v9ZQD4vNptRcjkZ5dwQgltxt6pzk
         Eds/xDJssE29o8o2JVQhLl4Mr7YFXLaPa8Rc5/Mjl0/gVYRP71A1snbbWihAZ1fQqY
         EnekDE4K+X3LxBVLwSVxGK5uiwJcwTIEbP4UcQ05xntpPA2NPl5sYv7mR4yKZiU3Kx
         iIp6nQf19kppQ==
Date:   Tue, 5 Oct 2021 08:09:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20211005080926.2f624ea7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZzzxLHuw_Bfb3YMdghRiWqJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ZzzxLHuw_Bfb3YMdghRiWqJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3042b3659ac5 ("riscv/vdso: Add support for time namespaces")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZzzxLHuw_Bfb3YMdghRiWqJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFbbYYACgkQAVBC80lX
0Gw2DAf/Ws0rG4dt0X5hdq3EGNcGNVEuuatjRiXhxb+4ppMx3tTk3aJIHq86/SYN
XwkQRao4QxUEjaRaSHjkSr69ZEGzWrUk94pEvtFMKabSiBUZjy0FAD750v4kLfZX
K2wnfGHqj23VseQbaUrxY6NyvypHQHakupu3hh07r4XNclJI+AOL76QSFLiqjTGx
21cpzZd2hMuj8rcNvm/g2C4We3PlxyZZVCeo2Y8qloW8kOWS/1Ft/cnypJKnyocd
Ps/IVQCLyQoIuwxuIZgC7vUInnYUVmjesAi94eNoK3fUCdy4OV8Zht2ZB9v7rKdW
TzAH1rSNErpafK4bbQWRa3Jw74A19Q==
=zxj6
-----END PGP SIGNATURE-----

--Sig_/ZzzxLHuw_Bfb3YMdghRiWqJ--
