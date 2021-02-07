Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE353123B4
	for <lists+linux-next@lfdr.de>; Sun,  7 Feb 2021 12:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBGK7q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Feb 2021 05:59:46 -0500
Received: from ozlabs.org ([203.11.71.1]:46721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhBGK7p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Feb 2021 05:59:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DYR3n3lvHz9sCD;
        Sun,  7 Feb 2021 21:59:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612695542;
        bh=/I7fNZAOAjhvTsy13VVZEWwmE79v1IGag6Aa52s48MQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Y49DNtSjkVemEyEMu+XXZTr6kJeADvpb8zF++cqSlNcyKyydFSViByjBkJ88dDl2n
         Ky/YX/oqQZ8aM8Z8jE49KQmOqYkH3Lq2mT8B6CQVLtpNs48qqj9hW7vxrsl7krzTX1
         RWlmJ1QLT8VLU3l5Bke0nE8mPNcWLPVf+E/VgoOfG2sVS/3BJHQCEeZd6PuOcQDyVu
         KWMkZRb5NA8nymQk+5Et7zPCvNOPi0khs+ZztgqEUdSvUKl+hCp8b7WFOCMdBSUuFG
         sN+ChfNnCuVszJORnx+phz9t95YrTfrQ1m3i7JsUPc1dTZANk1OdlxlFCdwzisi+dk
         W1kmBN2MtdVgA==
Date:   Sun, 7 Feb 2021 21:59:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the soundwire tree
Message-ID: <20210207215900.1223b0ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T.Ffr+Nq7jbltv01kb3MCkK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/T.Ffr+Nq7jbltv01kb3MCkK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  531f45f2bdf6 ("soundwire: export sdw_write/read_no_pm functions")

Fixes tag

  Fixes: 60ee9be25571 ('soundwire: bus: add PM/no-PM versions of

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/T.Ffr+Nq7jbltv01kb3MCkK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAfx/QACgkQAVBC80lX
0GySrQf/dWcUHlrOsaFEk0zcNaSGyg5nXtINOiWGlIsC77aVBS73AW643pLdXUVa
C3WNM2raBTXyR/DbqUZpCmKSGhTfmdTNmRgloSmGq/PX9xpFU8f4aY3DYq/KB0EN
67bk3YPDFzN3RDMwq6WAebgBZLqQBnfYmT8hXMfjM/sXJ9oj0znczqlsgGhn+8LL
ZvXwIQhAPSOnOGP9qm4DvAiTyqRFOOMWTLb34gvinuhBgE1Be/7TafGrInIrHWD8
S2x6EM8oYNOh7D9hQvFK+cPDId4iUbGXn0uTRQcDMfSy7hqlJjGYNR6yIJ6x/l7g
Fd1NXo+cKwAJ5XXkoRe3/FA+ShXaAA==
=EUMx
-----END PGP SIGNATURE-----

--Sig_/T.Ffr+Nq7jbltv01kb3MCkK--
