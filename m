Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA99CA4B16
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 20:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfIASWa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 14:22:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45425 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbfIASW3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 1 Sep 2019 14:22:29 -0400
Received: by mail-pf1-f196.google.com with SMTP id w26so7537838pfq.12;
        Sun, 01 Sep 2019 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VXN/849cVOMyZR1j7RUIfzytoIa0BtwwuXWwGMYjWeI=;
        b=GHNoNmUaScN3+L2bDCSJsKAcdarRMMUKNQPlLdbBRMBW/6RKlWtfAmntzXg06isXYP
         KBL93YvSwHJuUsv2OVBcUefOo2OY4Pv9KhM2rLaTGVh03fthbh8M7wQexjWPhIVxkhlt
         rMIbdmueBqj4i4fGEmOw2KmN0IeCN0PdMbB4eM9whjkXuKsXhrVAxKQZn4xVi1O5JY/j
         6BIuymo1OleUUx/zAXf9tTYAFxk6o/FtGYSfM/6SEi8V6ZhBPT7qD4HNOLqjNCKcOc9t
         ZEprkxowT9csdGaIrEnKRgfbtUc4ZrsG42jxzBcyf+/rs6KxiqMkTWyFeTg3XzHsNvrg
         B7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VXN/849cVOMyZR1j7RUIfzytoIa0BtwwuXWwGMYjWeI=;
        b=lFMOrl1DwtaRVzHkY6Csv0o92MAwpWXCi2ppDR9AoFZFT4aKCL0GHknYk/psWFouxU
         sawI3oraX/FD64NphG204E3cm6gYr0YSoDJTRCQJ2k91LLnDCuqf7EnOceHz63NfdGMF
         1Jb6R5WRqRl8qoAMDAalmf7HcbjM5ZZErtSPO/dETEt7zK2GsYS7TqsKGrRfgpvpxsZy
         47T0uUPE++f8lmNhl03yc+4ra6S11V7L31D9QAY82QHu/R2gtW5BrW2CciE+OZLY+hOO
         ow4fmHPD/h9daj/+DL4Ju2OuazuoPfDvXalINg87hKYdayjzXd6debjyFKHq4/BnLI/m
         haeg==
X-Gm-Message-State: APjAAAVjse2VruNUzBhoZZzBdEuuuIP3oC1SiOiL5c9AFizTVfn5B5Ku
        G6DRkbwV0f6w1T49bE4mB4w=
X-Google-Smtp-Source: APXvYqyGRJ1kMuFTcIIy1N6ciQMLNMoqfW9trTubgMNnwEJjFbtkkFn/mdgLe4yHPnh36a/JfRpYuw==
X-Received: by 2002:a17:90a:a896:: with SMTP id h22mr9427693pjq.1.1567362148722;
        Sun, 01 Sep 2019 11:22:28 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v18sm2176377pfn.24.2019.09.01.11.22.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 11:22:27 -0700 (PDT)
Date:   Sun, 1 Sep 2019 11:22:26 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Aug 30
Message-ID: <20190901182226.GA20315@roeck-us.net>
References: <20190831003613.7540b2d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190831003613.7540b2d7@canb.auug.org.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Aug 31, 2019 at 12:36:13AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190829:
> 
> The compiler-attributes tree gained a build failure for which I reverted
> a commit.
> 
> The arm-soc tree gained a conflict against the arm tree.
> 
> The csky tree gained a conflict against the dma-mapping tree.
> 
> The fuse tree gained a conflict against the fsverity tree.
> 
> The vfs tree gained conflicts against the fuse tree.
> 
> The pci tree gained a build failure for which I revereted a commit.
> 
> The net-next tree still had its build failure for which I applied a patch.
> It also gained a conflict against the net tree.
> 
> The regulator tree still has its build failure for which I reverted
> a commit.
> 
> The keys tree still has its build failure so I used the version from
> next-20190828.
> 
> The driver-core tree lost its build failure.
> 
> The staging tree got conflicts against the net-next and usb trees.
> 
> The akpm-current tree gained a build failure due to an interaction with
> the hmm tree for which I applied a patch.
> 

Something in the fixup patch seems to be wrong. I get the following
error with sh4 boot tests when booting from usb.

sm501-usb sm501-usb: OHCI Unrecoverable Error, disabled
sm501-usb sm501-usb: HC died; cleaning up

Unfortunately, bisect doesn't help much (see below). Reverting the fixup
patch as well as the offending patch (plus a context patch) alone does
not help either. Further analysis shows that the problem exists since
at least next-20190823. Another round of bisect on next-20190827 suggests
another culprit (see second bisect below). Reverting all the offending
patches doesn't help either, though, only result in a different error.

