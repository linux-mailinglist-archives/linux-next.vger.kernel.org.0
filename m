Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7B02C009D
	for <lists+linux-next@lfdr.de>; Mon, 23 Nov 2020 08:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgKWHXZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 02:23:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKWHXY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2020 02:23:24 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E27C0613CF;
        Sun, 22 Nov 2020 23:23:24 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cfdsx1Tqwz9sRR;
        Mon, 23 Nov 2020 18:23:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606116202;
        bh=TvkwxywDOruoIMJmS38di0HnYQjxIKz+TH5AobGz+qk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FSky2DaTiLWSh6HQ0oNaGB4S+/H5P5Jvb1+ni4c42CsxvsaFzu4pLJvpsN4FSu1Sm
         Up6s6T1GGKcJUUZEDDbPgqdF3BlX9jEExfk0fCL/T9fbe8bf1p+jZxqvBfZWRjY1iO
         0QWYLX0LUtCHPPgGC+romx9+J4j9x1NCajTZUjiLWfmtCZ3bFoNg+UrtPjHn8zlBel
         bgQOvbmcoPbgp2i+VaCyd49KhzXx8zD1mJp6mMcSTNYJScqIKzfixdvgiNxECs8pp2
         OgCwhH9wl5KgTKHgVKbflRdAyB00wPn8S8NmeI0Bw903jZc3ueERxkJbZRH0VWqp2v
         HkT18+h9lQfEQ==
Date:   Mon, 23 Nov 2020 18:23:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Balbir Singh <sblbir@amazon.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20201123182316.30c9ef09@canb.auug.org.au>
In-Reply-To: <7590a38a-12f1-3648-f5c0-6bc9773e7a9a@amazon.com>
References: <20201028142300.34ed89b1@canb.auug.org.au>
        <4614a858-3719-f8c0-3543-faab3524b8b8@amazon.com>
        <7590a38a-12f1-3648-f5c0-6bc9773e7a9a@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gR6jDdvmOYU_OpefDtCOf1e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gR6jDdvmOYU_OpefDtCOf1e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Balbir,

On Tue, 17 Nov 2020 16:21:31 +1100 Balbir Singh <sblbir@amazon.com> wrote:
>
> I am testing a fix by pointing the ref to a label, will send it out (hope=
fully soon), seems to work at my end.

Fixes the warning here as well, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/gR6jDdvmOYU_OpefDtCOf1e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7Y2QACgkQAVBC80lX
0GyzBgf/UyqyRRvDHzVcrI+Nmo1k3JbqZ5nvy34oerA1W3j3dp7IquBtdtzdho/1
lMAMyfm4sxncXcS04bD3ejoXehijfZy3r3/05FYRonXRlvvoMApXF6xQVvfYBaJ8
TAF0LNfyAxyoWna4VJVAJ5RKWiwDRbbJYQweqjLTSP9dhx9Wu6hmgZY5ESLrWE10
6g0YTiP9xb0wTG6SnQ5liQL/BcZH4mvZVHF5UijUfTSKqodXs8JskRMj9P3roMRn
zOkHqpE/esR0ljHaZWANzgJPI0znd4tQZUC2aCRKuk2LU+p1uewfRqyiWT5RO7pY
4BEe529a4gDBNGfJSinC0xPHYzE4WQ==
=EgYx
-----END PGP SIGNATURE-----

--Sig_/gR6jDdvmOYU_OpefDtCOf1e--
