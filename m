Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2199E82E6
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 09:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbfJ2ICk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 04:02:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:17582 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726233AbfJ2ICk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Oct 2019 04:02:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 01:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; 
   d="scan'208";a="401068940"
Received: from fyin-dev.sh.intel.com (HELO [10.239.143.122]) ([10.239.143.122])
  by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2019 01:02:39 -0700
Subject: Re: linux-next: manual merge of the vhost tree with the pm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191029151928.780c8ede@canb.auug.org.au>
From:   Yin Fengwei <fengwei.yin@intel.com>
Message-ID: <f22614d2-3275-fd98-9382-aeff1ca814fa@intel.com>
Date:   Tue, 29 Oct 2019 16:02:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191029151928.780c8ede@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 2019/10/29 下午12:19, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vhost tree got a conflict in:
> 
>    drivers/acpi/processor_idle.c
> 
> between commit:
> 
>    fa583f71a99c ("ACPI: processor_idle: Skip dummy wait if kernel is in guest")
> 
> from the pm tree and commit:
> 
>    a04c0533b07c ("ACPI: disable extra P_LVLx access on KVM")
Sorry for this. I only check the linus tree and didn't notice there is
this patch in pm tree.

BTW, from this patch (a04c0533b07c), it has todo to extend the
hypervisor not only for kvm. So I suppose it's time to add one more:
ACRN. Thanks.

Regards
Yin, Fengwei

> 
> from the vhost tree.
> 
> I fixed it up (I just used the pm tree version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