usb 1-1: new full-speed USB device number 2 using sm501-usb
sm501-usb sm501-usb: DMA map on device without dma_mask

With that, I am giving up. Copying Christoph as he appears to be heavily
involved in the patch series causing the problems.

Guenter

---
bisect on next-20190330:

# bad: [6d028043b55e54f48fbdf62ea8ce11a4ad830cac] Add linux-next specific files for 20190830
# good: [a55aa89aab90fae7c815b0551b07be37db359d76] Linux 5.3-rc6
git bisect start 'HEAD' 'v5.3-rc6'
# good: [199d454c0775386a645dd9e80b486c346816762f] Merge remote-tracking branch 'crypto/master'
git bisect good 199d454c0775386a645dd9e80b486c346816762f
# good: [450fd5809930dfee10dbbf351cdb2148cd022b1c] Merge remote-tracking branch 'regulator/for-next'
git bisect good 450fd5809930dfee10dbbf351cdb2148cd022b1c
# good: [12b85c8517393b5466dff225a338fc7416150df0] Merge remote-tracking branch 'tty/tty-next'
git bisect good 12b85c8517393b5466dff225a338fc7416150df0
# good: [ecda3e90e6357b15f3189ce00938ea5a20850b76] Merge remote-tracking branch 'scsi/for-next'
git bisect good ecda3e90e6357b15f3189ce00938ea5a20850b76
# good: [4cb65f973115d07578f5b8f4492da7d8295effe2] Merge remote-tracking branch 'rtc/rtc-next'
git bisect good 4cb65f973115d07578f5b8f4492da7d8295effe2
# good: [f3bf5fa4097e06b9cabb193599a012680380e52e] kernel/elfcore.c: include proper prototypes
git bisect good f3bf5fa4097e06b9cabb193599a012680380e52e
# good: [e58b341134ca751d9c12bacded12a8b4dd51368d] Merge remote-tracking branch 'hmm/hmm'
git bisect good e58b341134ca751d9c12bacded12a8b4dd51368d
# good: [405353faeb428dcf14f23707e039412f2defd042] cpumask: nicer for_each_cpumask_and() signature
git bisect good 405353faeb428dcf14f23707e039412f2defd042
# skip: [14f4bec14a4bd5857ca9587221e30d5109157981] Merge branch 'akpm-current/current'
git bisect skip 14f4bec14a4bd5857ca9587221e30d5109157981
# bad: [a6bbc27261e851e805f62775ac86fb7ef1fd29c5] mm: merge fix for "pagewalk: separate function pointers from iterator data"
git bisect bad a6bbc27261e851e805f62775ac86fb7ef1fd29c5
# good: [ccfe491b3b2bf4a5a6d2b3faeee1197d36937b24] bug: clean up helper macros to remove __WARN_TAINT()
git bisect good ccfe491b3b2bf4a5a6d2b3faeee1197d36937b24
# good: [97637fe0837ce1bb998be55588f20ae31e38b23e] ipc/msg.c: consolidate all xxxctl_down() functions
git bisect good 97637fe0837ce1bb998be55588f20ae31e38b23e
# good: [e58915179f3f4a839ea3b9aeae1c1e13e98e33b1] fpga: altera-cvp: Add Stratix10 (V2) Support
git bisect good e58915179f3f4a839ea3b9aeae1c1e13e98e33b1
# good: [b75aecfbe531ca3e2af4a33e88bd27583e05852c] Merge remote-tracking branch 'fpga/for-next'
git bisect good b75aecfbe531ca3e2af4a33e88bd27583e05852c
# only skipped commits left to test
# possible first bad commit: [a6bbc27261e851e805f62775ac86fb7ef1fd29c5] mm: merge fix for "pagewalk: separate function pointers from iterator data"
# possible first bad commit: [14f4bec14a4bd5857ca9587221e30d5109157981] Merge branch 'akpm-current/current'

---
bisect on next-20190827:

