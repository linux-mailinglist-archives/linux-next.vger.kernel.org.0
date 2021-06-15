Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04693A7B95
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 12:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhFOKRb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 06:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231289AbhFOKRb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Jun 2021 06:17:31 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3FFC061767;
        Tue, 15 Jun 2021 03:15:22 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G442G0j9dz9sTD;
        Tue, 15 Jun 2021 20:15:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623752119;
        bh=k2vAbMQ0xTRaV5s6fEqcJacuK5VKqphXKy7600hIAhw=;
        h=Date:From:To:Cc:Subject:From;
        b=lT54zzRmSI4DiKrdY61DUcnmjMWq3iJ/1ufbKdHXuDUaqJlQ7OFoNSpWNFVTVyzTa
         pKV/5cv7j34jMp/j2IQ3jAEQmum5+FtEX+VjmU8JcSAsH4mHZNox4lKH6fGoEkUBst
         64aZJ+I+h1+bJ0GJYcl06EJTM4pJANW6t2tt2ToNSP5R6w4gmMJWh3LE9FvWXXdQRJ
         LJ8UXq9mI74PiVYMzkXCRNXPfs5GCYSxN/WwDna2YBTZnnYzNKv4sVYnXIvqijdWoc
         jWzRACYTiuGJW1v0yO9RmZOpEEARAVsZbajTT7RBu/iqTBKlWgghdT3A82hJJj8zIw
         SoRZFkxjl8pHA==
Date:   Tue, 15 Jun 2021 20:15:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pstore tree
Message-ID: <20210615201516.56c760fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7+pNxeXmJy+uKvjSF1EreTd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7+pNxeXmJy+uKvjSF1EreTd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pstore tree, today's linux-next build (htmldocs)
produced this warning:

fs/pstore/blk.c:1: warning: no structured comments found

Introduced by commit

  38c18fec13fb ("pstore/blk: Use the normal block device I/O path")

The last kernedoc comment in this file is removed by this commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/7+pNxeXmJy+uKvjSF1EreTd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIfbQACgkQAVBC80lX
0GyfKgf9Ejml6UqYRL4VyDKhtofakgNUc+91sw+XW5DstjoorwiNkP84ufvCLDRo
QtqboosZXax6ehFjPMdsBD+nNrkAQdsra170rL+f2ymQ3xp7HMUsp0z2TeSXcAEQ
5PsogOQBxaz8vj+Q/dZgflVXItJ5sRts1uHAIDR04FoXmAMJOQ6/CYKpKYk3oYTM
EgoujeBgS2f9HdrckLyW2E4uiRN+pwNG9a25Zbwp7xJ2zuMvrEAB1NEUgZXtVyXY
3oyB5jZV5TmgMHV6qtrQXxvh/RsZDRrURa3zoCz7egrR0UlMjNtUY9mwiQTRWHQn
bRTCJgzvsjYk9S9l2Z7JmUGbAHjiyg==
=1VAf
-----END PGP SIGNATURE-----

--Sig_/7+pNxeXmJy+uKvjSF1EreTd--
