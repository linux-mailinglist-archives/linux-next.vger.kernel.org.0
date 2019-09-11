Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEC3DAFADE
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 12:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfIKKyo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 06:54:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34243 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726793AbfIKKyn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Sep 2019 06:54:43 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46SzLR1JsGz9sDB;
        Wed, 11 Sep 2019 20:54:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1568199281;
        bh=xZQ6AucVcELq6Dg2ZsMho6IYWPSOv3bhTWi0rIKj4PM=;
        h=Date:From:To:Cc:Subject:From;
        b=C+auiqPnRVBFXjH093vJoQoP70pfjJlor0CLjGlQjAezmnGuI1YfW4JJOmqZyYwUj
         Ce28QiJGGfhH8J+tSXd+RLro1twVXbj5J9JSRHVPkxftwEZOZLw5Yeet8vr5AZhJl0
         wQS805ND2592WsgTYm3Ac+0BBKHf75CJDaJihR6Nwha96RPnJ15pq1zkE8RSPNL4wJ
         CDhwSsq6TsgsmIkk1438XRl3M+K+sJF0d3LxDFmW4OtSRMY5DX8iSjzE/lUWwbFvK9
         e10ZCPqogpOvxLhYATUjvIvnJZT0irpFZCYlwDWlXGeKHNI+mmFyYcxN8tX0AUroIL
         61FcnJAPB+O6A==
Date:   Wed, 11 Sep 2019 20:54:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: strange set of patches in the y2038 tree
Message-ID: <20190911205439.18e7073a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gtZ+WBn0ZU=kkICxUgB5Yyp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gtZ+WBn0ZU=kkICxUgB5Yyp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

You seem t have remerged a whole series of patches in your tree:

commits a55aa89aab90..ecc43067d9a5 are identical to commits
a55aa89aab90..846e9b109913 apart from the commit message for commit
e83dd16c24d8/654f7717ef51.  And you have both sets fo commits merged.

--=20
Cheers,
Stephen Rothwell

--Sig_/gtZ+WBn0ZU=kkICxUgB5Yyp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl140m8ACgkQAVBC80lX
0GzR8Qf/d0+pILtP+Xqx9ZvfMHhr6kPR2bPvreAFZFizJEq/XGoVSsDXbN1hzXjq
+RHOJiJAbYv8UZIxRgTwh5V5gtiSHUNvalUwAv45zrbP+fjwkPpNpXm7k+IukUz0
NYnQUQdDToDO1NsBKznQ1eQmKil7AABuR42YqZOmSEeXgVQ2/x4eSqkkQjKGpCu0
+2KulUI5jHsWR9Cjon6C3PCXs+46CIlI7PpOysJR6rMSNdLt3zbOOXWWCeuR3Hjs
WGyODFL82Tv4hM49SNjaQLLg1SIRat2okxtnCU8wuv3TPy+08imcjfYnEia5iEmv
fSBktyQsiJHm3oxT7nklkMdNtURUDA==
=1tFq
-----END PGP SIGNATURE-----

--Sig_/gtZ+WBn0ZU=kkICxUgB5Yyp--
