Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEE336891C
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 00:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhDVWoC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 18:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235502AbhDVWoB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 22 Apr 2021 18:44:01 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68F6C06174A;
        Thu, 22 Apr 2021 15:43:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRCBL1VtYz9sVq;
        Fri, 23 Apr 2021 08:43:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619131402;
        bh=tGDhXlcqsPi+4PD3P6gNEQXLlfiMF6uoIgpbyc09htw=;
        h=Date:From:To:Cc:Subject:From;
        b=mtYqWnI9tgVAEman9OrgJCbJp8As8EtUxf32wtCFt9G1qws4z0d85RIobYZ4Bw5tn
         jClMky32l9WdZhhQHpIYrcl56UuHltUCso/3uqg1n6NnogH9OWLTUKSCyhHzVzShCy
         HSN3ZK6U2mu8fgjBxeIPFeGRbYLfE0CoA8wZqGLbWAOSBoQtNwU1f8JZRjxB0TsOwp
         dNX30DuJeF0r0nadrDe00Sr0AuV+f8ekGASsLTyfUWyGMMEsP99KRE6JqUvUn4/rSK
         OlrPe6Nw76cRvfDmg/PyF3E0sIzI63EKR+R3NYAO5LnjhEI1U2SvSWtR/Hut34y1F4
         LQowyiBs+RjdA==
Date:   Fri, 23 Apr 2021 08:43:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xie Yongji <xieyongji@bytedance.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vhost tree
Message-ID: <20210423084319.5cf9dcd8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=lD05Q2uvBU4fLcR7nhQ4XZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=lD05Q2uvBU4fLcR7nhQ4XZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

n commit

  a9d064524fc3 ("vhost-vdpa: protect concurrent access to vhost device iotl=
b")

Fixes tag

  Fixes: 4c8cf318("vhost: introduce vDPA-based backend")

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long

Probably not worth rebaseing to fix, but can be avoided in the futre
by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/=lD05Q2uvBU4fLcR7nhQ4XZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCB/AcACgkQAVBC80lX
0Gzd2wf7BfmDEWdJZ+iWdrrMRO/PfE0ndMo5PFI03O7/OWNzlhN6ehsnKuha8abw
jVMLkAdiCYccwoKZPwCB19dCwIVudKt33eBEz/fZdgbZ5tiefw3rMxeXn3GWzQeq
M7y2iDoCPi4IRCyX3ANKtz0O+LLnld7+wa+9C/glX95hefB8vtqUwSE0giWk13Xy
YcRsE4PGwIZP0OozVkyIPNcpUA2bkiYEXWNUlJuRIREToYWf6jylwf7R2fCPeuaq
fKpgcGUI+nYaRBW3Iqfty95SIfEuf2GUCnAh2FE1UuQKoy3Kx72nKSP51B2g8Tsg
wUtf9dVI3+apZ/6JK1XNqfKCtgI2/Q==
=cRUZ
-----END PGP SIGNATURE-----

--Sig_/=lD05Q2uvBU4fLcR7nhQ4XZ--
