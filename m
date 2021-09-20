Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B7A412BA9
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 04:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348592AbhIUCXt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 22:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236671AbhIUBvO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 21:51:14 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F94C08C5F1;
        Mon, 20 Sep 2021 15:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632177119;
        bh=IZtKJmK7USsmJHa5HINVDBCoeep89HDTZMnInwgV81M=;
        h=Date:From:To:Cc:Subject:From;
        b=RfDW7J3WNa1XgEymY08gd3vtWHee7+g6d6P4BbCsfYaIY3284uyEjupGg/R+5Iavj
         643BhQLhDdk2If0tAT9Bq8/2yF+FS8+mm/FmUf0q5ppE9Wu2+HrlERyRU669xb06zn
         8nxT2oek97+NGvVUAmxcc4NLzu44TjiQfXsi1uEXSsjjdMtU0hLLA4jBHHt0Qb/TwA
         +7e5ZW6xQ+oto/lOQue2F3ghcNXXd9RMlPOwnYU4fdii9rlL9oAzNre+pB1TUQubiN
         9GtbQpWg+KKgm5Y6o6XZhq9dKWAHLEavDKesoUrQW4ydyeiZfmzsD6lHfTnsQBTsdP
         FjOzPwtn1LRlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCznW4g9dz9sjJ;
        Tue, 21 Sep 2021 08:31:59 +1000 (AEST)
Date:   Tue, 21 Sep 2021 08:31:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc:     Kari Argillander <kari.argillander@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ntfs3 tree
Message-ID: <20210921083158.261517da@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A=iZpsos5Q/OSia6FXinOHn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A=iZpsos5Q/OSia6FXinOHn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  0412016e4807 ("fs/ntfs3: Fix wrong error message $Logfile -> $UpCase")

Fixes tag

  Fixes: 203c2b3a406a ("fs/ntfs3: Add initialization of super block")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")

--=20
Cheers,
Stephen Rothwell

--Sig_/A=iZpsos5Q/OSia6FXinOHn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJC94ACgkQAVBC80lX
0GwJewf/Ued5vGJeYGlopzc1IXD+mAqq0s1k2lyUHm25b/7KGahQVhPTpEtfCPvM
M8h2iySqUJzWm1CxwcpCGpZY00nTeoh8JeSvLsB4VZgO2BHyODBUzCP36A6pSAl+
MtFjM5pBp6DeYHPhYA64pY4ma9Sgtaeh8228DXOMPdgW4PHKc/PijIneXFgYcKBm
QQDUWA559T34h5cRxfPZ6dfZJmLPLg/MX3X+at2I8QKhqeRf4dOFSZ9aav2NfqqW
hOzBeHzsoZIRXZn7TPG6St4KpECwhZJRopVoD2Hqu2dkD7BN70BuJh9molM2Pvzf
sh4x5QUfx6p19iYizGzUdpJYv+5fJw==
=daVg
-----END PGP SIGNATURE-----

--Sig_/A=iZpsos5Q/OSia6FXinOHn--
