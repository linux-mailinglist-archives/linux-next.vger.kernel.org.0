Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5D722BD0C
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 06:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbgGXE2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 00:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgGXE2K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 00:28:10 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075B7C0619D3;
        Thu, 23 Jul 2020 21:28:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCbm16gf8z9sRN;
        Fri, 24 Jul 2020 14:28:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595564885;
        bh=YhB3HHfhzOJV0J55f1a2jFvjk0UbEddLnDsRAeWLUxM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pAHp+BkA0PnJglEo857d94RdyoH5mdLijG1Pk9+jSSGNHIy/0vvMB5cmCMZmG+or5
         0ADJq231tcK5kTGLS0zEr95JjD1nvbLhrTYO2cHS44QnnMSeMatqQpAib1qBAl3UgU
         i86GjiTvU9TJaEhuzSQtdKhYtr8eX+oRJ/5jOIORLs5LJOWXM/qi+u43rtSZ53CUc8
         gqqeCDWU4VAyWs3iJXjbuQ56FGThZ/66FMtB9A/2A2hgdd4kJAGZFsyp14HmJ0z8db
         3P3au06OjdO3c5Uq8Kq4OD1L1kVlXHawI+ddnQMOpHzn+LdaPjWgUJgJLMgD/FUQfo
         OguKzssctTqfg==
Date:   Fri, 24 Jul 2020 14:28:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Uladzislau Rezki <urezki@gmail.com>, Qian Cai <cai@lca.pw>,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        x86@kernel.org, linux-next@vger.kernel.org, lpf.vector@gmail.com,
        Shakeel Butt <shakeelb@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Hocko <mhocko@kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Joerg Roedel <jroedel@suse.de>, Roman Gushchin <guro@fb.com>,
        Dennis Zhou <dennis@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
Message-ID: <20200724142801.49d5e7a3@canb.auug.org.au>
In-Reply-To: <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org>
References: <000000000000588c2c05aa156b2b@google.com>
        <0000000000003cdc6c05aae24652@google.com>
        <20200720200618.GA9501@pc636>
        <20200722142759.GB4041@lca.pw>
        <20200722144650.GA19628@pc636>
        <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OgD..tT=0=FzzabBQXvZdTE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OgD..tT=0=FzzabBQXvZdTE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 23 Jul 2020 19:50:29 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Wed, 22 Jul 2020 16:46:50 +0200 Uladzislau Rezki <urezki@gmail.com> wr=
ote:
>=20
> All a bit mysterious.  I think it's best that we revert this from
> linux-next until we hear from Ingo.  I queued a patch - I expect
> Stephen will see and grab it, thanks.

In the end I actually did the revert (of the revert) in the merge of
the tip tree (so that -next will bisect better if necessary).  So you
will not need the revert in your quilt series after today.

--=20
Cheers,
Stephen Rothwell

--Sig_/OgD..tT=0=FzzabBQXvZdTE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8aY1EACgkQAVBC80lX
0Gx87gf/bugyAEE0pEc0D61f6khLKnRAUn2MJwgp7EKc/o7dKc52/oczaQ93hXdD
J3q/cYObs4rAnsmIYg3vHdrOKT+ETPXB01hCFIdoFcch+Jd4JogegYC3/JHP+8Ml
43SiSFiCQJjDLeaTdTsdU8IfRHB8xIkDEpIHltriINwmfS3TOL7GncUxP3aPdMHC
jcJA2B3XwWNMGNtqwR50RSjYYY7EO2vMDsImC0bYKh8n9r26jynmAIUbAT7ZyGBd
FRi6zK+GLAd94EWaKSPzI+FpuodiSG7v+HBs1N9l8+j2DC0Vy947D7cLqz1JruBB
FKky6McqW1Gh+FHO5A74vzwTMZni5Q==
=CFMR
-----END PGP SIGNATURE-----

--Sig_/OgD..tT=0=FzzabBQXvZdTE--
