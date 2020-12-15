Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F81B2DA751
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 06:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgLOFGe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 00:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgLOFGe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 00:06:34 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1105C061793;
        Mon, 14 Dec 2020 21:05:50 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cw5n7326kz9sPB;
        Tue, 15 Dec 2020 16:05:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608008748;
        bh=lU0lxYJKnpTfsUAv3vLnufL4b9WTdsEp0NDPe4aR6LA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LfA7ZWzqsHOX3GsOVOIX6hOscizxunu0vC1qOcr5CIwgnGDLB9mDRgmUfIRSETkcp
         85TlTed5wD5acjotBsJJ4n0wOSth/u1YkvXsGdwNpfwPp/ysfJssAc+P+NBJ33COwD
         S8hM0bi6YkubxPJX8kLI6ttdvmxQ4q1u4QXDqpyBxJYHWXELKFMKwQi51Okginf9ky
         iIkpfbHweSC9OndGWOpNSrHdN8EcpqKtMRCNDBgPQsLrW7Zt8yd6fcPFckbJ3rj2PE
         XW7MGCwnRBlYzSWw92L8ziGWX9D2xddyAOmWx2nPnigG5MCf5GPB184JVFr9jX4f0M
         n/DDuDrejuOFg==
Date:   Tue, 15 Dec 2020 16:05:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>
Cc:     Parisc List <linux-parisc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the parisc-hd tree with the
 asm-generic tree
Message-ID: <20201215160544.2f02b8f5@canb.auug.org.au>
In-Reply-To: <0f001a81-b1d3-4df4-28db-b193812a1a42@gmx.de>
References: <20201102123841.39eb4216@canb.auug.org.au>
        <20201215064847.3676d9bf@canb.auug.org.au>
        <0f001a81-b1d3-4df4-28db-b193812a1a42@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y8PSu=jN=tpqUXGeV9S3C2l";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y8PSu=jN=tpqUXGeV9S3C2l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Tue, 15 Dec 2020 05:45:49 +0100 Helge Deller <deller@gmx.de> wrote:
>
> I dropped the patch from the parisc-hd tree for now -=20
> it needs more work and will not be part of the next merge window.

Thanks for letting me know.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y8PSu=jN=tpqUXGeV9S3C2l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/YRCgACgkQAVBC80lX
0Gw6Dwf8DS4EZQnlT9kpTx9BABkNskolmN9q98bThb9Oc5zpb2HNarrVJ5vugy+4
KF3Z1wHiFdBKrR+I8E7Zyzm99yZvY8UZWs4I3RafusScOPjz9o2E7DqiIVbxccR8
pNkFbCG1iP1WfWLUaiog81bVBdeoP1k1Jca8QJiWNteXlcWUxBj3ZBYYaFDcDpTU
Rz5eI3r/tHDbrsAIABaO3dugHjBvNhLmFIabekWZDkLyv2BpnHiL2EhHsfENrK/w
4TInddiYSophQfL9GkqC1fvff5x3xah6+3bFWALkaS75AsucGNZoN/hHTfUYGaLj
wYTj92FW9z8yjYmyNCLKnCxzz7oaFQ==
=jv+t
-----END PGP SIGNATURE-----

--Sig_/Y8PSu=jN=tpqUXGeV9S3C2l--
