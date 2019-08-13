Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07438B3D3
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 11:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfHMJPx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 05:15:53 -0400
Received: from mga06.intel.com ([134.134.136.31]:30997 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbfHMJPo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 05:15:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 01:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,380,1559545200"; 
   d="scan'208";a="200414319"
Received: from rjwysock-mobl1.ger.corp.intel.com (HELO [10.249.129.248]) ([10.249.129.248])
  by fmsmga004.fm.intel.com with ESMTP; 13 Aug 2019 01:50:06 -0700
Subject: Re: linux-next: manual merge of the driver-core tree with the rcu
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
References: <20190813155048.59dd9bdf@canb.auug.org.au>
From:   "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
Message-ID: <0d7ff624-dce3-3961-b9a6-7de8eba2bdee@intel.com>
Date:   Tue, 13 Aug 2019 10:50:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813155048.59dd9bdf@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/13/2019 7:50 AM, Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the driver-core tree got a conflict in:
>
>    drivers/base/power/runtime.c
>
> between commit:
>
>    4a3a5474b4c1 ("driver/core: Convert to use built-in RCU list checking")
>
> from the rcu tree and commit:
>
>    515db266a9da ("driver core: Remove device link creation limitation")
>
> from the driver-core tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
The fix looks good to me, thanks!


