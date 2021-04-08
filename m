Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB4F3582F4
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 14:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhDHMNs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 08:13:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39737 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229837AbhDHMNs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Apr 2021 08:13:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGKt73qT2z9sWH;
        Thu,  8 Apr 2021 22:13:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617884015;
        bh=DFSMspZoMbGeeJ8Z/m1UsfIlspBhwPmT2q1uu9lnu68=;
        h=Date:From:To:Cc:Subject:From;
        b=f5tRjOQZXpdh877EkIifHSol3vz3b4OeEOC+PCsy0vUxGUpAFLCoR1akssDMUsMtC
         t/xu+pllBcjlC012HhCObUoSJsfWm80jBosDjPhuHf6YRlhgl3T41+9nDW/WoRKN1L
         Ai2NYMz/VUntnfVfoa+T+LzdnfmVDDV/Nb9OHsHqm0z23ZYNN1w48RwNpWaoKCvGJf
         Vur362AbZAjuB3w2BZc16G2uUrZXrx1nvzm2bGcGK3xZ/RSIwP5eM1kco523vdSEfZ
         3Z6BAbbdfgclsG9APFVpHuq8tUhaSMRggHuaRT+5QgMYLSJG4f89keEJ273w6PL/iC
         bI/FvNCc8odWA==
Date:   Thu, 8 Apr 2021 22:13:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Message-ID: <20210408221334.63262fbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bbWr1S3uwXZa2YpYdWncDo/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bbWr1S3uwXZa2YpYdWncDo/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  11cccec79c60 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/bbWr1S3uwXZa2YpYdWncDo/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBu824ACgkQAVBC80lX
0Gz/DQf6Ajq3KDhe08Az2eLjoHVNyPuImCeE7iejvQC/xursD3N2SzlHQwiy9MqV
sO3UW+w0UhMrsqSNMxw3Lkaz/9hXMCbPSUJOlJ9GE17CyUXhHTQNpI5oFOp2lfXF
W2dLkGUoIg3BVjEEzM7sRyteo6VKpsTYCnRUAk+FRsuAP1HJ6opMaOd6rO7uVGEc
ZOZNrXZuQUT79OgDspfA5g3YV2BuNeh6zdwi+51bCYUufd5a4g2Eg8OnC3DT9ZkF
n+sz/C57sgbVpHBrklSzk+2eOBYhH4wMa4YWNLOTmviw8ptwQPu4IMQ425pjLJo1
unGXZxxlpEttLU89Q7/HEZFmBms3tA==
=7soO
-----END PGP SIGNATURE-----

--Sig_/bbWr1S3uwXZa2YpYdWncDo/--
