Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7962D3F75
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 11:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729229AbgLIKC6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 05:02:58 -0500
Received: from ozlabs.org ([203.11.71.1]:57019 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729051AbgLIKC5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 05:02:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrXdy61tfz9sW9;
        Wed,  9 Dec 2020 21:02:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607508135;
        bh=8SjBJC3enLh3C+xvok+MiLcCtIZVyD81LmzuiIuJ3cA=;
        h=Date:From:To:Cc:Subject:From;
        b=hidnZwe9EELIeCt7sTHpZVUWam7dglNl6ATyqnkcFjbChIofmY8o54kv81Nr31j+o
         0YKJ8zBxEBNMF88rdNcHIt+ENjrKgbpfNR4BeTuh9rPypw5KrVn8OLPwZgbOTYV6wa
         3KNH0hwy6PQ3vlw5Kio3XLxXolrqqUQK1oFj5Nw2OYdd+IrGSfwsaS8g1Qb9JtAgIV
         L2vNe2SQUE7QgovX+dRiq9PAfyQqQ702PrUtD1Ub57t6CfjVw/od/quJ4IJc6zuu/P
         8+oFgueGS0c7eMSm4N4stwvhEJPmwjzeole1T/qQzTXmOohfSLdEMNYLalacklsExb
         vS1s7L6iSOpNw==
Date:   Wed, 9 Dec 2020 21:02:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20201209210211.306f3c61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0lxQX6ywS7+eQSbvvKXaRXv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0lxQX6ywS7+eQSbvvKXaRXv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/gpu_scheduler.h:201: warning: Function parameter or member 'lis=
t' not described in 'drm_sched_job'

Introduced by commit

  8935ff00e3b1 ("drm/scheduler: "node" --> "list"")

--=20
Cheers,
Stephen Rothwell

--Sig_/0lxQX6ywS7+eQSbvvKXaRXv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/QoKQACgkQAVBC80lX
0Gzo3wf/b98Htxe7h38fl2KCe5idJnjdkTJOApijxO/rukHJqw7tFyErFM5OlrIc
NtweqOSbmE6w2BJySSVEnMf/mPtrNym8DlvnnhTJeQgVtRcudz3BWSAMr2E9seK9
j4isxTieAFM7Qv3Nd8dG9gE8siL9d1EhnohQxoMLUDUSoagBthOTWKbhxUWRGWpi
JQ/s1BZlKO9zMPglBtqkW1l+olJvkOMcAN3e9o6SL8y+jTJdlQEZrBWbD+2FrmAt
nB1dGl1Q92XrVmlnQ2w2cvf3QuONCeFG/RCAHGUdBiSenRwS3KOGtQIf9too44j5
tywpkaatKs6FvIfE3pFGb2GovxwR0A==
=29MF
-----END PGP SIGNATURE-----

--Sig_/0lxQX6ywS7+eQSbvvKXaRXv--
