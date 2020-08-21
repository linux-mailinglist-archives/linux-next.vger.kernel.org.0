Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 805D524D750
	for <lists+linux-next@lfdr.de>; Fri, 21 Aug 2020 16:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgHUOZ5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Aug 2020 10:25:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:19425 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbgHUOZ4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Aug 2020 10:25:56 -0400
IronPort-SDR: vf4hjBebAygrHPF8bF/Ktcj8E7QLWsMKjPTY0ggMzSn/9gdw/bvWLjwPWFQgoqRbkQmsZxJxOv
 WscD/I6pz1Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="143177381"
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="143177381"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 07:25:55 -0700
IronPort-SDR: f37iSe65xyTgI7rzdilRPy7wD3g2sqsUhr+lpiHj0WIokQtc6gXSykXrCEbQdvLZdc3u3uIYBR
 bNeKsjrYJSoQ==
X-IronPort-AV: E=Sophos;i="5.76,337,1592895600"; 
   d="scan'208";a="442361861"
Received: from pcmiller-mobl1.amr.corp.intel.com (HELO [10.209.120.121]) ([10.209.120.121])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2020 07:25:54 -0700
Subject: Re: linux-next: build warnings after merge of the sound-asoc-fixes
 tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bard liao <yung-chuan.liao@linux.intel.com>
References: <20200821093901.4257afdc@canb.auug.org.au>
 <a8b47ba9-7b45-bef1-08a2-820fe48c4cc4@linux.intel.com>
 <20200821110117.GC4870@sirena.org.uk>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a982589b-9bc1-6439-99de-3ce6efdab469@linux.intel.com>
Date:   Fri, 21 Aug 2020 09:25:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821110117.GC4870@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 8/21/20 6:01 AM, Mark Brown wrote:
> On Thu, Aug 20, 2020 at 07:01:15PM -0500, Pierre-Louis Bossart wrote:
> 
>> There is a companion patch 1eb629363aa35 ("ASoC: SOF: Intel: hda: import
>> SOUNDWIRE_INIT namespace") that does the import, not sure what causes the
>> warning?
> 
> A patch which was not sent as part of the same series and where no
> dependency was mentioned :(

yes, sorry about that, i just noticed the two patches were sent one 
after the other but without the dependency.
Do you have a means to fix this on your side or do you need Bard/I to 
resend it?

