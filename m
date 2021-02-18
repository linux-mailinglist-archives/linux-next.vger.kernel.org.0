Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F8531F179
	for <lists+linux-next@lfdr.de>; Thu, 18 Feb 2021 22:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhBRVAC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Feb 2021 16:00:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhBRU7i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 18 Feb 2021 15:59:38 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhRrw1S1Zz9sBJ;
        Fri, 19 Feb 2021 07:58:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613681936;
        bh=QZmrNoUiHrUHOZbgMkUkeCVI5lmFPhODzWot7rpjZiM=;
        h=Date:From:To:Cc:Subject:From;
        b=n9H7ljDXyJO1LQC3SDpkXJ+xGGfVOIhitEQZz1o4pck+lUobqLt877PhZesVNiFhS
         d9pEWywosU9NmP17ZXuCCsmqQA/9JsuhJSzX4b5ozLAmtpd7eUBLvoukwmT5zsrlej
         OEeqBRMe9dt/XOQDud4jEtoLZ7PlQU2AKIw5iwDlFvsa9jsrcB2FJar15iBMn4XKtK
         h1n8JyH94PlxpWfLXbyA194mOYzPchITlejD6J6AIzTv8AR8B/KsobU5vj4BP+EAOD
         HA/dQdHJIj9Qm/idJu/A/PJDzx33BeE3MAOW5zqaNT+xLiUgFVCiy+5SR+QG1EKodh
         0uvMdUDTvehBQ==
Date:   Fri, 19 Feb 2021 07:58:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Justin Ernst <justin.ernst@hpe.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20210219075853.0514c9f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gid4EuZzXzY+gJs8ME8EeM.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gid4EuZzXzY+gJs8ME8EeM.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpected inde=
ntation.

Introduced by commit

  c159376490ee ("x86/platform/uv: Update ABI documentation of /sys/firmware=
/sgi_uv/")

Or maybe an ealier one.

This has been around for some time.

--=20
Cheers,
Stephen Rothwell

--Sig_/Gid4EuZzXzY+gJs8ME8EeM.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAu1Q0ACgkQAVBC80lX
0Gy/fwgAl/ImXhty0H2kgp1MpIJQcrku4RJ2YpHbgVO+7ztL7jNFw45oObtzjnEo
iB+SibP465wZs93fRQqjYyZ1veW2chj9w1UTbKiB/Hqv6zJINlOyLdI1OKNarIVX
NTsj56vbtmxK6L0CHFzJ1reaNgzz9wWwGhj38/dT7t/BMK1EKRKzwZUahnoWp1Tl
n2aLVfST//Bc/FUW6+T3BhOYQTEYVBAerUlB25wXt48OMD1Rtc0h+u+cWfnuEwwR
lYIX6gyOCfDLp5k0iOY6YG5cBiLBcoQo0j4WKUm4mN4EMcJ3T+8gxyeLkZl0AAW2
mkymlcSlIxya9rdKTeSUk+ztUbI7Bg==
=P/JT
-----END PGP SIGNATURE-----

--Sig_/Gid4EuZzXzY+gJs8ME8EeM.--
