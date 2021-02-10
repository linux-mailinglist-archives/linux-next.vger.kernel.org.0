Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 585F031668A
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 13:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhBJMXe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 07:23:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhBJMWg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 07:22:36 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5FF7C061574;
        Wed, 10 Feb 2021 04:21:55 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbJlx4N4Gz9sBJ;
        Wed, 10 Feb 2021 23:21:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612959709;
        bh=QkhHLoS2lTtZFN7qEIJZm53BOWjr7fHShqCW5xBcxEc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=h931OTLH9GUI6/fwkaWhDercwh7vi7ZefFDEtthdPL8DeBqhB5OI63pqB2W7Zy+R3
         XG014/hnBALTAhK8PURRz+ux7dtyGO/G3mkb10Kb5X9cW1c0/usEv1o7lNNPD1gcZ9
         ynsn80g/vNcN3Lj8fPKozO/ifFRsFWRojc7tYQQkwYj5rR8UoW2E6QfpP+Q0Q3E6oQ
         /ENsvdYSOllKR6YMi0HQbSjgcX/6hsHXISslOtuGiYt3qerrqARN0+GHfVRHR3SMSf
         X4vl29FAjkZKc0ZmocHio6jr96GulUM6mIQ+CgoEJ254/j8MMXY4cYmT35tJJFeZYG
         vsmqlqBUm1adA==
Date:   Wed, 10 Feb 2021 23:21:48 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: linux-next: build failure after merge of the modules tree
Message-ID: <20210210232148.4f9d4a43@canb.auug.org.au>
In-Reply-To: <YCOUGGJtUJ+Nf0ZA@gunter>
References: <20210209210843.3af66662@canb.auug.org.au>
        <YCKnRPRTDyfGxnBC@gunter>
        <20210210085051.7fb951d1@canb.auug.org.au>
        <YCOUGGJtUJ+Nf0ZA@gunter>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ve2Gj7CFwA6nEqZCIcPGXRm";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ve2Gj7CFwA6nEqZCIcPGXRm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jessica,

On Wed, 10 Feb 2021 09:06:48 +0100 Jessica Yu <jeyu@kernel.org> wrote:
>=20
> Sorry, by "feature" I meant CONFIG_TRIM_UNUSED_KSYMS. This config
> option was introduced around v4.7. If simply enabling it produces
> these compilation errors I was wondering if it ever built properly on
> powerpc.

Ah, of course.  So for a quick fix, you could revert just the changes
to lib/Kconfig and all the defconfigs.  That way all the UNUSED_SYMBOLS
infrastructure is still removed, but TRIM_UNUSED_KSYMS remains (un)set
whenever it used to be (un)set and that could then be cleaned up in a
followup patch set per architecture when we know it works.
--=20
Cheers,
Stephen Rothwell

--Sig_/Ve2Gj7CFwA6nEqZCIcPGXRm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjz9wACgkQAVBC80lX
0Gz/Dgf/XjojqFPVsjOyBJyhznHqyo9BVhsUryG4Aozj8T4HwoNf8rANih8uPv6/
bkvYyBj8N1I0O5hwImdJ25x0ZQJ8lFtD4TA6+F9XaKPV3IfSewRc4L2bVWFiWMoO
66AeJwFy4xD93HcfqXxMv5fVMeZ9q7idOihUt+gbU+18tHQzuYdMfO12guPUg0EK
3c7WxlZ8HnapQXeUCZvJ74Hmw5WsdZ0zWNuiDyqrIhHpPgZxUhRmUgzKr/GQUCfq
f1ODmOYOh4MJnyWKkrWAI68LZEDB009fGESxMh6DJcGDH8OUiL6If2Dog7Dw8Br4
/wCH9E2NLeLbcFIv0H5cwFayqmrJ8g==
=h6Kn
-----END PGP SIGNATURE-----

--Sig_/Ve2Gj7CFwA6nEqZCIcPGXRm--
