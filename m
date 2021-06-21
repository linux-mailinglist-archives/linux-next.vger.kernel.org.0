Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393753AF7D4
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 23:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhFUVsn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 17:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231503AbhFUVsk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 17:48:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFBAC06175F;
        Mon, 21 Jun 2021 14:46:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G834v0FzBz9sRN;
        Tue, 22 Jun 2021 07:46:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1624311983;
        bh=S6/0Qi4z5TKTKPxmXM0B0vXD9WBjbz+0e6y8TXbtUAo=;
        h=Date:From:To:Cc:Subject:From;
        b=E6VlaECKukA+RFAyp8zodssoZlI2RIPCQmw/HrWOOGUeaBiLAQiL0EdCXnTGK776k
         vbpK8N5IuQWXBYfvVqykHqiulFDDfGa8sLajeQXTEA3hpT1fON/M+9wnxl0ylBiHIn
         AFSsE/q5FZtxIXgW43hbFkAp3iZb3ZJ0x+MZBRduRlT9sQBzoCbZrt6RUvUTRD2ja1
         0UgOJJ+gYQXzkLxHOOOBqw+GXczE+/rkhuA79Vdn3hF5emxgnaBqmUdshQB09M5bWA
         S1AKTQf+lLWS4+savGpBMPI0j9SSlLMayIGbtQGyovJzYaOgbSEA0GkmWMGVBN63x/
         C3h56aLOPHGxg==
Date:   Tue, 22 Jun 2021 07:46:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Paul Mackerras <paulus@ozlabs.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the powerpc tree
Message-ID: <20210622074622.4e483a33@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Slxqo9uVHAQnqix+QUyApP9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Slxqo9uVHAQnqix+QUyApP9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  77bbbc0cf848 ("KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and=
 POWER10 processors")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Slxqo9uVHAQnqix+QUyApP9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDRCK4ACgkQAVBC80lX
0Gw2cwf/fmJTtzQJTvuwwEzz6EwNr8vkOovqo0p/hovjFHzI4yvJZpsn1EZSkeWh
KKaL3c+orVjfuqniDfj5OxOExNGL195zpdn8LyUOKOrYJeXUmC+lP6Gh7ntQBa3y
NUEqedfDnbi8Bhm7HLKOcuiloLJMKWGMazd7dDHNRmTJU4Eq08VRnhQLhZq159jB
MlfOrOmp5vxWLNuXk5HjvlATAWtnGaQMdzpp+OLv4KG55UvL5c3eSWuEfjYQG/po
FvTJ1z4erEB7ZvPZtSdHyRDfVm6VAlaO+U941woJF5hEBYCOLfr82Clcb7CLSdeY
/KQdWYaoDqPE3EtbEPZAI5C7+whc1g==
=GUe3
-----END PGP SIGNATURE-----

--Sig_/Slxqo9uVHAQnqix+QUyApP9--
