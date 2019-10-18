Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40187DBCC4
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 07:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732849AbfJRFPp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 01:15:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:49695 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728302AbfJRFPp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Oct 2019 01:15:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46vXMg4j4xz9sPW;
        Fri, 18 Oct 2019 14:58:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571371135;
        bh=wO2rnQEfFabWDx7yJbQXx/8U/u93yDA+NcdDOwCKOfk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ffgdHLQryZywbPqY1f+qL0vItMTcIWfH9inoGS/Cgrwv2hVMcUYQuAZkGMxibGV7n
         LVeSKBAK1U5+XYx7KyM9fQjHHhgAIN+qjZcCAputivkKjZ+7kZVuLgOh0PSZJh7iDW
         rpTuGNfZPzsFDY6msb7gUdqXrZFqmKeL+34b91pcJvd/LQpz1IaGvw/76Xh9xJi/Tq
         S1zj7zZPYaRK9IfABuc1hZGSQhpCSGSLF80TSm0jdGKuyyclwGYbqa7t4LOrCKXVJJ
         I4dLZkS9QWz9VfO0TKPKNgpsUVHBpYoLkkgEHS92l5fQLw6u/tqoSalUovNSDud4sa
         uedJhjQawh7Vw==
Date:   Fri, 18 Oct 2019 14:58:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Message-ID: <20191018145854.26b2c645@canb.auug.org.au>
In-Reply-To: <5a9bf632-2466-bc73-45d3-104c4bb0245a@kernel.dk>
References: <20191018115126.6263a3e3@canb.auug.org.au>
        <5a9bf632-2466-bc73-45d3-104c4bb0245a@kernel.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1xzrzn7NBgTfyXx4jJy1aoi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1xzrzn7NBgTfyXx4jJy1aoi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Thu, 17 Oct 2019 18:56:39 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>
> I'll fix these warnings up, guessing it's 32-bit?

Thanks.  Yeah 32 bit.

--=20
Cheers,
Stephen Rothwell

--Sig_/1xzrzn7NBgTfyXx4jJy1aoi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2pOH4ACgkQAVBC80lX
0GzIPgf9EUVKAAVP/p8nrsw99OavZUJcxgUjuNG5LddAjYFMmtB3S01qu6KT5tL9
jQBLGr6zlmHUoe6Xz6VUgP5ZS/fKnfXy12HMEeTPXJyYtq3FGiLplaQTn12Ja31i
OiXeVOS2UAO40rtXB925Sp+WL+drWoJv2dFi27RPNxM8pY6WaqYJgEPTjx3ZZYlS
WabaTqT56fm6UyMnp6XOrDyDqDAf6iX3pS6rjauL9lyGTcQA8cLP/7o55l7c0JCp
LqXcGW8w4bWm4XZA3mk3B2ukNvtmcEqppU7LH0ok8IvAwgv+pFWcOo6v7yEZaVJn
xCcCMX2CRahCF4U79E3R3pCFQsjfmA==
=169m
-----END PGP SIGNATURE-----

--Sig_/1xzrzn7NBgTfyXx4jJy1aoi--
