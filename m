Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E423299AE4
	for <lists+linux-next@lfdr.de>; Tue, 27 Oct 2020 00:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407533AbgJZXm0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 19:42:26 -0400
Received: from ozlabs.org ([203.11.71.1]:53783 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407529AbgJZXmZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Oct 2020 19:42:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CKrwb0562z9sRK;
        Tue, 27 Oct 2020 10:42:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603755743;
        bh=RjmCqO2BnA4TuUQaHh8VtpB6CSW2j+Ct4Fx0s9z9wK8=;
        h=Date:From:To:Cc:Subject:From;
        b=OAEdhCnJRtYXRgOOcfdOWH62t/0dZ3jvcO3Wubm9B1Sw0CzYmIfHBet8/QXg82ZH+
         x3sQgX2Bzj+EA8kjkt750Q7bt5a0wfOfsn4PBHtygE8FtPILyTe5sFtgxf5iV3N3ia
         gicKj1ELadRjHpqF5iinEFEpvBX+P6pAxphIHhlsByHYTMGt8ZqtucQ8HOBJcT4tTW
         Tod2R5Fto3ey9POtKonejhgxa4c9gGPmaEQsPp9xpJpYuGVuE6rSIuNWQuFR/rz2ko
         7WpHYuh14lnZYaB0WDvKN6kLAWXQoEevEUxOtQrQXNb0a9odyWetJgDLtC1TwlUvGK
         kXCLPqxMYJOtg==
Date:   Tue, 27 Oct 2020 10:42:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Yu-Tung Chang <mtwget@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sunxi tree
Message-ID: <20201027104220.0c8167d0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XNOYqW7Z48YmYNK7Ct753sp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XNOYqW7Z48YmYNK7Ct753sp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sunxi tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/boot/dts/sun8i-h3-zeropi.dts:53.25-63.4: ERROR (phandle_references=
): /gmac-3v3: Reference to non-existent node or label "gmac_power_pin_nanop=
i"

ERROR: Input tree has errors, aborting (use -f to force output)

Caused by commit

  89cfb6d76fdc ("ARM: dts: sun8i: add FriendlyArm ZeroPi support")

I have reverted that commit for today.



--=20
Cheers,
Stephen Rothwell

--Sig_/XNOYqW7Z48YmYNK7Ct753sp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+XXt0ACgkQAVBC80lX
0GznwQf/QwXYNlsLqNu/qM7tJxKSsYLbxs9zwQpb1pRj46eugl/T2Q9X/oZUC16s
BUIAIarQ9pEt45NlvMT50Kz8LTL8AA6sNJxpevUAefWJqvcW1KxRuWYEmp5BRclM
ZCCtVKxFs/i4HBTbMwkSVvfp3bArNHcJVcj+kAMFRXyd+oO5zpfr7LHSa2sRLPar
wqTf3Rti0WHL58onMD5U178V6EnMBgIV8HA20pwRDChafQCW/mrhGNyTDR/KAc90
A7JwQoQMtGsfBcI/zL+pDIxzvazMWBln61F+dUceV51QfAaAA2QvgFX69xYqRfpy
uvcEyezEfzhzbfPIZqJGgpFk+Y9Sbg==
=9ZDu
-----END PGP SIGNATURE-----

--Sig_/XNOYqW7Z48YmYNK7Ct753sp--
