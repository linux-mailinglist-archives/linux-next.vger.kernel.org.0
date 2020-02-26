Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D84F17094F
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2020 21:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBZURo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 26 Feb 2020 15:17:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:53763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727240AbgBZURo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Feb 2020 15:17:44 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48SRtX2Byyz9sP7;
        Thu, 27 Feb 2020 07:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582748262;
        bh=w8Bl+jm/s3dXNYwwhBW0f4fxyzFVtgaq08H1fuuT+Ys=;
        h=Date:From:To:Cc:Subject:From;
        b=cDSk6gAEr5Ah9XHv546qz2AGx81dzUVfwxZlNqcWKEWEPgQaUnp4zSEddl+OmgBhq
         qqP832PgTTTqLrLi2fbC+6S6rDOnjRkVXLYqQPlu8a50hxfJHYpMeoX2YhxyFZWNge
         KgelaWs0Hi+FL9ZrKfv2FjPKLhcrnauiLbQdpMiyXBC4RHGq/Fwu0hqu0Z+BOvFkEV
         o3xRg4I+Y8QxwW6vIztSU79Y5Sb6PD4GR1Kiu7foZHZjxHeXuT7vwA43+HtDESDYBf
         /Pho6ItdWLAQLFQcifFNUKm2IjB2xDO0dTOC6OslMzR2jmCQCfTCbJbiymYrvE9lvt
         FKDVIjMOGR+fQ==
Date:   Thu, 27 Feb 2020 07:17:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: linux-next: Fixes tag needs some work in the mips-fixes tree
Message-ID: <20200227071718.5aac4713@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tjWP9pweg6DvKRdwhhQ.f_T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tjWP9pweg6DvKRdwhhQ.f_T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3944dee0c6cd ("MIPS: Fix CONFIG_MIPS_CMDLINE_DTB_EXTEND handling")

Fixes tag

  Fixes: 7784cac69735 ("MIPS: cmdline: Clean up boot_command_line

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/tjWP9pweg6DvKRdwhhQ.f_T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5W0k8ACgkQAVBC80lX
0GyWBAgAhO2i3i88Bv8yJcvRjSPgKstNsKuS02T8mHX3CkOJLv36UEIK+DV8Xks1
Rt8ukgLZWiJgGa1R//b5swoFycgdbRm88nQjP6WWPKiSCU8iME0vvYLXTJwpjkOh
rJUaFNDPSx1WYqL1tq1OCfxCi/nOJLZNHFO4tX3RDHjCzHfFrOwHKO1gCcrjRlj0
hJBXPO38riaDAkRCWToU5xza+RqRKqU7OAetD3AS1tG8+GYZfQwciQE3U8GRVHtq
gQy1OzRRJQ2wYhhbbF/tU/KmtoscJz1CZ24kzjLrUjj5fEZSaHrsvbhLZ90e3Ic0
TEhwj7hPjbOIuTVGfNLGRJDCIz8cGA==
=aEhZ
-----END PGP SIGNATURE-----

--Sig_/tjWP9pweg6DvKRdwhhQ.f_T--
