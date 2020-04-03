Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4617019E091
	for <lists+linux-next@lfdr.de>; Fri,  3 Apr 2020 23:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbgDCVzV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Apr 2020 17:55:21 -0400
Received: from ozlabs.org ([203.11.71.1]:49359 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728173AbgDCVzV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Apr 2020 17:55:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48vDJ6499Wz9sQt;
        Sat,  4 Apr 2020 08:55:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585950918;
        bh=j3EigSV0Ng6FOdyJJkXAsvQ5sLC9jpuE7WD6+n1NRNg=;
        h=Date:From:To:Cc:Subject:From;
        b=R4FuLMFAy7KFQb+2H9IsBYb5zQPC37J5XNEIjqEmlEQYuqY8YkYi8FaLrbWe51MYp
         BVgTyP7GKMCnHON/o58AMZlbivqE2cXiC9f6OvdyP0iFabWJ1+ADFoHT4q+93VUIg0
         /pMh98x9VY4OqQ4g8FB2MGFw/JxUcIRubsY5fCb70B8MYvsE3IfI7VfTlz0ba0O/aw
         AVdu7QDVKtGQOWz8xGb0ZEQFY7XKGkH7dL0cuQQ9lt7aFguYaQMZey8sFtZyHqss79
         qwcAD45O+6gkeJyRUEcp7P83xWd4Y5JRh0vqbvRMadnHGsbwz06gvtvGB9YZm7AAEl
         C2bVr8wRBUxJw==
Date:   Sat, 4 Apr 2020 08:55:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Trond Myklebust <trondmy@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20200404085512.5ac25c61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=w/1z=qZYEGftMQtVfT61uE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=w/1z=qZYEGftMQtVfT61uE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  52381893a2be ("NFS: Beware when dereferencing the delegation cred")

Fixes tag

  Fixes: 5f4adff16fa2 ("NFSv4: nfs_update_inplace_delegation() should updat=
e delegation cred")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 57f188e04773 ("NFSv4: nfs_update_inplace_delegation() should update =
delegation cred")

--=20
Cheers,
Stephen Rothwell

--Sig_/=w/1z=qZYEGftMQtVfT61uE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6HsMAACgkQAVBC80lX
0GwWuwgAoxRY9VNtX4yDtZQ1fJYOPtU5hvrNAREkaDCmMqBa2VN6mTapOv/bSk9K
zrav5GMJ/GUUJ2eCihReMx/Y0hax3lDQ8/TK5LZypzLsSUOjYd62mP/bTw4z5oK5
k5znlRtaEDW4sV+eWU2GnpymFzityrFiRk7bS1EtysMrl9zmNUCozG+GkRvowFb8
LOSEqCcrwzRzgv7UXmFl4Cz9mTHaE6O7fJsxw8wQAhWdQu4f3rRGKf0s6xAwDMwe
ElmoEnBMvPvEQP2aGugIdenclUGZVO2wcdcqoseIgDyVnB9XEonm69EBgHg1SXLd
0fB8rMFRYRa866dKbx1DtKd1+DIEzA==
=vE0D
-----END PGP SIGNATURE-----

--Sig_/=w/1z=qZYEGftMQtVfT61uE--
