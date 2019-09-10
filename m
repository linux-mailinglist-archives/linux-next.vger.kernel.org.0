Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85491AECEC
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 16:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733166AbfIJOZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 10:25:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40297 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733102AbfIJOZ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 10:25:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SS4J58Mrz9sP3;
        Wed, 11 Sep 2019 00:25:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568125554;
        bh=uq9UJS1CnW+1MSyChB0WEJsx1WRMMtR4z8ZvDjymjg8=;
        h=Date:From:To:Cc:Subject:From;
        b=rIyLsjh/Gn8j+AhvZ7dBzJdx3YsdoP0B9m/Ty+YOym2lQpM+TGq8oDZpgb+VtHaI6
         fsDaIZg/5grlnu0oR5odggdIRIw0mmwtKlNkSglSenOJzFUrCFZYarlLgmMIBO/Z9L
         HjAEew4Nn+V0/peCxhRH794LNJ7TTMCs8QLJPW+EUNLTX6kn1puXNBjrq3XMl8RCtX
         zQvFLovy3/W73lpqX7eKgXodglYGkvY5FDUAyBU1rgPzUYaBDVEI+uxkF9uH3kwry6
         nb7dzNiWaKG4HTLtfs9z8o01azEHHy03qIu4TiGeqWHiiRuVPc4MloukO421ue5XOn
         +kQL/Y2vSjfWA==
Date:   Wed, 11 Sep 2019 00:25:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>
Subject: linux-next: Signed-off-by missing for commit in the vfs tree
Message-ID: <20190911002528.47fbd3f0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GB//vjhqRiLw2d5ztMh/F+Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GB//vjhqRiLw2d5ztMh/F+Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  591b53ca2883 ("vfs: Convert orangefs to use the new mount API")

is missing a Signed-off-by from its author.

Also, please keep the tags together in the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/GB//vjhqRiLw2d5ztMh/F+Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl13slgACgkQAVBC80lX
0GzUAAf/doFEpYTPO6XF+c03jQVp9K56kY+2Bv/BxjKigFS9Kc2rW7/rMRLD73Vb
7vbO5gNwOvY4qycb3ear3GHa4iGfHJ6MyaooGCJB9WD6w2qjJM0o96AqkYmk8Bgg
hW3wgxZnEjBeLYOI8Ne39htXUkZ0ypZNdZlMwy47gSljxqiOX3g/YySQpQ98Xe2H
9/C/JH157LMVWMKiOE2ToIhkVLdsRzUKjd94gurL7JG1xllYpI6o/j/UUxLmvU3l
/CKQ+Mmhbgf817yWB+Ec0R71AA702IBhJYRCjMoawayzv2gz1gFHuVPqVtk5gmqY
kGJ7UjhhuLGEg5ThRiZ1FMYfndPiyA==
=Hedc
-----END PGP SIGNATURE-----

--Sig_/GB//vjhqRiLw2d5ztMh/F+Y--
