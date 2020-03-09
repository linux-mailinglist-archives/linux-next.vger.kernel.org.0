Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D657317E148
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 14:34:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgCINe6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 09:34:58 -0400
Received: from ozlabs.org ([203.11.71.1]:57213 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbgCINe5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 09:34:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48bfNG6J86z9sPJ;
        Tue, 10 Mar 2020 00:34:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583760895;
        bh=AltDo9M4fmtAGo4MuZpe3IL+JKXOUDDbG5Ju5kWPlzU=;
        h=Date:From:To:Cc:Subject:From;
        b=HUKsGOZNoD/te05QzCuOH5xOMAGmE8JRbKNKkpaTXJ1ZzKV5vbXa0raElhp/ZT957
         o3iMUYMaLV81+C4vf4400rdAmIVw/dIO3Yj0RGgyHXJrOdQHK14jQQt7CUDpVNN6ew
         A7aVDV5C3DwPQ2I9JWk0a5J15KpvDeck0Kuh6RUx3cUzNrnY1vmEdoeiQc2kRNPXQA
         RDht92uRhdMvHu7BNQZursRnGFiw3VY8drRhW7YIm7u/g/xHKOgjknQt5K3W5B6bVO
         ZRdelHNVYTs4j6EAFEEVunBthX98KCK4bmTjOiOrvFG/f7znD5TVS5R0bnhXhIQrd3
         nqOCOt0X0ginA==
Date:   Tue, 10 Mar 2020 00:34:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michal Simek <monstr@monstr.eu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the microblaze tree
Message-ID: <20200310003444.50d98639@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q=ETE/5qIJmjC2kZiRgdeYz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Q=ETE/5qIJmjC2kZiRgdeYz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  299c61cb37fb ("microblaze: Replace setup_irq() by request_irq()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q=ETE/5qIJmjC2kZiRgdeYz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5mRfQACgkQAVBC80lX
0GwtcAf/Z2CxfR3xoP3bIYlqUSH57eFGqlmYokVnfJg2+jMXhasG7dmChKrBj+iE
uvyTMS8Xs0ytkNbocF22v0NF3w6KB7q9WNAQ2eKm8ycOw0lHh+WVy3dE3cVrSuOR
d/OFJsVoQDJjp/06L6xpTvXlXaE5/eXaqAJJmgOKIdoqRpxWvidhydUs/Whtvdn3
BMfKuiM90iUwVa8jJceQD49eTScPcRjkk+TlLxXTuWKdVW/nc5gsP6eEatus+X0l
OJ5xG543gIr1hZbyNbotIPm5lnVWIUx9c+78+kquvU8iAWbBOAHUkT0gytLhWbuK
uV7ADACUieNitNHchEEKMbGmtW1BPw==
=psrd
-----END PGP SIGNATURE-----

--Sig_/Q=ETE/5qIJmjC2kZiRgdeYz--
