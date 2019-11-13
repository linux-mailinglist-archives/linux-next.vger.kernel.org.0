Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6D0FA059
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 02:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbfKMBim (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 20:38:42 -0500
Received: from ozlabs.org ([203.11.71.1]:47745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbfKMBil (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 20:38:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47CS1q5RFzz9s7T;
        Wed, 13 Nov 2019 12:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573609119;
        bh=SwByYoLFEyaFhQcPYB6VEXGbPTJYyU/NVRS6uduhnb4=;
        h=Date:From:To:Cc:Subject:From;
        b=sCOHN334fwWpfr9TMDGipJgaqrutE3a+4jM5VH6z7EXMyn9iJ50gJQRPRwFVMgWf9
         Vq2AIqvNRm5a03rM14FW+ApKojy2HPxW9oWcpbSmldpa2/DsYKEqREJiyFyA4HdftD
         0ZVQXlmY1ckYJVXBcSU/4NVxMKWPSTz/s7xrVTsWuI5yGzbCNwIn7BpvwELokcX858
         HW13SfHKXFFvOqW9qAa3D+IpfsEHO28RKuBifeHk+ID0KY7WrfM3aoeL/1AVeQeOPr
         622Ag6NW5kfo/LbeuN12OSMOsPD1b+lH05NSgzR8V4XzcNx6ej+nJYFxuU8BifsEAY
         NO/N89t+KWOMQ==
Date:   Wed, 13 Nov 2019 12:38:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Imre Deak <imre.deak@intel.com>,
        Jon Bloomfield <jon.bloomfield@intel.com>,
        Andi Shyti <andi.shyti@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113123838.79733d12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6rImgs7l5p3T26k6mTBrh+/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6rImgs7l5p3T26k6mTBrh+/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.h
  drivers/gpu/drm/i915/intel_pm.c
  drivers/gpu/drm/i915/intel_pm.h

between commit:

  7e34f4e4aad3 ("drm/i915/gen8+: Add RC6 CTX corruption WA")

from Linus' tree and commits:

  c113236718e8 ("drm/i915: Extract GT render sleep (rc6) management")
  3e7abf814193 ("drm/i915: Extract GT render power state management")

from the drm tree.

I fixed it up (This was too messy, so I effectively reverted the former
patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/6rImgs7l5p3T26k6mTBrh+/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LXp4ACgkQAVBC80lX
0GzjeQf7BC4V/F2EG4zt7/3N+0BYwYkGe+Kugr0EZAjh3hnulTNBnqgKWwwPQanE
DJ9fhhbB23y7o3SQwsmMTw7LKpsdgi9ZSgkP67LjT19YlwaUKnrchR7+wCLlbojy
3bPqhwvJl1eqJ7uTqE5cve+VDAqjeFt22ALDt2j4E5y5wRqKEwB+5d0NFNhhdTVi
K0iO1gVy9jOBKPwKafgduBqJ6FjXQi5MrDvMRz8ISFbvtf9PMK801ADRsoqrPCyR
TatirABGL49YUSNwHa+hVnjtyRvtVrd8qz7admOGxJGh8Yc4ggsDfGwg7EApPi4e
MFhqzN3PkJqdLeAEWpSCIuCGEtF4yg==
=/F2F
-----END PGP SIGNATURE-----

--Sig_/6rImgs7l5p3T26k6mTBrh+/--
