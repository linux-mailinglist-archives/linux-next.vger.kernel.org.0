Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B929D287CD7
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 22:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbgJHUGD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 16:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgJHUGB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 16:06:01 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824E5C0613D5
        for <linux-next@vger.kernel.org>; Thu,  8 Oct 2020 13:05:59 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id k25so7706533ioh.7
        for <linux-next@vger.kernel.org>; Thu, 08 Oct 2020 13:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xwsDN6X1qdoLg6NoAWCRmcDuaBAzrQD/adalLvAVzBM=;
        b=MBSsfQHTbWTXU/Yo5oGR95qtqkxoYAzaQvxVsuRfdQ4ZObCo2tdGyIiJERjZQweYce
         KxNB90ZUwlQg+Gxx6z+NcRCHpm3Bnb2vdXXmu9MIZHZ/8ovjPdiL9wdMGpm1fnSufB5e
         GFTbJysN82Dy/Wf6qyNC2tI+u8l/kjgpC9uFDN1jPzcpFnavCFYgLjpNJzzIqlG45a+c
         AG/pDOd00sjD4x5D940bOvtstcB+IfHykZiUl7YaTCXwPrDIRjGjXMW/CntXIv5+nTa0
         4D8Eooi96KsAhpdB3KauJM5Np1nH3BTBOzTf1Re8T/9SZG7sg+prxjycdLxwUpTL9M09
         xRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xwsDN6X1qdoLg6NoAWCRmcDuaBAzrQD/adalLvAVzBM=;
        b=nKsLV+8Fp7UydYG9lKurDEhrPUSy4vEdm/gwyAS0EMzQB+lpVATL50TdzeHY40GiGc
         CkEgvGH/Z5fy62x9QtY5OYHQihdfQlr2v65+ZiL1yM2QBKt8xGFjCBua7wGADqmCyMhE
         CU/KdJa/pqPLCJnrrXyNA3xMJ9yq06Cp5uFlw6v95Za3Jhvn3rgWXNJyYfiW85SyzoSb
         yv8YLGW82rqgWmxutXrvUdWncH5L7eSd9ezDnlJH/V+0k/5KiKt45OKhV2k9UEicqs7x
         XVBWWdBmgujbxZojWLNTITcqigzq1Bm+0foVK1NjRNaNh6HJv2LTv6eR8zIk3uVgHDFL
         0m0Q==
X-Gm-Message-State: AOAM531uF2u+19t2zc5y6C8Q16RbMdf876BZOdGpj4i1sU0xywV7iRm8
        NfeIUwFbavYoYGF1HGc0AUzKl06+5xCamUP2/W7GKw==
X-Google-Smtp-Source: ABdhPJwRCRIfxkJxJDVD6dM9ZY7goLBzqf32rCpZ4VHK8YdlkCRXmoFRaE02yXNCdOUnFtWCNypXdYNx4H1pQRSz0+Q=
X-Received: by 2002:a02:a0c2:: with SMTP id i2mr8174613jah.92.1602187558626;
 Thu, 08 Oct 2020 13:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
In-Reply-To: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Oct 2020 01:35:47 +0530
Message-ID: <CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
Subject: Re: [ Regressions ] linux next 20201008: blk_update_request: I/O
 error, dev sda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
To:     Christoph Hellwig <hch@lst.de>, dm-devel@redhat.com,
        open list <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        drbd-dev@lists.linbit.com,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>, linux-raid@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Song Liu <song@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>, martin.petersen@oracle.com,
        Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 8 Oct 2020 at 23:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> There are two major regressions noticed on linux next tag 20201008.
> I will bisect this problem and get back to you.

Reverting scsi: patch set on  linux next tag 20201008 fixed reported problems.
git revert --no-edit 653eb7c99d84..ed7fb2d018fd


>
> 1) qemu_i386 and qemu_x86 boot failed due to mount rootfs failing [1].
>
>         Starting Remount Root and Kernel File Systems...
> [    1.750740] ata1.00: WARNING: zero len r/w req
> [    1.751423] ata1.00: WARNING: zero len r/w req
> [    1.752361] ata1.00: WARNING: zero len r/w req
> [    1.753400] ata1.00: WARNING: zero len r/w req
> [    1.754447] ata1.00: WARNING: zero len r/w req
> [    1.755529] ata1.00: WARNING: zero len r/w req
> [    1.756630] sd 0:0:0:0: [sda] tag#0 FAILED Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
> [    1.758622] sd 0:0:0:0: [sda] tag#0 CDB: Synchronize Cache(10) 35
> 00 00 00 00 00 00 00 00 00
> [    1.760576] blk_update_request: I/O error, dev sda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [    1.761534] Buffer I/O error on dev sda, logical block 0, lost sync
> page write
> [    1.764158] EXT4-fs (sda): I/O error while writing superblock
>
>
> 2) the devices boot pass but mkfs failed on x86_64, i386, arm64
> Juno-r2 devices [2].
>
> mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG03ACA100_37O9KGL0F
> [   72.159789] ata3.00: WARNING: zero len r/w req
> [   72.164287] ata3.00: WARNING: zero len r/w req
> [   72.168774] ata3.00: WARNING: zero len r/w req
> [   72.168777] ata3.00: WARNING: zero len r/w req
> [   72.168779] ata3.00: WARNING: zero len r/w req
> [   72.168781] ata3.00: WARNING: zero len r/w req
> [   72.168786] sd 2:0:0:0: [sda] tag#5 FAILED Result:
> hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s
> [   72.168788] sd 2:0:0:0: [sda] tag#5 CDB: Synchronize Cache(10) 35
> 00 00 00 00 00 00 00 00 00
> [   72.168791] blk_update_request: I/O error, dev sda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git commit: e4fb79c771fbe2e6fcb3cffa87d5823a9bbf3f10
>   git describe: next-20201008
>   make_kernelversion: 5.9.0-rc8
>   kernel-config:
> https://builds.tuxbuild.com/pOW-FELX2VUycejkuyiKZg/kernel.config
>
>
> steps to reproduce:
> --------------------------
> 1) qemu boot command:
>
> /usr/bin/qemu-system-x86_64 -cpu host -enable-kvm -nographic -net
> nic,model=virtio,macaddr=DE:AD:BE:EF:66:06 -net tap -m 1024 -monitor
> none -kernel bzImage --append "root=/dev/sda  rootwait
> console=ttyS0,115200" -hda
> rpb-console-image-lkft-intel-corei7-64-20200723162342-41.rootfs.ext4
> -m 4096 -smp 4 -nographic
>
> 2) boot x86_64 with linux next 20201008 tag kernel and attach SDD drive.
>
> mkfs -t ext4 /dev/<drive-partition>
>
> Full log links,
> [1 ]https://lkft.validation.linaro.org/scheduler/job/1823906#L688
> [2] https://lkft.validation.linaro.org/scheduler/job/1823938#L2065
>
>
> --
> Linaro LKFT
> https://lkft.linaro.org
