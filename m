Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E5B27FD87
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 12:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731884AbgJAKj0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 06:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKjZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 06:39:25 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0FEC0613D0;
        Thu,  1 Oct 2020 03:39:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C28kY697yz9sSf;
        Thu,  1 Oct 2020 20:39:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601548763;
        bh=JmbLezRzmSGuU5WK2PvyAyFQp3GhmDoCVA9yDQLx69k=;
        h=Date:From:To:Cc:Subject:From;
        b=cu1vuSZAb/gRpe7X9+frUCo2ClK8MEKqUCRsiSozM0M4XYBoN4aeP5rNLmuhI4jnS
         cgd64ioHd+aMKd30oJZ3uyoMPD5IJQKEwSXLRzCVFRdkslkG5fkWpyMRvjdFnA8Yu0
         khDFod5sZ3ZIIxPtnxSbALsmM2PqhvpZihkasJah0+zK489/w5cmEVzza7dRtKEcXG
         w88yM2nisN/KfsFfH8Xm0fbTZiSkq+hDESIzRUA7iqW3GzswdOQhNAqlPudZc+GvEs
         kq6CbBhUyjLSFllpwL1PIxX1a8KN6vbcTf1Ejpc9f7GGN6t1dnJXNSlOsv2IRhuwPK
         QJ1rZIoaFMqRg==
Date:   Thu, 1 Oct 2020 20:39:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Dave Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm tree with the drm-intel tree
Message-ID: <20201001203917.43d46a3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DdEb5MkgX7Rcxn6kn4rpov4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/gpu/drm/i915/gem/i915_gem_pages.c

between commit:

  4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
  ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT i=
s not supported")

from the drm-intel tree and patch:

  "drm/i915: use vmap in i915_gem_object_map"

from the akpm tree.

I fixed it up (I just dropped the changes in the former commits) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91sdUACgkQAVBC80lX
0GwY1Af+L5GL9WkeOKfbPmrMAMlWlaXHGD4rkH3IsH8AhCc0xfM78DvlXnJK4Fqq
DlLWngMCn/ubtPzJRPwSTSLUL1ZwGOapud/G1Tf0teSiunQ0Wc3NzIZt7E82Aw3i
jCSols7sNh7PvJ4spsowtMrpGNVpBhJMTBaK+BQpXZi8RFCcbqcC5ZaDWdyA5y9W
eUnZE947oIwiyofvpvzJg7b9GAqSstmMz9U86iM0UEtBTGOjLF0W6tvEgnNPEUIL
zRJzdQTWrsrKFvCNpdO5ONRyqtj6h+xY9V8QHRMLYaVKYMdAssCC77fPpzTnxEoP
TWl+u+jgBsx90uEoH2zzbr5eMANPjw==
=7wpk
-----END PGP SIGNATURE-----

--Sig_/DdEb5MkgX7Rcxn6kn4rpov4--
