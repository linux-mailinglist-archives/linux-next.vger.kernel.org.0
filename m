Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D793D7D04
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 20:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhG0SCM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 14:02:12 -0400
Received: from mga17.intel.com ([192.55.52.151]:50466 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhG0SCL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 14:02:11 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="192779273"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; 
   d="scan'208";a="192779273"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 11:02:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; 
   d="scan'208";a="437414256"
Received: from djiang5-mobl1.amr.corp.intel.com (HELO [10.213.177.99]) ([10.213.177.99])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2021 11:02:09 -0700
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 driver-core tree
To:     Vinod Koul <vkoul@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210723155354.082a62d8@canb.auug.org.au>
 <20210723091641.zse42sotjt2pqiif@pengutronix.de> <YQAN2o+msGGpYWLG@matsya>
From:   Dave Jiang <dave.jiang@intel.com>
Message-ID: <f79920e9-52d5-82e2-e8aa-5e5e3096ac79@intel.com>
Date:   Tue, 27 Jul 2021 11:02:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQAN2o+msGGpYWLG@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 7/27/2021 6:44 AM, Vinod Koul wrote:
> On 23-07-21, 11:16, Uwe Kleine-König wrote:
>> Hello,
>>
>> On Fri, Jul 23, 2021 at 03:53:54PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the dmaengine tree got a conflict in:
>>>
>>>    drivers/dma/idxd/sysfs.c
>>>
>>> between commit:
>>>
>>>    fc7a6209d571 ("bus: Make remove callback return void")
>>>
>>> from the driver-core tree and commit:
>>>
>>>    d9e5481fca74 ("dmaengine: dsa: move dsa_bus_type out of idxd driver to standalone")
>>>
>>> from the dmaengine tree.
>> Greg provided a tag for this case at
>>
>> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/bus_remove_return_void-5.15
>>
>> . Vinod might want to rebase on top of this or merge it into his tree
>> with Stephen's conflict resolution.
> Thanks I have merged the tag and resolved conflict as above.
>
> Dave pls test

Tested. Looks good. Thx.


>
