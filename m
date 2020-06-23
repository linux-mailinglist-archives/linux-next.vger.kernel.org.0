Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D85D206782
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 00:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388596AbgFWWr4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 18:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388282AbgFWWr1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Jun 2020 18:47:27 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D35C061795;
        Tue, 23 Jun 2020 15:30:09 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s1Dv0flkz9sSJ;
        Wed, 24 Jun 2020 08:30:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592951407;
        bh=JhH3TIdeJOXZKtOLxfwXegln47gA8SR/yps1VimhK5k=;
        h=Date:From:To:Cc:Subject:From;
        b=pOLPvGPc4tqZ8nIpUupTiUcU7WkZwPz/9sRENiwST0l6J7W0PQDjn0Bc8SGTcgl5V
         lTlFa65T5yzyE5FgRKrMeUy8y1D+jm1qASBS84FBbrTsoKuPuvWqB6YV7dugsQsKD5
         i84vw5DbVpPx1Afaat/8pqJsAEbfafKWEYBLYrUznlNU/VQm1pgO6ES4Badn3qxC6Q
         83vluMWglUVcsZxy8/naagc/P3qda1Kn3pEK4UGygiprCaemsD7wA3ckT+N/Hn1xLy
         eQULs9G2KHs28nHlrfuw1e6/cHZ3Qevw7MosF/h9qxLN2cFgYqDiUxtB1+TyH/lMLA
         QdVI7BaxTmVZw==
Date:   Wed, 24 Jun 2020 08:30:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greentime Hu <green.hu@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nds32 tree
Message-ID: <20200624083006.09cf6d27@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bti7bdzkfwLgH+GlH._8WwL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bti7bdzkfwLgH+GlH._8WwL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  dac4f526ca6a ("nds32: configs: Cleanup CONFIG_CROSS_COMPILE")
  c22efafa9b45 ("nds32: Replace <linux/clk-provider.h> by <linux/of_clk.h>")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/bti7bdzkfwLgH+GlH._8WwL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ygm4ACgkQAVBC80lX
0Gz6Cwf/WjbTgCMzbDrhJ1ACFO8Nt7xwXADglHih7at3qJmqkbI98dklv5226jo5
/PEBH7jKyM5rOGT5nwkc8IMpH2/YfKlu+JBj+cMYOM/jkm9FEz06ieDkjwbe1+te
+tPDYXpHiJfXqR75yoOJAWwUFs3KkTXJj34G0McHOnK9eGBUChRoZk+Cdo5TMqUg
PGPqFTLniwd3sU9BOqkrfpkszZSHFrSXz1CW1jVVn5b31RBC+IKWPVGEXqJ4lj4L
GAdeTggXXCzQmJeGUW7H4bllCw4VSXPVaDkr6u7FFstJpY2BszC4U7pe4+PeCfgs
o5SymK36Cna35VjT39jF8ecHOYHOaw==
=sAYv
-----END PGP SIGNATURE-----

--Sig_/bti7bdzkfwLgH+GlH._8WwL--
