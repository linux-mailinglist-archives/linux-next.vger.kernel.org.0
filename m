Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCCD1D411D
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 00:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgENWdR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 18:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728662AbgENWdQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 18:33:16 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6172C061A0C;
        Thu, 14 May 2020 15:33:16 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49NRBz12stz9sTD;
        Fri, 15 May 2020 08:33:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589495595;
        bh=9ljetqOT3gzLUa3iB3zxx9ekxV1W553qAgBlDt6WpxU=;
        h=Date:From:To:Cc:Subject:From;
        b=IGPh/KCQIXEjTD5o4hs9pv1VepHB3q9mHPJY78sTSetOeXmVS7mobygDgk03k4MvJ
         V8T9R3B+QUJMVK/lIpDt4NHeQiC8HVx7JB+RnCc5OcZzUtTO5A6+G2pnTe7dQIiywZ
         RbPaK1mtdDqzEZZ7tc39Fh5+VCIn80H5dO4pPfu9nMp+ov+wQoUV4WHz4ypyzGvMYd
         /GaBNOjkDU8qQKzXmDZLU/UHMZj0kJmWylWDwopYp0ODN1expmsa3qoaumyGF6Iy92
         uG9gzJIUP2E3HrYTp2FLbEX/lILUirZDGowtmpP/WrELqRUC2PY6rXfcJlzjGBkfze
         ryy0c4RXyMZhQ==
Date:   Fri, 15 May 2020 08:33:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olga Kornievskaia <olga.kornievskaia@gmail.com>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20200515083314.19b8ce17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CSM5oeRrnhsWXrdg_dNIZNr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CSM5oeRrnhsWXrdg_dNIZNr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1ce8dbb6a593 ("NFSv3: fix rpc receive buffer size for MOUNT call")

Fixes tag

  Fixes: e3d3ab64dd66 ("SUNRPC: Use au_rslack when computing reply buffer s=
ize")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 2c94b8eca1a2 ("SUNRPC: Use au_rslack when computing reply buffer siz=
e")

--=20
Cheers,
Stephen Rothwell

--Sig_/CSM5oeRrnhsWXrdg_dNIZNr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69xyoACgkQAVBC80lX
0GznKAf9EOJiF3zL8xx7wFVSGVyvp5Dc9NeoAJcKjrDpm3Ku9LDrwyiu6AvpJTsv
WhR4O6wgddP4uklffvYhWxxypMM32dGSFUMz0hCP2NicLxzgasVTpSujfxFt6cC2
BRJimyK672lbNN6AASlY871heAvjCpmHPgk1Nu997PiMiZ0aLvrgLu3S1izbjSz7
9btKUKhLSFvDCKzq5wlJxiu4wf7h8cCSRhC9DQLQuEUu760mc+Wbhu2v7SiM8ZuT
V/2R/XkTphUV68zSKUPjl4G4OC+ENnbvwyfJpyoZl/m4UdiU1gSl/I3KtyI3rKW3
Tt3fdNwEBgpTHhCiWoWvlCybJDIH4w==
=fYEB
-----END PGP SIGNATURE-----

--Sig_/CSM5oeRrnhsWXrdg_dNIZNr--
