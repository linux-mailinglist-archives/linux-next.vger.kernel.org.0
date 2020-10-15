Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A913E28ECDC
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 07:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgJOFxN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 01:53:13 -0400
Received: from ozlabs.org ([203.11.71.1]:53241 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbgJOFxN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 01:53:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CBdjy5fGBz9sTK;
        Thu, 15 Oct 2020 16:53:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602741190;
        bh=FGAbuEn7owxIgV4jgVwzk0c04SUjD6yGsAQuZGN56L0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=liue+/RLXspnsAhIyPRrHzLLEBcQgb5prGPHQNNsKS+1s0+AtEUYLX7HO+9f1bs2n
         CDl4Bk27QIq6y7z1INpNzquprynZoobzeIcDDeYE4mVnG+j42bX/d4cR2795ToGgfV
         6z2eRBTcFrbDb9Ed1cTyLuOfnyJXPzaFo1eAh+y/F/aW9BL7lo8uEGtqf43MMEkEpi
         0lhcX4p1h4bBFkrnPY78k9Wt/Ey7jQapvai5/i7/eu/I+XQ/FyFQz6+L4tbS696U8G
         gXqm1cuRbblOJWtCikkUMA0U385icrYpbcEiJ9a1RTOeX+tLWiKdTz+IhUDAJU/S7u
         GOFBBVPbtuztw==
Date:   Thu, 15 Oct 2020 16:53:10 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 counters tree
Message-ID: <20201015165310.45b5d7be@canb.auug.org.au>
In-Reply-To: <20201012194821.4eeaffab@canb.auug.org.au>
References: <20201012194821.4eeaffab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GVegj5DPSrveeT+xQFKVRJ0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GVegj5DPSrveeT+xQFKVRJ0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 12 Oct 2020 19:48:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   lib/Makefile
>=20
> between commit:
>=20
>   37a0dbf631f6 ("counters: Introduce counter_atomic* counters")
>=20
> from the counters tree and commit:
>=20
>   ed7f5253e189 ("mm/page_alloc.c: fix freeing non-compound pages")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc lib/Makefile
> index 95b357bb5f3c,1c7577b2e86a..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -99,7 -101,7 +101,8 @@@ obj-$(CONFIG_TEST_BLACKHOLE_DEV) +=3D tes
>   obj-$(CONFIG_TEST_MEMINIT) +=3D test_meminit.o
>   obj-$(CONFIG_TEST_LOCKUP) +=3D test_lockup.o
>   obj-$(CONFIG_TEST_HMM) +=3D test_hmm.o
>  +obj-$(CONFIG_TEST_COUNTERS) +=3D test_counters.o
> + obj-$(CONFIG_TEST_FREE_PAGES) +=3D test_free_pages.o
>  =20
>   #
>   # CFLAGS for compiling floating point code inside the kernel. x86/Makef=
ile turns

This is now a conflict between the counters tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/GVegj5DPSrveeT+xQFKVRJ0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+H48YACgkQAVBC80lX
0GwEzgf/b3g7CBwsr7if9yTTctVR3+Aj6N+ZXuo6qaHUMhfMZFckXuEYAYn39Jpz
tqrJZ5zqQne/OMuohi2JkMi6Yx/zuhMyk6fXuAdFec1sJFy6+W2AEoTFLGT7XBUC
T+MFtisK0JXQWbEEkM5DLPiyeSDGGykFS8mr4ol/AX9HCXTH3Hq7SvfRU/g9cwPY
Geb930xnuEGPXWyO/nm5pLwoRA7Oj9FGzDAxjOYBcbOwyKp+aBOnxNB5iJGBrgKg
Rx685F29EQ6Is4bQ46ZNfcsEl+OnkzcdLVElmq1Duhg786NAPB+AkYOi4q7I6XuA
IQxqpMpUGew3KyZWHidktY/xUAlkuQ==
=N1y9
-----END PGP SIGNATURE-----

--Sig_/GVegj5DPSrveeT+xQFKVRJ0--
