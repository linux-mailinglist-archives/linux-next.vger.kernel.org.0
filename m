Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663B121FE77
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 22:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgGNUWd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 16:22:33 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52353 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgGNUWd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 16:22:33 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5sPy5MrBz9sRK;
        Wed, 15 Jul 2020 06:22:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594758151;
        bh=m6q0t5rQ4tSfOmMooV1EHEwUQAHvbpn5mjHL15F+qEw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P8ibvs29lkUkCz49co9V7WPBcFc/Fsw2a7NNDseIh5Z31qyH7nJnsa3KUz/4KcVHh
         XKaV46mul9bSfayC/SuC0pMo/cIsabqX0Ssqr3ROzYPLYP/gMlHEo/br7IWo1BN1Zx
         Yak5pqJreqTXZckh2FJxYNYTd1PgBpsFFWkz3fF4DRMinpALDJsfHr8XH3lXBQW+yq
         kKRPfE4iZoOHBrWBEqnhLj6TPEtQxPK1BqaYzF9HV2JkfbETO8Q2mWN7b2p7gygoAO
         /VjzTRywXnwW4StfhKJLmi/P4Khyhzd9ZEZO44JBhvzsww+HRXJO3vRdQjut/W7CDU
         KBdoxrjfvqg8g==
Date:   Wed, 15 Jul 2020 06:22:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>, Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v2] mm/percpu: fix 'defined but not used' warning
Message-ID: <20200715062229.78591ff9@canb.auug.org.au>
In-Reply-To: <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
        <20200714225311.7aeffffd@canb.auug.org.au>
        <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PLQTjSuhLZHKFG1.u30PGb4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PLQTjSuhLZHKFG1.u30PGb4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bixuan,

Thanks for this.

On Tue, 14 Jul 2020 21:46:18 +0800 Bixuan Cui <cuibixuan@huawei.com> wrote:
>
> Gcc report the following warning without CONFIG_MEMCG_KMEM:
>=20
> mm/percpu-internal.h:145:29: warning: 'pcpu_chunk_type' defined
> but not used [-Wunused-function]
>  static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
>                              ^~~~~~~~~~~~~~~
>=20
> Add 'inline' to pcpu_chunk_type(),pcpu_is_memcg_chunk() and
> pcpu_chunk_list() to clear warning.
>=20
> Fixes: 26c99879ef01 ("mm: memcg/percpu: account percpu memory to memory c=
groups")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

You really should not add SUB lines for others - in  this case a
Suggested-by is more appropriate.

--=20
Cheers,
Stephen Rothwell

--Sig_/PLQTjSuhLZHKFG1.u30PGb4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8OFAUACgkQAVBC80lX
0GwHggf/bNn1uN+FOLwHWa7pt12Gtfv8cZ13520mBvzbvw2hVaoiMGE1xgZuZ6WM
9VYCtJXLpeFWsHJXOZKBI0HxIjJHkDR5rNZ3fnorDexzBJ0LvjTj/GUMjuUHv1vq
owAraeXUIsJUDr2jpuRq60+5PUm80F3+YGF35694tl1uHxK8Do/CFM4i7bRz/aQ/
ynfJNm/hFoR9CbBDISULAujfLnhKHgwR2z7fxgqqSM3Uj3hWZZyTI1GfS6oKVsJz
XN7UEb95LUCQiCUhsZeU2g4IR/rkXokDwoqDghIEX63zeb5//XJstDKHV7x6Xpgd
v49A+51vkMXaLbMI0h4C+gXZAETleA==
=IdV1
-----END PGP SIGNATURE-----

--Sig_/PLQTjSuhLZHKFG1.u30PGb4--
