Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52BF2A786B
	for <lists+linux-next@lfdr.de>; Thu,  5 Nov 2020 09:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEIAQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 03:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEIAQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 03:00:16 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78A0C0613CF;
        Thu,  5 Nov 2020 00:00:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRbXr27Fqz9sSs;
        Thu,  5 Nov 2020 19:00:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604563212;
        bh=TWDRRuMCw/Tf8vHDRNlHBnlGH76tGij+q+YpcX1Il0A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bSALnh1wCxZUIFYeIXOghU68HV6qX8VftxeZJWsMp3SwaKbelKGMmn9JhPQFirzYH
         Z15WnUfU/k8y/PUjAk5LzKywA/SZmlcxRsB+klL8buIotvX7LyU8Mk4Q0wOqZA40Vo
         R/9oZXshwRJadiULcXI8cktE/ERxcKIyVoMYht04dyhj7jTNMjU5YfKVej30snVSly
         rPrI2GeCRGY2/ggV5H6E7j9yraL7xKMK+a0QEEuh5rgKNJlYig/n8UH1rMDF0RGlXl
         67q0vk9bU5Oob1Dn5K8HXJOO2IVc9nKLdNEbxmD8g7hAEl5yCYdABxntUgvix7g3Og
         yWZQbjcWlxxzA==
Date:   Thu, 5 Nov 2020 19:00:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Anand K. Mistry" <amistry@google.com>
Cc:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20201105190011.7089f9a6@canb.auug.org.au>
In-Reply-To: <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
References: <20201105174549.614c2de4@canb.auug.org.au>
        <20201105070311.GU4879@kernel.org>
        <CAATStaMD=w+onf==L-=MQ7suJf6EaNoup5o8yW-TEbfajkbdaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A_v0IHZraFCN9ujFvt9EH6x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/A_v0IHZraFCN9ujFvt9EH6x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Anand,

On Thu, 5 Nov 2020 18:42:23 +1100 "Anand K. Mistry" <amistry@google.com> wr=
ote:
>
> How would I go about fixing this? Send a new (v2), fixed patch to the
> mailing list? I'm not that familiar with how patches get merged
> through the branches.

Since this is in Andrew's quilt series, either a v2, or an incremental
patch (to wherever the original went - including cc'ing Andrew).  If
you send a v2, he will probably turn it into an incremental patch and
then squash it back before sending it to Linus.

--=20
Cheers,
Stephen Rothwell

--Sig_/A_v0IHZraFCN9ujFvt9EH6x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jsQsACgkQAVBC80lX
0Gz/Cwf+IU99CX1nli0lJTqTCzJJPjJVafL0RFX2TVGdUSl7IkPCjZuows00NlLz
nUATk12KMkxTAFlcl63L/NNcP0KS3bSAiXtta9aToDKBkkQXL987FRNvq/aXvWBJ
9a3kP1Gfp0KcQ1yn0uvsfScDX3eKQgzD22fDpl2cBvHLAnkA7l3pjMT73//HkJ8d
lCEsaWdvkZwoOGpYhGj6yvFvexVg8F/iVbJpV8rpxN38AsthINN64IraX4EuGiYj
Y/P6Uy0h7zpZl1MoUvUvbxIu1cmEjP6AnPJV90SYWEJZFqy947z6tKpgsFW6GdJj
IcyjYoppLF1trkcD83njO8kSPLXf9w==
=NLpU
-----END PGP SIGNATURE-----

--Sig_/A_v0IHZraFCN9ujFvt9EH6x--
