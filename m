Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE06141D4DE
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 09:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348806AbhI3H5x (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Sep 2021 03:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348882AbhI3H5w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Sep 2021 03:57:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D61C06161C;
        Thu, 30 Sep 2021 00:56:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKltH4WdDz4xbL;
        Thu, 30 Sep 2021 17:56:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632988567;
        bh=eJSxc422N4S6NxP4aHiLKvEainyyOnG2Qns8rJFNvT8=;
        h=Date:From:To:Cc:Subject:From;
        b=htHxF1ZXsD2hkjHXYt5ESH33Xh8xpqzzvKKA+ywQDYe0rmg2JfgIu1+8ZbEYg5+Ja
         82XmcVWuKigkUofNd3XrdQF4HXym1z242YnQlnGF81Yjn7tRmeqMDkWPZEV8ZiTIBk
         sxmlE59GxoCLr0FlZTu1e02bBiAFlwvG2sIsZf7v4h9YOSsfh1yX0znMJqOzCb3XRw
         FlEnHn7DfZu1JssBfXj/mZ+DsdriG2rw6SmUKyWv2ojJ81KQZfLRbATG2/jNpC0A+5
         m851rb57thEPOuG5rd0slVQP7IeC8vTLVESWjYc+FUw5cW9i05EacuorV1NBoucEms
         M1ac/pqw3rDQQ==
Date:   Thu, 30 Sep 2021 17:56:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the ksmbd tree
Message-ID: <20210930175606.0d59ce6d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hLT_UUkpfeULsvqr08cpScp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hLT_UUkpfeULsvqr08cpScp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fa8050db505a ("ksmbd: fix transform header validation")
  1557419b2a9d ("ksmbd: add buffer validation for SMB2_CREATE_CONTEXT")
  b9abf3609fc5 ("ksmbd: add validation in smb2 negotiate")
  53e5d1b230f5 ("ksmbd: add request buffer validation in smb2_set_info")
  8e52566602c0 ("ksmbd: use correct basic info level in set_file_basic_info=
()")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/hLT_UUkpfeULsvqr08cpScp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFVbZYACgkQAVBC80lX
0GxBhwf8D+PBo/IVhuKsBHmfiuJgcvPuJCAPJjQ6bxS0kQacAzUb/+w6y5nuOSvT
Nm72dUMXsi0q5CsFsTI6Nv9RaOWHisjhNAZvIMCxE1Vwm01RLkqRkOHydA+oxqBi
wY0lpHiadqQd3qRF/xtIzFTpCr+IrpjwoA1apHv4EOiXu/gqwRxO09Z1tSAUNo4y
m9SNnwJw7GkAhUqG9GkjWrgFoyrB0ZBgspz3Pj5Vv3Qwmqo2A5txlyZb2FR1Knih
t8ci4wjgouLuFSDjBJh2C7v/NC2/Mv3WRk/CeNUR7UcCPNb9S9Liw0rvvQTdkqgC
NTfj/6Ss8Nqzc8+NJXxWaASPMLKe0A==
=FhNh
-----END PGP SIGNATURE-----

--Sig_/hLT_UUkpfeULsvqr08cpScp--
