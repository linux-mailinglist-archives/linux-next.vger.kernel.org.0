Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B07172A1A
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 22:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgB0V1d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 16:27:33 -0500
Received: from ozlabs.org ([203.11.71.1]:36517 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgB0V1d (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Feb 2020 16:27:33 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48T5Nf0Ncvz9sPR;
        Fri, 28 Feb 2020 08:27:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582838851;
        bh=omOnNGq0U034JZ/QYlQHI7lRvUVuc5B272R1Clx6w90=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QWbISm30CN9u70xArU3KTJ/QxAOYT3+A0yZKQ1A5mD+sbgsOYLeqbkJQLdDJ0IHbX
         tmcHDwX/tJf2B3OdHnjuO+ozvj2iERtOrsmLP68MW4tnnAtIzZMERFVVqChQ47pt5a
         laaqcwCf/wXGKxcco4Hx8PQ0GMBap6PU01waW5VIT7eKcTXcOipyjtD1u/pKw2vS2C
         bA9wg05v5BjehWXGh+vGNx03QN9ppzGfsBTaT42zIo6PA3UwVin1fBR89rtUuf827I
         iPlMOCix+nt7hNKi9nSkeu24L6Qg2meqWqQStqK06Dd8Anatw6qDQW/QHyV62eKlyq
         KTpZZy/xueqxg==
Date:   Fri, 28 Feb 2020 08:27:23 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arjun Roy <arjunroy@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Soheil Hassas Yeganeh <soheil@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Message-ID: <20200228082723.67dd958e@canb.auug.org.au>
In-Reply-To: <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
References: <20200227151143.6a6edaf9@canb.auug.org.au>
        <CAMuHMdVc-vyQfuLUgbF6ei9Qrr+fryA-j1PHsrsjTNiOYvUk+w@mail.gmail.com>
        <CAOFY-A0=AYDSdGq5tf7s6_kRjnDGLfLjCV9p+LdKbLwyw0J9nA@mail.gmail.com>
        <CAOFY-A2CFi0pX1BBsuruntk0AM9doseCMnFCJi192BYojaBUUw@mail.gmail.com>
        <CAMuHMdW-0xuxK_Cd2t3=BZwwOUhrYf-Ctn+frW_1tTsO5eQxOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s6lkM.vur1iRP7o1bviaw51";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s6lkM.vur1iRP7o1bviaw51
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, 27 Feb 2020 18:57:26 +0100 Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>
> pte_index is already a #define on architectures where it exists, so
> you can just use that.

Except for x86 which has a static inline function and so will require
#define pte_index pte_index added in arch/x86/include/asm/pgtable.h.

--=20
Cheers,
Stephen Rothwell

--Sig_/s6lkM.vur1iRP7o1bviaw51
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5YNDsACgkQAVBC80lX
0Gyr1gf/b7Yu09ctjMXEgwfPDPcds352Azl8/oX7ytbqKfGif5oLE06dxZTFS5C4
d0FNKjaT1EAxTo9QSJrV9CozKoZfgeY/22gNSK6bNTaVRl+P5pOpc3lGTUNcSJge
/Bd5/zQKOEPmirpE2fz2qnyyyYK0c5us0j6pYW8ZWO8aE0I7mf6GNK3ZAjYhsEy1
3cbBu5Lbm5rrZA/wSPCX43W+7VO+PxmR+RaPPjHOS1f9SrswZVBSkRpf664MBHl4
hfIKMkhlt1abK5DdFJJmwZ6N7wEE5oCE6PIOTqUKYy3/+YonsFf80aEfTEjI+rNF
CXRVHQikUdpnVlmkhUwPb+vspy6rwA==
=XIWd
-----END PGP SIGNATURE-----

--Sig_/s6lkM.vur1iRP7o1bviaw51--
