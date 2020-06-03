Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8271EC708
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 04:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgFCCCU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 22:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbgFCCCT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 22:02:19 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C4CAC08C5C0;
        Tue,  2 Jun 2020 19:02:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cBxM6yJFz9sRR;
        Wed,  3 Jun 2020 12:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591149736;
        bh=vhVIoWfRSqSXFrzE3g6qmYx7HtBU/h0jRCqrvADViUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ax87zDA2OMU9bhGi7CX2giGqfJNRR4ffm4/mCm+/r4zM4WTK4ZIlQQVm4drgGDQV+
         KbJKZ47lVS/axmNhj/9uGtK+wp3RTDRY/YjZ+wpMgWVm8votFb3NqT4HooByZ82Qhv
         72aJfQc7Ste0xwseybcO/7Xrh1/l8Nm6KOeq0j6CzD4CLs3a1jHOUaI2UJtga6Jwdk
         z7d6kSY/KndFdKNmOIauZI2wC6qSYT09z/rew8HKknjKs0HcbV/9pav0Es5Us8lDUm
         92dHV8oQgaM0Ii3zbCld6TmJDPHF16/6BtLs3nMXpYcfsA7KeU5D7PvgNbRMi0K8CZ
         dt6PFgEQd2NLg==
Date:   Wed, 3 Jun 2020 12:02:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
Message-ID: <20200603120215.758ec1f0@canb.auug.org.au>
In-Reply-To: <20200519172316.3b37cbae@canb.auug.org.au>
References: <20200519172316.3b37cbae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/re/4mt4BnHhc__uwjuL5lI1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/re/4mt4BnHhc__uwjuL5lI1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 May 2020 17:23:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   arch/powerpc/kernel/traps.c
>=20
> between commit:
>=20
>   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounti=
ng")
>=20
> from the powerpc tree and commit:
>=20
>   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
>=20
> from the rcu tree.

This is now a conflict between commit

  69ea03b56ed2 ("hardirq/nmi: Allow nested nmi_enter()")

=46rom Linus tree and the above powerpc tree commit.
--=20
Cheers,
Stephen Rothwell

--Sig_/re/4mt4BnHhc__uwjuL5lI1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XBKcACgkQAVBC80lX
0Gz/Wgf+L+rFqD4u+L0Kv5bqDMacIs7hXXsLQI+vN7E4C2cx1LcZiI9aWrRDpUTK
uUO5eVIwczW5tvq91C04sT7F6jrApts2PS2hbCwqPM+ZjWTI4SNO5yHopOrWKzUW
RfV7+lCLfE+SwDlA+ZbzJotktvIL6gpUEBRpiMcSe7ka3iAiarcywWzgo/vhQ4J9
I3oQUZiMblqFr653oSSYxwb7omI2TU3aAgV8Aheh8OmZktW90UfyYhJjoh6DYulQ
r+qCwBkQ+MpYcRTOklfrOt9N96sJy1WuNP6bCw34/jd8L/d44loxB4YLO18igyAE
biuCnndxOIm1utVMy+mR6g83z8twsA==
=sOc/
-----END PGP SIGNATURE-----

--Sig_/re/4mt4BnHhc__uwjuL5lI1--
