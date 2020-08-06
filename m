Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFDD23D6FA
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 08:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgHFGpI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Aug 2020 02:45:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50699 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbgHFGpI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Aug 2020 02:45:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMfB96mJxz9sR4;
        Thu,  6 Aug 2020 16:45:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596696306;
        bh=7/xlpJoxq3E+xxtklotRMYDoQWqHhPskpcJSlFOw/FE=;
        h=Date:From:To:Cc:Subject:From;
        b=sW3dIafVLjc9oUBNlFW6Mt95Im09NmmYm+qpOvCmRBrrxXokpxOhd4zvkOq6gTB3x
         tZCTi9govX1DUY1Cz1PmL+4glrGKhC1/c9dfo+/tphyZBeyfEgu2GrCReIQFHjh70h
         6RSwwhwxtKkCkeG5zcMwCcqUSdteoeKJcHQOraA7QvbUwyZus7VnrCrupyBuKYJEqi
         DmZ1AYmwqyr6VrRQt67JPluDHzMxfEuB9+qIjx9KYgKMPJ6WOKMfZmn8G6onsOhsOd
         dx8eOJy619q4p0RO59fiI9VdIdxf6etUqaCye5IYCbfosJOtaZzHXxPXqxHeAwi4qt
         G/FguN0JC1LxQ==
Date:   Thu, 6 Aug 2020 16:45:05 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20200806164505.0eada105@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w7r+KWZmbZgQLSZbRRBQoEp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w7r+KWZmbZgQLSZbRRBQoEp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2676d210d2f4 ("cifs: Fix an error pointer dereference in cifs_mount()")

is missing a Signed-off-by from its author.

This is only pisked up by my script because of the mangling of the email
sender address by the mailing list it passed through.  I guess a little
more care is required to make sure the author attribution is correct in
this case.

--=20
Cheers,
Stephen Rothwell

--Sig_/w7r+KWZmbZgQLSZbRRBQoEp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rpvEACgkQAVBC80lX
0Gx25QgAkjpPfnRhXfssBJMUeVWcCTujG16TXok8AUIVu6IM6nkVJJ/cw6Pei9VM
oErz/+Cm8n4lbrxDhJrUSaP8c3YXs/DLRCu+H7KKo7NswWgTQP/Ue7Z415JRtnJ9
CHa/ErYA08b4VYMlmM5WH8jZ/wYFHjYJTDq97aIsTYzpPF2vAPz2syzQqJd9Z/hH
EP6kErYrxZprNNrL4Lioonif3dddXLUzcLyjAsKG9fcVOfK0ATu1ymhtSnJAjzZQ
FOxP9ZiDLDMdFMahGyu6+kBjbu3HQo0gWk4/bsSZd86f5nchmOvSTdhDdcsZISvs
kZCZV5wW0kBe6eYbId999LHwByVq3A==
=37Us
-----END PGP SIGNATURE-----

--Sig_/w7r+KWZmbZgQLSZbRRBQoEp--
