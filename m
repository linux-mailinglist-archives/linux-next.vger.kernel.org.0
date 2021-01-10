Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72FA2F04CA
	for <lists+linux-next@lfdr.de>; Sun, 10 Jan 2021 03:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbhAJCPJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 9 Jan 2021 21:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbhAJCPJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 9 Jan 2021 21:15:09 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE83C061786;
        Sat,  9 Jan 2021 18:14:27 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DD0lN2mcmz9sW4;
        Sun, 10 Jan 2021 13:14:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610244864;
        bh=dNLbGK6GphtDw7du8HrC19+LXzVjkjCI18ziuiB6a7U=;
        h=Date:From:To:Cc:Subject:From;
        b=sBDU2Q77pUJJtrjZhMnkzT+io4JWfinkdAoE+d+t1LzxD+wzQ7frGziWa0mMNbylj
         WRv/RW+S/FYupOr7L51ZCU65ROH2Bwx9kC2JHcY0qesLhYtXhX1tFLaVydAFd7DkZ3
         r86jlaHCwxVwP41Q1EW3vuVTZTOoA8BAEYaFmwEKOZja9kXCR4pp6bvQCXcTGtgnom
         QWw6SHuO486Bc8eZAXPWPHDz/ypdqz3wvtr9SCgVJF9qrwIh9e+AoM10yfhCSNtZld
         XYSIEm0syWMmV1isXGLQyqlDVMD1BdK7MVCzgp6tfUls/ZTy38GYFtyGxvaOwafm7N
         T7xEttxJHkuXQ==
Date:   Sun, 10 Jan 2021 13:14:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Scott Mayhew <smayhew@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20210110131423.0dedfd93@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TDLrUdGkpI+_OwcOgFXrYGl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TDLrUdGkpI+_OwcOgFXrYGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2cc8aca9d547 ("NFS: Adjust fs_context error logging")

Fixes tag

  Fixes: Fixes: ce8866f0913f ("NFS: Attach supplementary error information =
to fs_context.")

has these problem(s):

  - No SHA1 recognised

See duplicate "Fixes: " :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/TDLrUdGkpI+_OwcOgFXrYGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/6Yv8ACgkQAVBC80lX
0Gy+Ogf9EICYFemkPAaS9F4nfn/GwJRbCSDBX2st9npbS7lO07yJt8EGKDtQqj74
bt/NkJuQL92jKL/kiGsCnVFE3Vny0AA5M8zmfb3GMUyVLwefF0zwA0DgBUI9p0D4
IY5kBlhTnx113qx6QK2QgnDiPuvf7WDu4aQenjI5XlPkqv9DaeHUCmLeOF2gdGBr
JIVkI8XAuP++CSUpLjAfp/EnVmN3LquwYBNKWJ5xOopr2qytC6d6ibBbgRpj8EVg
EeQEp5vr/RxnFoolbL6nAzxHP2qunDuz3Xvn+f/mOWjf7C+NyV075Cze57IXFM+N
8L50kVzjFPXBbU70pcyAE3USdPT/rA==
=+oEZ
-----END PGP SIGNATURE-----

--Sig_/TDLrUdGkpI+_OwcOgFXrYGl--
