Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A84423623
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 05:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhJFDGr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 23:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhJFDGq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 23:06:46 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D851BC061749;
        Tue,  5 Oct 2021 20:04:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPK7S2Bgnz4xbC;
        Wed,  6 Oct 2021 14:04:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633489493;
        bh=OR1zOu4+0keUFxqdrNKhI1dbntGB8hPMhbgPWtEPtXs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A/PKi3R78WOyUBvrY0NIXKmVVqdULR9QUnuULpiUg5rDbm72GVnNmnp3kgFliOKws
         3KbphOLHvmSvRo4VykQVrFTFidwXq4xRjUTcgNhQadd8Gk0cQkrd5PcaFsZ9HwS1LN
         K5jxfmy0E7lEyyxU+Qla8x3UK8JoLaFjjsxcwedoNxnA2Cr9GsCcW6O1fr23jM2QeP
         z5xmRCpGUoFdAeu2xwVdTCh+llLeibe8SghgiOQLgRXlibYVHSK6ZuLcXG15ad/2DP
         CbGANKgJ1ag5Bkaqh9BVUPz2zEBZjEQFHCtVQdcrQxS1Pm9ypHWwEbwNBm6mKloZHA
         bM5MCBq8WgmDQ==
Date:   Wed, 6 Oct 2021 14:04:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20211006140451.2dcea4ea@canb.auug.org.au>
In-Reply-To: <20210928153508.101208f8@canb.auug.org.au>
References: <20210928153508.101208f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O.Miepmz0sBPWkYQUV=Bu3c";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/O.Miepmz0sBPWkYQUV=Bu3c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 28 Sep 2021 15:35:08 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_put':
> wm_adsp.c:(.text.wm_coeff_put+0x54): undefined reference to `.cs_dsp_coef=
f_write_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_write_ctl':
> (.text.wm_adsp_write_ctl+0x60): undefined reference to `.cs_dsp_get_ctl'
> ld: (.text.wm_adsp_write_ctl+0xb4): undefined reference to `.cs_dsp_coeff=
_write_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_read_ctl':
> (.text.wm_adsp_read_ctl+0x50): undefined reference to `.cs_dsp_get_ctl'
> ld: (.text.wm_adsp_read_ctl+0xbc): undefined reference to `.cs_dsp_coeff_=
read_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_get':
> wm_adsp.c:(.text.wm_coeff_get+0x54): undefined reference to `.cs_dsp_coef=
f_read_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_tlv_get':
> wm_adsp.c:(.text.wm_coeff_tlv_get+0x60): undefined reference to `.cs_dsp_=
coeff_read_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_put_acked':
> wm_adsp.c:(.text.wm_coeff_put_acked+0xa4): undefined reference to `.cs_ds=
p_coeff_write_acked_control'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp1_init':
> (.text.wm_adsp1_init+0x38): undefined reference to `.cs_dsp_adsp1_init'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_set_dspclk':
> (.text.wm_adsp2_set_dspclk+0x44): undefined reference to `.cs_dsp_set_dsp=
clk'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_early_event':
> (.text.wm_adsp_early_event+0xac): undefined reference to `.cs_dsp_power_d=
own'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_event':
> (.text.wm_adsp_event+0x88): undefined reference to `.cs_dsp_run'
> ld: (.text.wm_adsp_event+0xb0): undefined reference to `.cs_dsp_stop'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_component_probe':
> (.text.wm_adsp2_component_probe+0x6c): undefined reference to `.cs_dsp_in=
it_debugfs'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_component_remove':
> (.text.wm_adsp2_component_remove+0x24): undefined reference to `.cs_dsp_c=
leanup_debugfs'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_init':
> (.text.wm_adsp2_init+0xa8): undefined reference to `.cs_dsp_adsp2_init'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_init':
> (.text.wm_halo_init+0xa8): undefined reference to `.cs_dsp_halo_init'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_remove':
> (.text.wm_adsp2_remove+0x24): undefined reference to `.cs_dsp_remove'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp2_bus_error':
> (.text.wm_adsp2_bus_error+0x24): undefined reference to `.cs_dsp_adsp2_bu=
s_error'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_bus_error':
> (.text.wm_halo_bus_error+0x24): undefined reference to `.cs_dsp_halo_bus_=
error'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_halo_wdt_expire':
> (.text.wm_halo_wdt_expire+0x24): undefined reference to `.cs_dsp_halo_wdt=
_expire'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp1_event':
> (.text.wm_adsp1_event+0x168): undefined reference to `.cs_dsp_adsp1_power=
_up'
> ld: (.text.wm_adsp1_event+0x210): undefined reference to `.cs_dsp_adsp1_p=
ower_down'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_control_add':
> wm_adsp.c:(.text.wm_adsp_control_add+0x70): undefined reference to `.cs_d=
sp_mem_region_name'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_capture_bloc=
k':
> wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x248): undefined reference=
 to `.cs_dsp_read_raw_data_block'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x27c): undefined refer=
ence to `.cs_dsp_remove_padding'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_capture_block+0x344): undefined refer=
ence to `.cs_dsp_write_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_boot_work':
> wm_adsp.c:(.text.wm_adsp_boot_work+0x108): undefined reference to `.cs_ds=
p_power_up'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_populate':
> wm_adsp.c:(.text.wm_adsp_buffer_populate+0x1ac): undefined reference to `=
.cs_dsp_read_data_word'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_populate+0x1fc): undefined reference =
to `.cs_dsp_read_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_parse_coeff':
> wm_adsp.c:(.text.wm_adsp_buffer_parse_coeff+0x58): undefined reference to=
 `.cs_dsp_coeff_read_ctrl'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_coeff+0x2b0): undefined referen=
ce to `.cs_dsp_remove_padding'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_parse_legacy=
':
> wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0x48): undefined reference t=
o `.cs_dsp_find_alg_region'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0xc4): undefined referen=
ce to `.cs_dsp_read_data_word'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_parse_legacy+0x150): undefined refere=
nce to `.cs_dsp_read_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_get_error':
> wm_adsp.c:(.text.wm_adsp_buffer_get_error+0x44): undefined reference to `=
.cs_dsp_read_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_trigger':
> (.text.wm_adsp_compr_trigger+0x370): undefined reference to `.cs_dsp_writ=
e_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_buffer_update_avail=
':
> wm_adsp.c:(.text.wm_adsp_buffer_update_avail+0x70): undefined reference t=
o `.cs_dsp_read_data_word'
> ld: wm_adsp.c:(.text.wm_adsp_buffer_update_avail+0x16c): undefined refere=
nce to `.cs_dsp_read_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_handle_irq':
> (.text.wm_adsp_compr_handle_irq+0x140): undefined reference to `.cs_dsp_r=
ead_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_compr_pointer':
> (.text.wm_adsp_compr_pointer+0x3d8): undefined reference to `.cs_dsp_writ=
e_data_word'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_tlv_put':
> wm_adsp.c:(.text.wm_coeff_tlv_put+0x100): undefined reference to `.cs_dsp=
_coeff_write_ctrl'
>=20
> Caused by commit
>=20
>   f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading=
 on Cirrus Logic DSPs")
>=20
> I have reverted that commit for today.

Any progress on this?  I am still reverting the above commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/O.Miepmz0sBPWkYQUV=Bu3c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdElMACgkQAVBC80lX
0Gx2Kwf+OGszCwztHj+Ju0xfuu2uepuQbv8NyrcX1sWTaNQh172l9Z7AtuVEZc42
Wm01kZpp0I9PCY5wuNyqmjidszWC+WOCNM9qLT9I1YC7lvvhb5lZl14EtoT4sMQN
s50FbgRKCNh7F7angNo1IbSrJuTMDQ1gd21VWZQ09QwwwNtXD7/Vb29n8wwgLxO9
Pxpyiw5ld6Ltu6rjSeUL6GB1r8kY/AxKreoi60WhmwyVz3H8qJjpeVW3ktdlKsHg
ukbbXoxaoCq1VUKfj//8mflZRW1+9qub98PLD/MExix+CqOEA5bXZUBE30HBabWd
LuFGHXRAaJ19trZKDXwO587H/AiYUg==
=UUfQ
-----END PGP SIGNATURE-----

--Sig_/O.Miepmz0sBPWkYQUV=Bu3c--
