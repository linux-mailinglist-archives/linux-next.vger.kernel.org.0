Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CAB3A263E
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 10:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhFJIK0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 04:10:26 -0400
Received: from ozlabs.org ([203.11.71.1]:36569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229770AbhFJIK0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 04:10:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G0xSC3qv7z9sPf;
        Thu, 10 Jun 2021 18:08:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623312509;
        bh=HbMbeVhTLdLteAXFbgMvq6ZShelkDmjVP+RiPkAKL/c=;
        h=Date:From:To:Cc:Subject:From;
        b=OExfnL20XAfoL3A3EoWqs6AvHzixQI7qOoAUQHxb7EdXybz2o0zym8Nxfj54k2YRa
         FYs6ktqSoW+Vy6L/N7SqmBH/WVmgR/SSAezJmU+pQSO8hbDF8s2v3/FMbXRbYXTwq1
         3spf9OqRnf1M9J1UsBI+NYAKx+8NvLcCVy/FvBAxdrY0iY6ph0oAme/pY6E/d02L2L
         ruxNd90w0A+YU8ACaDBNMsGyCRn1GPvf2hHy7kmGZreDzlTvJG1b72/BFRoAaupDB6
         tzstEKmH5RwiQhatkUal4a/bzxHp0WGa9QPi+j0+fy2YfVdoPq10XANQy80ss+3LCo
         meeMUqo/f2DhA==
Date:   Thu, 10 Jun 2021 18:08:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <20210610180825.2aa4435f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iOYZkp0SuqA4d=97+f4dQd.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iOYZkp0SuqA4d=97+f4dQd.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (powerpc
allyesconfig) failed like this:

Cannot find symbol for section 255: .text.opal_int_set_mfrr.
arch/powerpc/platforms/powernv/opal-call.o: failed

and many more similar.

Caused by commit

  9e419de4c678 ("recordmcount: Correct st_shndx handling")

(I bisected it to this.)

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/iOYZkp0SuqA4d=97+f4dQd.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDByHkACgkQAVBC80lX
0GwcQAf+JqGtR4z1VQpQWrfHr82IPvZfHyQcn7ZuF+SIi+ZwoEulxUOjZUrQ8mro
/lwSczjVKefBxcM7qbJVXSdykoRBRY7sFLTx1goRYU3WhrovUCYy7D4+RE9loqvR
6fvK0ifF1kOeCOt+/K9g29B816UboiQtq3cqL4A4hZD1if9SeNsUL7JXuP6x2Qd9
PBkDMvZwsWpiDEPIXsxAyCxPQ657Gu4Xm7KxWH1OAHgzCDvmGXHPAxev+oORFDZs
KwtG1MbrLKXnzKL+zRkzz1xxip9Vw/EEH63hnxP6SsWdawwV0kNXD/ej/7bo4aU9
BWfLnOrWJP086GZOxfsC3jPRz8CiEw==
=j3uF
-----END PGP SIGNATURE-----

--Sig_/iOYZkp0SuqA4d=97+f4dQd.--
