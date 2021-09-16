Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B88940EDB3
	for <lists+linux-next@lfdr.de>; Fri, 17 Sep 2021 01:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241216AbhIPXLT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 19:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235393AbhIPXLT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 19:11:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FC6C061574;
        Thu, 16 Sep 2021 16:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631833796;
        bh=9kUrgE3Dv3FDzQP2lvjRZldZl6SOjL7yPlltV5u0MQ0=;
        h=Date:From:To:Cc:Subject:From;
        b=jE5O/tVo02mXPa87evd8POzP6ThhemOyHuEHbKAfocBpSacsuhsgtlyF6UU/ztgDg
         5ygGbhs+7PdA16UDeUUz6mc3DyCDHQAYX/22uqSy1Dy4SJHjVyS0+6LDd7sUI3kM/Z
         Otqqw94KR1PxTaDY2d9zLzVaugVJho/G4hQJHzQ2de8wngwyx/4lOMpluUwQRXXt6G
         Fo3UGFoEFZCzHiYPQY+U4JKuk8PeBlFC7SvK7Wmjk9gBYBbNOaS96+BKXu8L0J52XP
         z7Mzp/g6K9+xpJ9z1+F7l85xZ6VFSS1UPg0S9rXguyAbiylym7OdTKX7CwK93n2/Yz
         bNPdm/kFA/mGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H9Xq802s7z9sXk;
        Fri, 17 Sep 2021 09:09:55 +1000 (AEST)
Date:   Fri, 17 Sep 2021 09:09:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the scmi tree
Message-ID: <20210917090954.18071850@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2Juw5/RYLdYdJDAErtt6bTG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2Juw5/RYLdYdJDAErtt6bTG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scmi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/vexpress-v2m-rs1.dtsi:107.3-49: Warning (ranges_format): =
/bus@8000000:ranges: "ranges" property has invalid length (20 bytes) (paren=
t #address-cells =3D=3D 1, child #address-cells =3D=3D 2, #size-cells =3D=
=3D 1)

Introduced by commit

  bb3adfb3bd70 ("arm: dts: vexpress: Fix addressing issues with 'motherboar=
d-bus' nodes")

--=20
Cheers,
Stephen Rothwell

--Sig_/2Juw5/RYLdYdJDAErtt6bTG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFDzsIACgkQAVBC80lX
0GzaGAf/f/pODR9SZ9fwdoNjwTWtc6zJokCnmN/n+lsahkN4avgp3vGEe481aXMw
ausXCWBgUgRDfJE/F55qlgAYGsU1weunIF0x6Hz0tkOzcCUJ/FzCN7q8Tke+JlkM
PbkDNtfrHJSt4zp1z+PC2wePb5QuCdgG3pvJKS/v52vY8IsogizHKzgBrZOaVSz9
fI6RaBK14PTrFtxTzon23x2uRW3pRX2dvj/EoGa3I4sj+AxglEf1Ctcb3erko/Go
p5YX13tx34f9aIzEx6jewbdFfwSWOudH7Do9uAeHq1Ob9S5FXB3vryDU8UKeNjOX
BvU7sa+0QI16kpDZU2QWgYst2OTp/A==
=rMGl
-----END PGP SIGNATURE-----

--Sig_/2Juw5/RYLdYdJDAErtt6bTG--
