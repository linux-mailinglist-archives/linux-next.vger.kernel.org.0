Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A7E240207
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 08:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgHJGhq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Aug 2020 02:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJGhq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Aug 2020 02:37:46 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91EBC061756;
        Sun,  9 Aug 2020 23:37:45 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQ5qp4BQbz9sTn;
        Mon, 10 Aug 2020 16:37:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597041463;
        bh=m+zOoQuk8SkP+Bz9FQL/66wMPnFFbtixWy/eubpVc0Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GRnC6c3kHlAqKRx0LQCN/eSiXg6JyuwQxXF26dpH/zwelh7n8I5BAbKixbxOgTALd
         d1FNqa0hMZ0wA+/Lac3jCRAaye6afo//J74jGpyACMDx0h0wjFnsaMBlLcaYhNr/eG
         B8iuZ2iifGKil9RtVplDQ8hndUqD9Tde1coEE95d8dA6Xa/fEbypbRZ6UfHXWO5i6g
         5K1j69Ga+La7x11Kor+Ap27qBFTU4IbqnQ1JvYJhBKxGDY0mD0zWNykJoj8PUXhZFR
         bn3ugZxKkAxJXOiXEcGzpVbHLGFwqnStep+wszFLp5mMyvLa3KoZJ/JRXcsVwdF/an
         1MANABR55yTjQ==
Date:   Mon, 10 Aug 2020 16:37:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: linux-next: manual merge of the set_fs tree with the powerpc
 tree
Message-ID: <20200810163740.2a2f7ba6@canb.auug.org.au>
In-Reply-To: <20200810061106.GA29318@lst.de>
References: <20200717190931.701ddf08@canb.auug.org.au>
        <20200809185726.5d8e5f55@canb.auug.org.au>
        <20200810061106.GA29318@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UaY.fUB6ypMAT2JtcongkbH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UaY.fUB6ypMAT2JtcongkbH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Mon, 10 Aug 2020 08:11:06 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> please drop my set_fs tree from linux-next.  It is not going to be
> merged for 5.9 in this form.

OK, done from tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/UaY.fUB6ypMAT2JtcongkbH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8w6zQACgkQAVBC80lX
0Gyw6Af/dnAIhTY9v20Q1FEZX7FMIi+4CELeOIvbteK/AsBTGmZQ7Bhfbi6ugUA1
LnVBWdyGhQJGtSIZGrbKkLUBIunRk9nYmlY3yAe8mad08302E2uvQfLrJwr8q+GY
BUP+R8ko7sWweYD2S8LAR7W3dCZySjFtoEKs6WL3i7Ulb39BKpoQAc+aWRcAIkMW
sOcTJrYjaDSs4ZOoJQFgUtbozwaPKkVRN3iU57d+2QGraDs09v2eSY61rbup0JZU
Otot6cSJKksyP5uI0a+i8fxS5X6PdPVa4F59M5fhecNSGg2HSaKVWyEbI1UVgoNs
P4koAbElkhVeaPcfNvcgYV3rcovz8Q==
=G4eH
-----END PGP SIGNATURE-----

--Sig_/UaY.fUB6ypMAT2JtcongkbH--
