Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789B32F6FC1
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 01:55:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbhAOAye (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 19:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbhAOAye (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2021 19:54:34 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC48C061575;
        Thu, 14 Jan 2021 16:53:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DH2k71Wbhz9sVw;
        Fri, 15 Jan 2021 11:53:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1610672031;
        bh=15cnUrgeHKK+qzQdJxWfBVjeukiu2TA48dejMOaim5Q=;
        h=Date:From:To:Cc:Subject:From;
        b=NilADp15nbvkHai9kKhGZ0P7WCJ0+NfEpw+Q8oWRFYs3q3KPWnXmI+Lx7zQyPyqoB
         LiuJ5gr3cDUxHh/21lBD8/cl2C54OHOopHb46FuQhf3wn7aohBd4r/VzHXt6CQ5SIp
         vNeq4UoZwWb0xPuVz0bZ4yUbhb2XPjWeFeq87Y40qEwj7Id4PYHzo3xzvuppT8hO4V
         GHSlkaq9igMhMySj90Bgn0gYBx3RS9QTMESwPMPyyAIK9JvJyQ7PrnZXXgK1mJwhiP
         Sy55BTKbYdcoA/CL+C8nS4uIzjgl8+v/w34JCC0PGnE31PDrhPLT+iG+AJb2Htyuse
         Z/F3R0U3UUWjw==
Date:   Fri, 15 Jan 2021 11:53:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Wesley Chalmers <Wesley.Chalmers@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20210115115348.023e64d6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iAw8G0IWPqpE0AyJhE/=E6t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iAw8G0IWPqpE0AyJhE/=E6t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_mpc.c

between commit:

  61d791365b72 ("drm/amd/display: avoid uninitialized variable warning")

from Linus' tree and commit:

  f03e80d2e82c ("drm/amd/display: Initialize stack variable")

from the amdgpu tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/iAw8G0IWPqpE0AyJhE/=E6t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAA55wACgkQAVBC80lX
0GyQrAf9EGZj13wKjiGa3C9T2o3SsZHJmU2AxnkESTN5mjSQpPmeRi59XNmpuouk
IzfS/PktOMw4SIMfqaEaEkRx5Hu73aozH5OFssmgYTeBRsmIpDrZwZU5+2sjRKd6
z+1J0ga3RshzwyzQ0YJD2YBEFTuL/9rB0+5srBp3UlIZQORAdqWp6foy5VscGA8r
II+nlfkz8Yy4b7OoCV2suCQTbUb5OVS7KeNUeEpP+M8FvCKggqxqjsxc29wmcgXm
kl/ETn1WGbVNiuYhdL0q5W2IsyCxoCTWq5Rg+1KqcholfHLGx4lsFCqfFCMf3QRq
Q9zCaA4SkqUvtysn1HGaTksf335LGA==
=cz6O
-----END PGP SIGNATURE-----

--Sig_/iAw8G0IWPqpE0AyJhE/=E6t--
