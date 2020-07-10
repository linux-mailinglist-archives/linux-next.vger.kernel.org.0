Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAF721B404
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 13:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbgGJLcI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 07:32:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:39572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727932AbgGJLcH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 10 Jul 2020 07:32:07 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1644820772;
        Fri, 10 Jul 2020 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594380727;
        bh=DsxgGQtteJ5Dag2ELjZEPgmaWOIrZYUtj1T8cCPPMIY=;
        h=Date:From:To:Cc:Subject:From;
        b=Ct2emtiAwvSgHAUlaQYgjKC0MO0ByHfLlXOA6JgRKDXmSnhqvC4MrJXJ/Awp3hCFr
         KUyOTt8RmGHfGi2YQ+ShznyjCFCJbYFbZNwlpfeq1lqHz4/MdtxE5KUVm36pW4gYes
         +7fty09/TLS3rNljlw50ARbg02jFXWF1TbeBrFyg=
Date:   Fri, 10 Jul 2020 12:32:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Peter Xu <peterx@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>
Subject: Build failure in -next with get_user_pages_remote() API change
Message-ID: <20200710113201.GC5653@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1SQmhf2mF2YjsYvc"
Content-Disposition: inline
X-Cookie: Use only in a well-ventilated area.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Today's -next fails to build in various arm64 configs with:

arch/arm64/kernel/mte.c:225:23: error: too many arguments to function call, expected 7, have 8
                                            &page, &vma, NULL);
                                                         ^~~~
./include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
#define NULL ((void *)0)
             ^~~~~~~~~~~
./include/linux/mm.h:1705:6: note: 'get_user_pages_remote' declared here
long get_user_pages_remote(struct mm_struct *mm,
     ^
1 error generated.

caused by b7363b0ab88d66d3c (mm/gup: remove task_struct pointer for all
gup code) which updated the signature of get_user_pages_remote() without
updating the caller in mte.c.

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8IUbAACgkQJNaLcl1U
h9CTNAf9HaIwjUGkKI5BPXuZhk/jlgg+MNJiQzY36lyXJ6/OpW4FQB0r2vAm0rRW
RlJsyXhif7WKKnzhtTjIAXK/w4ZOm+2B5oQCsGYe0JgH5cB9NTaUoxVs5cB8YqFG
F901wvsFtwnDWDdgIby/X9GwUtXM/gdHWLz1qEdb5sbQ+dbXApSEky4AdiCB/G5K
OT8VJxdoZXBQaoui9SaQMlS6MBrH0ro3M4/Jhfrve8gvwICha5MlOKrT/DDbZd+6
4lPvWDdr44OJglGkmE7IV24PBMZoipehtwurJQ4acfe9WNybUUAaRM/XSQGZm9bE
7mmuKsfmGXe+k+vf7Hd/yDdqIsliPw==
=BO31
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
