Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6178B4425
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 00:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387590AbfIPWkT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 18:40:19 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54240 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728485AbfIPWkT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 18:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=v0BlS9qRudLzu3np5+I/Md4DSfVdsMMy4Aqdqyg4bEE=; b=jSbyU9wgvy0GCLFTmtoT7xYvN
        JPyW9BOEBj9Z6KR9FJb0d8KRFUNFYWe+CHOsaVg4fBsEgGsc3Es74lQc0ZuPjavBOL7kM3INxjJiO
        iLUMKvJO4Hc5aXHSyehGXhuHmB/oLwq3RVNvmrwUhYFQXddJo4Pev/6e+8+8syConmjd0=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9zfJ-0005yq-5T; Mon, 16 Sep 2019 22:40:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 8A1602741A12; Mon, 16 Sep 2019 23:40:12 +0100 (BST)
Date:   Mon, 16 Sep 2019 23:40:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Christian Brauner <christian@brauner.io>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Hridya Valsaraju <hridya@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the char-misc tree with the vfs tree
Message-ID: <20190916224012.GR4352@sirena.co.uk>
References: <20190916012252.GS4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XseMXOJqQDKhbErc"
Content-Disposition: inline
In-Reply-To: <20190916012252.GS4352@sirena.co.uk>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--XseMXOJqQDKhbErc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2019 at 02:22:53AM +0100, Mark Brown wrote:

> Since it's very late and it seems useful to try to get a -next out with
> the state prior to the merge window opening I've used commit
> ec13c78d7b45 from the previous -next build rather than fix this up
> sorry, I'll come back to it tomorrow.

Sorry, I didn't actually get that done today as I had no time when the
conflict came up so I continue to carry the old version of the tree.

--XseMXOJqQDKhbErc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2AD0sACgkQJNaLcl1U
h9BwJgf/YdsDH7w3LhQNlu7BoOvHhM3fCjmn3JMe+X/8OHxJ3SzYCHmDTQomeMdL
PahfsaAf+duCMhsjUJxyy7GoApXMB3irOwJ5QiGkZIRSmxwymg73cy7fmTiXqP+G
aCfvzkxLgjbDGOKDpkdCb7TxWzrnGEMxGo9tapjDaV0puyUU7S9qcw2PQBLkrk4D
L4JnG688HBwI5DAQaxKaz6aVvDN8wyHNuXbflbJwKi5qVw7Nsq5dmEgJqS2ET1M2
wfSv63T7zpPWrX6aaoRN+FOhITq10VGAlNhqPzmsT+dtG7xwnfG+7NwbiEGq67Yv
na+fmzkaqSzqXzRMdS7D1OORej+1XA==
=2VsP
-----END PGP SIGNATURE-----

--XseMXOJqQDKhbErc--
