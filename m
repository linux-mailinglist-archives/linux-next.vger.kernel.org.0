Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546CE2F42DA
	for <lists+linux-next@lfdr.de>; Wed, 13 Jan 2021 05:08:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhAMEId (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Jan 2021 23:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbhAMEIc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2021 23:08:32 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0557FC061575;
        Tue, 12 Jan 2021 20:07:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFv6s4yjcz9sVy;
        Wed, 13 Jan 2021 15:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610510870;
        bh=cPCprq+igt09bDytTuJWW1YSwjM9mNKZqXRpo9xf/Wc=;
        h=Date:From:To:Cc:Subject:From;
        b=i34Nbfj3DD05TJxn9cQwq+FSy8IOty6PThdv5n02x/M4oT5Sj68njUgtIaJh3Ns9G
         DISYsqCEA1Z4JfoU37JfPPu3Hb0Z0bNWmW6pz2seBkwPIbpCCyRa+CHYPQBqrXGJTX
         Iw/3xn+L9x/cxz5046J2ePI7jzgdAMicuLbWjglShGQBr7EkFrHWXgD21yfvjfr01b
         1RQBfr7NSTSR1Dhk5d+nZfEyp/13OgUpLdZSnBBgFEx/isPBDyKbo5no475rKHdOzM
         dTtS2rJyG1MX/bc2WF3ANLP+v6CCI/VQHZCk7aNJsgkgqQ2HtdtsuHQ4Yr5FEKX5Qx
         VOjEPH7gMV83A==
Date:   Wed, 13 Jan 2021 15:07:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210113150748.1efc75aa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A=stXcj/=6v.FTDSelqBLqg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A=stXcj/=6v.FTDSelqBLqg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/translations/zh_CN/mips/ingenic-tcu.rst:61: WARNING: Malforme=
d table.
Text in column margin in table line 6.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         =3D=3D=3D=3D=3D
=E6=97=B6=E9=92=9F                drivers/clk/ingenic/tcu.c
=E4=B8=AD=E6=96=AD                drivers/irqchip/irq-ingenic-tcu.c
=E5=AE=9A=E6=97=B6=E5=99=A8              drivers/clocksource/ingenic-timer.c
OST                 drivers/clocksource/ingenic-ost.c
=E8=84=89=E5=86=B2=E5=AE=BD=E5=BA=A6=E8=B0=83=E5=88=B6=E5=99=A8      driver=
s/pwm/pwm-jz4740.c
=E7=9C=8B=E9=97=A8=E7=8B=97              drivers/watchdog/jz4740_wdt.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         =3D=3D=3D=3D=3D

Introduced by commit

  419b1d4ed1cb ("doc/zh_CN: add mips ingenic-tcu.rst translation")

This looks different in my editor :-(  I guess the font matters.
--=20
Cheers,
Stephen Rothwell

--Sig_/A=stXcj/=6v.FTDSelqBLqg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/+chQACgkQAVBC80lX
0GzPUgf9HtHTzlqiIIFckftFTCTuoKIAbG/j9OGh9HdfjB4ZhGsxbB3AtjF+P7gR
CrfZSXV0P9/EXxlpO9kTx1cfNKnHzHp+IN1L840iTx5+bGbSnd2SLPjT3LvaRUEK
7Dcnh9X18ubCB/lUqw9/ZpYt5bUn92aOzzsyP+4Ittedeu/u34EOh4S0jpz1LHPM
HS8CPd77ZVOUoQZjiKWc3dBiC6VnUEYr4NJYKCOgUA8cB4NvfRDj3cyGzGEsJBOZ
ZxD9gWku7zAo+2PkaHQ2Sb7F3p4r9aQy+Wl1h2NbSW1eZXbBWTFcDVXkknoXIbNx
Chay1EemPp2DjJsBphFsWsFhu67eUQ==
=U4p0
-----END PGP SIGNATURE-----

--Sig_/A=stXcj/=6v.FTDSelqBLqg--
