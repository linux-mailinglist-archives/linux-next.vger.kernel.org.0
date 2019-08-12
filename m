Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A448A98F
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 23:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbfHLVpL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 17:45:11 -0400
Received: from ozlabs.org ([203.11.71.1]:32927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726200AbfHLVpL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 17:45:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466qBq6fRYz9sN1;
        Tue, 13 Aug 2019 07:45:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565646308;
        bh=rEe7J5LXPR3Bzx5yRrLWfT587t2d294CWMNiWIGXH0A=;
        h=Date:From:To:Cc:Subject:From;
        b=hYNXPKmHoA0dVaa5a2zcggsRlPooNpWuVEK5vTCJccMnl1wu2K04T2/zUfT+tqVkd
         0YiY2IKacOyIKUGuW1l8+laWF7SD0LTw+WGF5LnbXPD7GMymcRHVOvT2x8a9jH9Fhk
         clqCWUXVm6HtOVfLryD4mEo5va8Fwm9z0F4H7fjmmQGlncHUqLnCMlqcmw3HES1tdB
         IIwjdbPV0NJyfAQ0XKLIaIwqYvlM0Kg+Bs1+U/HzeXH6oIQMBbJL8fPcGL83pxfY8D
         Lx0k66Uo8lJUBCMN+6QK+5F2hV7eYt1ZUYClyJzZ7asCCdJ5UVcELF88A1w55C8eBt
         aSu23QxK0rNcw==
Date:   Tue, 13 Aug 2019 07:45:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20190813074506.3e2ee2c8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qZu7HnNcDMRIIYz=EyaSqZg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qZu7HnNcDMRIIYz=EyaSqZg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  294fc7a4c8ec ("fs: xfs: xfs_log: Don't use KM_MAYFAIL at xfs_log_reserve(=
).")

Fixes tag

  Fixes: eb01c9cd87 ("[XFS] Remove the xlog_ticket allocator")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/qZu7HnNcDMRIIYz=EyaSqZg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1R3eIACgkQAVBC80lX
0GyQdggAiIZNkT1bXZlEiouHqcI/6K+Q5IiKQfem6//MqILuFjBaM62fwggQEtJ8
fblLTbCyJUYMO1TBrSir0FDBUU5Gs+xGpMS+Xt+wnCZzBBru80135pr+gIL/izxt
CtYYFR0fdUeG4soHg7gb0ZBSaYoSuMP12CD0IQjsQwQDaYL5aoWsFBBk1btUo89y
aUuWAFyIWiYOdUow9vZ8jVrtW+K4YDE2ejP2QkGyE//nxES00E08AScWtWIgFwCA
ZMWXRdgw9bd87XklAGOfyas86xVgVG6MJVrYiAdub+Xr0CJA7jUh8/vMH8TEWgrL
xPmns2M3UtU5y4FeH14QOYVjNEs1cg==
=VlG8
-----END PGP SIGNATURE-----

--Sig_/qZu7HnNcDMRIIYz=EyaSqZg--
