Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBAF426155
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 02:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhJHAdj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 20:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238359AbhJHAdT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 20:33:19 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A09CC061570;
        Thu,  7 Oct 2021 17:31:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQTdL2266z4xbL;
        Fri,  8 Oct 2021 11:31:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633653078;
        bh=62TrvYTTbb9qpNm0s57VIUFxSTWKgaqu6CiYRbcsqt4=;
        h=Date:From:To:Cc:Subject:From;
        b=Mf0vtuhjocCjF5QaKWp6nzMOPdZakbxA5o6QZ/Z5lk9wXtI5wyvsLQiXYsYGHt1Pt
         znRQ/6vPa3JC2wuhQE7UMbujLBlAthIqkOqku4aj1FQ4CJ5Da+ImX6OrKDRNj2XY2Q
         W3nc7ekbfE1xcp/hPHtNOo2a883aXUesOzzLmRO4PdafaSFbMmzhV8h3jQxUWeK+b1
         JwgP1C7oKAPabq4hjGnSrf6JssJmMi25jRRTSWnORHwFPY5ysgTdy6gUqDwnYTX8Nj
         EJqsFmqlJPmFyMz9sCNFBdR7XaaFEvOJw5F7qLHHqxUvkUTKrl2cU8Y/PmddA1FtC6
         D5R1OVxSI4H3g==
Date:   Fri, 8 Oct 2021 11:31:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211008113116.4bdd7b6c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ue/AVrvBkmR8eZuCDqPFqQr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ue/AVrvBkmR8eZuCDqPFqQr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "get_mm_exe_file" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] un=
defined!

Caused by commit

  f4f80155e6e8 ("amd/display: only require overlay plane to cover whole CRT=
C on ChromeOS")

I have used the amdgpu tree from next-20211007 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ue/AVrvBkmR8eZuCDqPFqQr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFfkVQACgkQAVBC80lX
0GykdAf+OcPxbBiQ4/tzuaKfJJuQleyO9W0hC/MAig66UlgZrEWcQk+EqcP7Z39h
g3VS9zgZuWCNmonMKGzxRLl1jg+RJzMKTmXSyN9zJ3HzzTc1go2D4qOsHxGCS6SY
48vBYeSoC7Bkns3TXqp8q92cTEFt/gd4ddodnGPJ/8BKJ4zk1DlULHe/O/x7s+z6
U7rG/ksxAvAFpSyplekEqNxoUoOoU5chyW4ibn7bWjE9QEXCBCpOyAMqguM195h5
c+LUdfWv6IUbi7pSpUhx96XziLg2ei5cGCFPUKSom//tNxmj8l+JzPEQym+NffVb
E1V9JoCTGvTEyQjTufR8LbnraBNokA==
=PL2a
-----END PGP SIGNATURE-----

--Sig_/Ue/AVrvBkmR8eZuCDqPFqQr--
