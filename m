Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94733184515
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 11:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgCMKmS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 06:42:18 -0400
Received: from ozlabs.org ([203.11.71.1]:48533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726423AbgCMKmS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 06:42:18 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48f2MD26tzz9sRN;
        Fri, 13 Mar 2020 21:42:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584096136;
        bh=jrmjeEbuq1HfpbJL7+QclLvRYJFhIEMsgxdq99kwO58=;
        h=Date:From:To:Cc:Subject:From;
        b=DJ4tjzzkVx3SH1GDRlAsIZUXZklai9Cns36OY3pDkwlgmls3MowQWjcXCNfYEX3+F
         f6KKlSP2h+bbgeoltLu1pWPJiB4hUS+gSgtx5G4igXROxbpq6auRVqAwHXET5645xm
         TDK7HTLJcjWN59qRBnatX1+RvhXNIWYHFop4Rw+ZetgczcwB74v5WbkLhYc7/M6F6n
         KTDU+GhWS0LwDKd3/6v1LYdSQGAgHlTPs4GPA/qSS+m63bbyJqxQl2q+kinD2VdpEp
         o6KXTtqPmdhxSWmH+eNVxONAlAn9vD66EA6p9OhQMkuW+3QlxY+agXDjEyhteiz6RC
         BhVGo/kPoRg5w==
Date:   Fri, 13 Mar 2020 21:42:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baoquan He <bhe@redhat.com>
Subject: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200313214214.4d2e2af6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J3tAiRt.Pe=QlTWt2Tz1i0w";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J3tAiRt.Pe=QlTWt2Tz1i0w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allnoconfig) produced this warning:

mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [-W=
unused-function]
  311 | static int fill_subsection_map(unsigned long pfn, unsigned long nr_=
pages)
      |            ^~~~~~~~~~~~~~~~~~~
mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not used=
 [-Wunused-function]
  306 | static bool is_subsection_map_empty(struct mem_section *ms)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used [-=
Wunused-function]
  301 | static int clear_subsection_map(unsigned long pfn, unsigned long nr=
_pages)
      |            ^~~~~~~~~~~~~~~~~~~~

Introduced by commits

  38eb09ac7c29 ("mm/sparse.c: introduce new function fill_subsection_map()")
  334411156ba6 ("mm/sparse.c: introduce a new function clear_subsection_map=
()")

Or maybe laster patches.

--=20
Cheers,
Stephen Rothwell

--Sig_/J3tAiRt.Pe=QlTWt2Tz1i0w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5rY4YACgkQAVBC80lX
0GzQkwf/fKaM7N7Pnn7CKZuxu5GHmKRZupcDK7DvViaR9hRJXB7sAbd045M3ig05
k19uEYFPPzarlAn/gEomOJLS4miFMFTsojvC58oJqMTh/LN/FPzOLrPmcUijdVC0
fp0FrUaKfZnf0XSppQ67lsyQJt8Ib03cQbqDmXWP19/LguXqy+VztplYPpGeZS5Z
FRDh5/Y+mPaXMpusxKcljwgpId9F4Cmrb/yZktEiCEmeOr2CEdJ+6Rvzv/5mbdqv
zF26v/byzR/7r9Zt+A2VhAXBPgfR3WyQYi5CIy2xXk+X+9GGLfIebD9Ix38FzFKX
JQiIHSewNFPyT7zvhc5zhzTkPbn7qA==
=/a8l
-----END PGP SIGNATURE-----

--Sig_/J3tAiRt.Pe=QlTWt2Tz1i0w--
