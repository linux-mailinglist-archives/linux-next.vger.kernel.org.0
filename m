Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B42AF9FF4
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 02:13:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbfKMBN5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 20:13:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55877 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727104AbfKMBN5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 Nov 2019 20:13:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47CRTG1wJQz9s7T;
        Wed, 13 Nov 2019 12:13:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573607635;
        bh=g15OSr6tjmM8WcvHvyRJcU3qjqAKy7LsnWP62p1/2ec=;
        h=Date:From:To:Cc:Subject:From;
        b=TPjuu9KEwIeDO+zaUMiErTaMyUTqkvrU8tWgyvZ6HUhV3w0H4ZFzbD7zDAcsTmaXW
         puBRd7LOmkdn+y4V9GIimnDqsQf37It7u/2wG2owFmpuULsYMJgknkndMN9R55xmOH
         s/ZwVoLEpmR1Kr1O5jV+EJLOdQLLiGZP5SfYdCm1g99/IYbULBLeO+PLNFixShk0+m
         aKlxYgLYaoIDU1FWrVKcFO7LwjvICb5AKTxP6JVGLsZ6PprqASuKzbmKQD7W66QhKT
         HrsfTRF2SSv+a+nZq/d/JNH2uFtqxfxbjQ/ZFwGx1s+52h0orAMeLD37lU1YVe8HiM
         YLZs+BaxjJ7UQ==
Date:   Wed, 13 Nov 2019 12:13:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Uma Shankar <uma.shankar@intel.com>,
        Jon Bloomfield <jon.bloomfield@intel.com>,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Imre Deak <imre.deak@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20191113121352.3b1e85bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//WkbiqEZT/2qZv01sZ8IkdP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//WkbiqEZT/2qZv01sZ8IkdP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_reg.h

between commit:

  1d85a299c4db ("drm/i915: Lower RM timeout to avoid DSI hard hangs")

from Linus' tree and commit:

  41286861b4c9 ("drm/i915/tgl: Add DC3CO counter in i915_dmc_info")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_reg.h
index f8ee9aba3955,53c280c4e741..000000000000
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@@ -7217,10 -7351,8 +7357,12 @@@ enum=20
  #define TGL_DMC_DEBUG_DC5_COUNT	_MMIO(0x101084)
  #define TGL_DMC_DEBUG_DC6_COUNT	_MMIO(0x101088)
 =20
+ #define DMC_DEBUG3		_MMIO(0x101090)
+=20
 +/* Display Internal Timeout Register */
 +#define RM_TIMEOUT		_MMIO(0x42060)
 +#define  MMIO_TIMEOUT_US(us)	((us) << 0)
 +
  /* interrupts */
  #define DE_MASTER_IRQ_CONTROL   (1 << 31)
  #define DE_SPRITEB_FLIP_DONE    (1 << 29)

--Sig_//WkbiqEZT/2qZv01sZ8IkdP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3LWNEACgkQAVBC80lX
0GzBsQf/SeCccVFD+GcevT0QOZ+vm/36MyNCG9lj8yBWcW6KlCaLwBpRSNDSg+kq
4E36ofkUyXvUQb/Sun0TRQ+382a96ynjGv9EaUv4zBQ+ZfTBFi2ed9Vtjdk22UsD
i01ek9OT3p9+6FeZn6Bzro6E9d6JE/5KQZcO4sb0F9NG0HmONwBdgTv8pfQPPrDS
LvTbDpvOwYLVc8fqkaYgaAdup0EJUeROwgwp5tuYgDRvup4LZfLVPtv4pB0lvvU6
YsRtA+bDe/ri7hq6gULxCNvN+tRBF9wjZE+Fs4L/tWvd4Fi0CICu+9zrLHnXgQ49
tp55aJtzd0ELPjSF+US3MAhU5Ga+IQ==
=edsz
-----END PGP SIGNATURE-----

--Sig_//WkbiqEZT/2qZv01sZ8IkdP--
