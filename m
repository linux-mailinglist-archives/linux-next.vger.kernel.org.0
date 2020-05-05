Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85C2F1C649D
	for <lists+linux-next@lfdr.de>; Wed,  6 May 2020 01:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgEEXmN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 May 2020 19:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728717AbgEEXmN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2020 19:42:13 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1237CC061A0F;
        Tue,  5 May 2020 16:42:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Gx8b6X6Sz9sPF;
        Wed,  6 May 2020 09:42:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588722128;
        bh=2Jo9lu7OdYZOI6iSc1tzaW0Em95vOIvzYJQDOhcl41o=;
        h=Date:From:To:Cc:Subject:From;
        b=Y1drQe+0/h1DS94E51D3Sb8ha64u4YDEE7zzx4oDCRrfN+coHsCzxIiiTXRKZG2x9
         ut0w40wnbVSrw79G6x5oh3jxUa9mIpJ/QoyPpO5Zr15ZUpDMqpjLnnsBk9TBk28pol
         LRT7WIlOlC4vfd5sNca//r4oWW9NNziGb6ih+ESdcNKTanxldUwsQSJYaNOg1DtQd7
         Ad/xI1JEtTw5IDUsuZMwQgwvTBbhkS0DzLbzj5TFw7dVn4VFOScv9JROMapqoVisCl
         AA5+9HoaR/XFiwXY24k99i0hkryTUsxngE/i9dl535jDeLJLEcsoVRopt37aldqFYd
         B/1u799ZXmHNA==
Date:   Wed, 6 May 2020 09:42:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux-kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20200506094206.068977b6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V7Oyu_4b2KNfUO.v+lO9MJH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V7Oyu_4b2KNfUO.v+lO9MJH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Normal service should resume tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/V7Oyu_4b2KNfUO.v+lO9MJH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6x+c4ACgkQAVBC80lX
0GwJWAgAgNTC7as6KeLcMjhctjwexT1xzCNQ1jHplfk0YInxZ+42zjLxlTEPfNNU
JBcBGSKBtz30vahF1CooGV6LLbhVV22MMSxNs0MmyH1lYkaBvPdj/TTC/21fzwAd
HZJJ9GUHcxJme5CBBfe8KHAsVMN516kB5iOCa/43WzCE3N3HEJnfnt4qpnIIWkqG
bO1OEAspq12kT7D53Hpfr6JpGEVneDwQ82v3K/g+rZV31R5gkPgQjkGYLa1/IpMm
J0nC1uVql9UBDU3s62LStKDy4Prf8qWMPbwBr5iISMR3GjtmnJtq7wXQ3iCxygpH
g5MVTK30+rM0wQQIzPNj6fC8kYHS7w==
=txAH
-----END PGP SIGNATURE-----

--Sig_/V7Oyu_4b2KNfUO.v+lO9MJH--
