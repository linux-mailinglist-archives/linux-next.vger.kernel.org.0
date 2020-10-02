Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00ABE280E61
	for <lists+linux-next@lfdr.de>; Fri,  2 Oct 2020 09:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgJBH7f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 2 Oct 2020 03:59:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51791 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725968AbgJBH7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Oct 2020 03:59:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C2j7n02Q7z9sSC;
        Fri,  2 Oct 2020 17:59:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601625573;
        bh=OkRahBuUgOJ+bPRpFw5pqVSDAYrGe4TbxIqbLavU76g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zzo+yPbjZpOtIwXGdeQwoVvDqciTsmluz+FdmnJYFEnfdA7EvMpf8gAh/U5eABLzE
         xERAmVmjTlP4nJrN1Bclo1hH37ZvuZgQNJx67lYfeeFl/hFPdfscdWlinNJyavvlWC
         WM1ibG4scqzqhP4SUoh6aKBSeUwYFlIjQ1YaluX5Dc43iEFwrSA4qDw/yXyx015DB0
         pdBobNhw6kD/OhBwc+d/tLLCw/K9sHnaS2qhH6gIh38HSAJSgwvBOulV91pU6YbfN3
         DxL4M8I6XdXNKJKwl05VWWaiQLVMGVhZlH8IcnF/t/90qQ/I8WpCpINoL6ePXRhTpz
         Zv2hn7z8ps+6Q==
Date:   Fri, 2 Oct 2020 17:59:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH] selftests/vm: fix: make check_config.sh executable
Message-ID: <20201002175931.5317ef64@canb.auug.org.au>
In-Reply-To: <20201002064811.435769-1-jhubbard@nvidia.com>
References: <20201002064811.435769-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xtO5/x_LCXVCRm_BYvugP.k";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xtO5/x_LCXVCRm_BYvugP.k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi John,

On Thu, 1 Oct 2020 23:48:11 -0700 John Hubbard <jhubbard@nvidia.com> wrote:
>
> commit 30fb9454ab23 ("selftests/vm: hmm-tests: remove the libhugetlbfs
> dependency") created the new check_config.sh file without the execute
> bits set. This is a problem because the Makefile runs it with "./", so
> now "make" is failing in that directory.
>=20
> The posted patch [1] does seem to have it as an executable file, so I'm
> not sure how this happened. But in any case, make check_config.sh
> executable again, so that "make" in selftests/vm works once again.

The correct fix is to make sure that the Makefile runs it explicitly
with a shell because is such a patch is applied with patch(1), the
execute bit will not be preserved.

See e.g. in the top level Makefile:

	$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@

--=20
Cheers,
Stephen Rothwell

--Sig_/xtO5/x_LCXVCRm_BYvugP.k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl923eMACgkQAVBC80lX
0Gy/vAgAkrfjf16OkbBuUzkb+lkFNt8sQhXlaysO4C7GjbSbzoyCkTJav+xGbrk2
JyQobQe7CkNKgh25sHxL1Mo2ZOoDhydqdzgt22q0iu6Df1j5fqmhK/3qROpT+Jsj
i+L4gmdqNQ9uMO9hiX/FBRkCaDCTmjaC+VoBgHYFvqDD2210aOrwYWmokUWh30Mx
5LYY1Z3pfvPwJJEs9DftBGbW1IwgcP/Pqz+DNcizWWA0dJZt2xz4xBFpf9PmbLY6
GEYBrh6dFOQJTgU+GGnTcgzkhhQxnEjHfDa/ATp0m/7ij4ejwueP1ikqxkUGaYsX
Zl03iFomQqEcOtoznce1ewRnfR36fQ==
=1EHW
-----END PGP SIGNATURE-----

--Sig_/xtO5/x_LCXVCRm_BYvugP.k--
