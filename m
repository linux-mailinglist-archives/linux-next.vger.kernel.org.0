Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8506569F10B
	for <lists+linux-next@lfdr.de>; Wed, 22 Feb 2023 10:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjBVJNX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Feb 2023 04:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjBVJNW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2023 04:13:22 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767751554B
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 01:13:21 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id x199so7439659ybg.5
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 01:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6a4YhtYQMpphc+YPS7agPVIdZsgacEWmaqhtKEOVpzg=;
        b=I0Oo+Nla6WUq2AUPYY9zBmh7a7YS91onpZLYxV3/9Kb4KniDqukZha+PFYuC7+xLZy
         H1xcBmENbjGmPI7kWxKncIwmoTjvFahbnbjSmPdIH7ipl8XX6UNzHybFMlM+3ZCpgZ37
         jVH6/vd+ZQmBbZaT5vMB6t4mYObOeLCeysOSJxkkSVBA+tlP2xd6AS+GCglndcP9KNrp
         QqO1G8kQD/OH/TcmETuGTM6KCt98eycaaGUXTa4Z6sJBihilG2CTTr1I97LR2Tg+fK0T
         0d1e5ahK3UzP9fXuPY6QVWPKGqVnNwpCaBaXrq7t1FRk4vYq5HunrC7EEiZrAMyEV7B8
         Khcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6a4YhtYQMpphc+YPS7agPVIdZsgacEWmaqhtKEOVpzg=;
        b=dyGieYwb5LJ/ymTiTojaFTK8FmAv3dx9kRNtoTq5JVW53HIKPHOL0/6kwFTJQXIslv
         d2oO9HSix6P0X2ZAKQ4JUtqLiRJ6f0QdqRD7BwI7jnYdSIO9tdwOsJ59e+wgNbFpSPPJ
         elEa9BOGzS1yVbchTd+kP/f05iTsAMwXyCw0PMrkKNgbjfkdijL2/NsMhGM4hoyj1Tg/
         S4M0Tbe/YRc4yB0sIexKrN7d1yHSVXxtiyvHvyBJ75nW+dkvPLyek3L2f5b6edi6j2P5
         WvrPnHQhh/lksCxeDLQZYe6c5KTtZRMvlDlU4hHBVpve7VgHnUNMwx5VeqnGUZuRuc8D
         rFYg==
X-Gm-Message-State: AO0yUKU1Jxt6vK2RrluBmtNIY7m3ENkFsLVOQj83EaKNt8S6N2qZqQ+z
        6K/s6o7RVz/KRKT36nICbs9W5SGBetDzmRUuYqs=
X-Google-Smtp-Source: AK7set+rj+FdnSnbLEbZTrTYAh5fFT+PFoHKokSyr7lnT8c+6+J6ijFFDVpMjbT+nfF7tGU3fl+qQUvUQvj5ygJzWXU=
X-Received: by 2002:a5b:f87:0:b0:8ff:dc75:b93d with SMTP id
 q7-20020a5b0f87000000b008ffdc75b93dmr514915ybh.261.1677057200661; Wed, 22 Feb
 2023 01:13:20 -0800 (PST)
MIME-Version: 1.0
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
In-Reply-To: <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
From:   Murphy Zhou <jencce.kernel@gmail.com>
Date:   Wed, 22 Feb 2023 17:13:09 +0800
Message-ID: <CADJHv_tzBWoGDBfNCsg-HKt8aKacXgmvY31mS47y30XkNyAw4w@mail.gmail.com>
Subject: Re: linux-next tree panic on ppc64le
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next-20230221

I'll try powerpc/next.

