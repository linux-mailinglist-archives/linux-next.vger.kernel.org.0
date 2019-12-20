Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8DE127515
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 06:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbfLTFTM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 00:19:12 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47693 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbfLTFTM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Dec 2019 00:19:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47fH9945Qbz9sP3;
        Fri, 20 Dec 2019 16:19:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576819149;
        bh=n32zCL1EMMDsQqIYpA6kkK7coHHZ22QAgS0f+VPFMVM=;
        h=Date:From:To:Cc:Subject:From;
        b=k+zZPdqisR7WV5ZyW9v3r5JMnr209Cy2Jmu3P+V+327GqeeLCuctMypi29gl40o2m
         8GXRFGQKpa4G1/02xsa3bDNsj7uLSqYlc+S756/8iEmVryAdDhxmszIN5BWBdi7QGy
         20mz8MhV8DnSlGcj6C9cf6HEx12fKbHkzXg9gvctWFmrLKsug6EIEOekfu9/vY0CCe
         mH2k79AFbza6aFDLDeWyHpQv1zYuzLBTmbD1TbE6cldtY8cbw4c6uX/jDhJZ3JTw56
         ktgXcweljK0b+v3eLzIpKGz7YHN7tLvMlz5ay6F7b0csO7NuCyCAMx3Pp8AdmfN0VT
         oafSYLFBAnQZw==
Date:   Fri, 20 Dec 2019 16:19:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Quinn Tran <qutran@marvell.com>,
        Himanshu Madhani <hmadhani@marvell.com>
Subject: linux-next: Fixes tag needs some work in the scsi-mkp tree
Message-ID: <20191220161908.10b18dcf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/78cN_7SkV/HwfFHNWRVa7kV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/78cN_7SkV/HwfFHNWRVa7kV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  08c0de658b08 ("scsi: qla2xxx: Fix stuck login session using prli_pend_tim=
er")

Fixes tag

  Fixes: 974950710e2a ("qla2xxx: Fix stuck login session")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: ce0ba496dccf ("scsi: qla2xxx: Fix stuck login session")

--=20
Cheers,
Stephen Rothwell

--Sig_/78cN_7SkV/HwfFHNWRVa7kV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl38WcwACgkQAVBC80lX
0GxZ2wf/ZKjdMnYrcRcUpSCis+L18aVo1AmrlPHd13qxmoDz8MLMqCk5TvEaDFA+
wtrmheO72WOE1JKOhdebRWc88rXaVlnlUpaAFUhrvw8iLg+REXVs1ePKaDjYFX+G
EpoMLR9t6skZmXaLW/v6rGbKhuMdn8rAjz26iCWr2Pe2ekyUshZv6HfMTPLo1y9O
yKAI/1KZU1iX5Q8ck2IVq7l7gBUf1WI8RkUJveRCEtHEOsz+5IIfonb2g4I846+/
qLPMLMWA/1eoWhy/+5v+LUhak59smnTDbnko9ub4VtPAOpwRbYlAoGyrmZ2tdlK+
mCTjj4MFzSEIhcNyXLAuAMUPtq4DDw==
=P0d6
-----END PGP SIGNATURE-----

--Sig_/78cN_7SkV/HwfFHNWRVa7kV--
