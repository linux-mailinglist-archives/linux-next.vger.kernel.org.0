Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5DE274C27
	for <lists+linux-next@lfdr.de>; Wed, 23 Sep 2020 00:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIVWf7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Sep 2020 18:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVWf6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 22 Sep 2020 18:35:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC41C061755;
        Tue, 22 Sep 2020 15:35:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bwx3b1pTGz9sSn;
        Wed, 23 Sep 2020 08:35:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600814155;
        bh=an68nPl8slCXksOVFaUNMbm9pNneezalt7mdFAWTZoA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F3Kp87lV2EaJZ3iJgUPbaA5EuMVaSb/jtpmyIvPo0Rn8Uf6j1DUkLMjo/WhSLa+ub
         PqcO4hLlJDxJLfz+uFby9d3qqp5Q+//fxMZDbXTZ1Np/tBmV9vwB0J1ls/Sc5AtKa8
         cK0Ye8KJzlKKiXtQ6CV7ci2cWAM8U1vRo/S8+ITHen/Id+7yUYi/FZetTChDN/G7GM
         arJYxjSAc5OSL/KKr8HerBSiH9Mg8+NWK3oU8iG3+3Cj6zldjdzrak+Qu/KfYuVlG6
         hzoCSKr8zjAzz6d0bQVuHQAZ9HIHbrlbYuaMJyMD3z4a9kSeEIxHzcZ3so3uYCFkFB
         Q6qcWESipMrUQ==
Date:   Wed, 23 Sep 2020 08:35:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20200923083554.41525dcf@canb.auug.org.au>
In-Reply-To: <20200917180005.GM29330@paulmck-ThinkPad-P72>
References: <20200917132652.738c4cc2@canb.auug.org.au>
        <20200917180005.GM29330@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B7AKGsV7sz1/MHpXfane8Ep";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/B7AKGsV7sz1/MHpXfane8Ep
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, 17 Sep 2020 11:00:05 -0700 "Paul E. McKenney" <paulmck@kernel.org> =
wrote:
>
> On Thu, Sep 17, 2020 at 01:26:52PM +1000, Stephen Rothwell wrote:
> >=20
> > Commit
> >=20
> >   903c5302fa2d ("sched/core: Allow try_invoke_on_locked_down_task() wit=
h irqs disabled")
> >=20
> > is missing a Signed-off-by from its author and committer.
> >=20
> > I didn't complain about this when it was first present because I figured
> > it was just a debugging commit that would be removed quickly.  However,
> > there are now quite a few follow up commits ... =20
>=20
> Without Peter's Signed-off-by, I clearly won't be submitting it to the
> upcoming merge window.
>=20
> Peter, this is now quite close to your original patch.  May I please
> add your Signed-off-by?

Rebased today, but still no SOB lines.

--=20
Cheers,
Stephen Rothwell

--Sig_/B7AKGsV7sz1/MHpXfane8Ep
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9qfEoACgkQAVBC80lX
0Gz0Awf/WuA22zboVIO4zh0IgAe22xQir3/jpwT/ikw8FN7nq1ZBsoFhlMZx/5oc
bIvAhjZEZplAZqhJUM6zBWAPZ+Kb2dmtZ3j0x8pRpCALuh/7aaxJJijixeAs1QTM
GPFDcqkCLpQfgjV2C9AhUuZP7YZ3TdOLAn6WUeX3ganwn+VBdWgbXGi5wspnl6qL
WRilGz/j3MCF/cVSviPhCaxsVi8kESWxdD3BwZzNln3+VT3E7oeRXBrIAyl9zyWR
jDPk8IMqDzwUCR0EvhBJ30/gjx6XhVD2nfETIvjCF159ORphB2ww749X3shTX7Dj
VopRpbjN9OFuLh3CAZ4YnxOL3mpeyA==
=qvKb
-----END PGP SIGNATURE-----

--Sig_/B7AKGsV7sz1/MHpXfane8Ep--
