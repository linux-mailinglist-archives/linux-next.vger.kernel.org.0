Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C7042EE47
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 12:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbhJOKDO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Oct 2021 06:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhJOKDN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Oct 2021 06:03:13 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A67C061570;
        Fri, 15 Oct 2021 03:01:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW1xY1k4vz4xbZ;
        Fri, 15 Oct 2021 21:01:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634292065;
        bh=ePlUuskm7Uh1T92kQwaDXV03zpWjKXjp9IdGIQb+1sE=;
        h=Date:From:To:Cc:Subject:From;
        b=WvMApseMyxCOwHT5CGq5gW9iOzN9H64/pNRS96pdFeUZ1rjxlOz/vaLyooA1vhyEF
         hSjaUTXU3pMZHe7N+covA+uk/Lkcq+L1iTuaBHvlsUzkfRBgfhAFpEsnKxNcXE0K4Q
         +wozaULg+ysGVhu74dojJlLhNDHxJ2h0kPAGR2Xl+eT1F2AUSBoXhBdKKo3cjbwbic
         zjPS+yU26DLGw/0hNFWn9Kb15wrh9XJp96rr588tRnu1AtMt2OT0ur5DKqzaTgrkaN
         84Ng44+ntzNaHdESRTNSxhU86nQwZf0K+tuLxYl+nuoFHYhixH7FmzsU/TMmP5AOkn
         bZyeX02a4jyYQ==
Date:   Fri, 15 Oct 2021 21:01:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20211015210104.0f034544@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_0tl3R1kvydS7IvFTEMBN1_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_0tl3R1kvydS7IvFTEMBN1_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_modeset_lock.h:74: warning: Function parameter or member 's=
tack_depot' not described in 'drm_modeset_acquire_ctx'

Introduced by commit

  cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks wit=
hout backoff")

--=20
Cheers,
Stephen Rothwell

--Sig_/_0tl3R1kvydS7IvFTEMBN1_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFpUWAACgkQAVBC80lX
0GzqrQf+N1xOEMVqO2cgDgu2fjyQXEpwfvRikemEywpVlBT1dngt2Dns4dOQMk8o
dO/kg/fG5wREvKoKir5ulnqWHXsAIlVaG0bZSgVJIgYJIZJP/jG6AOuBtKk0qnfb
uaoh8E/leGM3+Ge4mVfFulKSDr4BzrCb/Ff8jvunONx1yfhJrl07jVT+9axRTBNI
Mx7dA7CAH5douU5gramPQpls9/3v6JDvgaTnACKuNtnnZ1nuZnyL8XKhdpqWRmiG
I2KbZNDBSenQO7dLMECej55VfBRqE/QVdtgnV2eygL+WYG+zhVA77zhA8vDKW55v
yh5m2XMmNWtDOLuLLYBzFRceQ3oSrg==
=MSo2
-----END PGP SIGNATURE-----

--Sig_/_0tl3R1kvydS7IvFTEMBN1_--