# bad: [ed2393ca091048fa9711f4e8ab17ce52856e6412] Add linux-next specific files for 20190827
# good: [a55aa89aab90fae7c815b0551b07be37db359d76] Linux 5.3-rc6
git bisect start 'HEAD' 'v5.3-rc6'
# good: [ddae8e3246a4d042a5b8e1f70fdfbd2d185175fc] Merge remote-tracking branch 'crypto/master'
git bisect good ddae8e3246a4d042a5b8e1f70fdfbd2d185175fc
# good: [3d3d4552301ff96a673c8adbb691d68eaea0b778] Merge remote-tracking branch 'block/for-next'
git bisect good 3d3d4552301ff96a673c8adbb691d68eaea0b778
# bad: [1275ab614bafbe2c3fc865899f400011cc658c56] Merge remote-tracking branch 'char-misc/char-misc-next'
git bisect bad 1275ab614bafbe2c3fc865899f400011cc658c56
# good: [02c12a1482624b7f7ca5906e126d3b5f31d06e3f] Merge branch 'WIP.timers/core'
git bisect good 02c12a1482624b7f7ca5906e126d3b5f31d06e3f
# good: [13b45f7a52a4bd9e539fe11f38212e2be0134bc2] Merge remote-tracking branch 'kvm-arm/next'
git bisect good 13b45f7a52a4bd9e539fe11f38212e2be0134bc2
# bad: [e443c4e221323edaae8a29ce9af81334571a5931] Merge remote-tracking branch 'usb/usb-next'
git bisect bad e443c4e221323edaae8a29ce9af81334571a5931
# good: [8c337a74ca0449146356d509091d9f7986698e0b] Merge remote-tracking branch 'leds/for-next'
git bisect good 8c337a74ca0449146356d509091d9f7986698e0b
# skip: [8f6244055bd33695ce28f6b9b454fc1ae05bcd9c] usb: typec: fusb302: Always provide fwnode for the port
git bisect skip 8f6244055bd33695ce28f6b9b454fc1ae05bcd9c
# skip: [91148dbad80bb6024389287be4aefcbf20b2d0e4] USB: usbip: convert platform driver to use dev_groups
git bisect skip 91148dbad80bb6024389287be4aefcbf20b2d0e4
# skip: [9f4bc2ed74086e51cfc75754adfcbff86f28597a] usb: typec: tcpm: Use usb_debug_root as root for our debugfs entry
git bisect skip 9f4bc2ed74086e51cfc75754adfcbff86f28597a
# good: [0fbb93fce79b938643889862e74ee30213e1d5fe] olpc: x01: convert platform driver to use dev_groups
git bisect good 0fbb93fce79b938643889862e74ee30213e1d5fe
# skip: [e605c30977bb5f48af6d14149a252b1619851f33] USB: atm: cxacru: convert to use dev_groups
git bisect skip e605c30977bb5f48af6d14149a252b1619851f33
# skip: [b33f37064b743d4c5771d3bfc65976790b7396cc] usb: Remove dev_err() usage after platform_get_irq()
git bisect skip b33f37064b743d4c5771d3bfc65976790b7396cc
# skip: [a21350feb9ae4d03062eda1fe344ec2a93d6bccc] USB: usbsevseg: convert to use dev_groups
git bisect skip a21350feb9ae4d03062eda1fe344ec2a93d6bccc
# good: [5d6ff300f0114e64f4ad911d256ac1587204ac5d] usb/max3421: remove the dummy {un,}map_urb_for_dma methods
git bisect good 5d6ff300f0114e64f4ad911d256ac1587204ac5d
# good: [64cb9bfd189382385cd1a1bdf4d8ed0d3bcd0ffa] Merge remote-tracking branch 'ipmi/for-next'
git bisect good 64cb9bfd189382385cd1a1bdf4d8ed0d3bcd0ffa
# skip: [9c1c5e0bc5ec032e78bf15c302f3b20152f865ad] of/platform: Disable generic device linking code for PowerPC
git bisect skip 9c1c5e0bc5ec032e78bf15c302f3b20152f865ad
# skip: [ce684d957c5672f3bb55e6b0872932b5b4c39c56] devcoredump: use memory_read_from_buffer
git bisect skip ce684d957c5672f3bb55e6b0872932b5b4c39c56
# good: [a84e83fb54024dfd12824a14d3902e5db294b3f3] Merge remote-tracking branch 'driver-core/driver-core-next'
git bisect good a84e83fb54024dfd12824a14d3902e5db294b3f3
# good: [bd5defaee872da9b81e3c72045eb6794445cd2e6] dma-mapping: remove is_device_dma_capable
git bisect good bd5defaee872da9b81e3c72045eb6794445cd2e6
# bad: [cdfee5623290bc893f595636b44fa28e8207c5b3] driver core: initialize a default DMA mask for platform device
git bisect bad cdfee5623290bc893f595636b44fa28e8207c5b3
# first bad commit: [cdfee5623290bc893f595636b44fa28e8207c5b3] driver core: initialize a default DMA mask for platform device


