Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA38273D84F
	for <lists+linux-next@lfdr.de>; Mon, 26 Jun 2023 09:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjFZHQO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Jun 2023 03:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFZHQN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Jun 2023 03:16:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C941AC;
        Mon, 26 Jun 2023 00:16:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QqJzY3DQDz4wb1;
        Mon, 26 Jun 2023 17:16:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1687763769;
        bh=B3aEimZkxXC8W62XTmfbRc0y6h5kDbqiw6nXMqvQ/fo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=POgHoelkA3dUzG0P3ok4LPCWWjWWkODaxGWrtx6Gp2UPYUQ4GKuXxPAtbJxIEZbr1
         8Q1IMFicQFAzOescQ5r4R0/tnfFOJqo0vyvlKtION8Khgn2BGhHo294vQiT5syqmq9
         7hnWAUIxurqfgW2ghVOVg2vDsu0yA1ZHVeLmsQ0eTaXQYPvLp4Ew3cKkxcHDWa0Qn8
         Ua6RWzV1BYfqiNelPfVaTC/C4lgAY4LMZBfB7blp2WIiDOPcXQVSdsWR7YwpOEWMFY
         HxF6Hymiy6G2mRSMBa38uo45AAaf0k7mq2186c81hqULZj1xjqcGFd3SpOFLlq+pPk
         gJ+Gr/NIuZVGg==
Date:   Mon, 26 Jun 2023 17:16:07 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 26
Message-ID: <20230626171607.77381e10@canb.auug.org.au>
In-Reply-To: <20230626163712.073b5c5a@canb.auug.org.au>
References: <20230626163712.073b5c5a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y2I/hdu1Sn5dOBTn9sU/e9X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y2I/hdu1Sn5dOBTn9sU/e9X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The merge window is open, so please do *not* add any v6.6 material to
your linux-next included branches until *after* v6.5-rc1 has been
released (and if there is any in there already, please remove it).

Also, please make your best effort to *not* rebase your linux-next
included branches during the merge window.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y2I/hdu1Sn5dOBTn9sU/e9X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSZOzcACgkQAVBC80lX
0Gy3Bwf/RmRs9dimYG66302x3PTPKDigk8DM+WEHT1pvchGFaPiz6vETDWC0hQ0J
h/VUcdxYmLNeO8I/ecn+Jn5L0skrqWCKjK48CsAMXFjhUqN7kB2TTDZX1YJftX38
xOv3apNKkup5aDHHx51rN9Ba49TffSWSs4f71aQeLpL9ylhTwfTIRvDdjT/GMVhI
JbOanxvT15ztyh9GcE5iotkzNNkjoJRw971gu3O9NqeVrvabZPuDHCl4mIdlcWdh
BUg+dP6L9LtQtjzQlgiVgOpGAeD9CvV1eY4XWllfdx8I8of/SIUwmM0xsBOPleqk
hP3GYmTdDzd0v7rRvKa69qvinSXvRg==
=sRuZ
-----END PGP SIGNATURE-----

--Sig_/Y2I/hdu1Sn5dOBTn9sU/e9X--
