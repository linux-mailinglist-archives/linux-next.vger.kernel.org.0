Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB88BACC
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 15:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfHMNwX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 09:52:23 -0400
Received: from mga03.intel.com ([134.134.136.65]:22654 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729190AbfHMNwX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 09:52:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 06:52:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="178675665"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga003.jf.intel.com with ESMTP; 13 Aug 2019 06:52:23 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
        by linux.intel.com (Postfix) with ESMTP id 893B65800FE;
        Tue, 13 Aug 2019 06:52:22 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>
References: <20190809130811.58eb1d78@canb.auug.org.au>
 <20190813131611.6d2b8710@canb.auug.org.au>
 <20190813112115.GA5093@sirena.co.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <adf98b7e-56ed-e715-012d-db0228b35085@linux.intel.com>
Date:   Tue, 13 Aug 2019 08:52:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813112115.GA5093@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


>>> Looks like the merge resolution is not quite right.
>>>
>>> I have used the sound-asoc tree from next-20190808 for today.
> 
>> I am still getting this failure ...
> 
> Intel people, any thoughts?

I provided a solution on alsa-devel yesterday, see 'ASoC: SOF: fix HDA 
direct MMIO access'


