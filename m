Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99F10131F43
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 06:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgAGF0p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jan 2020 00:26:45 -0500
Received: from mga17.intel.com ([192.55.52.151]:13641 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgAGF0p (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jan 2020 00:26:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jan 2020 21:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,404,1571727600"; 
   d="scan'208";a="395244570"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga005.jf.intel.com with ESMTP; 06 Jan 2020 21:26:44 -0800
Received: from [10.226.38.20] (unknown [10.226.38.20])
        by linux.intel.com (Postfix) with ESMTP id 3EED85803E3;
        Mon,  6 Jan 2020 21:26:43 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the phy-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20200107161733.3c70149b@canb.auug.org.au>
From:   "Ramuthevar, Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <e09d6254-4ff6-93b4-f007-e256db135e47@linux.intel.com>
Date:   Tue, 7 Jan 2020 13:26:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107161733.3c70149b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 7/1/2020 1:17 PM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the phy-next tree, today's linux-next build (86_64
> allmodconfig) produced this warning:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/phy/intel/phy-intel-emmc.o
> see include/linux/module.h for more information
>
> Introduced by commit
>
>    95f1061f715e ("phy: intel-lgm-emmc: Add support for eMMC PHY")

sorry,  will fix it and update.

Thanks!

---
Regards
Vadivel
