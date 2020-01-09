Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67885135148
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2020 03:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgAICWn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jan 2020 21:22:43 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38767 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbgAICWn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jan 2020 21:22:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47tVJJ5rsgz9sRW;
        Thu,  9 Jan 2020 13:22:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578536560;
        bh=riqZCzpetlOrzK/RICQ5QDhyJ95/csHhh1IRUG1I734=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nik6mqC+89EH5JTyUpOQGKBSmw26Ta/Kuy6ojOKesw6AIimIe0QXUoc5c/D5e1LKH
         dVxJ7JWTwvCh6Lu5JyyYqjyCCwwOpIYr6iYz5gSWqTvHP1plefT1A33UYhicsZPsRt
         kCTB/W/7aJWnyloMXhooqWWa9hJOll8kW5ndjVhIcv12EUHuog31zBS4sSLHwLWAqF
         MPc6kfd144FnMujGpQkvgsYvMkbPXQ6m6YaVySNAxcvvYZLXRcC0nK1Uv4j6gELBH2
         TU1P5ImH5qvv8r+Ib/VhBIBGSftvIehBg11Ad3tFYNJ4sjZIx8Xpng5IKU3cwjBmIj
         gbNk5GB4Syj7Q==
Date:   Thu, 9 Jan 2020 13:22:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failures after merge of the keys tree
Message-ID: <20200109132240.264728ef@canb.auug.org.au>
In-Reply-To: <20191212115901.221d8ba1@canb.auug.org.au>
References: <20191212115901.221d8ba1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dyxcWIddM/xj714Xk.RfnNj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dyxcWIddM/xj714Xk.RfnNj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Thu, 12 Dec 2019 11:59:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the keys tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

	....

> Caused by commit
>=20
>   068df091816a ("keys: Replace uid/gid/perm permissions checking with an =
ACL")
>=20
> I have used the keys tree from next-20191211 for today.

Any ETA on when this tree will be updated?

--=20
Cheers,
Stephen Rothwell

--Sig_/dyxcWIddM/xj714Xk.RfnNj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4WjnAACgkQAVBC80lX
0Gym8Qf9Gse2VPOCLAAe/VZ/zBmm4qVu9RcJ9K4JT9ciwLOBaatZHwFcRGuiduTV
o1MZLLdnQbfb6LOIKZN5CoENirJUC6qPj2z6LOEW2MG26BR4e28V9snV1BYLkfWi
AL8l7MGNsZ5j9rNKneklSlOETNbzR1+50NGjnWfP44cUlwdFiUiLquJGAIOJ1G9U
LUFRJuwTxODYBWbRX2BCmqmL3x++/4pY81stBzqvgqiBrO++jD8HhPR2YHo/oRxh
DL4NzS61EBQgxqCpfpvM5NR/+Oh3Rcnw1JhuH3SuOSYoo5y++x9XIAfDRAQriJZH
cSkC+41KrpuxDWC4+aScXjbymlxi4A==
=bCkd
-----END PGP SIGNATURE-----

--Sig_/dyxcWIddM/xj714Xk.RfnNj--
