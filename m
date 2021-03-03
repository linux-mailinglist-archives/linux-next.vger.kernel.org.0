Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5BB32BB74
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239414AbhCCM3V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237577AbhCCGEf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Mar 2021 01:04:35 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87FC0C061788;
        Tue,  2 Mar 2021 22:03:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dr3N61dWhz9sSC;
        Wed,  3 Mar 2021 17:03:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614751430;
        bh=a33PT/OlAHd0La983MMJmgSCDK0my5f3B0rEjS7pdOo=;
        h=Date:From:To:Cc:Subject:From;
        b=BMEyM/Sp7Kd0cXDESb97vg1RXzjB/b74dl7/5Z1oCROGA2ZD+W/9b2m0XRYTfYDUS
         m7k7I7xDKK3nbz3MGpv+WAufENF9R/G+52qowjbvUMmTeu4Pf4uu7NVhH6ltGg5cpl
         HXoUGghS+jQjP9qYbQkSTmpvPuZH/b31aHb74x5+lTqtuIcy0jrAodHoEUsz78ni76
         1AXLx8wATeDDRhsaz+qW7ABH+CTCQ0dJd30nZq31zW4lvR38ZeKrg7v/ght50DRRK2
         cJKJZURn17oKAY0Dr4XPs9Bs/k5dSW+BoecrTnI4o8eCowb36+qOeFfm58EI7kg7Qh
         XfHug2uR5wAEg==
Date:   Wed, 3 Mar 2021 17:03:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Ming Lei <ming.lei@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the scsi-mkp tree
Message-ID: <20210303170349.2165b7b2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F/dNil_+2hkOe3x+sgnomVw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F/dNil_+2hkOe3x+sgnomVw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the scsi-mkp tree, today's linux-next build (htmldocs)
produced these warnings:

include/linux/blk-mq.h:395: warning: Function parameter or member 'set_rq_b=
udget_token' not described in 'blk_mq_ops'
include/linux/blk-mq.h:395: warning: Function parameter or member 'get_rq_b=
udget_token' not described in 'blk_mq_ops'

Introduced by commit

  9dda23635dbe ("scsi: blk-mq: Add callbacks for storing & retrieving budge=
t token")

--=20
Cheers,
Stephen Rothwell

--Sig_/F/dNil_+2hkOe3x+sgnomVw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA/JsUACgkQAVBC80lX
0GwCNQf/VytuNNDe4PPle0wiSNKCoSYWQFcbGNxyC5pxV4jx6sRYv1WgDd/h05uG
otC9G5WkEiBG6cxP086bNBqKD1TjURVHkgEchgiPPNnuFNYpSFxJRNGoN14/sh1A
pFfbfa578966hX2ZAhe5Zg6jWZKjHz+cFFxLahbGLsNJbB542/ZTJMgjYaA2DxfJ
8Q9Vaf5wMNupXdlWBS/t9oDocddoiHu6uLX1Mbp59IB98Nje+GLEFHHrAe1TwxMk
RRkESmJiNegx1RCz8zGXQQ7gLFhBfFeS4efUXiec1gtiYv6WIHn4sMZzkpNg5AHV
+PI1kM8XW0Lo5yP9N3WwlygMSsudaw==
=JNJ6
-----END PGP SIGNATURE-----

--Sig_/F/dNil_+2hkOe3x+sgnomVw--
