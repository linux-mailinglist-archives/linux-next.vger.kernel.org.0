Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3C0258AA8
	for <lists+linux-next@lfdr.de>; Tue,  1 Sep 2020 10:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgIAItw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Sep 2020 04:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgIAItw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Sep 2020 04:49:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8357FC061244;
        Tue,  1 Sep 2020 01:49:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bggk36491z9sTM;
        Tue,  1 Sep 2020 18:49:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1598950188;
        bh=OS5jYEkx/bz+JtpadafYuUFnzUgrYohCxZLJW5RQ2h0=;
        h=Date:From:To:Cc:Subject:From;
        b=Dr4efZLrMZws2qF5Dd6XeW/rTu9RR2pFTF2ahH53nKWwQwk4F7xEpkoUyCC63Oar9
         zrAqryGgoP9b1sHPnOhglPIbdz+SIXswCme4UKELAzcne+RQydYz3TFGu+u0y98FD3
         tAxzLcuB/ofIzXbipWONF6u26CqOYFQuTcKqu5q3fgfPLiUMkP4sotMspllTnIoM0E
         eXjvJSib1p622KwPQgEUWrtblE1yZWYhcy+k2gLXxbXdEz009hgmsSE2rhYyHZfLG8
         VXLjBj2/YnvLC2XQJ+0uTN/ARZ4qo1ko20CPah3xh2i1/gbzg9WEfhMItH/Hov7fy+
         cubrKqrvwgamw==
Date:   Tue, 1 Sep 2020 18:49:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: Fixes tag needs some work in the arc-current tree
Message-ID: <20200901184928.057f6082@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+gqfVyeX5wILx==AABy5tQ5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+gqfVyeX5wILx==AABy5tQ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7000c9462d1b ("arc: fix memory initialization for systems with two memory=
 banks")

Fixes tag

  Fixes: 51930df5801e ("mm: free_area_init: allow defining max_zone_pfn in =
descend ing order")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/+gqfVyeX5wILx==AABy5tQ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9OCxgACgkQAVBC80lX
0GzOmQf/fvIechmbewtjZgVoZVwhQrCe1Us2G2yNRkDe6zFP0iMdRw/w64RsrHOV
UXsLslz9NTSRoDAQM3EoYF3mbO2j1sFkQDqXMP61cj/Qrv5pf1NmZTDpzgUbCp1N
y0d7sx3E/+fMT4N2zayY/7ILKKGz9xOfpeXH5exmB6mCUWYb72MYNRUNnx6FqihZ
hxFlttbKHM+fmrwvbN7gVaD+qfwHET40et31+eMBxGkiFGIK/2Z3VQszZtoIKu1N
+aUWdBDDCqT0qbhqFQ/9gLinVeeZsSsO7g4WtRm16zT2hfFExiPZkGst2RnsnHMd
/hGG1kmmEwhLoM9Ot7x4V1gKzY3IHw==
=r+3P
-----END PGP SIGNATURE-----

--Sig_/+gqfVyeX5wILx==AABy5tQ5--
