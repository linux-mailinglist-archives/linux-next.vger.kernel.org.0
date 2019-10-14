Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54FCD6AFA
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 22:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbfJNU7I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 16:59:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37867 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730335AbfJNU7I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Oct 2019 16:59:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46sWBd3cjmz9sPV;
        Tue, 15 Oct 2019 07:59:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571086746;
        bh=w8DUqDb5jEsY+AX+Q+H1OtGM3lZTCPKNh5jD9PmlgnA=;
        h=Date:From:To:Cc:Subject:From;
        b=MFaIscCbSn5M3L7VWG6kMpVGTQlbk+f3VugIjfkkJw/0s5mO7lQYydQsFjuSwFu+d
         NaFGC/3Bk4bhFLc+ActD4kmNjBSLc6lTWHIFCUJN1x6q0PmtwEkYj7iknb9v8LQ3Dz
         wx4YSS2zpXqciIwqb6MpswtPxT9TXLQgSijvYFcF6h4J0drLzcZDQibTDdbeNiMWwf
         ccKykpSiQoLuyETbg68ZIVrJ3T/3HcySA28gcIUC3HkWgeyu4mbvFJX0Q6g8FizAUW
         HOicU674dQc4stmWz5ggL4te07FBGzcR5eP9tA2HLy3sCkm/YD/lOFJv/2hpv4bMJ9
         t0Rj5wGaaQaxQ==
Date:   Tue, 15 Oct 2019 07:59:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20191015075904.6b5adcff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eM_f_lhAmw+jp3bqTr5YSMd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/eM_f_lhAmw+jp3bqTr5YSMd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  b2afd668c323 ("ACPI / utils: Move acpi_dev_get_first_match_dev() under CO=
NFIG_ACPI")

Fixes tag

  Fixes: 817b4d64da03 ("Introduce acpi_dev_get_first_match_dev() helper")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/eM_f_lhAmw+jp3bqTr5YSMd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2k4ZgACgkQAVBC80lX
0GxS4Af/TgW3ixOugdgNIBqPsVSclvcAyzVSi3/+GW8MbUoLAWH53Xvm76bTYI9D
RDfi5suiQXawfiPrNg9eZml5Re/9ASn/p6ujWPSDQ/ZdmqufiklUFbtFroNy5E37
jIInury4/zX7fk7L2L6rVTNSTtIB2iUmQu5h53rKpvkNJXdHP2J3ddMDRsKrC34C
4jclGGuuvbZW+E6fmvMLdbfncN0oSCCtu8CLypOk0F3dxLnQc3gRyLoWat47bJhl
vSVW6CkUrXyx0RNZ8zkTkwfFE5sdXGKz+ikWlTFeEnASFYsjb56IjxdY2D7VC7pz
oL5wCItz0F+AD2XPLhzu/1NeIXo2nw==
=1Yw6
-----END PGP SIGNATURE-----

--Sig_/eM_f_lhAmw+jp3bqTr5YSMd--
