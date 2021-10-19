Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7D6434140
	for <lists+linux-next@lfdr.de>; Wed, 20 Oct 2021 00:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhJSWWw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 18:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJSWWv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 18:22:51 -0400
Received: from gimli.rothwell.id.au (gimli.rothwell.id.au [IPv6:2404:9400:2:0:216:3eff:fee1:997a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EC60C06161C;
        Tue, 19 Oct 2021 15:20:38 -0700 (PDT)
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4HYp8m57WDzytn;
        Wed, 20 Oct 2021 09:20:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
        s=201702; t=1634682025;
        bh=BsZDeOgDiE+nxryU78tK9C1iGM3YQmcPupQaMFCpk1U=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bgou3IHIlEt/VAzdjlzPBFqvFJEBBnwf1+V8X5UbWhuE+xTkzyCEjn6wH2ahaAoRK
         wVoJzLPz1Pg1AUhgwkzZkx6P6lzDrBctxifLMnCTfODeUwxzPvPuU5wmH7NdwzFedB
         Vh2ZBINRD/6gbt/oKMTC8RK1Y3AVHiyNSgQD7SAZQGb+HkUysUG5iXFiPjWli3u2UW
         oOjK239Q+eLSbQaaM6ADGIGBB5fGauxbHV4iA7lZ2elbCJf+uxKIIQJ0fN61jJm0/x
         LArjTu0oH2Bt2Fx5IwbKD41FWr3weHCRC8xASibA3IrsTgjQRLSACiSWLkvDpC7B2z
         BPjdLTtWBVoUA==
Date:   Wed, 20 Oct 2021 09:20:23 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Latypov <dlatypov@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
Message-ID: <20211020092023.0a9a43f4@elm.ozlabs.ibm.com>
In-Reply-To: <009188fd-a744-fb50-a9d2-ca1ce9b7905f@linuxfoundation.org>
References: <20211008152930.03787395@canb.auug.org.au>
        <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
        <009188fd-a744-fb50-a9d2-ca1ce9b7905f@linuxfoundation.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BzRp6QoQu6qcixc9NvWUnLH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BzRp6QoQu6qcixc9NvWUnLH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

On Tue, 19 Oct 2021 15:26:40 -0600 Shuah Khan <skhan@linuxfoundation.org> w=
rote:
>
> I fixed the merge conflict in kunit-next tree after rebase to Linux 5.15-=
rc6.
> There is no need to carry this fix.
>=20
> Daniel! Please review to see if it looks good. It was very minor fix-up.

There was really no need to rebase.  A simple merge of the kunit-fixes
tree into the kunit-next tree would has sufficed, maintained history
and allowed a place for an explanation.  Or you could have mentioned
the conflict to Linus during the merge window.

--=20
Cheers,
Stephen Rothwell

--Sig_/BzRp6QoQu6qcixc9NvWUnLH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFvRKcACgkQAVBC80lX
0Gx+tQf9HDBDLRVl7P07Du15kl3+IGaOfgj9kaeB6iX937OsYZfoAHG0OnIYp+p1
w83dQ5xeZmwhPVEvNx3Kg6JzpRA3mef2Yt0TiFJ3GBsdL7MMvNJzLD5XniI4DwbA
hTnARKAc4RMznnYHJXDvleT1VMemJDeGp2gxwLOTX7VJQ8kHtOUwvIQ4m4p/xQmw
CRepOLhJrMQCQO51/fdWUxDfL3KAG/qUG7J6aGskjpftR6nZjNTYaGcj5QSvRO8C
IMc8UiRCcCnwhr6iN8XvTTsEKRTWV4k2Jn+r3DYjrFlsAZE4r/o9x7isAqIdiKsJ
0/9obqTxw6FqWf+koI5Z7T6aqRmnSg==
=0iCm
-----END PGP SIGNATURE-----

--Sig_/BzRp6QoQu6qcixc9NvWUnLH--
