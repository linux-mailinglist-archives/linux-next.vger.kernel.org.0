Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A9B43A83C
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 01:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbhJYXi0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 19:38:26 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52677 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235117AbhJYXiV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 19:38:21 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdWY83ZKJz4xbt;
        Tue, 26 Oct 2021 10:35:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635204957;
        bh=TUi/jkB4W0VoV7xMHRCwj98lzlLaUGaZ3Lr58LdDwyE=;
        h=Date:From:To:Cc:Subject:From;
        b=r/YSzgZA1dfLGlC7YflGUBis9Erojx1Nm8PBGQB5DvP8P0qL54NfgGP1Je4mngUfD
         daOYmvUU2kqaduJL6Df016eD18HhxfWc49quqbd7bpGk6Glwm1IIJXU7HO887rv7wM
         b/qVH4stPBye56m1JssKB/UzW9lyABo33WRTVbJCbuU6OgF6uZoddtaTD1vxw5X4cN
         BfRnXSSQb1HqktCgb/gn8rr9lYeUp+2tIfyh/pGkeEEQPMiM+wNMwRr5wHKmiMALp/
         KT2P+QtulO8iPAfsXCBGXrzFw4RwB4W8DaiNeBcNHHCGe57W8fwDCtvMjuWj1Dyf+z
         sVA/DqD2VhSag==
Date:   Tue, 26 Oct 2021 10:35:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20211026103553.46c956db@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/unZtDqPbK5H8PAz7adpW+mh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/unZtDqPbK5H8PAz7adpW+mh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

lib/bootconfig.c:78: warning: Function parameter or member 'node_size' not =
described in 'xbc_get_info'
lib/bootconfig.c:78: warning: Function parameter or member 'data_size' not =
described in 'xbc_get_info'

Introduced by commit

  e306220cb7b7 ("bootconfig: Add xbc_get_info() for the node information")

--=20
Cheers,
Stephen Rothwell

--Sig_/unZtDqPbK5H8PAz7adpW+mh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3P1kACgkQAVBC80lX
0Gx+eQgAhmEickIm9E/Wh/Z3ChJUNyVhJ6cbCmk2kzFMSg6QNT9qIMZMR9KUEibs
v/7XA11Qs/ckV1Xn42fl/p3DKu83LStnOh4LGqcEd84UHR9Yx/QtdKPugYW73fHR
TrtratBWFtqVCtcB5RGticDLtriP+uGxO7BgMVkCg2JO3l6MAzcQl9v86FHmdK2p
cUblYkXBOi3z6IBXiFvxewLWjZQpTudqe05SKTL8VYYzaA3xXjlH6UST/ol+jw1E
g5Vl68BCnq2cuKQ4ggX0wPWO6CnfPsd1TUNN4JwZJFrRmCM7Bbv/Oxsp2A7pfbt2
nVtbil3JryLQdCux5fuPsyYRMlpl3A==
=IiPL
-----END PGP SIGNATURE-----

--Sig_/unZtDqPbK5H8PAz7adpW+mh--
