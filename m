Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D0541A993
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 09:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239084AbhI1HTt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Sep 2021 03:19:49 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:59393 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239083AbhI1HTs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Sep 2021 03:19:48 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MyNoa-1mlRND1gc8-00yhK3; Tue, 28 Sep 2021 09:18:07 +0200
Received: by mail-wr1-f54.google.com with SMTP id w29so56085755wra.8;
        Tue, 28 Sep 2021 00:18:07 -0700 (PDT)
X-Gm-Message-State: AOAM530hKKhVA/tUVe6BfSf/I0uoUQXTPasURDjeA5ux0bh0Ctqt0E9k
        g8lLE7rW3U3Zf/8WP+vWirjDNa/v8El2UBTbRm8=
X-Google-Smtp-Source: ABdhPJxaHorzD2S3T2sCWmmw/0OZKgyFTdDkETJW1DWJXS7gwWsZGV1er7XbCQjLdku7lzqd5KcZP1G40aMdlFjeqmM=
X-Received: by 2002:a5d:6a08:: with SMTP id m8mr4558493wru.336.1632813487077;
 Tue, 28 Sep 2021 00:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210928153508.101208f8@canb.auug.org.au>
In-Reply-To: <20210928153508.101208f8@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 28 Sep 2021 09:17:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a12rEbupWakQ8DxWDU4JW0sKVgTa0GXFZ6jNE+7gtT5cw@mail.gmail.com>
Message-ID: <CAK8P3a12rEbupWakQ8DxWDU4JW0sKVgTa0GXFZ6jNE+7gtT5cw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:N4V4lzVYq8SPQ1GPyucLbN8J/MFtl0YvKOakDz+70KmYgxMDks0
 +vCT7gIGakj+nw25L1pN3xxArsAWujYDbdnBgokKp4TR46KU7elAwYU0jDnDndh9R4nYCmU
 VWdAkYiRcZdbnRvSBk63S/p49dkss8ABkk/Kf7U1eML93Jb5dyDNk2jRfDTCtffwl9caYGg
 ZzN5NV4g86sQWtQVQ8oeA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMRoY2FUPfo=:qCfKOsOlpT8V0ZxkZ9lFS3
 1EhjZKfpbonAv+MXEXJzI34jZVBzvLk+VrZhdBkQ85lI5HMI1cJx/agMMRrMd+ALjMFQpE6RY
 wqILMULt5/xbEOIAzggY2Imvgj9gUzdU5uulK+c2oBLdNML9JfjZ6UZ2c/AhekHLDiheyu5N8
 Pfg8QKHCbEH8GuDKvKXZa7+mnZQrEV/fL1VRUV1PHcPDj5ThO2x0e0K1kWZFc9eBNczTT583y
 CH5MYszKQGyMiuPe5AIFSioN7CS64/nUBFX0H+sGNgFII81x1jj/LTif6+VRiyz/Y+4D4BJWG
 WxUkpo5VmVr+1Pd/43/pWBWRBlDaO6ViTnB2RDyi34qLqnAOfn5kwBRPXh132gaPWKBl0Zi6f
 SXZn+3fkvT7Nz98KyJ+HBvc39MFFnWeMS5E5rXx7Pnb+8NwyHD8Fly3jWW8RzXvmL/NZ7H4vj
 jIpmN3kUuFkHBqQDSFsnYdJSAI5BB1n9LvPRhSPMkjZH3ePioNQe8N3OjAaJISLXasdpmVPhN
 0Uxu5hWBqx/oS/tAfbnuz0Wiby0m6opSmCkY7KD4X4gjD2syXF7ljbFG1fq/FQOVnRkY62QRV
 fiNmQ4jfTqZJPMjnqn28zijgAFSSreTqqi8OQ+sk/Ir9v4phafdwZ/Djsd6qk5t3IgF7lBYow
 m5usat1cID7jDbdw3lVN1qefoDqcH1ClEvEIEnKevqFAAaftQScZXh4TSwMDOmefctTrIEfgQ
 dI+3jmqq/HUqvO4g+hK1mNJ7VyBQgv3qsmk8bQ==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 28, 2021 at 7:35 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the sound-asoc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_coeff_put':
> wm_adsp.c:(.text.wm_coeff_put+0x54): undefined reference to `.cs_dsp_coeff_write_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_write_ctl':
> (.text.wm_adsp_write_ctl+0x60): undefined reference to `.cs_dsp_get_ctl'
> ld: (.text.wm_adsp_write_ctl+0xb4): undefined reference to `.cs_dsp_coeff_write_ctrl'
> ld: sound/soc/codecs/wm_adsp.o: in function `.wm_adsp_read_ctl':
> (.text.wm_adsp_read_ctl+0x50): undefined reference to `.cs_dsp_get_ctl'

To spare everyone the search, the problem is in this bit:

--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -298,6 +298,7 @@ config TURRIS_MOX_RWTM

 source "drivers/firmware/arm_ffa/Kconfig"
 source "drivers/firmware/broadcom/Kconfig"
+source "drivers/firmware/cirrus/Kconfig"
 source "drivers/firmware/google/Kconfig"
 source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"

drivers/firmware/Kconfig is only included from arch/*/Kconfig for
certain architectures, rather than from drivers/Kconfig as most
other subdirectories are. This means the CONFIG_CS_DSP
symbol is not in the namespace of Kconfig and never gets
selected.

We just discussed this problem on IRC the other day as I
had the same issue. I think we should move all the
"source" statements for driver Kconfig files from architecture
specific inclusions to drivers/Kconfig.

      Arnd
