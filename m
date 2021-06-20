Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84B43AE0EB
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 00:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhFTW3N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Jun 2021 18:29:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45299 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229875AbhFTW3M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 20 Jun 2021 18:29:12 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G7S291B90z9sVp;
        Mon, 21 Jun 2021 08:26:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624228017;
        bh=CuNYE25Ha+xSJFyyBKVbL2zBvQVRnV4GVfUbY7arsGk=;
        h=Date:From:To:Cc:Subject:From;
        b=i49mC3X2prgSabAXwN72Dc6mPOX+IWg8LRm1OysqjuokQadlM/FNzJVd+ZNwlkSvc
         5e9XPYQAGaI9/+oaCZVoMzBYDcCGwi9Vpgyx+9zVKjXXM+6uoPxjxgcFbcGwV4nJFA
         PAET7QW/98LaXSK/ogUolygmoePPh/arYpoIDNP0GPTwnee2uPTUwe/+u6S1g0HaR6
         gNYPEn0LCYiun0mKvVDmkwSbYnD3RkkGGrqSu8PiHPv7hKbjF/wEvGiiZ0d7pq/3NW
         o5E1OGYXe8rR/TpiEXwpQR4+aTahUkJdP/W8lyLgC/uygP27QRB6HoM+BEAg7pegB7
         7rutQAE/iGQ3g==
Date:   Mon, 21 Jun 2021 08:26:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Allison Henderson <allison.henderson@oracle.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210621082656.59cae0d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QsW1E0sM2CQ10yYBNQLxOEf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QsW1E0sM2CQ10yYBNQLxOEf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  742140d2a486 ("xfs: xfs_log_force_lsn isn't passed a LSN")
  e30fbb337045 ("xfs: Fix CIL throttle hang when CIL space used going backw=
ards")
  feb616896031 ("xfs: journal IO cache flush reductions")
  6a5c6f5ef0a4 ("xfs: remove need_start_rec parameter from xlog_write()")
  d7693a7f4ef9 ("xfs: CIL checkpoint flushes caches unconditionally")
  e45cc747a6fd ("xfs: async blkdev cache flush")
  9b845604a4d5 ("xfs: remove xfs_blkdev_issue_flush")
  25f25648e57c ("xfs: separate CIL commit record IO")
  a6a65fef5ef8 ("xfs: log stripe roundoff is a property of the log")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/QsW1E0sM2CQ10yYBNQLxOEf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDPwLAACgkQAVBC80lX
0Gwsywf/ZMbJdsFMRs4iJJs9kEp0+nhNxpdi36Za4ba/IsORM8gYdX5sRMXCOW9O
OuedccjXKs63d5wCJoxA3Z8pzIT1LUqUxYPZcZ/i6NIBmU824+KnqC8knWX4Io8v
YB6P72Q15r85QHkSefWJbf4/pkZKbzLKEtBxBcjWv/S8vDwoavs/bPUpZ/HKFR6L
jPlJnz63+8e+CtoiR4CJIr4uYLxsgFnQVJMw7p9Fi+38IA1Pzu1yeK1ORctE5y6U
6U5jRjlHAeUS8UcmnyPbBAUBW/T3TwwSMadzk38U6kZZvsIcZzMu5i1O/QXkZB+s
vCkZXzc+FywcdpaMtgE+68bsDBAqow==
=W6M+
-----END PGP SIGNATURE-----

--Sig_/QsW1E0sM2CQ10yYBNQLxOEf--
