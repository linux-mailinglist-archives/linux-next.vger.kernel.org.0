Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6561A90A6
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 03:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbgDOBwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Apr 2020 21:52:10 -0400
Received: from ozlabs.org ([203.11.71.1]:40947 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387766AbgDOBwI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Apr 2020 21:52:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49252G1V8jz9s71;
        Wed, 15 Apr 2020 11:52:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1586915526;
        bh=fV1TG65RHgW5mIIIywIzh+2jkntYkoQhdhBIuj+ePD0=;
        h=Date:From:To:Cc:Subject:From;
        b=FUUAvjfwRzKEGTbuUm4Y1r7k7qnFRNUM2MLeVhoodY3Ji61ZSmq6NwbBmJW8G99ap
         M+9fugTMZoHdjjTBdES84Gthquced4zaLFGk9TbkqpMoJnjdTWRvlMVEycVcPc08ju
         QDYtjX3BOHNa3k/gCmFhKhDZN2aQnFsd+WnqsSHAlGL6hToPU8cyJR7DYkEnZ4i3Wu
         6Ve3qH3UDtLPHqT4eXewLm1MD7aEhRNiPIj+D+rpnPXjzYbBlQo6sIl9wH3fVmI5R7
         rMlnwRYpDkFf2/WE1Na/ro0hL2n1AyX8kzzHkDmomMRMyjwz/wI9PyjZj0TReKawN1
         3pIUwlmDtnMGA==
Date:   Wed, 15 Apr 2020 11:52:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lyude Paul <lyude@redhat.com>,
        Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Message-ID: <20200415115204.4929f663@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hn/Ojf3YwBFqzq4+MhBG6XU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_dp_mst.c

between commit:

  743acd115070 ("drm/i915: Get rid of silly void* from MST code")

from the drm-intel tree and commit:

  20c22ad32957 ("drm/dp_mst: Remove drm_dp_mst_has_audio()")

from the drm-misc tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6WaMQACgkQAVBC80lX
0GzpcQf8CYjcwn/7zvb9NfTafo2jJWZDi0WdDDL19Jt/R0k+404h9D2DL44+bf1v
8892nWITiUWZmjrnjM/D6J4Q86CVyTVavZ8Fb0rdmxKWBm5EjjZV7//aV4hphYt3
24y37cVvGpxeWvLHlWq7NR5sBs1yRZjzACsw4mKxGuJcVdHD22jJhcPqF09QKTq/
53CJvOc4i/czFo6GwaUoKzpAmYdl0pbrfwglzooNWZBhKZp6HcVogLQ0nmLSKR2B
zd0+Tx69+zThCSfO1ZCo7sr1xn4cCJuXvtqn3cUuV1epxMi0ve/Ty6XCk24XIqmx
TYX+mwcJrKasdiy3kYV6TUsVa+Lo7A==
=mYXD
-----END PGP SIGNATURE-----

--Sig_/hn/Ojf3YwBFqzq4+MhBG6XU--
