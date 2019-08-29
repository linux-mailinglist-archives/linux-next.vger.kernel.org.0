Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFCB6A0EE6
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 03:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfH2B32 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 21:29:28 -0400
Received: from ozlabs.org ([203.11.71.1]:59819 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbfH2B32 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 21:29:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JlQG51kRz9sN4;
        Thu, 29 Aug 2019 11:29:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567042166;
        bh=tskMfJFI0O4IbFruMfr+cUXuPvwjE5vWKxjp7imadhM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QF1Waz4Vgz61lmDJ23xl8MdiJ7dmUfnZqYkXeKZvnLUQ8VGLw//X6OD2wcwjP6ASX
         1AH2Qm15LCI/i0evPATYVu4LsT7tI1BG2BDOa0kpuvlIAKAITUgnxEcnAchtBbSQJj
         +tjg3ZW/pM5bt1vZA50DU+G+Do9QxWYm7GYX3hmtBdLDYAMQvZETobzMgnsrXl4o8o
         uWMoboA5OJzd4p1r6xOUcKHbvTBzFexWGGGpoU0KeyxcOoO7IGTdCp6lCCkLv3u03m
         NjL6tsl44fbRyorsPho4A+HQYa8tsl2VYx37z3JalxMVMeStMEbaMKZuiorEUP050j
         xBOc8CXO4j+iw==
Date:   Thu, 29 Aug 2019 11:29:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Casey Schaufler <casey@schaufler-ca.com>
Cc:     linux-next@vger.kernel.org
Subject: Re: Please include the Smack tree in linux-next
Message-ID: <20190829112925.1a3a3dd0@canb.auug.org.au>
In-Reply-To: <5746b686-fd22-73b3-7de4-43282143396f@schaufler-ca.com>
References: <5746b686-fd22-73b3-7de4-43282143396f@schaufler-ca.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aKOitRyfRMUZ4AAvb+t0YRu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aKOitRyfRMUZ4AAvb+t0YRu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Casey,

On Wed, 28 Aug 2019 11:09:58 -0700 Casey Schaufler <casey@schaufler-ca.com>=
 wrote:
>
> Would it be possible to include the Smack project for-next branch
>=20
> 	https://github.com/cschaufler/smack-next#for-next
>=20
> in linux-next?

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/aKOitRyfRMUZ4AAvb+t0YRu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1nKnUACgkQAVBC80lX
0Gwvggf/Sz2Ee3C9ZdSx1z04yyLX1gmCK4z1dPZqf1kqYpHZETEDic973PKvnx+T
KQ7sbm6DlemvLtEnHGFrodz2ze2q9CRrg/qVDOSnCoMYK2++XyDZ+yb1ES5CJR7I
iy/pBAfxneNN3CiTB5bvFZ4eNz54SmiOQtQhmafQQJkJI7iZbjoVCpAZbHFXl1XB
SPBD28f9z/2jMRAvUhC++Jadg5p8I8+i5d8HQloH2BXIV5nyusHQt3lpIcq8B6fa
ow/FY6+jbu7wXlXw9uwBWflO5AclJ410gfO6sej9NcFkVO/rFJiz9LAUlBIELkgq
3fT3MSrOhYXpq3LdGNRufKKi/MxUhw==
=f4TH
-----END PGP SIGNATURE-----

--Sig_/aKOitRyfRMUZ4AAvb+t0YRu--
