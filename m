Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8FA20EBAA
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 04:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgF3CzH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 22:55:07 -0400
Received: from ozlabs.org ([203.11.71.1]:58251 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726746AbgF3CzH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Jun 2020 22:55:07 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wpqp5z3jz9sPF;
        Tue, 30 Jun 2020 12:55:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593485704;
        bh=LSc0m14+uE0FHKSn3cgUGk7QPY2Q8jWda01z1ga2bHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UiP+q8BQtImrItRHJUUdQCvJXIM/XcggLgBmfRhtZO237wvvzHrj/p4F2xSRa3kiS
         GxwY2tWscV42oGRcKnx59779vCSnzHaJUKdrNLOqpepX5BT1AV17tL7mYfSO2Enq3y
         fn46ZTn5Ek9RVMkrYO/0XpndlhfjhK+M6/SoPs71iNYysIxLkYQ8T8gpu6+WZZ4wwf
         kkJme792ndrYzIM38O8+1Tg1PdMg9Be+/a2jSevBt2Lswbv7vO+iDLisoJHWBMcoNI
         gvXa8JBxoi/UuDEZS1qkDk92OEZTd8RoN6T9XR4u2Blq7iHAS67fMu2BczEGyhLsE3
         AMvMlIsGQsEWg==
Date:   Tue, 30 Jun 2020 12:54:59 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200630125459.0ca67c38@canb.auug.org.au>
In-Reply-To: <20200622113700.3dd74527@canb.auug.org.au>
References: <20200622113700.3dd74527@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cZrPDT8Vmc0nezM7l6j/.aq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/cZrPDT8Vmc0nezM7l6j/.aq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Jun 2020 11:37:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> ERROR: modpost: "sched_setscheduler" [kernel/trace/ring_buffer_benchmark.=
ko] undefined!
>=20
> Caused by commit
>=20
>   616d91b68cd5 ("sched: Remove sched_setscheduler*() EXPORTs")
>=20
> Missed one :-)
>=20
> I have reverted that commit for today.

I am still reverting that commit.
--=20
Cheers,
Stephen Rothwell

--Sig_/cZrPDT8Vmc0nezM7l6j/.aq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl76qYMACgkQAVBC80lX
0Gwsngf7BxVSpJ/Vw11nIBFLrdXdezBnXkpSEPA7m78+vdKaK3BUjlU2qEKDlaqy
Vx8V2a174/WRnUGkUc53d6cfSpskmmmlln0aQLKYlSVOn0Ae40FQqZx/20yp1b6q
OpsP1ElLXtvzuHPPYw+0x2F5VaCIAu2w4GOZXlfsapv6ZwZekuSLe9Bt0Q2MTDhA
kMWD7RRr9IUD8MUZDY41hDntP77BoSWKOubeZ6dcm+Nm+rZ7WL4csKGSHZzOHQkH
ijV6MycifaMTfFuurDU1p1a6ECGGxif9qSeP8QIW6yWk+Y7JykfEkp7P1lje2ub5
ky9OMBNvo+CqpX8h5aKJHZK5R4XYHw==
=DPsp
-----END PGP SIGNATURE-----

--Sig_/cZrPDT8Vmc0nezM7l6j/.aq--
