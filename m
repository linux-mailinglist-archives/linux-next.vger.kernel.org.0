Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37F2167B86
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 12:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgBULLX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 06:11:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59011 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgBULLX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Feb 2020 06:11:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48P80S1tlfz9sRG;
        Fri, 21 Feb 2020 22:11:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582283480;
        bh=8kb61WM1YPs0DETp0NgqxihFVRjLzn4BG1ZpL5dqpWs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cxJV+YHAe30x4Lwh+5YKtGtRqYYY3gbrb+UfedYbfXYcFI+NDAtfAwttifS0rylpo
         liRAJFUryQn1UW5pCJ/2orsUCebJeaZj/euQcgbrK+hgfbZcxvGHt1CC/Pzs4kwwpg
         wgz/CfFUgbfnfjgmSYdMHtgQQAUfYkkq25TBjIYDiv8v9jTA7xNbPef+MuORAvowZQ
         Lm8ffLiRtPImnte15v4iHJjV1HfV86RT2mEki5GBNdiFw9K0V8Wfu109VBUtt3YRae
         xdf7KHsph4batvIVTqACnYNIYggo+B1Fq2b5gLNM/DQaRCj9lu6N359l2nByOk3n4v
         +hNoSW7Gow66w==
Date:   Fri, 21 Feb 2020 22:11:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: please clean up the clockevents tree
Message-ID: <20200221221103.02818754@canb.auug.org.au>
In-Reply-To: <501d1b8c-ae24-bdfd-e56f-7f5e907a2083@linaro.org>
References: <20200221113714.7293f125@canb.auug.org.au>
        <501d1b8c-ae24-bdfd-e56f-7f5e907a2083@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EO304nrXrFZHP2hr=1vmxsv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EO304nrXrFZHP2hr=1vmxsv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, 21 Feb 2020 09:32:40 +0100 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> On 21/02/2020 01:37, Stephen Rothwell wrote:
> >=20
> > All the commits in the clockevents tree
> > (git://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/ne=
xt)
> > seem to have been applied to other trees as different commits. Please
> > clean it up as it is starting to cause unnecessary conflicts. =20
>=20
> Done

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/EO304nrXrFZHP2hr=1vmxsv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5PuscACgkQAVBC80lX
0GzLAggAlKHUvIdAcYvPZNRadcf/hgFZKnNpfbIA9oG0DxivJvY3OJDyXlDRmWlO
mf/BBZxwVUHnvbdV+W0hqnU+eb3a3ubIxTUyBrb5OyeJbPomrgM4r6j2BNVd5xic
V7ADqUcilbBZb40WjZwxjwyJOEm0lqtQ5DHaAz7EYkB43MUSBm/tkH87w/nU3CDJ
gqhPzCxqwUP5OSNRwujmO9l2/1BmZkrTW/U7tBpnqgR6FD8lscMqYxwDLvTKpTnq
rsXIhADpeNej8J37uO9wUczCgiawVSduitiBDHdd6znvv/1ppOqtkag7I6gX/Ao1
OwGB0EtwBf09t8WKEtjWbe2J1GW0iQ==
=XuNc
-----END PGP SIGNATURE-----

--Sig_/EO304nrXrFZHP2hr=1vmxsv--
