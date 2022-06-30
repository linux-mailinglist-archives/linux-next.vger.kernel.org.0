Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2008562255
	for <lists+linux-next@lfdr.de>; Thu, 30 Jun 2022 20:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbiF3SuW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jun 2022 14:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbiF3SuU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jun 2022 14:50:20 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FAD2B195
        for <linux-next@vger.kernel.org>; Thu, 30 Jun 2022 11:50:20 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id o4so12964331ilm.9
        for <linux-next@vger.kernel.org>; Thu, 30 Jun 2022 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DU7Hgm+nVp1BIUlqpLH6JlGDiG0q5vZbfayRIvYvF6M=;
        b=nELrPTLQzZF251wnx3QqCqNgm0XR67sAmWCe8DzYq5q7MUKYvJX7dj+ezgLS7Qv83u
         4hrLL5SUmfy6W6Pl8x0j0sp5wU7aoRXC1W5j+JI+r0xbbQXNbxrX7hepRx10dKEaHUdd
         kvBZ8JddQB1nLzkheFHDDLfeOGrKgVjjogp94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DU7Hgm+nVp1BIUlqpLH6JlGDiG0q5vZbfayRIvYvF6M=;
        b=mISKW83twri57rsdKXPOyYmgV8f4jyLjMpbTCtI/pu3TqrIADhfY3MR1jyRslH5UJU
         YUB7kmXpv3L6ZRSLuG0BCGbXQsoTyKxRSn2pXsFwnKvnccXammaWfAzpnzq/IYgYKOm3
         57vws96i9boJgyQuzEHGQZTjyHGYzsWtEZ6aIibIoFVxRGE7pZCKOrEnjuyzccsg4Yi1
         4MaTxorvMnOeC4c38FkWfrBnSksUCwXMeqT0fgzJ4SyYHAXB4eAexkkxKx7y+RZXRuEC
         KBv7QIPTZqfNV8aBTQWaERhz1mCPS6kF4+DsO1DximLMHqlCPxW54v42C27d+K5gD06E
         CTRw==
X-Gm-Message-State: AJIora8OYPt2fd3d3aQBlEeZEinL6CyB0/SESwnzZD0PYFzjQkPr2fmU
        0wzKhZ1cezlYOlAWdTNMbc7pOQoE/FoxxyySMaXwLA==
X-Google-Smtp-Source: AGRyM1sg9w7X+FfJWoUYVR7lEmVXNrNLuIAr2Vcc3V5z4leUNdkyv5LtdsqVd9s7Dh5lzHmXkb3sL7+rq9RLqZZ2Yws=
X-Received: by 2002:a05:6e02:1a29:b0:2da:9310:a5fa with SMTP id
 g9-20020a056e021a2900b002da9310a5famr5833873ile.179.1656615019325; Thu, 30
 Jun 2022 11:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
In-Reply-To: <74179C93-0D19-4A8A-81EB-07BD836A3BD3@linux.ibm.com>
From:   Ignat Korchagin <ignat@cloudflare.com>
Date:   Thu, 30 Jun 2022 19:50:08 +0100
Message-ID: <CALrw=nF6EBFQCc8bn9A_Q0nz2O3TSJKsj=ErZUH37-EzLy-qmQ@mail.gmail.com>
Subject: Re: WARN at crypto/testmgr.c:5774 (next)
To:     Sachin Sant <sachinp@linux.ibm.com>
Cc:     linux-crypto <linux-crypto@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 30, 2022 at 7:11 PM Sachin Sant <sachinp@linux.ibm.com> wrote:
>
> Following warning is seen while booting recent -next kernel on IBM Power =
server.
>
> [    1.544420] ------------[ cut here ]------------
> [    1.544422] alg: self-tests for rsa-generic (rsa) failed (rc=3D-22)
> [    1.544429] WARNING: CPU: 18 PID: 512 at crypto/testmgr.c:5774 alg_tes=
t+0x42c/0x850
> [    1.544437] Modules linked in:
> [    1.544441] CPU: 18 PID: 512 Comm: cryptomgr_test Not tainted 5.19.0-r=
c4-next-20220627 #2
> [    1.544446] NIP:  c0000000006fa76c LR: c0000000006fa768 CTR: c00000000=
08552e0
> [    1.544448] REGS: c000000008a27980 TRAP: 0700   Not tainted  (5.19.0-r=
c4-next-20220627)
> [    1.544451] MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2800882=
2  XER: 20040005
> [    1.544458] CFAR: c000000000154114 IRQMASK: 0
> [    1.544458] GPR00: c0000000006fa768 c000000008a27c20 c000000002a8ff00 =
0000000000000035
> [    1.544458] GPR04: 00000000ffff7fff c000000008a279e0 c000000008a279d8 =
0000000000000000
> [    1.544458] GPR08: 00000000ffff7fff 0000000000000000 c0000000025c6ff8 =
c000000002947160
> [    1.544458] GPR12: 0000000000008000 c0000009afff3f00 c00000000018c6f8 =
c0000000070c5180
> [    1.544458] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000
> [    1.544458] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
c000000000f1c230
> [    1.544458] GPR24: 0000000000000000 c00000000e679080 0000000000000400 =
ffffffffffffffff
> [    1.544458] GPR28: c00000000e679000 000000000000000d c000000002d814a8 =
ffffffffffffffea
> [    1.544491] NIP [c0000000006fa76c] alg_test+0x42c/0x850
> [    1.544495] LR [c0000000006fa768] alg_test+0x428/0x850
> [    1.544499] Call Trace:
> [    1.544500] [c000000008a27c20] [c0000000006fa768] alg_test+0x428/0x850=
 (unreliable)
> [    1.544505] [c000000008a27d90] [c0000000006f8df0] cryptomgr_test+0x40/=
0x70
> [    1.544510] [c000000008a27dc0] [c00000000018c814] kthread+0x124/0x130
> [    1.544514] [c000000008a27e10] [c00000000000cdf4] ret_from_kernel_thre=
ad+0x5c/0x64
> [    1.544518] Instruction dump:
> [    1.544520] 409e02e0 3d22002f 892915d1 2f890000 409e02d0 3c62fe77 7f25=
cb78 7f84e378
> [    1.544526] 7fe6fb78 3863ac78 4ba59949 60000000 <0fe00000> fa2100f8 fa=
410100 fa610108
> [    1.544532] ---[ end trace 0000000000000000 ]=E2=80=94
>
> Git bisect points to the following patch.
>
> # git bisect bad
> f145d411a67efacc0731fc3f9c7b2d89fb62523a is the first bad commit
> commit f145d411a67efacc0731fc3f9c7b2d89fb62523a
>     crypto: rsa - implement Chinese Remainder Theorem for faster private =
key operations
>
> Reverting the patch helps avoid this boot time warning.
>
> - Sachin

Thanks for the report. I've already submitted a follow up patch:
https://patchwork.kernel.org/project/linux-crypto/patch/20220630140506.904-=
1-ignat@cloudflare.com/

Ignat
