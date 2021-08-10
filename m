Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBDF3E85A2
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 23:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbhHJVtj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 17:49:39 -0400
Received: from ozlabs.org ([203.11.71.1]:52985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233555AbhHJVtj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Aug 2021 17:49:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gkmn65ZWTz9sCD;
        Wed, 11 Aug 2021 07:49:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1628632154;
        bh=Jot/mNfUg1oqahi9OGSBbSIjW4z0xFOCMjQ6BWNFSFM=;
        h=Date:From:To:Cc:Subject:From;
        b=mDzNld9onKZTAD1P+lPDFe5oUn/uoYCWm61qJH/OBxsAL1kCGTZy13yhEpQGlDhvk
         wpnCgN6RrA2WuGWq0hobaSNV0EALndScNuRpXMN7a435lfHmSV6v84KR3AykHzRy2A
         uKh3UsFfH87wgF4IwGPAItyuSomx3QwWqanWUxgEUil+eruW8ap2198EGA2iNOMPOz
         xc8XSOdmq2DQZChDltvxnhAHtN3epnt+wXbDiS6IzCosSWnsPHHjDgmBhf7eXSMSFr
         EEV5bH4/gc0V/E5XAI+hGYAtDRRFzOP+udtRuTI1FJoFlB+5ZyotbwUsCdolNeT0qo
         TPnobaYXGRysg==
Date:   Wed, 11 Aug 2021 07:49:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <djwong@kernel.org>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the xfs tree
Message-ID: <20210811074913.48605817@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dUdzsoZRBY.BwB3HuWpTv6x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dUdzsoZRBY.BwB3HuWpTv6x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  0f3901673631 ("xfs: Rename __xfs_attr_rmtval_remove")
  da8ca45da62e ("xfs: add attr state machine tracepoints")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/dUdzsoZRBY.BwB3HuWpTv6x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmES9FkACgkQAVBC80lX
0Gz4+gf+IkfFu5UawSW8+7o+jivyVS9zWJrBogXXPsHQWtwygkjLrW3A0nfjcT7a
qKQW21p8b1xhxnbLPH758BAFiQOYwvnmyjXy5zJDTHIZlAEoLOMLn92uSTg6EYUx
4r5TmQh9LtXcgJyPdTmZVu+HxgvrhoIrAh63brQ6R1gN2VywhbhLL5FjQr/W1JsB
510MRRrB0ZOsGJoL58p7uy5U7nJl6TNMT2i4/mcDw9zanZ1rlgnmf472Qven08y+
alm0RbEjfLyaLyytLZmjsie07sATtMbI78YfqWgkJg9L0trwMsncnLT95FRflVnz
B51Bu8NEWSHl0FaPkZnncUl3L7Vm3Q==
=ihqQ
-----END PGP SIGNATURE-----

--Sig_/dUdzsoZRBY.BwB3HuWpTv6x--