On Wed, Feb 22, 2023 at 10:35 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 2/22/23 07:55, Murphy Zhou wrote:
> > Hi,
> >
> > [   59.558339] ------------[ cut here ]------------
> > [   59.558361] kernel BUG at arch/powerpc/kernel/syscall.c:34!
> > [   59.558373] Oops: Exception in kernel mode, sig: 5 [#1]
> > [   59.558384] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> > [   59.558397] Modules linked in: rfkill i2c_dev sunrpc ast
> > i2c_algo_bit drm_shmem_helper drm_kms_helper ext4 syscopyarea
> > sysfillrect sysimgblt ofpart ses powernv_flash enclosure
> > scsi_transport_sas ipmi_powernv at24 mbcache jbd2 ipmi_devintf
> > regmap_i2c opal_prd ipmi_msghandler mtd ibmpowernv drm fuse
> > drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
> > crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e aacraid vmx_crypto
> > [   59.558494] CPU: 29 PID: 6366 Comm: kexec Not tainted 6.2.0-next-20230221 #1
> > [   59.558508] Hardware name: CSE-829U POWER9 0x4e1202
> > opal:skiboot-v6.0.7 PowerNV
> > [   59.558521] NIP:  c000000000031e4c LR: c00000000000d520 CTR: c00000000000d3c0
> > [   59.558534] REGS: c000000097247b70 TRAP: 0700   Not tainted
> > (6.2.0-next-20230221)
> > [   59.558548] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR:
> > 84424840  XER: 00000000
> > [   59.558570] CFAR: c00000000000d51c IRQMASK: 3
> > [   59.558570] GPR00: c00000000000d520 c000000097247e10
> > c0000000014b1400 c000000097247e80
> > [   59.558570] GPR04: 0000000084424840 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR08: 0000000000000000 900000000280b033
> > 0000000000000001 0000000000000000
> > [   59.558570] GPR12: 0000000000000000 c0000007fffcb280
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR16: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR20: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR24: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558570] GPR28: 0000000000000000 0000000084424840
> > c000000097247e80 c000000097247e10
> > [   59.558689] NIP [c000000000031e4c] system_call_exception+0x5c/0x340
> > [   59.558705] LR [c00000000000d520] system_call_common+0x160/0x2c4
> > [   59.558719] Call Trace:
> > [   59.558725] [c000000097247e10] [c000000000031f18]
> > system_call_exception+0x128/0x340 (unreliable)
> > [   59.558743] [c000000097247e50] [c00000000000d520]
> > system_call_common+0x160/0x2c4
> > [   59.558759] --- interrupt: c00 at plpar_hcall+0x38/0x60
> > [   59.558770] NIP:  c0000000000f58dc LR: c00000000011277c CTR: 0000000000000000
> > [   59.558783] REGS: c000000097247e80 TRAP: 0c00   Not tainted
> > (6.2.0-next-20230221)
> > [   59.558796] MSR:  900000000280b033
> > <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 84424840  XER: 00000000
> > [   59.558821] IRQMASK: 0
> > [   59.558821] GPR00: 0000000084424840 c0000000972479e0
> > c0000000014b1400 000000000000041c
> > [   59.558821] GPR04: 0000000097ff4000 0000000000000200
> > c000000097247930 c0000007fe233ef8
> > [   59.558821] GPR08: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR12: 0000000000000000 c0000007fffcb280
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR16: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR20: 0000000000000000 0000000000000000
> > 0000000000000000 0000000000000000
> > [   59.558821] GPR24: 0000000000000004 c0000000ba704000
> > 00000000000000c6 c008000014d20000
> > [   59.558821] GPR28: 000000000417b200 0000000000000000
> > c0000000af848800 c000000097ff4000
> > [   59.558935] NIP [c0000000000f58dc] plpar_hcall+0x38/0x60
> > [   59.558946] LR [c00000000011277c] _plpks_get_config+0x7c/0x270
> > [   59.558958] --- interrupt: c00
> > [   59.558966] [c0000000972479e0] [c00000000011275c]
> > _plpks_get_config+0x5c/0x270 (unreliable)
> > [   59.558982] Code: 7c9d2378 60000000 60000000 39200000 0b090000
> > 60000000 e93e0108 692a0002 794affe2 0b0a0000 692a4000 794a97e2
> > <0b0a0000> e95e0138 794a07e0 0b0a0000
> > [   59.559018] ---[ end trace 0000000000000000 ]---
> > [   60.564314] pstore: backend (nvram) writing error (-1)
> > [   60.564336]
> > [   61.564343] Kernel panic - not syncing: Fatal exception
>
> Panic on what linux-next tag? Can you test powerpc/next tree?
>
> --
> An old man doll... just what I always wanted! - Clara
>
