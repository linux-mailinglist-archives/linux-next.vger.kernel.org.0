Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0371422DF
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2020 06:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgATFjD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jan 2020 00:39:03 -0500
Received: from ozlabs.org ([203.11.71.1]:33485 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725783AbgATFjD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Jan 2020 00:39:03 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 481L7l3BLmz9sRQ;
        Mon, 20 Jan 2020 16:38:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1579498741;
        bh=I8Lh+RA8avcoXnghl+JZrgYPpe7DTQbPFeiLUa8yXq0=;
        h=Date:From:To:Cc:Subject:From;
        b=J+1jjLQ4/2jn70tfJi+iTpd+0lH+f4qmZO/g48dbBc7fVswSflzXL+/OGY8wgIVx3
         TcjgnSQXtmkO86CT5jcyWyuk2BL9zvkkN91QAbPgmBIvnZtefaK795QHMs+8N3/ozC
         4grmP2EcoPxcVpDdLavn87X6JfYfTWI9NKmzAzVtbZjefeuaqHsvd5tyHW5bfDRtsN
         BNRwKJitm42JA3Z2ZAp8SJ/I3QdcFktJH2FSgFjT6WK7ZVNTek9X7L/Plw8NwFjQLc
         Vgs23yWMYXSssRa37rX+hFxaN3CpAfGt1snf0CP5hHYT2wiYW1Mc38UeVPdOBqTP3s
         RcoV6+iog9jOw==
Date:   Mon, 20 Jan 2020 16:38:53 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20200120163853.53da0ac5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y5z4jywl5eWu=/1eiCAP6Q7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/y5z4jywl5eWu=/1eiCAP6Q7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig
and a couple of other allnoconfigs) produced this warning:

kernel/sched/fair.c:5221:12: warning: 'sched_idle_cpu' defined but not used=
 [-Wunused-function]
 5221 | static int sched_idle_cpu(int cpu)
      |            ^~~~~~~~~~~~~~

Introduced (I think) by commit

  323af6deaf70 ("sched/fair: Load balance aggressively for SCHED_IDLE CPUs")

--=20
Cheers,
Stephen Rothwell

--Sig_/y5z4jywl5eWu=/1eiCAP6Q7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4lPO0ACgkQAVBC80lX
0Gzfbwf/QBxTNLlsonWssDSAEzGq3OCAIHM7LHiSVb2R7I2BD53VnsFWnN46zmhA
VN0/oH525des+4RKdtCRX/8fyRjxsmi81bpdy0WawWjggo3REtXankV+3sM17qAH
LripUkm6VvMqnjgBmvAcc0YoDWgR9IjuFOpspMJzs+7bri8aO37kp2coRTy7qWQt
xc1q1OtVJyVUOEvjRHSPt4sr+XAXvjogEHGKtjU24xyXywc8ag5Aim3Hon5DT6Xr
yHMY9CUNaQOhdAjkuGrCfNV3qMHvuUGscFt9eI/N2xFqiLXMnoHKISUvSWkepkes
qGwo3tmqitjIdCfSnStPGYomsD3MKA==
=tRSA
-----END PGP SIGNATURE-----

--Sig_/y5z4jywl5eWu=/1eiCAP6Q7--
