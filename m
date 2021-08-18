Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010483EFD2D
	for <lists+linux-next@lfdr.de>; Wed, 18 Aug 2021 08:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238573AbhHRGzI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Aug 2021 02:55:08 -0400
Received: from mga11.intel.com ([192.55.52.93]:36742 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238550AbhHRGzG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Aug 2021 02:55:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213143853"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="213143853"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 23:54:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="531376788"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2021 23:54:13 -0700
Subject: Re: linux-next: build warning after merge of the i2c tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Conghui Chen <conghui.chen@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210818162959.4dfe60a0@canb.auug.org.au>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <1d80c5e6-5d5e-1714-78d8-8d2b9c6f8389@intel.com>
Date:   Wed, 18 Aug 2021 14:54:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210818162959.4dfe60a0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2021/8/18 14:29, Stephen Rothwell wrote:
> Hi all,
>
> After merging the i2c tree, today's linux-next build (powerpc
> allyesconfig) produced this warning:
>
> drivers/i2c/busses/i2c-virtio.c: In function 'virtio_i2c_probe':
> drivers/i2c/busses/i2c-virtio.c:208:17: warning: unused variable 'pdev' [-Wunused-variable]
>    208 |  struct device *pdev = vdev->dev.parent;
>        |                 ^~~~
>
> Introduced by commit
>
>    8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")


Why we have this warning ? In commit 8fb12751ac78, the variable 'pdev' 
was used in line 237.

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=8fb12751ac78d0a4ba3c604496ffc8dcd1bd6c31

