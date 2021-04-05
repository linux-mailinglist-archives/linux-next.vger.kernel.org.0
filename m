Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F38354885
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 00:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241322AbhDEWLV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Apr 2021 18:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242760AbhDEWLR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Apr 2021 18:11:17 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAF0C061756;
        Mon,  5 Apr 2021 15:11:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FDlGw2hLfz9sVb;
        Tue,  6 Apr 2021 08:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617660666;
        bh=kuRAZMiod34p+qN7n4pECrCYOBQe/yt4odU0uCY2FsY=;
        h=Date:From:To:Cc:Subject:From;
        b=ZgbMAGDHl3Kc7G0DJr6ampRF68fFcXaKXWR2zOfQ6aU0aMkEf4hg6hnOX/6sfIotz
         28ODIk52WBg+sVaGfYXBDgZnUHTivKobdfpmMKg2oSTn4s3uvVqm6AsZnJSzAxyu/k
         wHt6nnsKbykeq/gZbxVOH8o6pyc98tBqakmmaSRcGC4CAjQWVY/tHehkHCSvhS0kCD
         F7weCETqaVBNmexAzAGZM7FV5UnoAe8nyKA69PnT080pYRIOFDzfWwGTCCSOEVGouj
         tuHguN1yYq3+akyWrcTzzpPZLafuMECmu5l+o0ZpaFYeUe9s1GhIdTt+HtG5lDaOWe
         mfZq4wzSs0SeA==
Date:   Tue, 6 Apr 2021 08:11:00 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm-soc tree
Message-ID: <20210406081100.4a866aa6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M6zNGhm0cDvXwhJGrbV+FK6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/M6zNGhm0cDvXwhJGrbV+FK6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  3b493ac0ac04 ("arm64: dts: allwinner: h6: Switch to macros for RSB clock/=
reset indices")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/M6zNGhm0cDvXwhJGrbV+FK6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBrivQACgkQAVBC80lX
0GzIHAf/RETA4rxBkCQFWGBV7y7yA7magQWFzn3e7dMapzum674DUOSrsjd6eKIR
+Uv3HaKWHkuyEGGaYXx4oUHTQDa6Pmty9c2etAwdisEHLW5ZSiCkkd5v3a7euMu3
3e2hkKUT6dWKw08wL068vbl+YsEVlDpgBasH0bDDQ6pKq0k3DEWf2GarODjpSAjp
W+btACggrMdNqh6iUp5btt6fv1KoQt7EWE7H39AX0wHDsaovOVTeuREV2lHNxeFw
/O7v0Rmo+90+gMXQ3EJxCkWzDIXE1i1vXxhw0lT/qSwEuq8enHbAAxoAvSRtt7LO
OCnZCHre5V4s7f8AgL5zTudbI5B1qw==
=i0vB
-----END PGP SIGNATURE-----

--Sig_/M6zNGhm0cDvXwhJGrbV+FK6--
