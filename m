Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0682623D6
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 02:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgIIAP0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 20:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgIIAP0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Sep 2020 20:15:26 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98514C061573;
        Tue,  8 Sep 2020 17:15:25 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BmMwf3hRVz9sTN;
        Wed,  9 Sep 2020 10:15:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599610516;
        bh=G+c9Aw/7aQyit4FCnnuNFGGwhaFlmH6imUDb7V5FlrU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VIQZJDjmN5ooJV1EOuT0seYLgl1asNZyHGb7Fj5/eeMCHyxXzKrA///xqvuL54OUz
         Pu+at0VpSAL34i/pYp+firANdwvhFBKDa+OLUkGe79DoBGFAdik6LlnmzVhErSqCQz
         TnB52AOKYpAF8FQBlzA2z4JCgPxg6e9qtsH7m98zOuAqVZTOuSLGxdQHWKQKeHPnod
         TZTcp3hHrs5gpOyd/MIKU6cTriX09PU94nP5XTKRYlFcSbvia3vv0RH5h7K0siWJJq
         H6m4RSVNzuwAqZeZKAw85BCq5bnJqZHaGiJMqIChtB0glD1mNO+V9h/V44E/5dDsSy
         Ye8PE6pTT8xgA==
Date:   Wed, 9 Sep 2020 10:15:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: build warnings in Linus' tree
Message-ID: <20200909101508.2dcbfdc6@canb.auug.org.au>
In-Reply-To: <20200908131439.xj6nzi6nny3u5icb@treble>
References: <20200908091102.4c2d7b37@canb.auug.org.au>
        <20200908131439.xj6nzi6nny3u5icb@treble>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v0fIXRqK3vdwoSVeNUT=q5P";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/v0fIXRqK3vdwoSVeNUT=q5P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Josh,

On Tue, 8 Sep 2020 08:14:39 -0500 Josh Poimboeuf <jpoimboe@redhat.com> wrot=
e:
>
> On Tue, Sep 08, 2020 at 09:11:02AM +1000, Stephen Rothwell wrote:
> >=20
> > Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
> > produced these warnings:
> >=20
> > arch/x86/kernel/cpu/mce/core.o: warning: objtool: mce_panic()+0x2a3: un=
reachable instruction
> > net/core/skbuff.o: warning: objtool: skb_push.cold()+0x1b: unreachable =
instruction
> > arch/x86/mm/mmio-mod.o: warning: objtool: pre()+0x21a: unreachable inst=
ruction
> > arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x14=
2: unreachable instruction
> > kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x26: unreachab=
le instruction
> > kernel/cred.o: warning: objtool: get_task_cred.cold()+0x19: unreachable=
 instruction
> > drivers/misc/sgi-gru/grukservices.o: warning: objtool: gru_wait_abort_p=
roc()+0x97: unreachable instruction
> > drivers/scsi/pcmcia/aha152x_core.o: warning: objtool: is_complete()+0x6=
c6: unreachable instruction
> > drivers/message/fusion/mptbase.o: warning: objtool: mpt_SoftResetHandle=
r()+0x4a5: unreachable instruction
> > drivers/scsi/aic7xxx/aic79xx_core.o: warning: objtool: ahd_intr()+0x2a9=
: unreachable instruction
> > drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o: warning: objtoo=
l: otx2_sq_append_tso()+0xab6: unreachable instruction
> > fs/btrfs/extent_io.o: warning: objtool: __set_extent_bit.cold()+0x12: u=
nreachable instruction
> > fs/btrfs/backref.o: warning: objtool: btrfs_backref_finish_upper_links(=
)+0x818: unreachable instruction
> > fs/btrfs/relocation.o: warning: objtool: update_backref_cache.isra.0()+=
0x3bf: unreachable instruction
> > drivers/atm/horizon.o: warning: objtool: rx_data_av_handler()+0x452: un=
reachable instruction =20
>=20
> I suspect these will all be fixed by this livepatching pull request:
>=20
>   https://lkml.kernel.org/r/20200907082036.GC8084@alley

Yep, all but the vmx_handle_exit_irqoff() one as Linus noted.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/v0fIXRqK3vdwoSVeNUT=q5P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9YHowACgkQAVBC80lX
0Gz7XggAmPLYEKpqSvIpVbgZnlEiqEIRbPTUL4Btb5ymsq481Tt8kD++wlcGBUHE
YqkCKNGyYInbDn85LAlNlx3WD1LY7Q2k0zq6xJkwZXXrxh1xiqcL+B28YCYHE+lR
Qokw4jDtm+ARf1o7lhdAoW0dQMy6Jda6wRXNCOxwUsnSLPeXLN0tDqliT0HzIiOs
lLC9T/4cikd++MGqCQFu/ARBPtAtmJ/KfZhpz7hWNPyvRfm+x8Nq4kYUgrwW7o7K
Fvzn1hRPCtrCc5z0dD1yDfCu8DnpfOUPy6W/fKg1zBio9esn65vDkt4V4no7cO25
YCUWV9uRzNMrifwUnR0dwmBL2Ew1AQ==
=ColM
-----END PGP SIGNATURE-----

--Sig_/v0fIXRqK3vdwoSVeNUT=q5P--
