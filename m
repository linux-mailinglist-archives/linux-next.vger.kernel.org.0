Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5D7A1BEB72
	for <lists+linux-next@lfdr.de>; Thu, 30 Apr 2020 00:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgD2WGZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 18:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726481AbgD2WGY (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 18:06:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC6EC03C1AE;
        Wed, 29 Apr 2020 15:06:24 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49CCJs1VzRz9sSK;
        Thu, 30 Apr 2020 08:06:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588197981;
        bh=llel0p769tM009nqjF6teU3n59YzZG+i/iE2Lrn+Vv4=;
        h=Date:From:To:Cc:Subject:From;
        b=lGqjPQl/b94Coas8Sai7PLNn6jFIT2GhsyOfRGewjx/UlnvpFjJj3LdnjOjFKYC1o
         N1b6N1pBRHo3OsbwWkG4auASbGFSpws5wUU7QnZb9/jctFS+jlAIksRJzMSBgLmb8S
         cY8J6DK1uc0Wu8fBIiFWRBqoAyr89sRVeUjXdUoXEFYSkhsawx5KCaALnCLBsLDmHL
         TYFdc662LGP74wx9hDCbFCKpxLRkUw3dW0j1yMC0vXcF1DgOl1IFgRhdQUSjCYBMVN
         4VulGO3jgu+/taK4ffF7lRQVZ6FhPJ1op2ZWyAQ2zoxdvh3vEG8O8UfZf9Na48zLgT
         FXF4DdSF41Q9w==
Date:   Thu, 30 Apr 2020 08:06:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Gerecke <killertofu@gmail.com>
Subject: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <20200430080619.67ff0ac0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/922d1iaYv+dtd8Vqc8DfX=A";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/922d1iaYv+dtd8Vqc8DfX=A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  dcce8ef8f70a ("HID: wacom: Report 2nd-gen Intuos Pro S center button stat=
us over BT")

Fixes tag

  Fixes: cd47de45b855 ("HID: wacom: Add 2nd gen Intuos Pro Small support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 912c6aa67ad4 ("HID: wacom: Add 2nd gen Intuos Pro Small support")

--=20
Cheers,
Stephen Rothwell

--Sig_/922d1iaYv+dtd8Vqc8DfX=A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6p+lsACgkQAVBC80lX
0GxFYwf/aWR2OAMTFV6BSI9P+IBsSVZAxw7cNAYJ2oXNwH2P+0T30Qm+GVaHmcVl
mNHKIvLyue4mAQwvKj4WAKP9KZwD5u1leRmNFICGzhgpvjWKFC8WARashuBNGndc
W55OxlYrfkF2tmCThBQ85jLGoIHrJscdV06iiVpXrbMbgHJZMiNovZjsfFwllygf
ZC3QHMbi1g9hBozuNOPZN4PDcbbQ9tGoAnV7SMQtU3vmPuzs0KtJ40bJDJDENbBS
xtQhma5aivY7za4gU8h8spgi5QikZ6R4+n/2rQuSA+SWKF2IN0WlfRHafc4Uexzi
3uV5fbeAWyYVZLs4TKK0q2O4Lg1MkQ==
=hwPD
-----END PGP SIGNATURE-----

--Sig_/922d1iaYv+dtd8Vqc8DfX=A--
