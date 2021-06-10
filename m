Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C27F3A36DB
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 00:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFJWNh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 18:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFJWNh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 18:13:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14D11C061574;
        Thu, 10 Jun 2021 15:11:39 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G1J941MYmz9s24;
        Fri, 11 Jun 2021 08:11:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623363096;
        bh=9cGyqAjNtIDZKXh6hL3poKu5DwIHSH5SYx5Bf31JEt0=;
        h=Date:From:To:Cc:Subject:From;
        b=cDeERKdzB0od4Upbk5tZoE6i4XPKKaxVm+1FnLXilma/w6ywF5mEP29W12H9saLf7
         YubsxjeF3XUMqu8iiV3jAWeoZcb0aXaRzy5vjOwvzPzyLH5cYD5zGDB8E3qc93JY6X
         7eMs78DQvNBiBH+9SQ3FBTkkFBksX5SexMS3DJVk+UxzBuQK5OTTEYhpSp+iBSA/Oi
         fh5PB5E10W6OLpJ9W7UkwiBuBQDAWtA/CWjm2JxVE7rgOPn3Bf8gDpo2LUwEUOEsnx
         YObueG8A1ch9pZGiQQ5GULju2zuqMKZ5Pegr6b6Gjowg/9hRpb3Tka4CFXWijePGfk
         uHFbFmi1mqacQ==
Date:   Fri, 11 Jun 2021 08:11:35 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>
Cc:     Andreas Gruenbacher <agruenba@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: rebase and update of the gfs2 tree
Message-ID: <20210611081135.3245330a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fs0ww0kRKdm/uKYndzg8f8y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fs0ww0kRKdm/uKYndzg8f8y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

So yesterday I reported a conflict between the vfs and gfs2 trees.
Today it has been "fixed" by the gfs2 tree rebasing and merging a
topic branch from the vfs tree.  Unfortunately, that topic branch has
been rebased in the vfs tree today, so now in linux-next I will have
two (slightly different) versions of that vfs tree topic branch (and
presumably I will get more conflicts).

Please think about what is wrong with this situation.  Hint: two already
published branches have been rebased/rewritten.  And maybe there has
been a lack of communication between developers.

--=20
Cheers,
Stephen Rothwell

--Sig_/fs0ww0kRKdm/uKYndzg8f8y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDCjhcACgkQAVBC80lX
0Gz5PAf/YX7CIEwaERfDKoNejf8qU5V5U0aF1KvzWKuAQxDlI24O6Kon4zmwpVmr
nWHUxaGsEx+djHSnGoCVTBfGho4AYNqiiKu+Lu9fVBRYljnnafaamUBTy6a/Kc+b
5saGdDrqfHTLV1TEgM0TblYm3dMTJKSB5Mfsh8lXHgIKLMjlyfE+tyG/kNUJQ5Cd
ebyMioeM/SV4YAdgmpNfHQftM0dkdA2Q2Ctig/LdKK9bViIXaZ0MjW7e9midJlDh
ZuW+6EdL8naq8uJuzfMxrBsyPTeqvL4w2kyOXtQ8dMbwgTr59UUJsUo4za6SvpHV
TjGrfAt+zfwI1dzXlkJOWennf7nHVA==
=ODXM
-----END PGP SIGNATURE-----

--Sig_/fs0ww0kRKdm/uKYndzg8f8y--
