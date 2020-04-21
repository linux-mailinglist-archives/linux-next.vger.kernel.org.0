Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F04A1B1B37
	for <lists+linux-next@lfdr.de>; Tue, 21 Apr 2020 03:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgDUBWg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 21:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725774AbgDUBWf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 21:22:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F91C061A0E;
        Mon, 20 Apr 2020 18:22:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 495m5M5XBtz9sSK;
        Tue, 21 Apr 2020 11:22:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1587432152;
        bh=IA6k/aQmMtU9yFDUo72uEeFNFCXwVUw9eiRtA5EFHGQ=;
        h=Date:From:To:Cc:Subject:From;
        b=s5BpIC6qguieRaqKEKfVweCAwNG4jaoKa4Ay2bxjoLCukE9oggXFA0/EW50iaYFmQ
         KMBOxdnynXTw4KDETdO3bSvpkrc4jLfLx7jkrqdh8u/DAZJXJYr2qED0kYLze3PrLh
         uRAMfAuIMWrKRWowH+3kUY4qVf38iJUe3YaR/shdJPz3ULjMIWNb2tuHudBRmTo4kY
         HfErEdK5FlQsHT4e2XH/rTXKwyrrR7hg6PMVF0sdC6tPWS9/Rkt/Y8ROvb3C6tODDD
         at4QEkAjTbiOXWLw0aoBfU/hobkgLOi+O16sa7iZHTvuhFbT9HrB4XUZXBfonv+ZZv
         /hzgAT+ea+CDw==
Date:   Tue, 21 Apr 2020 11:22:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the userns tree
Message-ID: <20200421112229.27d3e8dd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hlQCf9tg0GMigW10VvpFeaS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hlQCf9tg0GMigW10VvpFeaS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e854a70f6f0b ("signal: Avoid corrupting si_pid and si_uid in do_notify_pa=
rent")

Fixes tag

  Fixes: 6588c1e3ff01 ("signals: SI_USER: Masquerade si_pid when crossing p=
id ns boundary

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/hlQCf9tg0GMigW10VvpFeaS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6eStUACgkQAVBC80lX
0GwCOwf+NpykuN5MDkxrCregYhgBcJOMhBR1oSt9BI1iqVw5/hW9C8fB+/gSvbT2
RDCut9YYzW/lvq+c8uxJbEYYw1vlQ/OJTg0ZeaGY8nv8YkhL/rrMBx2pgJ+mX4Kv
TuwURVYhYtqkV/p1jiqP6rSki2ziv32JUe7QA1/Wl6mly0Qnow4LdeGt2HJtSRJU
aNqkQ/chvvYuTG6RjhgKTpObn6bbvoGCdniE7BdDvPx9Psm1scG3zmpC9SN+G44v
vEJ7Y2imqKY3zKEOAcRDhTBHyo28GUmISVOumNc+CK36JmGhZVM/zn7dyqZ714UA
ikkOyFDAOQprb2Na96V5+G1io0BsXg==
=0MGB
-----END PGP SIGNATURE-----

--Sig_/hlQCf9tg0GMigW10VvpFeaS--
