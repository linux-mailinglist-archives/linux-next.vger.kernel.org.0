Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A3626071A
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 01:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgIGXLI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Sep 2020 19:11:08 -0400
Received: from ozlabs.org ([203.11.71.1]:56563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726929AbgIGXLI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Sep 2020 19:11:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BlkY42nBKz9sR4;
        Tue,  8 Sep 2020 09:11:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1599520266;
        bh=FLpzBh1MtaOdJusvfew0y0vFNZl/o+pHZi6fZRvWzS8=;
        h=Date:From:To:Cc:Subject:From;
        b=th8jEA+jxRuFJlAYJjznssQ9vOu0SK0w6yNuTWvVYW2fcdMCSJyyylKpmRLFdmILK
         JL4Pb/KoxMRrCO++yq6BwFA8JvBP19gCKPASphsTfLM6A8vWud4GjidLW7E/HSWmDa
         Ptdk7e8K4R4uYlLswmfsmhjBIJuh+iUS6MJ4I0Tn5wluXvBVctOph+UYRjffFtJj+U
         +FsXZQwZUW5zQf962gnQgof9HMRmTZQmBDauNE6cBQIGvBJ4QfB1WPiobhlMDITPph
         6S8AX2QuViZ8kL3jwhau3ykoe7xpITH4JkRR387dljWXwhwff2r+dmKpor4r8p9Qm5
         Y3vMR2IWT6IvA==
Date:   Tue, 8 Sep 2020 09:11:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20200908091102.4c2d7b37@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uFoOW0k_q3wB2MWWaZa.fiZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/uFoOW0k_q3wB2MWWaZa.fiZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

arch/x86/kernel/cpu/mce/core.o: warning: objtool: mce_panic()+0x2a3: unreac=
hable instruction
net/core/skbuff.o: warning: objtool: skb_push.cold()+0x1b: unreachable inst=
ruction
arch/x86/mm/mmio-mod.o: warning: objtool: pre()+0x21a: unreachable instruct=
ion
arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x142: u=
nreachable instruction
kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x26: unreachable i=
nstruction
kernel/cred.o: warning: objtool: get_task_cred.cold()+0x19: unreachable ins=
truction
drivers/misc/sgi-gru/grukservices.o: warning: objtool: gru_wait_abort_proc(=
)+0x97: unreachable instruction
drivers/scsi/pcmcia/aha152x_core.o: warning: objtool: is_complete()+0x6c6: =
unreachable instruction
drivers/message/fusion/mptbase.o: warning: objtool: mpt_SoftResetHandler()+=
0x4a5: unreachable instruction
drivers/scsi/aic7xxx/aic79xx_core.o: warning: objtool: ahd_intr()+0x2a9: un=
reachable instruction
drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.o: warning: objtool: o=
tx2_sq_append_tso()+0xab6: unreachable instruction
fs/btrfs/extent_io.o: warning: objtool: __set_extent_bit.cold()+0x12: unrea=
chable instruction
fs/btrfs/backref.o: warning: objtool: btrfs_backref_finish_upper_links()+0x=
818: unreachable instruction
fs/btrfs/relocation.o: warning: objtool: update_backref_cache.isra.0()+0x3b=
f: unreachable instruction
drivers/atm/horizon.o: warning: objtool: rx_data_av_handler()+0x452: unreac=
hable instruction

I have not idea what caused them.

--=20
Cheers,
Stephen Rothwell

--Sig_/uFoOW0k_q3wB2MWWaZa.fiZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9WvgYACgkQAVBC80lX
0GxFOwgAnSNmvSLAEYvrUBt/zp7HbmCD+bSHTUck7NOu13MEdsmK4/ErgtpsuuEE
tEF1BV7gTXFmSvbs8edxXgXopUZk1JH6U2R4t0r1SsL/Oc6qyMXyvfsSCf0Ma2jw
qkI8hYZNS7SjteNp9849tND5DjbJ4QeHutafK5mcFdt4aN1tPE/DRieGruQu3nh0
oIdHPUvdJtteQy3ArdhEUMEmSebEcy12lhewNhKY1jaUxfaGF2y+W/jXG7ohG4aW
HBW8Nmsw8VB3p39xYG5ObQ3zwjJsW7kdqnrFyW0qY8lOhFrak9ncvjv1FsGib7zt
8i7HDT2vzWjMk8AF+76N3QswbnM+3g==
=GpWg
-----END PGP SIGNATURE-----

--Sig_/uFoOW0k_q3wB2MWWaZa.fiZ--
