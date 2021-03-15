Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78FA233C8A8
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 22:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhCOVoB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Mar 2021 17:44:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52205 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233496AbhCOVnw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Mar 2021 17:43:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dzqg40HHWz9sPf;
        Tue, 16 Mar 2021 08:43:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615844624;
        bh=pzSgS6SZK+/2EAIaayZSti1CLkcH7qhe3iwxwCkoGUU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qsjMDLe/TBQ/iW3IdYZWRLzuy9wzc/afG3PFzNW6rilc++PefqvKcxj7TirZwI/6q
         kZCkTdojoHPevTNgav2Sz+j5ALAcbhRA36X2nPisImtpJtrN06UGx6UXF5oZuc7CcK
         2hSxpeep+gAjlV8hFrp3HfnaQXlTWg7085xIWbLc+L4BmkV7qMby1GIEV4yKfdxPvv
         1j2qZpkWs+c71mANp2pGOdwx/YKHMUwqKZpDLIndRDHAZct+o4Mgf8vE5XwZSk/9IG
         Zhd4MGkiwE/ibuR5hr76/rbPvfArh+1g3kJSqzmUCrh7p9L5pJSBK0HprpQabEsExE
         6uG/XJWA6pqXw==
Date:   Tue, 16 Mar 2021 08:43:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the arm-soc-fixes tree
Message-ID: <20210316084342.13b804f3@canb.auug.org.au>
In-Reply-To: <20210308185741.56900784@canb.auug.org.au>
References: <20210308185741.56900784@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RbEsTR__O2bC4dTh.gjhAvu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RbEsTR__O2bC4dTh.gjhAvu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Mar 2021 18:57:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Fetching the arm-soc-fixes tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
> produces this error:
>=20
> fatal: couldn't find remote ref refs/heads/arm/fixes

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/RbEsTR__O2bC4dTh.gjhAvu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBP1Q4ACgkQAVBC80lX
0Gywawf+LdpReXl794TW6RnTvZ3I0RHWzNzvPLXxGXKVsq15pAlhmvaCCudaClqy
Z7WdUjkXBXclz6wZADIhEmoqTNb1AqESy+J2fF8ADoEH5QH8VyEpdqd2vfW/KQP+
9P6bTw/OOf60z81J+BCa7Z4OKh97RodyigSY847VMWBnDzCtLi5bLdGBW/ynUUbh
I9PE6kJsJbydHcYXw0n+oh7NyEadwB3MBP5ikPqsyZiZ44DxCZbHTnexl7kaU2Xi
zyWSn4FE07UsnvKKEMy6EH7v8biLAUO3VPbqfcWhAJVpNhG3Il5pxzq3bS14RDYT
nfodsGIAOb9Xsas8OyyhAeIDpGjmuA==
=ry9l
-----END PGP SIGNATURE-----

--Sig_/RbEsTR__O2bC4dTh.gjhAvu--
