Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48A0202B1C
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 16:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbgFUOkW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 10:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730153AbgFUOkV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 10:40:21 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333DEC061794;
        Sun, 21 Jun 2020 07:40:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qZvk1hJDz9sQt;
        Mon, 22 Jun 2020 00:40:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592750418;
        bh=NG41RznDHgXDWCh34wo4br6otrAWXjsHBtb4OgawV5w=;
        h=Date:From:To:Cc:Subject:From;
        b=dgCmR4vW/3/xbjU09y+ELY9T7EfkajfHxWYTsAEHwxm9QCM1ljKg+7QxvhSeL33a0
         zhzzF9Hvfsh07t3vqlLTU5n2IzNF39/enWXpVozVfFclS6Qy9CCyKAGFjhL3COT+mA
         NhR8H+l3zU6Bix45Xv3nyVgoZDP5MG3+5hkcOuecb5u1qj3wzeiXHx6KbcjitDk2o4
         eSOADSaUJxh8J5vtlRO9uw7/K+qlITL5hBWWjBwPICQ4pZO3h8owhNOAtzx2xe5sOu
         dG9RMrQ7jIOVz846+4YHQTPlUJSV170u2jOSIQtNPFbRoaLms13uHau41wgtujZWCv
         LR41/9mjV+z6w==
Date:   Mon, 22 Jun 2020 00:40:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200622004017.5fc5267f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/18waSvELrvsqLvp=iuhZcAY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/18waSvELrvsqLvp=iuhZcAY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

WARNING: modpost: missing MODULE_LICENSE() in lib/test_bits.o

Introduced by commit

  37f7d07028d1 ("lib/test_bits.c: add tests of GENMASK")

--=20
Cheers,
Stephen Rothwell

--Sig_/18waSvELrvsqLvp=iuhZcAY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7vcVEACgkQAVBC80lX
0GwXvgf+IPHexF9lNlqL7FehQhs3pPNR43VzaMAV1v4OderWyEtV0fw9w1pq6CdC
MYxa9HOHebF0nXAjGFCMTlUmxXL/8M7ouShsbQgN3j/aUE0GvDwx4Q4OIjUh4Nkv
PO2o4Nd3CiJJElKOw0IBgCwxAgI07StVdwt4+faT+9/v8pO0mDWBlvXMjncR13pu
+6dwePQ4ERmtLfo+LcMJvNlgj8yBxvA4aA2AL04tAUoCguyUGxVdgHbFFCkCD6uN
AUvv8z/ejyWaHXeytcSOr7PDcphYYqvBx0qw87KeZUNM7u/jOZkymR3mWc12coaA
8n4RfceRRzCSrtCAN64MJpCTwZX2Sg==
=YPe/
-----END PGP SIGNATURE-----

--Sig_/18waSvELrvsqLvp=iuhZcAY--
