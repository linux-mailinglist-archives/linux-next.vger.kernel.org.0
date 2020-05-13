Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0C41D21D3
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 00:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730532AbgEMWQT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 May 2020 18:16:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53186 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730276AbgEMWQT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 May 2020 18:16:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id A221C2A285C
Subject: Re: next/master bisection: baseline.login on jetson-tk1
To:     Joerg Roedel <jroedel@suse.de>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <5eb9fab4.1c69fb81.a1f1c.0e95@mx.google.com>
 <a868fa70-9039-f72a-39c6-5464a9d06db2@collabora.com>
 <20200512151600.GD8135@suse.de>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <c9745450-a6d0-1944-a9af-ef9ce18fed12@collabora.com>
Date:   Wed, 13 May 2020 23:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512151600.GD8135@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/05/2020 16:16, Joerg Roedel wrote:
> Hi Guillaume,
> 
> thanks for the report!
> 
> On Tue, May 12, 2020 at 07:05:13AM +0100, Guillaume Tucker wrote:
>>> Summary:
>>>   Start:      4b20e7462caa6 Add linux-next specific files for 20200511
>>>   Plain log:  https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.txt
>>>   HTML log:   https://storage.kernelci.org/next/master/next-20200511/arm/tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-jetson-tk1.html
>>>   Result:     3eeeb45c6d044 iommu: Remove add_device()/remove_device() code-paths
> 
> Okay, so it faults at
> 
> 	PC is at __iommu_probe_device+0x20/0x1b8
> 
> Can you translate that for me into a code-line, please? That would help
> finding the issue.

Sure, sorry for the delay.  I've built my own image as vmlinux is
not stored by kernelci and reproduced the problem:

  https://lava.collabora.co.uk/scheduler/job/2403076#L544

which this time gave me:

<4>[    2.540558] PC is at iommu_probe_device+0x1c/0x15c
<4>[    2.545606] LR is at of_iommu_configure+0x15c/0x1c4
<4>[    2.550736] pc : [<c092e0e4>]    lr : [<c0932c0c>]    psr: a0000013

which in turn brings us to:

(gdb) l *0xc092e0e4
0xc092e0e4 is in iommu_probe_device (drivers/iommu/iommu.c:232).
227		int ret;
228	
229		if (!dev_iommu_get(dev))
230			return -ENOMEM;
231	
232		if (!try_module_get(ops->owner)) {
233			ret = -EINVAL;
234			goto err_out;
235		}
236	


Hope this helps.

Guillaume
