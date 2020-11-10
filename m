Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72CBB2ACB11
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 03:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729648AbgKJC3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 21:29:45 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58403 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728607AbgKJC3p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Nov 2020 21:29:45 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CVWz862HCz9sRK;
        Tue, 10 Nov 2020 13:29:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604975381;
        bh=jBnWVjQF0E7BGnLCWQZUnf+moKMFqooLEx90ij8u2Ww=;
        h=Date:From:To:Cc:Subject:From;
        b=JBTVPMdHQ1nGjke1kM8TuowuqUwEQf6QxgiWqEwdfUTKVNJqpegMDZ/zshOMNm0Yi
         HKbGnZlkYDPPg2RCpDT2lw/Sp0hc+KlEZZ6pCMui8TgfIK8B0fhEmPtfykhYXQ7x5Q
         0iK+C4uzzM57v1jRissSToFinu32NE/zQvppiLelE8qXS38WznhJ3GSYOEomDy+vXS
         /bE6F/QHehUomYer2m8zGdsS9xYUc3MTiI8nWeFnn79WBgaH+boGLDTaf3sm6VI7cL
         OYnqdgg/xqZK+l/sBjPxLsBH5EcF9xEY86X4EBNJ1gqVdQBKu6M/ALwdeSTvRfH/iT
         MVuErAZYMqBtw==
Date:   Tue, 10 Nov 2020 13:29:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20201110132940.5387bac6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Nw1tT16ZHW8yjamjJxiWOZq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Nw1tT16ZHW8yjamjJxiWOZq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/kernel.h:14,
                 from include/asm-generic/bug.h:20,
                 from arch/arm/include/asm/bug.h:60,
                 from include/linux/bug.h:5,
                 from include/linux/io.h:11,
                 from include/linux/dma-buf-map.h:9,
                 from include/linux/dma-buf.h:16,
                 from drivers/gpu/drm/drm_fb_helper.c:33:
drivers/gpu/drm/drm_fb_helper.c: In function 'fb_read_screen_base':
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
   51 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/gpu/drm/drm_fb_helper.c:2041:22: note: in expansion of macro 'min'
 2041 |  size_t alloc_size =3D min(count, PAGE_SIZE);
      |                      ^~~
drivers/gpu/drm/drm_fb_helper.c: In function 'fb_write_screen_base':
include/linux/minmax.h:18:28: warning: comparison of distinct pointer types=
 lacks a cast
   18 |  (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
      |                            ^~
include/linux/minmax.h:32:4: note: in expansion of macro '__typecheck'
   32 |   (__typecheck(x, y) && __no_side_effects(x, y))
      |    ^~~~~~~~~~~
include/linux/minmax.h:42:24: note: in expansion of macro '__safe_cmp'
   42 |  __builtin_choose_expr(__safe_cmp(x, y), \
      |                        ^~~~~~~~~~
include/linux/minmax.h:51:19: note: in expansion of macro '__careful_cmp'
   51 | #define min(x, y) __careful_cmp(x, y, <)
      |                   ^~~~~~~~~~~~~
drivers/gpu/drm/drm_fb_helper.c:2115:22: note: in expansion of macro 'min'
 2115 |  size_t alloc_size =3D min(count, PAGE_SIZE);
      |                      ^~~

Introduced by commit

  222ec45f4c69 ("drm/fb_helper: Support framebuffers in I/O memory")

--=20
Cheers,
Stephen Rothwell

--Sig_/Nw1tT16ZHW8yjamjJxiWOZq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+p+xQACgkQAVBC80lX
0GwGvAgAlZnZX1uWSH0vFjNdH/buCu8M4egQgucrf8WtEb4RlQ+Qm7TLwITCXu2z
iy1K2EbmI5RYarXhiyMhRVVQfdxVaWKhrkpvX4b3aSW+Rc5oUW2Ykx4coIoIF6pK
Jd4mR3M01j4hLSvoGWBsssI2UpNiLi/qDkGTXXaLVs2sYDcKjvCv3PFar+foDZeU
Prd1VGKLk5EYp+Wl2GSpaNV6WnnhQBCLv4bLq3K4SNtY/5JsuPtCivlK5GNGnRN+
bc319j08ni8qvzRzAyEO5i5n2w4w3H4AYQzluu5NLElbsWG3XdIW7kACtF2r33sf
AYoOvMN8o6k1+/GDF6XrPyDh5bGnsg==
=bIi3
-----END PGP SIGNATURE-----

--Sig_/Nw1tT16ZHW8yjamjJxiWOZq--
