Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6976531B282
	for <lists+linux-next@lfdr.de>; Sun, 14 Feb 2021 21:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhBNUsT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Feb 2021 15:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhBNUsO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Feb 2021 15:48:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699C1C061574;
        Sun, 14 Feb 2021 12:47:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DdznW2sL9z9s1l;
        Mon, 15 Feb 2021 07:47:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613335650;
        bh=YLcFRnFRUl32GsBiD84KfQ6NqrZpCb8tXOYwNq/9U1M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F8AXDXRjYUuthPKOBy8yzDpYEfBjMumVE+XQU799uJ8WICRa/0I08VU6HvwsBNsRO
         89oAo5gwjJOud9/zHI8juzaJio9VFT/bIALfndJszNOF5/jqp78e5cHIxotluattBG
         I3CqZJiKNJgI88t/Utvys60RpqLL/3RvUg17RLr5xTWGHxMX9zffsdTNVbEw0fI9ZP
         8/gWIH8VLyKW1sVFzrMFL/cwBZ9O8BUCGywzQ6DDlRNGlysxWCFxvlqE+F6kZwATWb
         Gyt43TG3RlNjTbrgAYpUe01s+I1RHYzjABiNgGte+zS8E9ZS7GULEc2EKOZnlKHB3I
         3tS81Q1WO9qFw==
Date:   Mon, 15 Feb 2021 07:47:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: linux-next: manual merge of the kspp tree with the mips tree
Message-ID: <20210215074726.60c45281@canb.auug.org.au>
In-Reply-To: <20210118150804.378ac9f3@canb.auug.org.au>
References: <20210118150804.378ac9f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nS549xQolZZpAWCMJA.39+J";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nS549xQolZZpAWCMJA.39+J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Jan 2021 15:08:04 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the kspp tree got a conflict in:
>=20
>   include/asm-generic/vmlinux.lds.h
>=20
> between commits:
>=20
>   9a427556fb8e ("vmlinux.lds.hf41b233de0ae: catch compound literals into =
data and BSS")
>   f41b233de0ae ("vmlinux.lds.h: catch UBSAN's "unnamed data" into data")
>=20
> from the mips tree and commit:
>=20
>   dc5723b02e52 ("kbuild: add support for Clang LTO")
>=20
> from the kspp tree.
>=20
> I fixed it up (9a427556fb8e and dc5723b02e52 made the same change to
> DATA_MAIN, which conflicted with the change in f41b233de0ae) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging. You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

With the merge window about to open, this is a reminder that this
conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/nS549xQolZZpAWCMJA.39+J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmApjF4ACgkQAVBC80lX
0GzWvgf/Y69q/cVrjpJd4RCXHUDA8W1MOwX3uLH0BokkbDXx1HzNlyEp+t71cSgw
LWVpkSXeQyF5iq4Nfq4Bed1Z30x+xV30izcuVIUcCdwX898fCu0XC1pE15W8HOLe
e9BIKSZl6SUN5a3KbrSozjSLYGCXrTiCbk8Ha9ME1mxMsPjVJzecdcTtI3kp2Lyl
gJOApeQqXWHsv1L+QuCTy3M79neshYPfsJt9nlZ0kk50Hga9owZX4E4Uxn62fHu6
q1GgrjvmHTAGt5B6Els5LxeWMBMVIn1M5MBZqK4r19mSqYAOrGp1z7in9kYRocje
3SndlImvhMFHAIhQxIyMPM1fSbZy2A==
=bekH
-----END PGP SIGNATURE-----

--Sig_/nS549xQolZZpAWCMJA.39+J--
