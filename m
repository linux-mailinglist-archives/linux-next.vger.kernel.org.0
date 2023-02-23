Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19C036A0244
	for <lists+linux-next@lfdr.de>; Thu, 23 Feb 2023 06:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjBWFKX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Feb 2023 00:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWFKW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Feb 2023 00:10:22 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0AA37550
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 21:10:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PMh156vs7z4x5c;
        Thu, 23 Feb 2023 16:10:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1677129018;
        bh=0ClxPO2MRWaZ78fnygNF8fDJXF366a8dE/on5zlqMaw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Fr5miP2vrWFlACjCP0HICyY2xi+0AvyKpo899CT6BT4XV6B9XSQyfhDLup1O5Qm4h
         8pY3Cz0hoPeTq5uE3QG+djV3yvUFSsyR6vdPbwVnr3ErX3QFdCDk0O590lcv6xovFv
         F/YnTj9wlS0gUGn8E4FBetxPFMbUZwx32PE+J7ps1DFsdXRsZ26J5ZR2UcQ6dcXGuV
         XUa2kGc3TBl1PMuBAhXXncOrEOQ83yg5CbL5ocZKxKZN6n+uyL2uZXCiUbJxcBu9kA
         TuLCw61WO9M+XwMNIGfsezEEYtmB+ij1w9+eC/c5WG5auRoiI41P2mOOA3fRWb8fHo
         OTSFoKbxXkP4w==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Murphy Zhou <jencce.kernel@gmail.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Linux-Next <linux-next@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next tree panic on ppc64le
In-Reply-To: <CADJHv_u7CGt9oM68YCLSmZTJvdq0rXcVu_1VMT=a9R3VNf8pKg@mail.gmail.com>
References: <CADJHv_tWJKgqfXy=2mynVG0U2bJaVqYo59F_OPfdRRptNOV-WQ@mail.gmail.com>
 <c69dc6be-9642-2876-5375-d536f49d0403@gmail.com>
 <CADJHv_u7CGt9oM68YCLSmZTJvdq0rXcVu_1VMT=a9R3VNf8pKg@mail.gmail.com>
Date:   Thu, 23 Feb 2023 16:10:17 +1100
Message-ID: <87a615arwm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Murphy Zhou <jencce.kernel@gmail.com> writes:
> On Wed, Feb 22, 2023 at 10:35 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>> On 2/22/23 07:55, Murphy Zhou wrote:
>> > [   59.558339] ------------[ cut here ]------------
>> > [   59.558361] kernel BUG at arch/powerpc/kernel/syscall.c:34!
>> > [   59.558373] Oops: Exception in kernel mode, sig: 5 [#1]
>> > [   59.558384] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>> > [   59.558397] Modules linked in: rfkill i2c_dev sunrpc ast
>> > i2c_algo_bit drm_shmem_helper drm_kms_helper ext4 syscopyarea
>> > sysfillrect sysimgblt ofpart ses powernv_flash enclosure
>> > scsi_transport_sas ipmi_powernv at24 mbcache jbd2 ipmi_devintf
>> > regmap_i2c opal_prd ipmi_msghandler mtd ibmpowernv drm fuse
>> > drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi
>> > crc64_rocksoft_generic crc64_rocksoft crc64 sg i40e aacraid vmx_crypto
>> > [   59.558494] CPU: 29 PID: 6366 Comm: kexec Not tainted 6.2.0-next-20230221 #1
...
>> > [   60.564336]
>> > [   61.564343] Kernel panic - not syncing: Fatal exception
>>
>> Panic on what linux-next tag? Can you test powerpc/next tree?

> powerpc/next tree does not panic.

Because I applied the fix last night :)

Which is:
  f82cdc37c4bd ("powerpc/pseries: Avoid hcall in plpks_is_available() on non-pseries")

Thanks for the report.

cheers
