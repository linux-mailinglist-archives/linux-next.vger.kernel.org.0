Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD6D9105B00
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 21:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfKUUT1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 15:19:27 -0500
Received: from ozlabs.org ([203.11.71.1]:37673 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfKUUT1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Nov 2019 15:19:27 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47JrWK2nGDz9sPf;
        Fri, 22 Nov 2019 07:19:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574367565;
        bh=3N87yUeqrZg5ZwLLtfLJ9ViubbjCA6czfsD0tOkznZ8=;
        h=Date:From:To:Cc:Subject:From;
        b=d8xUkNw75kpJJJZMEZGudoi7UYKr9M2ySLMAhwM58IS2qyJAk5Oejn5YHf0XUO3kO
         bUFrcEEyfRMuSmfThAHe1ZU/4QMiiviAOr4nnaP7Lcw0wVI8JJRbP8cDJPJ8Z0UBFo
         bsgI6xx2CUmXVBHPnbIdtIyfZSfKV+00ODO/Hd4hOBbtAeOX0+ysszRQ2Ow0+Ozu3V
         RID6stCyayf/2JZMoI+v563fWGhlXd5rnd08vhakaQnX47zPO7UmwzPHs4/HjjNfKP
         9xLqJc3tjLwqRHu0CJtOQNKBY7QK6tCeEkN3tjd6zldYy12LY45HJEKndQjnmSBb1v
         V6oe8rCGv3TeQ==
Date:   Fri, 22 Nov 2019 07:19:24 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dominik Brodowski <linux@dominikbrodowski.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pcmcia tree
Message-ID: <20191122071924.50f1fa52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fBjqzIx8Qq/+x_zgiWtVFBH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fBjqzIx8Qq/+x_zgiWtVFBH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  59558fd909b0 ("pcmcia: remove unused dprintk definition")

Fixes tag

  Fixes: 836e9494f448 ("Refactored dprintk macro for dev_dbg().")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/fBjqzIx8Qq/+x_zgiWtVFBH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3W8UwACgkQAVBC80lX
0GzKDwf/fkP+biuTm8gsNsQX5oumLfO0t8ymNxnCtOI9NTkSyucjFzjZyyNZYfry
1OWrnTgQTeyNCqaIxmmSPNAk5yTiiKf3FLGvZXTWX9u7cz5r2gluq9u4ogmsIG8x
1og1aOjMwH/6Ds0Nxb4i6iE1Udba2pDsNWbGGYBzYPCiaWSXfd4Qn0yk9+6SHXRK
jaXbTBIMGTVfFslWIO0Lpwh/pwh8z8DPjXF49kzoFgUmuRnC3sfAr/lSj1ooFoi4
el4PS5QTl3FQVLG+xA/Y3mZdmBmQ4rfteCIYEXVorXm12pfNunVdL0btKpVfzckU
thKU4PUaB7krWI9jveEBcJEDFlL/dw==
=/ioD
-----END PGP SIGNATURE-----

--Sig_/fBjqzIx8Qq/+x_zgiWtVFBH--
